# QA plan — Cycle 2 (pre-registered 2026-11-13, lane H)

Pre-registered BEFORE Cycle-2 artifacts land, to avoid post-hoc sampling bias. Modeled on the
main-run `qa/*-spotcheck.md` discipline: sampled claims checked against sources with exact
commands; every item records **Claim / Checked (command) / Evidence (file:line) / Verdict**;
scale **OK / MINOR-ERROR / WRONG** (MINOR = locator/cosmetic, substance holds; WRONG = the
claimed fact is false as stated). Results are appended to this file as **Parts 1..N** as
artifacts land. **No pass executes before this plan is committed** (commit at the next batch,
even if no artifact has landed yet). Watch-level disk signals (e.g. an uncommitted green run
log) are NOT QA evidence — only landed artifacts + their own claims are checked.

Roots (read-only): `AX = /home/doz/zcode-workdir/axiommath` (`DedekindZetaZeroFree`,
`ZetaZerosV2`, `ZetaZeros`, `PrimeNumberTheoremAnd`, `Weil`, `AreaLaw2D`); mathlib =
`/home/doz/zcode-workdir/encore-mathlib/repo/mathlib4`; tauceti, openai-math, anthropics as in
the main-run spot-checks. Index: `qa/decl-index-v2.tsv` (corpus ⟶ file ⟶ kind ⟶ name; labels
`axiommath-{dzzf,vendor-cft,zetazeros-v2,zetazeros,pnt,weil,arealaw2d}` + the six main-run
labels).

## (a) Sampling quotas per artifact

| # | Artifact (owner) | Quota | Mandatory mix |
|---|---|---|---|
| Q1 | `survey/axiommath.md` (A1) | 12 claims | ≥2 per repo (all six); ≥4 **axiom-hygiene** claims — `#print axioms` / `native_decide` / sorry findings verified directly in the donor repos, not against the survey's own text |
| Q2 | `bridges/function-field.md` (A2) | 10 claims | ≥5 file:line citations into `axiommath/` sources (Weil / ZetaZerosV2 / dzzf trees); ≥2 literature nearest-misses verified via the cited sources |
| Q3 | `bridges/area-law.md` (A4) | 10 claims | ≥5 file:line citations into `axiommath/AreaLaw2D` or the openai family-265 sources; ≥2 literature nearest-misses verified via the cited sources |
| Q4 | `novelty/axiommath-as-donor.md` (A3) | 10 claims | **every** DISCHARGES/PARTIAL verdict re-checked: donor decl exists with the claimed shape (direct-source), AND the consumer binder matches what the pilot actually assumes |
| Q5 | dossiers 70–74 (A9), each | 8 claims | ≥3 novelty-side grep-evidence checks (re-run the dossier's own absence searches); ≥2 statement-precision checks against donor/pilot sources |
| Q6 | pilot artifacts: 10-L1/L2, 52, 20 close-out, 50-M3, 42-M4 | all final logs | log-vs-claim consistency: provenance headers present on every log; `#print axioms` output matches the claimed verdict; **zero `sorryAx` anywhere**; logs persisted under `pilots/*/logs/` (never /tmp-only) |

## (b) Recipe commands

Reusing the v2 index (`TSV=research/qa/decl-index-v2.tsv`; run from repo root):

    # exact-name presence, corpus-wide (novelty absence check)
    cut -f4 "$TSV" | grep -xF 'DeclName'
    # substring / name-family
    cut -f4 "$TSV" | grep -F  'DeclName'
    # which corpora carry the name — the namespace-vendoring check, run before ANY "corpus X has Y" claim
    awk -F'\t' '$4=="DeclName"{print $1}' "$TSV" | sort | uniq -c
    # name anywhere under an axiommath label?
    awk -F'\t' '$1 ~ /^axiommath-/ && $4=="DeclName"' "$TSV"
    # one repo's own-tree rows (then direct-source the file)
    awk -F'\t' '$1=="axiommath-weil"' "$TSV" | head

Direct-source checks (the TSV is an index, never evidence of provability):

    rg -n "^(theorem|lemma|def|abbrev) +DeclName" $AX/Weil -g '*.lean'
    sed -n 'START,ENDp' PATH/FILE.lean          # verify quoted line ranges exactly
    rg -n "sorry|native_decide" $AX/<Repo> -g '*.lean'          # hygiene sweep
    rg -n "#print axioms" $AX/<Repo> pilots/<NN>/ -g '*.lean'   # axiom-report sites

Caveats — v1 caveats carry over (ASCII names only; `noncomputable def`/`private theorem`
prefixed headers and anonymous `instance :` rows missed; openai-math vendors mathlib-like
trees, so a TSV miss is NOT evidence of absence in openai-math — also `rg` directly in
`openai-math/lean/OAI/`, `openai-math/lean/ComparatorChallenges/`, `openai-math/preprints/`;
preprints are never indexed), PLUS the Cycle-2 caveats (from the v2 script header):

- **AxiomMath repos re-export mathlib/TauCeti content. A TSV hit in an axiommath tree is NOT
  evidence the repo proves it** — check the file's own namespace and imports before any
  originality claim. Same-name rows under several labels (or axiommath + mathlib) are expected
  and harmless for novelty: absence still implies absence everywhere (conservative direction);
  presence needs namespace disambiguation.
- `axiommath-dzzf` excludes `vendor/**` (the class-field-theory tree is indexed separately as
  `axiommath-vendor-cft`, 1,658 files — do not credit dzzf with vendor content); dzzf also
  carries re-namespaced TauCeti source (`DedekindZetaZeroFree.TauCeti`, `…LargeSieve.Vendor`)
  — tauceti content appears twice in the index.
- `axiommath-zetazeros-v2` contains a divergent fork of the ZetaZeros tree (same file names)
  plus ported PNT+ modules on its path — ZetaZeros names appear under both labels.
- `axiommath-pnt` embeds an `IEANTN/` subtree and local `Mathlib/` overrides.
- `axiommath-arealaw2d` vendors openai-math-derived statements under `OpenAI/`.

## (c) Execution trigger table

| Pass | Trigger (artifact landing) | Execute | Quota |
|---|---|---|---|
| P1 | `survey/axiommath.md` | survey spot-check | Q1 |
| P2 | `bridges/function-field.md` | bridge spot-check | Q2 |
| P3 | `bridges/area-law.md` | bridge spot-check | Q3 |
| P4 | `novelty/axiommath-as-donor.md` | donor-verdict re-check | Q4 |
| P5a–P5e | each of `candidates/7{0..4}-*.md` | dossier spot-check | Q5 (8 each) |
| P6a | pilot-10 L1 final state (A6) | log-vs-claim audit | Q6 |
| P6b | pilot-10 L2 final state (A6) | log-vs-claim audit | Q6 |
| P6c | pilot-52 fix-or-close verdict + final logs (A8) | log-vs-claim audit | Q6 |
| P6d | pilot-20 close-out evidence (A8) | log-vs-claim audit (incl. rescued M1 record) | Q6 |
| P6e | 50-M3 (if GO after A3/A7) | log-vs-claim audit | Q6 |
| P6f | 42-M4 (if GO after A3/A7) | log-vs-claim audit | Q6 |

Rules: H executes each pass as its trigger lands (poll + orchestrator relays); results append
below as Parts 1..N with date + tally line up front, one Part per pass; no pass runs before
this plan's commit. Verdicts route to the orchestrator (and STATUS via the relay); fixes
follow the main-run convention — H applies authorized errata only on H-maintained files,
researcher files are fixed by their owning lane. A WRONG verdict on a load-bearing claim
blocks the artifact's TRIAGE/REPORT cell until resolved.

---

# Part 1 (2026-11-13, pass P4) — novelty/axiommath-as-donor.md (A3)

Triggered by A3's landing (orchestrator relay). Quota Q4: 10 claims; every DISCHARGES /
PARTIAL verdict re-checked against the donor decl AND the consumer binder as stated.
Roots: `AX = /home/doz/zcode-workdir/axiommath` (DZDF, ZetaZerosV2, ZetaZeros), pilot files
in-repo. Plan committed at `de5d8dc` (pre-registration satisfied).

**Tally: 8 OK, 2 MINOR (line pins), 0 WRONG.** Both minors are locator slips; every
verdict-shaping fact (donor statements, consumer binders, constant geometry, the §c(2)
QA flag) verified exact.

1. DZDF `dedekindZeta_ne_zero` — OK. `DedekindZetaZeroFree/Main.lean:9` `theorem
   dedekindZeta_ne_zero` ✓; Quantitative original at `…Quantitative/DedekindZetaNonvanishing.lean:13`
   (A3 wrote :11 — MINOR, see item 9); 31/32 shape via HeckeCorollary's parallel statement.
2. DZDF `heckeL_ne_zero` + `RayClassCharacter` — OK. `HeckeCorollary.lean:12` theorem, with
   the exclusion `∀ s, 31/32 < s.re → (s ≠ 1 ∨ ¬ χ.IsPrincipal) → f s ≠ 0` verbatim at :19;
   `structure RayClassCharacter` at `Arithmetic/RayClasses/Character.lean:12` ✓.
3. Pilot-50 consumer binders as stated — OK. `pilots/50/M1.lean:45` `hQRH : ∀ s, (7/8:ℝ) <
   s.re → riemannZeta s ≠ 0` verbatim; `Dirichlet.lean:41` `hQRHχ`, `:44` `hFEχ`;
   `M1.lean:44` `strip_confinement` — all exact.
4. Constant geometry (7/8 ⊊ 31/32) — OK. 7/8 = 28/32 < 31/32: openai's region strictly
   contains DZDF's ⇒ no 7/8-shaped discharge; the PARTIAL verdict's arithmetic is right.
5. V2 `simple_proportion_lower` C₀ > 2/3 — OK. `ZetaZerosV2/ZetaZeros/Main.lean:47` theorem
   ✓; numerics recomputed: C₀ = 3/2 − (1/√2)cot(1/√2) = 0.6725007 > 2/3 ✓
   (and `simple_proportion_d4` :130 ✓).
6. V2 `distinct_proportion_lower` C₁ > 5/6 — OK. `Main.lean:88` ✓; C₁ =
   5/4 − (1/(2√2))cot(1/√2) = 0.8362504 > 5/6 ≈ 0.8333 ✓ (`distinct_proportion_d5` :149 ✓).
7. Pilot-42 M2b binders — MINOR (pins). `hCert : cert` at :1065 and `hK673` at :1066 exact;
   but the second binder block opens at :1084 with `hCert` — `hK839` sits at **:1085**
   (A3 wrote :1084), and **`hCZ` is at :729** (the `_of_negligible` binder; docstring :625,
   theorem :723) — A3's ":1125" is the *second* `hK839` occurrence. All binder names/shapes
   as stated; two line pins off.
8. **The §c(2) QA flag (load-bearing) — CONFIRMED.** V2 `distinctZeroCount` =
   `(nontrivialZeros T).ncard` (`Definitions.lean:56`) with `nontrivialZeros` = zeros in
   **0 < re < 1, 0 < im ≤ T** (:38) — STRIP-wide, no on-line restriction; pilot 42's
   `ZeroMult.countDistinctOnCum` (`M2b.lean:789`) = `(lineFiniteCum …).toFinset.card` —
   **on-line** distinct; zeta23 `Ndist = (zerosIn T₁ T₂).ncard` (`ChallengeDeps.lean:59`)
   matches the strip reading. On-line ≤ strip-wide ⇒ the pilot's numerator is stronger than
   any donor proves; A3's re-vocabulary fix (strip-distinct numerator) is required before
   the M4 5/6 discharge. Exactly as A3 flagged.
9. Quantitative wrapper pin — MINOR. A3's "`Nonvanishing/Mellin/Quantitative/
   DedekindZetaNonvanishing.lean:11`" — the theorem is at **:13** (:11 is the `open` line).
10. Axiom hygiene + `dedekindAbelianQuotient` — OK. `native_decide` → 0 files in
   `ZetaZerosV2/{ZetaZeros,Solution}/`, `ZetaZeros/{ZetaZeros,Solution}/`,
   `DedekindZetaZeroFree/{DedekindZetaZeroFree,Solution}/`; active `sorry` → 0 in those
   trees (scope caveat: V1's *Challenge* file `ZetaZeros/Challenge/Basic.lean:154,164,173`
   carries 3 challenge-by-design sorries — outside A3's claimed trees, flagged for
   consumers); `comparator.json permitted_axioms` = {propext, Quot.sound,
   Classical.choice} in both V2 and DZDF ✓. `dedekindAbelianQuotient` at
   `LFunctions/Dedekind/EntireAbelianQuotient.lean:13`: abelian-Galois hypothesis
   (commuting automorphisms), fK/fL differentiable off {1} agreeing with
   `NumberField.dedekindZeta` on re > 1, entire g — the §f shape exact.

**Disposition:** both minors are one-edit locator fixes in A3's file — routed to A3 via the
orchestrator (not H's to apply; A3's file). No load-bearing change; the M4-GO and
50-GATED verdicts stand as written.

---

# Part 2 (2026-11-13, pass P1) — survey/axiommath.md (A1)

Triggered by A1's landing. Quota Q1: 12 claims, ≥2 per repo (all six), ≥4 axiom-hygiene
claims verified directly against the donor repos. Roots: `AX = /home/doz/zcode-workdir/axiommath`.

**Tally: 10 OK, 2 MINOR, 0 WRONG.** Every hygiene claim (the donor-consumption gate)
verified against the repos directly; the two minors are a token count and a docstring-vs-def
pin.

1. DZZF Challenge statements — OK. `main` at `Challenge/DedekindZetaChallenge.lean:30`
   (verbatim ∃f/differentiable-off-{1}/zero-free shape), `heckeCorollary` at `:34` with the
   `(s ≠ 1 ∨ ¬χ.IsPrincipal)` exclusion; both `sorry` placeholders exactly at `:32,:41`.
2. DZZF proof-chain pins — OK. `cyclotomic12_context` (`TwelfthCyclotomicExtension.lean:10`)
   → `mu12_continuation_ne_zero` (`TwelfthRootNonvanishing.lean:13`) →
   `dedekindZeta_zeroFree_of_abelian_extension` (`AbelianZeroTransfer.lean:20`), all exact.
3. DZZF hygiene — OK. Word-boundary `sorry` over the repo excl. `vendor/`: **2 tokens, both
   the Challenge placeholders**; `formalization.yaml:110` `axioms: ["propext", "Quot.sound",
   "Classical.choice"]` (inside the cited :92–110 block, with the per-result :115/:120
   echoes).
4. V2 counting vocabulary — OK. Survey's Challenge-layer pins exact (`Challenge/Basic.lean`
   :44 nontrivialZeros, :53 zeroCount ∑ᶠ, :62 distinctZeroCount ncard, :66 onLineCount,
   :76 simpleOrOnLineCount) AND the library copies at `ZetaZeros/Definitions.lean:47,56,70`
   agree — the dual-home characterization holds.
5. V2 theorem pins + constants — OK. `thm_simple`/`thm_distinct`/`thm_average`/
   `thm_simple_or_critical` at `Challenge/Basic.lean:209,217,229,238`; constants block
   :197–203 with C₀/C₁ strings verbatim; **C₂ recomputed = 0.8876200082 exactly as claimed**.
6. V2 hygiene + RvM — OK. `sorry` in exactly one file, `Challenge/Basic.lean`, **12 tokens**
   (the 12 comparator placeholders); `theorem riemannVonMangoldt` at
   `ZeroCount/RiemannVonMangoldt.lean:465`.
7. V1 binder edition — OK. `def RiemannVonMangoldt : Prop` (`Defs.lean:133`),
   `def PairCorrelation : Prop` (`:143`); `simple_proportion_lower (hRvM :
   RiemannVonMangoldt) …` (`Main.lean:33`); Challenge carries exactly **6 sorries**.
8. PNT+ PNT-ladder pins — OK. `theorem MediumPNT : ∃ c > 0, …` at `MediumPNT.lean:3714`;
   StrongPNT present only as commented-out decl + `-- sorry` at `StrongPNT.lean:1883–1885`
   (removed, not proved — as the survey's §2b says); `WeakPNT` at `Wiener.lean:2352`.
9. PNT+ hygiene — MINOR (count; classification CONFIRMED). Load-bearing claim "ALL sorry
   tokens in comments/docstrings" verified: the 9 word-boundary hits are
   `StrongPNT.lean:1885` + `PerronFormula.lean:376` (both `--`-commented) + 7 docstring
   prose lines (FKS2 ×4, Kadiri ×3); plus 3 `sorry_using` comment hits in
   GeneralMeromorphic.lean = 12 visible vs the claimed 14 — count slip only, no bare
   `sorry` proof step exists. `axiom qc` at `Tactic/AdditiveCombination.lean:176` is inside
   the docstring example block, as claimed.
10. Weil headline pins — OK. `satisfiesWeilEstimate` (`DeligneWeilConjecture.lean:367`),
    `exists_mul_zetaSeries_eq` (`ZetaRationality.lean:170`), LeanEval
    `weil_conjectures` (`Weil/LeanEval/WeilConjectures.lean:185`).
11. Weil hygiene — OK. `sorry`/`native_decide` over the repo: **0 hits**; README :118–125
    carries the `#print axioms` recipe + standard-triad statement.
12. AreaLaw2D statement pins + hygiene — MINOR (one pin; hygiene OK). `HasGlobalGap` :185,
    `AreaLaw` :202, `AreaLawCorollary` :228, `cylinderAreaLaw3D`/`cylinderAreaLawOfPlanar3D`
    at `Cylinder3D.lean:574,526` all exact; but `def VertexAreaLaw` sits at **:214** (:212 is
    its docstring). Hygiene exact: 3 real `sorry` tokens at `Challenge/Basic.lean:77,82,259`
    + 2 prose hits in `OpenAI/Statements.lean` — matching "5 (3 comparator + prose)".

**Disposition:** the two minors (9: token count 12-vs-14; 12: VertexAreaLaw :212→:214) are
one-edit fixes in A1's file — routed to A1 via the orchestrator. Donor-consumption gate
unaffected: the six repos' hygiene claims all stand as surveyed.

---

# Part 3 (2026-11-13, passes P5a–P5c) — dossiers 70 / 71 / 72 (A9)

Triggered by the dossier-wave landing (commit `539a1c2`). Quota Q5: 8 claims each, ≥3
novelty-side grep re-runs, ≥2 statement-precision checks vs donor/pilot sources. Dossier 73
is a pre-registered skeleton — no QA due until filled. Roots: axiommath clones, mathlib
checkout, zeta23, openai OAI, in-repo pilots.

**Tallies: 70: 7 OK / 1 MINOR / 0 WRONG · 71: 8 OK / 0 MINOR / 0 WRONG · 72: 7 OK / 1
MINOR / 0 WRONG.**

## P5a — 70-unconditional-zetaK-zero-confinement

1. `abelianFactorization` (`AbelianRayCharacterFactorization.lean:62`) — OK, theorem line
   exact (Part B's donor identity).
2. `heckeFunctionalEquation` (`FunctionalEquation.lean:12`; principal `FunctionalEquation/
   Principal.lean:14` with the `IsTotallyComplex F` hypothesis; nonprincipal
   `Nonprincipal.lean:15`) — OK, all three exact.
3. `trivialRayCharacter` (`Characters/TrivialCharacter.lean:14` def, `:27` apply) — OK.
4. mathlib F1 pins — OK. `zeta_eq_tsum_one_div_nat_cpow` RiemannZeta.lean:207,
   `riemannZeta_one_sub` :178, `le_analyticOrderAt_add` Analysis/Analytic/Order.lean:228,
   `IsCompact.inter_riemannZetaZeros_finite` LSeries/ZetaZeros.lean:68,
   `IsTotallyComplex` NumberField/InfinitePlace/TotallyRealComplex.lean:210 — the last two
   cited by short path but file-unique, lines exact.
5. mathlib novelty greps — OK. `'31 / 32'` → 0 files; `'1 / 32'` → exactly the 2 claimed
   hits in `Tactic/Inclusion/Extension/IntervalDyadicReal/Exp.lean` (:20,:82);
   `dedekindZeta_residue_ne_zero` at DedekindZeta.lean:72 = the sole dedekindZeta-zero
   hit. zeta23 `'dedekind'` → 0; tauceti `'31 / 32'` → 0 (the strip-convexity
   disambiguation at `NumberTheory/LFunctions/Zeros/Completion/FiniteOrder.lean:17` exact).
6. axiommath novelty greps — OK on the five non-DZDF repos (`'31 / 32'` → 0 everywhere).
7. DZDF `1 / 32` claim — **MINOR**. Dossier: "`1 / 32`/confinement occur **nowhere**" in
   DZDF. Actual: the token `1 / 32` occurs **4×** (excluding `31 / 32` substring matches) —
   `ZeroDetection/Smoothing/SmoothedZeroPrefixes.lean:73,:130` and
   `Moments/Principal/Contour/Comparison.lean:19` (+1) — all internal proof constants
   (a smoothing weight, a savings inequality), **none a confinement statement**. Substance
   holds; the token-level "nowhere" is false as written. One-edit rewording, routed to A9.
8. pilot-50 anchors — OK. `IsNontrivialZeroP50` M1.lean:33, `strip_confinement` :44,
   `_mem` :75 / `_set` :85, `hFEχ` block Dirichlet.lean:44–46 — all exact.

## P5b — 71-function-field-splane-dictionary

1. Weil zeta-fraction form — OK. `exists_zetaSeries_mul_prod_even_eq_prod_odd` at
   `WeilRiemannHypothesisForm.lean:206`; Deligne clause at :212–213 verbatim
   (`‖z‖ = (Fintype.card k : ℝ) ^ ((j : ℝ) / 2)`).
2. Weil defs — OK. `pointCountOfDegree` Definitions.lean:66, `zetaSeries` :87;
   `coeff_pointCountSeries`/`logDerivative_zetaSeries` at **Defs/**…`/Trace/ZetaSeries.lean`
   :97/:144 — exact lines, cited by short path (the Defs/ mirror tree; the Trace/ file is
   68 lines and lacks both) — note, not an error.
3. Base change — OK. `rationalFrobeniusCharpolyReverse_eq_comp_of_comp_specAlgebraMap_eq`
   at `FieldOfConstantsFrobenius.lean:163` verbatim.
4. Stacks wall — OK. `Weil/Definitions.lean` and `DeligneWeilConjecture.lean` import
   `StacksFrontier.*` exactly as claimed (the binder-posture premise).
5. mathlib FF-zeta absence — OK. `zetaFunction|zetaSeries` → 0 files;
   `AlgebraicGeometry/EllipticCurve/LFunction.lean:43–84` = localPolynomial→LSeries (the
   BSD Euler-factor object; short-path note).
6. tauceti genus-1 layer — OK. `HasseBound.lean:44` (`frobeniusTrace_sq_le_four_mul_card`),
   `Isogeny/Frobenius/Zeta.lean:201` (zeta factorization) and `:244` (eigenvalue norm),
   `Supersingular.lean` present (the falsity-trap anchor).
7. ZZV2 multiset layer — OK. `IsConjInvariant` Challenge/Basic.lean:114; inequalities
   :146/:155/:169/:182; constants C₀/C₁/C₂ re-verified in Part 2.
8. LeanEval bundle — OK. `weil_conjectures` at `WeilConjectures.lean:185` (Part 2 item 10);
   the point-count clause at [E:F] = m present in the bundle.

## P5c — 72-area-law-inertial-defect

1. AreaLaw2D statement pins — OK. `pureState` :191, `condExpect` :240,
   `PositiveReplacement` :259 (Statements.lean).
2. Region layer — OK. `ptrace` PartialTrace.lean:25; `entropy_eq_H` State.lean:75,
   `entropy_le_log_card` :160, `regionEntropy` :198 — all exact.
3. Proof layer — OK. `areaLaw` Transfer.lean:361, `positiveReplacement` :136,
   `marginalTails` :228 — all exact.
4. openai PEPS pins — OK (all six): `FullSystemGap` :74, `MainStatement` :97,
   `reducedDensity` :119 (Gram form), `vonNeumannEntropy` :127, `boundaryCard` :130,
   `UniformAreaLaw` :135 (`OAI/MathematicalPhysics/PEPSFilters/Basic.lean`).
5. pilot-01 PROVED anchors — OK. `posIndex_conj_le` port/09:846, `master_identity` :1983,
   `rank_trace_mult_k_of_master` :2019; `kc`/`kc_of_le` port/08:1640/:1654.
6. Novelty greps — OK. posIndex/rank-trace/inertia over AreaLaw2D → 0 files;
   `partial.?trace|HasGlobalGap|spectral gap` over Mathlib → 0 files.
7. zeta23 donor anchors — OK. `posIndexAbove` at LinAlg/PosIndex.lean:50 (the cited :50),
   `posIndex_conj_le` Inertia.lean:51, `rank_trace_mult_k` **ZeroSide**/RankTraceMult.lean:369,
   `cauchySchwarz_count` LinAlg/Weyl.lean:89 — all line-exact (dossier writes the RHLinalg
   namespace as a path prefix; files live in LinAlg/ + ZeroSide/ — note).
8. **Physlib dependency claims — MINOR (substantive tilt).** Three sub-claims checked:
   (a) "the region layer imports [Physlib] directly (`PartialTrace.lean:3`)" — FALSE as
   written: :3 imports mathlib `Kronecker`; Physlib appears in that file only in
   docstrings (:9,:13), and `import Physlib*` occurs **nowhere** in AreaLaw2D's own tree
   (0 files, vendor/.lake excluded); (b) lakefile pins Physlib `a50684a1…` — TRUE
   (`lakefile.toml:37–39`); (c) "manifest is stale (`db584cd6`)" — FALSE: the manifest's
   Physlib rev is also `a50684a1…`. Consequence worth routing to A4/A7/G5: with zero
   in-tree Physlib imports, the "consumption cost = staging Physlib on Modal" premise may
   be void — G5 might reduce to a no-op check. The dossier's fallback (re-derive the
   region core, ≈300 LoC) remains valid either way.

**Disposition:** 70 item 7 and 72 item 8 → one-edit fixes routed to A9 (and A4's bridge
§0.1/§5 for the Physlib locator, plus an A7/G5 premise flag); 71 clean. No load-bearing
statement affected: 70's confinement-novelty substance holds; 72's pilot plan is if
anything CHEAPER than written (Physlib likely unstaged).
