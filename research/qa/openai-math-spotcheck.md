# QA spot-check — research/survey/openai-math.md (main-run P1 survey, R2; never QA'd)

Lane A1, 2026-11-13 (task A1-5, orchestrator-authorized; methodology per
`qa/cycle2-qa-plan.md` §(a)–(b)). Survey under audit: `research/survey/openai-math.md`
(landed 2026-11-09, INDEX row "Not yet QA'd"). Sampling: 12 claims, prioritizing the
Cycle-2-relevant surface (family 265 / AreaLaw2D bridges, the Hecke subtree and quasi-RH
donors feeding pilots 50/20, PNT+ dependency overlap, matrix-exponent and Laughlin anchors
behind dossiers 12/52/72). All checks direct-source in `/home/doz/zcode-workdir/openai-math`
(own tree `lean/OAI/` + `lean/ComparatorChallenges/` + `lean/lakefile.lean`; the
vendored-mathlib caveat applied throughout — every decl verified in OAI's own namespace, TSV
not used as evidence). Checkout at the surveyed rev (`4eaee8754` per survey §0).

**Tally: 10 OK, 2 MINOR, 0 WRONG.**

| # | Claim (survey §) | Checked (command) | Evidence | Verdict |
|---|---|---|---|---|
| O1 | Quasi-RH Lean: `OAI.DirichletCharacter.LFunction_ne_zero_of_seven_eighths_lt_re` at `OAI/NumberTheory/DirichletL/Nonvanishing.lean:19`, `OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re` at `:29` (§1.1; the hQRH donor of pilots 50/20) | `grep -n` in the file | `:19 theorem LFunction_ne_zero_of_seven_eighths_lt_re`, `:29 theorem riemannZeta_ne_zero_of_seven_eighths_lt_re` — verbatim | **OK** |
| O2 | Hecke variant at `OAI/NumberTheory/DirichletL/Hecke/Nonvanishing.lean:13,35` (§1.1; dossier 20 family II object layer) | `grep -n` | `:13` and `:35` both `theorem LFunction_ne_zero_of_seven_eighths_lt_re` (module-split, plus `:19 _ofResidue` variant) | **OK** |
| O3 | Uniform Landau–Siegel: `OAI.SiegelZeros.WeightedTorusJets.exists_absolute_real_zero_gap` at `OAI/NumberTheory/SiegelZeros/Conclusions/Theorem.lean:11` (§1.1) | `grep -n` | `:11 theorem exists_absolute_real_zero_gap :` | **OK** |
| O4 | Family 265 "2D gapped area law" listed with no Lean name (§1.4), preprint in `preprints/` (§0) — Cycle-2 load-bearing: A4's `bridges/area-law.md` and dossier 72 treat AreaLaw2D (axiommath) as *the* formalization of OAI265 | `ls preprints/`; `grep formalization.yaml`; OAI tree scan | Preprint dir exact: `preprints/A-two-dimensional-area-law-from-a-global-spectral-gap-September-24-2026` ✓; no `docs/265.md`, no formalization.yaml entry ✓ (survey's bare mention is literally accurate) — **but** OAI's own tree carries an *undocumented* family-265-class Lean development: `OAI/MathematicalPhysics/PEPSFilters/` (namespace `PolynomialPEPS.PinnedEntropy`: square-grid PEPS states, Hamiltonians, nested positive filters; `Basic.lean:1–20` read) + sibling `OAI/MathematicalPhysics/PEPSMove/` — the anchors H's dossier-72 QA already verified (`FullSystemGap` :74, `MainStatement` :97, `UniformAreaLaw` :135, `Basic.lean`). The survey's greps missed it (no docs/yaml trail) | **MINOR** (omission of undocumented content; every explicit survey statement true; fix applied — see Disposition) |
| O5 | Comparator mechanics: 418 statement files + 418 JSON configs; `permitted_axioms` triad; nanoda enabled in only 2/418 (§0) | `ls | wc`; `grep -h enable_nanoda *.json \| sort \| uniq -c` | 418 `.lean` + 418 `.json`; nanoda `true` ×2, `false` ×413 (415 mentions + 3 absent→default) — the "2/418" claim exact | **OK** |
| O6 | `lean/OAI/` sorry inventory: 8 tokens, all comments/docstrings, at the 8 cited locators (§2a) | `grep -rn "sorry" OAI -g '*.lean'` | Exactly 8: `SheafCohomology/Projective/PullbackTensorMonoidal.lean:30,38,58`, `Monoidal.lean:27`, `Invertible.lean:36`, `PullbackTensorGeneral.lean:40,42`, `RepresentationTheory/Theta/Definitions.lean:15` — **all eight locators verbatim**, zero in proof position | **OK** |
| O7 | Toolchain Lean v4.34.1 (§0, §4 toolchain-gap warning) | `cat lean/lean-toolchain` | `leanprover/lean4:v4.34.1` | **OK** |
| O8 | The tauceti import edge: lakefile requires `TauCeti @ 3bed7e37…`; five OAI files import `TauCeti.Analysis.Complex.Conformal.{Montel.Basic, Hurwitz, NormalFamilies, SimplyConnected, Inverse.Function}`, all under `OAI/Probability/SLE/` (§4; "the only place where two of our targets are literally linked") | `grep -n TauCeti lakefile.lean`; `grep -rn "import TauCeti" OAI` (own tree only — vendored-mathlib caveat applied) | lakefile `:33–34` pins `3bed7e37f3c504a99e8c07e9f309540812a7aa90` exact; exactly **5** import sites: `SLE/Loewner/InitialInverseNormalFamily.lean:2` (Montel.Basic), `InitialInverseLimit.lean:2` (Hurwitz), `InitialLimitInverse.lean:3` (Inverse.Function), `ReflectedForwardContinuity.lean:3` (NormalFamilies), `SLE/Geometry/SimpleSlitRiemann.lean:2` (SimplyConnected) — module list and locations verbatim | **OK** |
| O9 | ω ≤ 9/4 decls at `OAI/LinearAlgebra/MatrixMultiplication/Main.lean:14–31`; every-field `omega_lt_source_constant` at `MatrixFields/Conclusions/AllFieldsBound.lean:17` (§1.2; dossier 12/60 anchors) | `grep -n` both files | `:14 complex_omega_le_nine_quarters`, `:19 complex_alpha_gt_93_div_200`, `:25 complex_rectangular_omega_lt_523_div_250`; `AllFieldsBound.lean:17 omega_lt_source_constant (F : Type u) [Field F]` | **OK** |
| O10 | Laughlin: `OAI.Laughlin.mainTarget_proved` at `OAI/Analysis/Laughlin/Main.lean:19`; `MainTarget` freezes 1/100 at `Model.lean:56–59`, Q = 3(N−1) (§1.4/§2c; dossier 52 adjacency) | `grep -n` + `sed -n 56,60p` | `Main.lean:19 theorem mainTarget_proved : MainTarget`; `Model.lean:56–59` verbatim incl. `(1/100 : ℝ) * distanceToLaughlinSq ψ ≤ energy ψ` and `State N (3*(N-1))` | **OK** |
| O11 | ETH comparator: `runtimeBound C A d e` (existential constants) + `exact_count_and_sat` in `ComparatorChallenges/SubexponentialSAT.lean`; Lean proves only the ρ(n) = n(loglog n)²/√log n form (§1.2/§2c; dossier 10 consumer) | `grep -n` in the trusted file | `:136 noncomputable def runtimeBound (constant exponentConstant : ℝ)…`, `:194 theorem exact_count_and_sat (k : ℕ) (hk : 2 ≤ k)`, time bound at `:210` — shapes as surveyed | **OK** |
| O12 | Dep-import counts: PrimeNumberTheoremAnd 244 files; StrongPNT 12; ClassFieldTheory 4 (DukePrimeDegree) (§3; Cycle-2-relevant: PNT+ ecosystem overlap) | `grep -rl 'import X' OAI -g '*.lean'` | PNT+ = **242 files** (survey: 244 — count wobble); StrongPNT = **12** exact (`StrongPNT.Erdos970.*` modules); ClassFieldTheory direct importers = **2** (`DukePrimeDegree/Arithmetic/ClassFieldBridge.lean:3–4`, `ClassFieldKernel.lean`) with a third namespace-opening file (`ClassFieldModulus.lean:18 open GlobalClassFieldTheory…`) — survey's "4" counts the cluster loosely. **Cross-corpus note worth the record:** OAI's `ClassFieldBridge.lean:4` imports `ClassFieldTheory.GlobalClassFieldTheory.GlobalClassFields.MathlibFrobeniusHilbertComparison` — the *same n-yamaguchi ClassFieldTheory library* DZDF vendors (`survey/axiommath-cft-vendor.md` §(e)): the CFT vendor has a second independent consumer | **MINOR** (two count slips; substance + the DukePrimeDegree attribution intact) |

## Disposition

- **O4 (MINOR, fixed in place 2026-11-13, trivial-and-uncontested per the A1-5
  authorization):** one-line erratum added to survey §1.4 recording the undocumented
  `OAI/MathematicalPhysics/PEPSFilters/` + `PEPSMove/` trees (family-265-class content, no
  docs/yaml entry — the reason the survey's greps missed them). Cycle-2 consumers
  unaffected in substance: `bridges/area-law.md` (A4) and dossier 72 already work from the
  PEPSFilters anchors (H's Part P5c item 4); the survey text now agrees with them.
- **O12 (MINOR, fixed in place 2026-11-13):** counts corrected in §3 (244→242; CFT "4
  files"→2 direct importers + 1 namespace-opener), with the second-consumer cross-note
  (OAI ↔ n-yamaguchi ClassFieldTheory) added.
- No WRONG verdicts; no load-bearing Cycle-2 claim affected. The hQRH donor chain
  (O1/O2/O3), the tauceti import edge (O8), and the dossier-12/52 anchors (O9/O10) all
  verify verbatim.
