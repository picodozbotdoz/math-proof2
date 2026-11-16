# R1 — Articles editorial audit (rubric, defects, causes, cross-cycle pattern)

Lane R1 of the 10-lane iteration-4 review · 2026-11-16 · auditor scope: all 17 article
files under `research/articles/` (10 main-run + 7 Cycle-2 files carrying 9 Cycle-2 slots)
plus `research/articles/README.md`. Every factual claim below was checked against the
article files, the sibling donor trees, the repo's pilot logs, and git history; spot-check
evidence is in §4. No article was edited.

## 0. Executive verdict

The articles are **individually near-competent and citation-excellent, and collectively
unacceptable as a research-article corpus**. The verification honesty *inside* the bodies
is strong (a global strength: no article was caught overclaiming its Lean status in the
theorem statements). What failed is everything around the mathematics:

1. **Genre**: the files are internal lab reports — byline blocks of dossier/pilot/prework
   pointers, status lines in house dialect ("PROVED at Tier C", "PROVED (entry
   milestone)"), build-log tables and error trajectories, Modal infrastructure narration.
2. **Kind discipline**: 6 of the 9 Cycle-2 slots are engineering records (donor swap,
   binder discharge, statement layer, open-headline tranche, two addenda) published
   through the same "research article" channel as real discoveries, diluting the corpus.
3. **Seam integrity**: the README contradicts itself (article 10 exists and "has no
   article yet" in the same file); article 42-M4 claims the main-run article 42 "is kept
   frozen … and is cited, not edited" when git shows 42 was erratum-patched the same
   morning; article 11's §7 says its M2 milestone "is not attempted here" and the
   appended addendum then proves it.

Score distribution (§3) is compressed at 8–11 out of 12 with **no article earning better
than 1/2 on prose/register** — the failure is corpus-wide, not a few bad files.

## 1. The rubric

Each axis scored 0–2 per article. 2 = meets the bar of an external referee; 1 = partially
meets; 0 = fails.

- **(a) Precision of the headline claim** — could a referee restate the theorem
  unambiguously from the abstract + statement section (full hypothesis list included)?
- **(b) Verification-status honesty up front** — is "kernel-proved unconditional" vs
  "kernel-proved conditional on named binders H" vs "certified numerically" vs
  "paper-only" unmistakable in the *status line and abstract*, in standard vocabulary,
  per theorem?
- **(c) Novelty claim vs evidence** — does the article overclaim "new"/"first" where the
  content is formalization-first, donor-swap, or a known theorem? Are nearest-miss prior
  works cited next to the claim?
- **(d) Citation exactness** — decl names, file:line, paper theorem numbers, log paths
  correct (5+ spot checks per article; see §4).
- **(e) Self-containment** — statement, proof sketch, formal record, limitations, prior
  work all present and internally consistent (no section contradicting another).
- **(f) Prose/register** — title, abstract, notation, structure at the standard of a
  research article readable by someone outside the project.

## 2. Score table

| # | article | a | b | c | d | e | f | /12 | cycle |
|---|---|---|---|---|---|---|---|---|---|
| 01 | Five-Defect Identity | 2 | 2 | 2 | 2 | 2 | 1 | **11** | main |
| 30 | ETH-Appendix Q_s Closed Form | 2 | 2 | 2 | 2 | 2 | 1 | **11** | main |
| 52 | Statistics-Universal Calculus | 2 | 2 | 2 | 2 | 2 | 1 | **11** | main |
| 21 | Quartic Window Certified Loss | 2 | 2 | 2 | 2 | 2 | 1 | **11** | main |
| 22 | PNT ψ-Form (+closure note) | 2 | 2 | 2 | 2 | 2 | 1 | **11** | main+C2 |
| 71 | s-Plane Zeta of a Curve | 2 | 2 | 2 | 2 | 2 | 1 | **11** | C2 |
| 50M2 | Unconditional Strip Confinement | 2 | 2 | 2 | 2 | 2 | 1 | **11** | C2 |
| 32 | RC Savings Frontier | 2 | 1 | 2 | 2 | 2 | 1 | 10 | main |
| 42 | Quadratic ζ_K Proportions (+errata) | 2 | 2 | 1 | 2 | 2 | 1 | 10 | main |
| 20 | Common-Zero Seam | 2 | 1 | 2 | 2 | 2 | 1 | 10 | main |
| 50 | Zero-Free Regions / Strip Shell | 1 | 2 | 2 | 2 | 2 | 1 | 10 | main |
| 75 | Abelian Assembly ζ_L | 2 | 2 | 1 | 2 | 2 | 1 | 10 | C2 |
| 72 | Rényi No-Go Gate | 2 | 2 | 1 | 2 | 2 | 1 | 10 | C2 |
| 10 | Toward One Machine for All k | 2 | 2 | 1 | 2 | 2 | 1 | 10 | C2 |
| 11 | Call-Charged Calculus (+M2 addendum) | 2 | 1 | 2 | 2 | 1 | 1 | **9** | main+C2 |
| 73 | Hecke L-Series over 𝔽_q[T], I | 2 | 1 | 1 | 2 | 2 | 1 | **9** | C2 |
| 42M4 | ζ_K ζ-Column Donor Swap | 2 | 1 | 1 | 1 | 2 | 1 | **8** | C2 |

Reading of the distribution: (d) and (e) are near-universal 2s — the corpus's citation
discipline and completeness are genuinely good. (f) is a universal 1 — no article reads as
an article. The Cycle-2 set loses on (b)/(c) — status dialect and novelty framing — and
42M4 additionally on (d) for a false record claim.

## 3. Per-article defect lists

Severity: **BLOCKER** = alone can justify rejection at external re-review; **MAJOR** =
requires rewriting a section; **MINOR** = cosmetic/precision nit.

### research/articles/README.md (index — audited with the set)

- **BLOCKER — self-contradiction on article 10.** The main-run section says dossier 10
  "is cleared to pilot … but the headline refutation still needs L1/L2, **so it has no
  article yet**" (README.md:26–29), while the Cycle-2 table in the same file lists
  "| 10 | Toward One Machine for All k … | **layers proved; headline OPEN** |"
  (README.md:45). The inventory cannot be trusted after one screen of reading.
- **MAJOR — stale main-run row 11.** Main table: "M1 **proved**; machine realizations
  open" (README.md:19) vs Cycle-2 row: "Theorem B(ii): TM2 realization **proved**"
  (README.md:46). Same file, opposite statuses.
- **MAJOR — no supersession pointers in the main table.** Rows 42 and 50 read as current
  ("certificate-conditional", "binder-conditional") with no note that 42-M4/50-M2 have
  discharged parts of them; a reader of the main table alone gets 2026-11-09 statuses.
- MINOR — main-run row 11's title omits the article's actual title suffix ("…with
  Theorem 19 of the 3SUM/APSP Refutation as One Composition").

### 01 — An Exact Five-Defect Identity (main)

Best-in-corpus. MINOR: internal tokens without glossary — "empty zone EZ1"
(01-inertial-defect-master-identity.md:44), "novelty round 2, R8" (:180), "COLD risk
tier" is 30's token but 01 cites `novelty/VERDICTS.md` rows bare (:184); references mix
repo paths and papers in one list.

### 30 — ETH-Appendix Operators Q_s (main)

MINOR: title presumes donor context ("The ETH-Appendix Operators Q_s…" — "ETH-Appendix"
is an anthropics-corpus notion, not a field notion). MINOR: §5 verification table is a
build log ("Two models are used… faithful for labels |k| ≤ 7", :156–159 — fine content,
lab-report framing). MINOR: "novelty rounds R8 … COLD risk tier" (:172).

### 52 — Statistics-Universal Calculus (main)

MINOR: the 2026-11-14 addendum (:147–160) is novelty-bookkeeping (physlib `ExchangeSign`
dating, "NO G5a staging exists" — internal probe vocabulary) and calls the in-repo file a
  "publication" (:150). Belongs in `novelty/` notes, not the article.

### 32 — RC Savings Frontier (main)

- **MAJOR — abstract vs §5 on crossing existence.** Abstract: "the frontier is given by
  a unique crossing point c\*(ε) of two explicit monotone curves, Γ(ε) = gammaOf(c\*(ε),
  0.9)" (:24–25) with no caveat; §5 discloses "the crossing is a parameter of
  `frontier_of_crossing`" and its existence is a paper-level IVT argument (:123–127).
  Theorem 5 itself is honest ("If c\* is a crossing…"); the abstract is not.
- MINOR: title's "Corollary-31" is donor-paper internal numbering
  (32-rc-savings-frontier.md:1).

### 42 — Quadratic Dedekind Zeta Zero Proportions (main; edited 2026-11-14)

- **MAJOR — inline bracketed errata inside the abstract.** "…improves the literature's
  45%-distinct statement for Dedekind zetas (de Laat–Rolen–Tripp–Wagner 2019 —
  **[erratum 2026-11-14: their result is GRH-conditional, fixed quadratic K, T→∞
  asymptotic; the comparison is hypothesis-shape-to-hypothesis-shape, not
  unconditional-vs-conditional]**) to the 5/6 class modulo an explicit defect"
  (:29–31). The wrong claim was patched with a bracket instead of rewriting the
  sentence; the frame "improves … to the 5/6 class" still stands around the erratum.
  A second bracketed erratum sits in §6 (:152–157) naming the internal QA trail
  ("H QA Part 7 / A5 standing note 3").
- MAJOR (kind): now one of three overlapping articles (42, 42-M4, 75 §6) that must be
  read together to know the current status of the same theorems.

### 20 — Common-Zero Seam (main)

- **MAJOR — Theorem 5's non-formalization disclosed only in §5.** The abstract asserts
  "show that hCZ at any level η > 1/6 already follows from the factors' 5/6-distinct
  theorems" (:26–28) as a result; §5 states "Theorem 5 is not formalized (it needs the
  factors' distinct theorems as inputs, which the pilot does not yet consume)"
  (:130–131). The status line does flag "the common-zero analysis of §4.3 is a paper
  result" (:10–11) — per-theorem status is what's missing.
- MINOR: "[HYPOTHESIS] S3 of the dossier" internal token (:113–114).

### 11 — Call-Charged Reduction Calculus (main + Cycle-2 addendum)

- **BLOCKER — the article contradicts itself about its own milestone.** §7 (still the
  main body's limitation section): Theorem B's machine realizations "is the substantive
  next milestone (≈ 1.5–2.5k LoC, eth slice) and **is not attempted here**" (:114–118).
  The appended "Cycle-2 addendum (2026-11-14): M2 — the TM2 realization (Theorem
  B(ii)), PROVED" (:132–134) proves it. A reader of §7 alone is misinformed; the fix
  (revise §7) was skipped in favour of appending.
- **MAJOR — status block is a changelog.** "**Status: Milestone 1 PROVED,
  kernel-verified** … **+ M2 COMPLETE (2026-11-14; A8 formal report received)** —
  Theorem B(ii), the TM2 realization, kernel-verified… Of Theorem B only the word-RAM
  (Light-language) half and the M3 instantiation remain open" (:7–12). "A8 formal
  report received" is orchestrator bookkeeping.
- MINOR: title carries donor theorem numbering ("…with Theorem 19 of the 3SUM/APSP
  Refutation as One Composition", :1). MINOR: two verification sections (main §5 +
  addendum's own).

### 50 — Zero-Free Regions Cannot Move Constants (main)

- MINOR (a-axis): Part I's Proposition 1 ("No statement of the form … exists within the
  engine", :41–42) is a meta-claim argued by source inspection; it is honestly labelled
  "a source-verified mathematical argument, not a Lean theorem" (:7–8), but as a
  headline "result" it is not referee-restatable without the source-level qualifiers.
- MINOR: trailing sections ("Formal verification", "Relation to prior work", "Open
  directions") break the numbered-section pattern used by every sibling article
  (:79–116) — the set has no shared skeleton.

### 21 — Quartic Window Transplant (main)

MINOR: the proof lives in an external script ("a stdlib-only Python script, reproducible
from the milestone note §6", :8–10) — the article does not carry the certificate
parameters (N = 20 order, intervals) in itself. Model for honest numeric status
otherwise.

### 22 — PNT ψ-Form (main + Cycle-2 closure note)

Exemplary status honesty: "**This is a formalization result, not new mathematics**"
(:8–9); "We claim no priority over the upstream efforts" (:79–81).
- MINOR (channel): the Cycle-2 closure note (:99–121) is a dossier/survey update
  ("T2b = closed-by-upstream, cite upstream not us", :119–120) appended to an article.
  Right content, wrong document.

### 75 — Abelian Assembly ζ_L (Cycle 2)

- **MAJOR — statement-level "first" in the abstract.** "As far as we know, these are
  the first zero-proportion statements for ζ_L, formal or informal, outside the
  quadratic case" (:34–36). True as written (they are *statements*), but it sits above
  the honest framing ("The mathematics is deliberately corollary-level: the analytic
  content sits entirely in the component hypotheses", :37–39) and under a title that
  names no hypothesis ("Zero Proportions for ζ_L Across an Abelian Tower", :1). An
  external reader parses "first zero-proportion statements for ζ_L" as a theorem about
  ζ_L.
- MINOR: status line "**Status: PROVED (entry milestone), FINAL for Cycle 2.**" (:10) —
  "entry milestone" is undefined project vocabulary (the very next sentence does state
  the conditionality correctly).
- MINOR: decl names carry house mood ("`zetaL_assembly_landed`", "`…_landed`" family,
  :99, :113) — fine as Lean identifiers, but the article prose adopts "landing
  theorems" as terminology (:12, :198).

### 42M4 — ζ_K ζ-Column Donor Swap (Cycle 2)

Lowest-scoring article (8/12).

- **BLOCKER — false record claim.** Byline: "the main-run article
  `42-quadratic-dedekind-zeta-zero-proportions.md` **is kept frozen** as the
  certificate-conditional record **and is cited, not edited**" (:5–6). Git: commit
  `c540682` (2026-11-14 02:31) inserted the DLRT errata into article 42 (:28, :149)
  *before* 42M4's final rewrite `4e19304` (09:19) asserted the freeze. The pointer is
  factually wrong, and a reader trusting it will mis-dated the erratum.
- **MAJOR — bold status elides the conditional.** "**Status: PROVED, FINAL.**" (:11).
  The three theorems remain conditional on `hEχ`/`hEχdStrip` (zeta23 Theorem E as
  binder) plus structural hypotheses; the ζ-side-only discharge appears in the abstract
  body (:31–34) and §3, not in the loudest line, and the README row — not the article —
  carries "χ-side conditional".
- **MAJOR (kind) — donor swap as a standalone article.** The article's own honesty
  section: "There is no new analytic mathematics" (:48–49); "We record the trade, not a
  strict improvement in constants" (:56–57). This is an upgrade *to* article 42, not a
  discovery; publishing it separately splits one theorem's status across three files.
- MINOR: diffstat prose in the verification section — "The upgrade from fallback to
  final is a net change of +11 lines: −3 hypotheses and +2 endpoint bridges" (:149–151).
- MINOR: title's "the ZetaZerosV2 Donor Swap" (:1) presumes both AxiomMath's repo and
  this project's consumption vocabulary.

### 71 — s-Plane Zeta of a Curve (Cycle 2)

Strong Cycle-2 article; the forced pole-exclusion correction (§3 Remark, :117–125) is a
genuine formalization finding, correctly highlighted.
- MINOR: "P2.lean has 279 lines and 11 theorems" (:9) — the file is 282 lines on disk
  (3-line drift; `wc -l research/pilots/71/P2.lean`).
- MINOR: probe IDs used as evidence without gloss ("Probe G6a priced that import out",
  :84–85; "G3, G6a/b" in references :215).

### 73 — Hecke L-Series over 𝔽_q[T], I (Cycle 2)

- **BLOCKER — unparseable status line.** "**Status: PROVED at Tier C, FINAL.**" (:8–9).
  "Tier C" is never defined in the article; an external reader cannot tell whether
  anything is proved, or what. The sentence that follows does enumerate `hRat`/`hPur`
  and the un-attempted Q4 — buried under an unscored label.
- **MAJOR — headline framing oversells the object.** Title "Hecke L-Series over 𝔽_q[T]
  in Lean, I" (:1) and abstract "a continuation theorem" (:37–39) describe what is, at
  this tier, differentiability of an explicit quotient P₁(q⁻ˢ)/P₀(q⁻ˢ) whose
  identification with the L-series is the hypothesis `hRat`; the series-agreement step
  "is not formalized here" (:172–174). Honesty section point 2 admits this (:65–68) —
  after the abstract has spent it.
- **MAJOR — comparison optics.** "The window constant 1/2 is optimal. Compare 31/32
  for Hecke L-functions of number fields in DedekindZetaZeroFree, and 0.8733458561 …"
  (:43–45) juxtaposes a hypothesis-borne 1/2 (purity = Weil RH as binder) with proved
  constants, inviting an apples-to-apples reading the hypothesis structures do not
  support.
- MINOR: "Q4", "L-effort objective" internal tokens (:16, :205).

### 72 — Rényi Monotonicity No-Go Gate (Cycle 2)

- **MAJOR — internal index in the title.** "The Rényi Monotonicity No-Go Gate for
  Area-Law Rank Statements (with the Family-265 Interface Layer)" (:1). "Family-265"
  is an openai-math corpus index number; no external reader can parse the title.
- MINOR (c-axis): the mathematics is a Hölder inequality plus quadratic-beats-linear;
  the article says so ("Part I uses no physics … it is a Hölder inequality and a
  contrapositive", :56–57) and the discovery input is Kuwahara's theorem taken as
  hypothesis `hKL`. Honest — but the *negative result* being fenced is the preprint's,
  not the project's; the abstract's "We formalize the chain that makes this a theorem"
  (:30–31) is the right claim, the title's "No-Go Gate" is the strong one.
- MINOR: Part II ("glue-grade", :58) is an interface-layer progress record (links 1–3
  of 4, link 4 "carried to Iteration 4", :140–141) inside the same article.

### 50M2 — Unconditional Strip Confinement (Cycle 2)

Best status-honesty in the Cycle-2 set: "For ζ and Dirichlet L at 7/8 or better we
claim **no first**… Our result is a downstream *consequence* … at a weaker constant"
(:60–63).
- **MAJOR — infrastructure narration displaces mathematics.** §1 "Why it needed work"
  recounts G7b runs 19–28 failure history (:50–53); §5 "Substrate" describes "a chain
  of 28 cached Modal image layers … layers at 8 GB, user-approved after telemetry
  showed 5.3–6.5 GB of memory-mapped Mathlib `.olean` pages" (:121–125). This is
  ledger content; in an article it reads as an ops report.
- MINOR: "R1.lean (178 lines)" (:67) — 180 on disk (2-line drift).
- MINOR: title self-references the project's own numbering ("…Discharging the
  Quasi-RH Hypothesis of Article 50", :1).

### 10 — Toward One Machine for All k (Cycle 2)

- **MAJOR (kind) — progress report as article.** The headline is explicitly open:
  "**The target theorem of §3 … is not proved.**" (:13–14); §3 is titled "Target
  theorem (not proved)" (:89). The proved layers are engineering (host simulation,
  counter combinators, countdown loop) toward a conjunction of two corpora results.
  Honest throughout — and still not an article; it is a tranche record for dossier 10.
- MINOR: byline carries governance log ("the assembly tranche carried to Iteration 4,
  by orchestrator decision 2026-11-14", :4–5).
- MINOR: title's "One Machine for All k" — k unexplained until the abstract.

## 4. Citation spot-check evidence (axis d)

28 checks executed 2026-11-16 against sibling trees and repo logs. Donor citations are
**exact to the line** in every checked case — a corpus strength the next iteration
should keep.

| article claim | checked against | verdict |
|---|---|---|
| 50/50M2: `OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re`, `OAI.DirichletCharacter.LFunction_ne_zero_of_seven_eighths_lt_re` @ `Nonvanishing.lean:19,29` | openai-math `lean/OAI/NumberTheory/DirichletL/Nonvanishing.lean` | exact (:19, :29) |
| 42M4: `simple_proportion_d4` @ `ZetaZeros/Main.lean:130`, `distinct_proportion_d5` @ :149 | axiommath/ZetaZerosV2 | exact |
| 71: `weil_conjectures` @ `LeanEval/WeilConjectures.lean:185–194` | axiommath/Weil | exact |
| 71: `dedekindZeta_ne_zero` @ DZDF `Main.lean:9` | axiommath/DedekindZetaZeroFree | theorem at :8–13 (off by one, immaterial) |
| 75: `abelianFactorization` @ `AbelianRayCharacterFactorization.lean:62` | axiommath/DZDF | exact |
| 73: `RayClassCharacter` fields @ `Challenge/DedekindZetaChallenge.lean:14–20` | axiommath/DZDF | exact |
| 10: `ETHIsFalse` @ eth `MainResults.lean:122`; `TM2ComputableAux` @ :178 | anthropics/eth | exact |
| 10: `padM_runs`, state sizes 2\|x\|+2·2^{e(x)}+3 @ `PaddedDescent/Pad.lean:93–94` | anthropics/eth `proof/rates/PaddedDescent/Pad.lean` | exact (article omits `proof/rates/` prefix — MINOR) |
| 30: display (48) @ `AppHalfPiecesStatement.lean:148–154` | anthropics/eth | exact |
| 52: `LemmaDual` @ `AppHalfPiecesStatement.lean:175` | anthropics/eth | exact |
| 32: `Corollary_31` @ `PaperStatements.lean:4014`; `epsStar` @ :2018 | anthropics/3sum-apsp | exact |
| 11: transfer-claim convention @ `TimeClaims/Sec3/Definitions.lean:54–58`; Theorem-17/Cor-16 → `Theorem_19_explicit M 0.00175 1` @ `Theorem19.lean:108–109` | anthropics/3sum-apsp | exact, including the constants |
| 01: `rank_trace_mult` @ :281, `rank_trace_mult_k` @ :369 | anthropics/zeta23 `ZeroSide/RankTraceMult.lean` | exact |
| 20: `trivial_chain` @ `Statement.lean:157`; `thmA₀_N0` @ `Final.lean:356` | anthropics/zeta23 | exact |
| 21: `cStar_denom_ge` @ `ThmD/Functional.lean:105` | anthropics/zeta23 | exact |
| 22: `tendsto_sum_range_div` @ mathlib `WienerIkehara.lean:693`; `psi_le_const_mul_self` @ `Chebyshev.lean:485`, `psi_eq_sum_Icc` @ :93; `riemannZeta_residue_one` @ `RiemannZeta.lean:242` | encore-mathlib checkout `ff2494ea` | exact |
| 50: `riemannZeta_one_sub` @ `RiemannZeta.lean:178`; `completedLFunction_one_sub` @ `DirichletContinuation.lean:291` | encore-mathlib | exact |
| 52: `contractLeft_ι_mul` @ `Contraction.lean:123`, `contractLeft_one` @ :176, `contractLeft_comm` @ :198 | encore-mathlib | exact |
| 71: tauceti genus-1 Hasse bound @ `HasseBound.lean:44` | tauceti `TauCeti/AlgebraicGeometry/EllipticCurve/HasseBound.lean` | exact |
| 10: openai monitor shape @ `SqrtLogSpace/Final.lean:122–128` | openai-math | exact |
| 22: fork amputated StrongPNT @ fork `StrongPNT.lean:1883–1885` | axiommath/PrimeNumberTheoremAnd | exact (commented placeholder confirmed) |
| 75: `Pa.lean` 1,557 lines; 10: `L2.lean` 2,625; 42M4: `M4a` 1,194 / `M4b` 1,571; 73: `C.lean` 236; 72: `C-neg.lean` 369 | `wc -l` | all exact |
| 71: "P2.lean has 279 lines" | 282 on disk | **drift (MINOR)** |
| 50M2: "R1.lean (178 lines)" | 180 on disk | **drift (MINOR)** |
| 42M4: "kept frozen … not edited" | git `c540682` (02:31) vs `4e19304` (09:19), 2026-11-14 | **false (BLOCKER)** |
| log paths: `pilots/75/logs/run6-final.log` (rc 0, Pa.lean OK), `pilots/73/logs/run6-c-green.log`, `run7-p0-final.log`, `pilots/42/logs/m4b2-*.log`, `pilots/10/logs/l2-run5-final-green.log`, `pilots/11/logs/m2-run8-GREEN.log`, `feasibility/probe/logs-g/run31/32-*.log`, per-pilot `axcheck-c2-final.log` ×15, ledger §9.F (43/43 plain + M4b donor-tree) | all present, contents match claims | verified |

## 5. The 3–5 most probable causes of the unsatisfactory external feedback (ranked)

1. **The Cycle-2 half is close-out paperwork published as discoveries.** Of 9 slots,
   only 75 (corollary-level statement class) and 72-Part-I (elementary formal fence)
   contain project-originated mathematics; 42M4 is a donor swap ("There is no new
   analytic mathematics", 42M4:48), 50M2 a binder discharge, 71/73 formalization-first
   statement layers, 10 an open-headline tranche, 11/22 addenda. Git shows the batch
   was manufactured at deadline: `dabd87a` 02:21 "six article drafts (71/72/73/42M4/
   50M2/10, verdict-slotted)", then `3876126`/`ce0a15e`/`01784fb`/`4e19304`/`bb51660`
   "rewritten as finished research articles" through 09:19, same day. A referee reading
   the set front-to-back meets increasingly thin content in identical article clothing.
2. **House-dialect status lines make verification status unparseable.** "PROVED at
   Tier C" (73:8), "PROVED (entry milestone)" (75:10), "+ M2 COMPLETE (…; A8 formal
   report received)" (11:9–10), bold "PROVED, FINAL." over conditional theorems
   (42M4:11). The information is usually present a sentence later — the *label* is what
   a skimming reader takes, and the label is in a private language.
3. **Statement-level "first" claims read as mathematical priority claims.** "the first
   ζ_K zero-proportion statements whose ζ-column is unconditional *inside Lean*"
   (42M4:30–31), "the first zero-proportion statements for ζ_L, formal or informal"
   (75:34–35), "the first formal s-plane statement" (71:12–13), "We give the first
   formal statement layer" (73:31). Each is technically scoped; none survives the
   abstract with its scope intact, and the scoping ("in our corpora", "inside Lean") is
   exactly the part an external reviewer will strike.
4. **Record-integrity failures at the seams.** README row-10 contradiction
   (README.md:26–29 vs :45); stale row 11 (:19 vs :46); 42M4's false "not edited"
   claim; article 11's §7 contradicting its own addendum; inline errata in article 42's
   abstract. Individually small; collectively they tell a reviewer the corpus cannot
   keep its own story straight.
5. **Infrastructure narration crowds out mathematics.** Error trajectories ("errors
   20→14→12→6→7→3→1→0", 72:151), diffstats ("net change of +11 lines", 42M4:149–150),
   Modal-layer and memory-approval stories (50M2:121–125), sweep stage IDs
   ("AxPilot73_C: OK, 14 axiom lines", 73:146–147) occupy the formal-record sections
   that in a real article state theorems, declarations and axioms.

## 6. Cross-cycle pattern (queue 2)

### What systematically degraded, main run → Cycle 2

| dimension | main run (2026-11-09) | Cycle 2 (2026-11-13/14) |
|---|---|---|
| unit of achievement | theorem (new identity, refutation, frontier, assembly) | milestone (donor swap, binder discharge, statement layer, tranche, addendum) |
| authoring mode | written once at close, per "one article per discovery" | slot drafts at 02:21, force-rewritten as "finished research articles" by 09:19 at close-out |
| novelty vocabulary | "new theorem" with named nearest misses | "first formal statement / first inside Lean / in our corpora" |
| main-run file integrity | frozen | retro-patched: errata inlined in 42, addenda appended to 11/22/52 |
| status dialect | "PROVED, certificate-conditional" (decodable) | "Tier C", "entry milestone", changelog status blocks |
| verification sections | Lean declarations + axioms + logs | + run histories, diffstats, Modal/GB approval narratives |

The main-run set already contained the seeds (11 was a milestone-M1 article; 22 a
self-declared formalization), but the ratio inverted: main run ≈ 7–8 discovery-grade of
10; Cycle 2 ≈ 0–2 of 9 by the same bar.

### Verdict per article kind

| kind | instances | verdict |
|---|---|---|
| New theorem, unconditional or crisply conditional | 01, 30, 52, 32; 42-family; 75 | **DESERVES an article.** 75 only with hypothesis-schema framing in title/abstract. 42+42M4 must merge into one versioned article. |
| Negative result with a formal/certified theorem | 21, 50 Part II, 72 Part I | **DESERVES an article**, provided the negated claim is precisely attributed (72 must foreground that the refuting theorem is Kuwahara's, as hypothesis `hKL`). |
| Source-inspection structural argument | 50 Part I | **Section inside the article, not a standalone result.** Keep the honest "not a Lean theorem" label. |
| Donor swap / binder discharge | 42M4, 50M2 | **NOT an article kind.** Fold into a revised version of the upgraded article (v2 with a changelog line), or the dossier. Standalone publication splits one theorem's status across files — the 42/42M4/75 tangle is the cautionary example. |
| Formalization-first statement layer | 71, 73 | **Article only if formalization changed the mathematics** (forced statement correction, found falsity) **or yields a consumable theorem**. 71 qualifies (pole-exclusion correction, §3 Remark). 73 does not yet (Q4 un-landed; quotient differentiability) — dossier/pilot notes until Q4. |
| Progress tranche, headline open | 10 | **NOT an article kind.** Dossier tranche record (`pilots/10/next-tranche-spec.md` already serves this). Article only when the §3 target lands or a layer is independently interesting (L2's value-time/word-space separation is the borderline candidate — as a theorem inside a future article, not a "Toward" article). |
| Addendum / knowledge-level closure | 11 M2 addendum, 22 closure note, 52 nearest-neighbor note | **NEVER inside articles.** Revise the article (11 §7) or update dossier/survey (22, 52). Articles are versioned wholes, not append-only logs. |

## 7. Recommendations

**Three most urgent rewrites (articles):**

1. **42 + 42M4 → one revised article 42 (v2)** — the flagship (Top-3 #1) currently
   split across three files, with a false freeze claim (42M4:5–6), abstract errata
   (42:29–31), and a "PROVED, FINAL" status over χ-conditional theorems (42M4:11).
   Merge: statement class once, ζ-column discharge as a section, DLRT comparison
   rewritten (not bracketed), single status row.
2. **73** — BLOCKER status opacity ("Tier C") plus the worst claim-to-content ratio in
   the corpus: either demote to dossier notes until Q4 (rationality discharge) lands,
   or rewrite with a plain-language status, a title matching the actual object
   (character class + conditional window statements), and the 1/2-vs-31/32 comparison
   recast with hypothesis provenance on both sides.
3. **11** — resolve the self-contradiction (§7 "not attempted here" :114–118 vs
   addendum "PROVED" :132) by integrating the M2 material into the body with one
   status block in standard vocabulary; drop "A8 formal report received" from the
   article.

**Immediate non-article repairs:** README row-10/row-11 contradictions (BLOCKER);
supersession pointers in the main table; move 22's closure note and 52's addendum to
dossier/novelty notes.

**Keep as-is (minor touch-ups only):** 01, 30, 52, 21, 22 (body), 71, 50M2 (delete the
ops narration), 75 (rescope the abstract's "first" sentence), 32 (add the crossing
caveat to the abstract), 20 (per-theorem status line for Theorem 5), 50 (number the
trailing sections), 72 (retitle without "Family-265").

The iteration-4 authoring gate that encodes all of this is
`research/articles/TEMPLATE-iter4.md` (written with this audit).
