# Novelty verification — round 3

Lane R8, 2026-11-09. Scope: dossiers landed since round 2 (40, 41, 42, 60 = DOSSIER-CHECKED;
20, 21, 22, 50 whose queued queries are run here), repositioning analyses for 01 and 10/Z3,
pre-checks for not-yet-landed dossiers (30–32, 52), and strategic depreciation notes.
Labels: **DOSSIER-CHECKED** / **PRE-CHECK** / **NOT-YET-LANDED**.

## Method additions (on top of rounds 1–2)

11. **Semantic Scholar Citations API** (no key, works):
    `https://api.semanticscholar.org/graph/v1/paper/arXiv:<id>/citations?fields=title,year,externalIds&limit=40`
    — the citation-graph drill dossier 20 asked for; returned 14 citers of AF in one call.
12. zbMATH record review texts are reachable via the API (`editorial_contributions[].text`)
    — used to characterize CCLM17 without leaving the shell.

---

## §1. DOSSIER-CHECKED — 40 (ζ_K′ / Ξ_K′ derivative zeros)

**Dossier's five queries run**: arXiv `"zeros of the derivative" "Dedekind"`, `derivative+Dedekind+zeros`,
`Levinson+number field`, `Speiser`; zbMATH `zeros derivative Dedekind zeta` (all 11 hits);
Farmer–Gonek number-field remarks; openai `completedThetaXi` context.

**Evidence**:
- **Šleževičienė 2003 (Zbl 1132.11340), "Speiser's correspondence between the zeros of a function
  and its derivative in Selberg's class of Dirichlet series"** — the conditional
  Speiser-correspondence (RH ⟺ derivative zero-free half-plane) is proved for the SELBERG CLASS,
  which covers ζ_K and nice Hecke L. The conditional zero-location theory for ζ_K′ **exists
  classically**.
- Zaheer, arXiv:2512.19761 (2025): ERH-equivalent closed forms for series "involving derivatives
  of an analogue of the Riemann xi function for Dedekind zeta function" — the ξ_K′/ξ_K object is
  studied conditionally; no strip/proportion statements.
- Broughan 2009 (Zbl 1228.11130): Re(ξ′/ξ) positivity region for **ζ** "extended to near the
  critical line" — the T2(i)-type positivity has a classical literature (for ζ).
- Adjacent: Ghosh 2026 (Higher Euler–Kronecker constants of number fields — ξ_K′/ξ_K-adjacent);
  nothing on unconditional strips or proportions for ζ_K′ anywhere; AF citation graph (§5 below):
  no ζ_K/Hecke extension; Lamzouri 2610.26841 = ζ/Dirichlet combinations only.
- openai-math `completedThetaXi` (`OAI/NumberTheory/PrimePackets/IdealThetaXi.lean`): **Lean-only** —
  no corresponding preprint found (not in `preprints/`, not in `CONTENTS.md`); no derivative-zero
  content in the tree (dossier's own rg; consistent).

**Verdict**: T2 (Speiser-type strip for Ξ_K′) = **NEW-CLAIM-CONTESTED** — conditional Selberg-class
Speiser correspondence exists (Šleževičienė 2003), ξ′/ξ positivity regions classical for ζ
(Broughan 2009); the *unconditional* T2 statements may still be new but are one small step from
known conditional results → per the dossier's own honesty note, T2 degrades toward
formalization-plus-small-new. T3 (proportions for Ξ_K′) = **NEW-CLAIM-SUPPORTED** (stated nowhere;
nearest kin conditional: FGL 2008 for ζ (RH), Zaheer 2025 series identities). Confidence: medium.
**Dossier amendment**: add Šleževičienė 2003 and Broughan 2009 to nearest misses (currently absent).

## §2. DOSSIER-CHECKED — 41 (q-deformed eight-square / Temperley–Lieb)

**Dossier's five queries run**: zbMATH `quantum octonion` (100 physics hits, inspected),
`q-deformed octonion` (0), `q-octonion` (0), `Temperley-Lieb octonion` (0), `quantum composition
algebra` (100 → all Hall-algebra noise); arXiv `q-deformed octonion` (0), `octonion+Temperley-Lieb`
(0), `quantum octonion` (1).

**Evidence**:
- **Benkart & Pérez-Izquierdo, "A quantum octonion algebra" (arXiv:math/9801141, 1998)**: quantum
  analogue of the *split* octonions via U_q(D₄) with "a nondegenerate bilinear form which satisfies
  a **q-version of the composition property**", plus identities. This is a published
  q-deformed-composition/norm identity at object level — the direct collision the dossier feared.
- No four-term Graves alternation with (1−q) defect; no TL/Jones trace host; no cubic-corrected
  sign family (eth-type) anywhere in the sweeps; "q-deformed octonion"/"q-octonion": zero hits.

**Verdict**: object level **NEW-CLAIM-CONTESTED** (q-composition property known since 1998);
(M)+(N) — the σ_q sign family with the explicit (1−q)·G_q parallelogram defect — **plausibly new**
(no hit); (H) — the TL/Jones diagrammatic host — **NEW** (no octonion–TL connection found).
Dossier amendment: rephrase "first q-deformation of a composition-algebra sign rule" to
"first *sign-rule/parallelogram-defect* deformation", citing Benkart–Pérez-Izquierdo as the
q-composition precedent. Confidence: medium-high.

## §3. DOSSIER-CHECKED — 42 (ζ_K 2/3 assembly + C_D common-zeros defect)

**Dossier's three queries run**: AF-remark risk (cleared in round 2 §5 — AF v2 has no
Hecke/Dedekind/number-field statement or remark; re-confirmed: no citer of AF adds one, §5 below);
`common zeros` + zeta/Dirichlet (arXiv 0; zbMATH 7 hits); `zeros of Dedekind zeta` simple
(round 2 §5: Zhang 2310.07360 conditional).

**Evidence**:
- Common-zeros nearest misses: **Li Bao-Qin 2012, "On common zeros of L-functions"** (zbMATH);
  **Garunkštis–Kalpokas 2013, "The discrete mean square of the Dirichlet L-function at nontrivial
  zeros of another Dirichlet L-function"** (zbMATH) — common zeros / L-values at another L's zeros
  are a *studied topic*. Neither states the windowed on-line common-zero **count** C_D as a
  proportion defect for ζ×L(χ_D).
- Lamzouri 2610.26841 (v2, Oct 26): zeros of *linear combinations* of Dirichlet L-functions +
  13/20 c-isolated zeros — nearest recent kin for overlap/isolation accounting; different quantity.
- Knausgård 2609.33043 (§5 below): "a nonnegative correction from **overlaps between different
  nearby zeros**" — spiritually adjacent to C_D-style overlap accounting, third-party.

**Verdict**: B-K = corollarical formal-first (dossier says so; AF-remark risk cleared);
**C_D = NEW-CLAIM-SUPPORTED in the narrow sense** (the counting-defect quantity for the
ζ×L(χ_D) pair is unstated) — but the dossier's phrase "genuinely unstudied quantity" must be
softened: common zeros of L-functions are a studied topic (Li 2012; Garunkštis–Kalpokas 2013).
Confidence: medium-high.

## §4. DOSSIER-CHECKED — 60 (border-rank first connector)

**Attribution checks (the dossier's `[R8 confirmation pending]` list)**:
- **Laderman 1976 CONFIRMED**: "A noncommutative algorithm for multiplying 3×3 matrices using 23
  multiplications", Bull. AMS, Zbl 0322.65021 — rank ≤ 23 is Laderman, **not** Smirnov (the
  orchestrator's question). Current activity: Tomar 2026 (arXiv:2610.11823) "rank of 3×3 over F₂
  is 23".
- **Schönhage 1981 CONFIRMED** as the exponent/asymptotic-sum source: "Partial and total matrix
  multiplication" (Zbl 0462.68018, SIAM J. Comput.; Wikipedia timeline "1981 2.522 Schönhage")
  — the ten-term direct-sum identity content is classical there (per BCS ch. 15, as the dossier
  cites).
- **⟨3,3,3⟩ border rank ≤ 21: attribution UNCONFIRMED.** Not stated on either Wikipedia page
  ("Matrix multiplication algorithm", "Computational complexity of matrix multiplication"); zbMATH
  sweeps surfaced no attributing source; Landsberg–Michałek arXiv:1911.07981 gives the lower bound
  R̃(M₃) ≥ 17 without attributing ≤ 21. **Action**: verify in BCS ch. 15 / Landsberg's book by hand
  before asserting, or drop the specific 21 attribution. (Side datum from Wikipedia: "over a
  commutative ring, 21 multiplications suffice" for 3×3 — a different, commutative-rank fact.)
- External formalization: AFP full scan (round 1, 1044 entries) has no tensor-rank/border-rank
  entry (Deep_Learning CP-rank only, per dossier); Coq/mathcomp nothing (rounds 1–2). openai's CW
  instance (`ComplexCWBoundary.lean:237`) remains the only corpus instance — the dossier's
  ECOSYSTEM-NOT-DISCOVERY labeling is **CONFIRMED**, with Laderman/Schönhage/Strassen attributions
  verified and the 21-border-rank attribution flagged.

## §5. Sweeps of landed dossiers 20 / 21 / 22 / 50 (their queued R8 queries)

**20 (Hecke/ζ_K zero-density) — citation-graph query run.** Semantic Scholar: 14 citers of
arXiv:2608.13637. All ζ/Dirichlet-family; **no GL(2)/Hecke/ζ_K proportion anywhere**. The cluster:
Biao Wang 2609.24167 (improves C₀, C₁ by δ₀ = 6.66624×10⁻⁸ refining Lamzouri), Wang 2609.07918
(short intervals), Knausgård 2609.33043 (distinct ≥ 0.8369928814; see §6), Cobeli–Zaharescu
2610.23467 (≥ 8/9 simple-or-on-line), Lamzouri 2610.26841 (13/20 c-isolated + linear combinations),
Pearce-Crump 2609.15329 (Selberg method, 6.78%), Aryan 2610.12853 (Im ζ′/ζ), Angón–Ross–Tang
2610.22927 (consecutive moderate gaps), 2610.26575 (automorphic surfaces — RH/Rudnick–Sarnak
geometry, not a proportion theorem). **E1 novelty STANDS**; but note the constants E1 would
instantiate (2/3-level, 0.6725-level) are already informally superseded — E1's value is "first
Hecke/ζ_K statements", not record constants. Iwaniec–Kowalski ch. 10/18 remain the classical
density-theorem (N(σ,T)) references — a different notion, as the dossier records.

**21 (quartic window / ThmD) — CCLM17 identified and characterized.**
**CCLM17 = Carneiro–Chandee–Littmann–Milinovich, "Hilbert spaces and the pair correlation of
zeros of the Riemann zeta-function" (2017, Zbl 1362.11078)** — zbMATH review: "**Throughout the
paper the Riemann hypothesis (RH) is assumed**"; the paper is Montgomery-pair-correlation Hilbert
theory. Consequences: (A1) formalization-first (their optimality is RH-conditional); **(A2) —
certificate-class sup = MT constant — NEW as a formal optimality statement** (CCLM17's class is
conditional and pair-correlation-shaped; AF asserts only the ≤ 0.6819 ceiling, never
sup = 0.6725 — round 2 §1 confirmed). Outcome-B caveat: Biao Wang's δ₀ > 0 (2609.24167) shows the
*method* constant moves (via Lamzouri-refinement, not proven to be a window change) — the
"separator" question is live and third parties are pushing it. Verdict: A2
**NEW-CLAIM-SUPPORTED**, window narrowing.

**22 (quasi-RH effective PNT) — AFP check run.** AFP `Prime_Number_Theorem` (Eberl–Paulson;
files: `Prime_Number_Theorem.thy`, `Newman_Ingham_Tauberian.thy`, `Mertens_Theorems.thy`,
`Prime_Counting_Functions.thy`) — Isabelle **has** PNT + Mertens + a Tauberian route; no
effective/quasi-RH error-term entry found. Dossier's "first-in-mathlib only" posture **confirmed
honest**. Mathlib race (PRs #41394/#44062/#43238) unchanged from round 2 §9(ii) — Tier-1 urgency
HIGH.

**50 (7/8-truncated window constants) — residual S3 queries run.** Broughan 2009 (Zbl 1228.11130)
extends Re(ξ′/ξ) > 0 "to near the critical line" **for ζ** — classical anchor. S3 (ξ′/ξ band below
σ = 1) = **KNOWN-INFORMAL for ζ** (Broughan); any surviving S3 content is the ξ′-of-completed
variant or formalization only — consistent with the dossier's own negative-leaning engine audit.

## §6. Repositioning — dossier 01 (parts-level, vs AF v2 Lemma 3.2 + §7.2(b))

Parts verdict (evidence: AF v2 fulltext fetch, round 2 §1):
- **The exact five-defect identity/decomposition: NEW.** AF has the one-sided lemma; no
  slack decomposition anywhere.
- **Named-defect nonnegativity (structural taxonomy): NEW** (AF Remark 3.3 is a variational proof
  sketch via scalar squares, not a defect taxonomy).
- **A1** (re-derive `rank_trace_mult`/`rank_trace_ineq`): glue, correctly not claimed as novelty.
- **A2** (Δ₊ = 0 ⟺ P·Q₊ = 0 gain): NEW, elementary.
- **A3** (n₋ tail-mass strict improvement): NEW as a formal statement — but see hazard below.
- **A4** (equality characterization): **PARTIALLY CONTESTED** — AF v2 already states the base
  equality case (P = Π₁, Q = 2Π₂ orthogonal projections, Lemma 3.2) and §7.2(b) sharpness of the
  downstream inequalities with the ⅔N+⅙N extremal configuration; A4's *five-defect simultaneous*
  characterization is finer and new, but the headline must credit AF's stated equality case.
- **A5** (polarized/bilinear MV-analogue): NEW (no polarization content in AF or zeta23; the MV
  ladder's third storey unclaimed).
- **New hazard (this round)**: Knausgård, arXiv:2609.33043 (v2, Sep 27 2026, single author)
  improves distinct-zeros to ≥ 0.8369928814 via "a short matrix inequality with a **free clipping
  parameter**" + threshold lemma + block dichotomy, and states: "The matrix inequality, the
  threshold lemma, the block dichotomy, the counting assembly and the exact arithmetic are
  **proved formally in Lean 4**" (no public repo found — GitHub search: 0). This is a live
  third-party Lean effort in exactly the certificate-matrix-inequality space of 01/02, and its
  abstract also cites "a report we have not verified [that] claims 0.83672". Constants in this
  area are moving monthly; the *identity* (01) remains the right formal object, but
  significance-window risk is now **high**.

## §7. Repositioning — dossier 10/Z3 (exact claim + pre-emption check)

**Rephrased novelty claim (recommended wording for triage):**

> There exist a single deterministic machine M and constants C, S, e — all fixed **before** k —
> such that for **every** k ≥ 1 and every k-CNF φ (n ≥ 4, m ≥ 2, every variable occurring), M
> outputs #φ in ⌊2^{C·min(km/√log₂m, k²n·log₂log₂n/√(log₂n))}⌋ steps **while visiting at most
> S·(|enc φ|+1)^e cells** (per-execution-prefix space).

Pre-emption audit (final): arXiv `subexponential k-SAT space` → 0; Semantic Scholar citers of
2610.06783 → 0 (as of today); the three known claimants audited in round 2 §4 (eth: uniform +
min-rate, NO space; openai: per-fixed-k + poly-space, Lean only at the weaker (loglog n)² rate;
suquark: 3-SAT-only + poly-space, ε-form rate, multitape). O'Donnell/Kintali expositions not on
arXiv (blog-level). **No fourth claimant; the conjunction is un-pre-empted. Verdict:
NOVEL-SUPPORTED (high confidence), with the exclusions above phrased explicitly.**

## §8. Pre-checks for NOT-YET-LANDED dossiers

- **30–32 (R7 tensor/Hall-Parseval/BudgetedSplit): NOT-YET-LANDED** (no files at
  `research/candidates/3*.md` as of this round). Re-queue.
- **52 (unified CCR/Heisenberg-Fock layer): NOT-YET-LANDED; orchestrator-supplied queries run as
  PRE-CHECK**: arXiv `"canonical anticommutation relations" formal` → 0 relevant (hits are
  math-physics, not formalization); `"Heisenberg algebra" "Fock" "proof assistant"` → 0; mathlib
  grep `fock|anticommutation` → 0 (one false positive); eth's `ClauseBound.Boson` is in-house.
  No CCR/Heisenberg-Fock formalization found in any assistant (Lean/Isabelle/Coq) — the gap is
  plausible; full check when the dossier lands.
- 51: rescoped KNOWN-INFORMAL in round 2 §7 (Pan 1985) — unchanged.

## §9. Strategic notes

**(i) IEANTN-exposure final list** (who depreciates if teorth/IEANTN lands RvM/EF/zero-count):
- **Depreciate outright (urgency HIGH, window = months)**: the survey-§4 *donation plays*
  ("RvM/first zero-counting into mathlib", "WeilEF API donation") — IEANTN already ships the
  vocabulary (`zetaN`, `HasRvMBound`, `zetaZeroesSum`) and stub nodes.
- **Exposed but re-scopable (moderate)**: 20 (gains generic machinery, loses "first
  engine-instantiation beyond Dirichlet" only if IEANTN adds Hecke nodes — none today); 40's
  zero-count component (RvM-adjacent); E2 (Weil-EF-beyond); 22 Tier-1 (mathlib PNT PRs — HIGH).
- **Immune**: 01, 02, 03 (matrix analysis), 10/11/12 (complexity), 41 (q-algebra),
  42 (consumes only zeta23's submitted statements — no RvM), 21 (zeta23-internal),
  50 (openai quasi-RH input), 60 (tensor connector).
- **New depreciation clock (faster than IEANTN for the zero-side constants)**: the AF-cluster
  itself — Wang (×2), Knausgård, Cobeli–Zaharescu, Lamzouri (×2) moved the ζ records within
  8 weeks (0.67250 → 0.67250+δ₀; distinct → 0.83699; simple-or-on-line → 8/9), and Knausgård
  claims a Lean formalization (no repo yet). Candidates 01/02/21 whose bottom lines are constants
  or ceilings should be sequenced early or re-scoped to structural statements.

**(ii) Hughes–Miller citation fix for dossier 02 — flagged for H's QA sweep**: the dossier's
novelty-check cites 'Hughes Miller "zeros of L-functions coupled" (2008)' — **no such paper
exists** (arXiv 0, zbMATH 0). The verified reference is **C. P. Hughes & S. J. Miller, "Low-lying
zeros of L-functions with orthogonal symmetry" (2007)** (zbMATH). Fix in
`research/candidates/02-ez5-bandwidth-k-ceiling-laws.md` before triage.

## §10. Round-1 erratum (records moved)

Round-1 §4 said "no paper found improving 0.6725 for ζ itself" — now false:
Biao Wang, arXiv:2609.24167 (v2) improves the simple+on-line constant to C₀+δ₀ and distinct to
C₁+δ₀/2 (δ₀ = 6.66624×10⁻⁸); Knausgård arXiv:2609.33043 improves distinct to ≥ 0.8369928814;
Cobeli–Zaharescu arXiv:2610.23467 prove ≥ 8/9 simple-or-on-line (vs Lamzouri's 88.76%).
Current informal record (as of 2026-11-09): simple+on-line ≈ 0.67250+6.7×10⁻⁸ (Wang), distinct
≥ 0.83699 (Knausgård), simple-OR-on-line ≥ 8/9 (Cobeli–Zaharescu). zeta23 remains the only
*published* Lean formalization of the original statements.

## §11. Summary table

| § | Candidate | Label | Verdict | Conf. |
|---|---|---|---|---|
| 1 | 40 T2 (Speiser-type ζ_K′) | DOSSIER-CHECKED | NEW-CLAIM-CONTESTED (Šleževičienė 2003 Selberg-class Speiser; Broughan 2009 positivity) | med |
| 1 | 40 T3 (Ξ_K′ proportions) | DOSSIER-CHECKED | NEW-CLAIM-SUPPORTED (unstated anywhere; FGL/Zaheer conditional nearest) | med |
| 2 | 41 (M)+(N) σ_q defect identity | DOSSIER-CHECKED | NEW (narrow) — object-level CONTESTED by Benkart–Pérez-Izquierdo 1998 q-composition; (H) TL host NEW | med-high |
| 3 | 42 B-K / C_D | DOSSIER-CHECKED | B-K formal-first (honest); C_D NEW-narrow vs Li 2012 + Garunkštis–Kalpokas 2013 | med-high |
| 4 | 60 connector | DOSSIER-CHECKED | ECOSYSTEM-NOT-DISCOVERY confirmed; Laderman 1976 ✓, Schönhage 1981 ✓; border-rank-21 attribution UNCONFIRMED (flag) | high |
| 5 | 20 (E1 Hecke) | sweep | NOVEL-SUPPORTED (14 AF-citers, none Hecke/ζ_K); constants already superseded informally | high |
| 5 | 21 (A2 certificate-sup) | sweep | NEW-CLAIM-SUPPORTED (CCLM17 = Zbl 1362.11078, RH-conditional, different class); outcome-B live via Wang δ₀ | med-high |
| 5 | 22 (PNT pilot) | sweep | Formalization-first confirmed (AFP PNT+Mertens exist: Eberl–Paulson); mathlib race urgency HIGH | high |
| 5 | 50 (S3 ξ′/ξ band) | sweep | KNOWN-INFORMAL for ζ (Broughan 2009) — consistent with dossier's negative audit | high |
| 6 | 01 parts | repositioning | identity/nonnegativity/A2/A3/A5 NEW; A4 partially contested (AF Lemma 3.2 equality + §7.2(b)); hazard: Knausgård Lean effort | med-high |
| 7 | 10/Z3 | repositioning | NOVEL-SUPPORTED for the uniformity+min-rate+space conjunction; no fourth claimant | high |
| 8 | 30–32, 52 | NOT-YET-LANDED | 52 PRE-CHECK: no CCR/Fock formalization found; re-queue on landing | med |

---

## §T. Threat deep-dive — Knausgård (appended after round-3 proper, same day)

Scope upgraded mid-round: the repo hunt found not one Knausgård paper but **two** — and the
second one is built on zeta23 itself.

### T(a) The papers, exact statements, and what is Lean-proved

**Paper 1** — arXiv:2609.33043 (v1 **2026-09-27**, v2 2026-10-07), "More than 83.69% of the
zeros of the Riemann zeta function are distinct", sole author **Kristian Muri Knausgård**
(kristianmk@ieee.org, no affiliation shown; "primarily an experiment in AI-assisted mathematical
research", developed with OpenAI Codex and Anthropic Claude).
- **Theorem 2, "Mixed-multiplicity Gram inequality"** (the "short matrix inequality with a free
  clipping parameter"): *U Hermitian l×l with unit diagonal, D = diag(d_i), 1 ≤ d_i ≤ 2,
  G = D^{1/2}UD^{1/2}; parameters τ ≥ 0 and c ≥ max(1+τ, 2+τ/2); then*
  **tr φ_c(G) − tr D² ≥ tr Ψ_τ(U)**, *with φ_c, Ψ_τ convex quadratic-clip functions*. Chosen
  instance: τ = 12/5, c = 17/5. It is a **pure trace inequality between clip-function traces**
  — no Frobenius norm, no rank, no inertia budget (contrast: AF/zeta23's rank–trace certificate
  c·trP − (c²/4)r + 2c·trQ − c²b ≤ ‖P+Q‖²_F). U carries no PSD hypothesis.
- Lean-proved (paper's own §4 list): Lemma 3, Theorem 2 (all valid τ, c), Lemma 4 in two forms,
  their combination, the counting assembly, "all exact constants"; axioms =
  propext/Classical.choice/Quot.sound, no sorry. **Not** formalized (enter as explicit
  hypotheses): the operator reduction, the energy asymptotic, the computer-assisted "certified
  local inequality" (Prop. 6, seven-point windows, Arb-based — independently re-run), pinching,
  K→K_ε smoothing.
- Outcome: liminf N_d/N ≥ 0.8369928814 (vs AF/MT 0.83625, Wang's 0.83625+3×10⁻⁸, unverified
  reports 0.83671/0.83672, Chandru's unrefereed 0.83652). Method: unconditional Montgomery pair
  correlation → energy estimate; gain = "a nonnegative correction from overlaps between
  different nearby zeros … retained even when some of these zeros are double". Window remark:
  "The Montgomery–Taylor window gives the bound 0.83625 this way. **The window used here gives
  up about 2×10⁻⁵ of that baseline in exchange for a larger gain below**."
- Lean source: "in the ancillary files" of the arXiv submission (confirmed present on the abs
  page).

**Paper 2** — arXiv:2610.08965 (v1 **2026-10-06**) + public repo **`kristianmk/839`** (created
2026-10-04, last push 2026-10-09; Lean; also mirrored on alphaXiv 2610.08965), "More than
**83.9%** of the zeros … are distinct and more than **67.35%** are simple and on the critical
line". Six formal theorems over Mathlib-defined counts (`Ncount/Ndist/Nsimple/N0simple/
N0mult/NsimpleOrLine` on `riemannZeta`):
- `distinct_zeros_839`: N_d/N ≥ 1645064/1960733 = **0.8390045** (hence simple ≥ 0.6780091);
- `simple_critical_zeros_673`: N₀ˢ/N ≥ 1669159/2478195 = **0.6735382** — *the first improvement
  of the simple+on-line constant over AF's 2−1/cMT = 0.67250* (also beats Wang 0.6725067 and an
  unverified 0.673492 report);
- `average_simple_and_critical_8367` ≥ 0.8367691; `simple_or_critical_8891/8893` ≥ 0.8891609 /
  **0.8893150** (beats Cobeli–Zaharescu's 8/9 = 0.8888…);
- **Ceilings (paper Props 7.2–7.3, namespace `Ceilings`)**: certificate classes `PairCert s
  x₁ x₂ b` (17/20-separated labelled configurations, spread ≤ R, pair energy within index
  distance s ≥ x₁n₁ + x₂n₂ − bR − C₃) with formal ceiling bounds —
  `ceiling_range6 < 83916/100000`, `ceiling_range8 < 83943/100000`,
  `ceiling_range10 < 83957/100000`, `ceiling_all < 83998/100000`, and line-family
  `ceiling_line_range7 < 67357/100000`, `ceiling_line_all < 67383/100000`. **A monotone ladder
  of ceilings in the index-distance parameter s = 6, 8, 10, ∞** — i.e., his constants sit within
  ~1.5×10⁻⁴ of his class ceilings.
- **Builds on zeta23 directly**: "extends the library `zeta23` of
  github.com/anthropics/formal-math @ fbdc36bb, v4.33.0-rc2" via **`upstream_relax.patch`**
  (560 lines, 14 files, dated 2026-10-02): relaxes the window-hypothesis lower bounds
  **1/2 ≤ b → 1/8 ≤ b** and **1/2 ≤ a → 1/4 ≤ a** in the hypothesis-collection propositions
  (`LocalHypsCore`, `LocalHypsCoreW`, `AdmFamily`, `WindowZeroSide`, `FactsXi`) — "no definition
  … changed, no axiom and no unproved statement is added, Challenge files not touched". 242 Lean
  files; external computer-assisted inputs (Prop 6-style certificates: kernel tables,
  majorant checks, branch-and-bound; C++ verifier: 60,467,309 boxes) are outside Lean.

### T(b) Overlap map vs our dossiers

- **01 (five-defect identity)**: Theorem 2 is **not** a rank–trace-type inequality (no
  Frobenius/Rank/inertia; different shape and different Gram setting: multiplicity-weighted
  Gram of on-line zero labels). It does not subsume `rank_trace_mult` or the defect identity.
  But its "nonnegative correction from overlaps" is morally the Δ₊-defect move, formalized and
  exploited *ahead of us*. **NUMERICALLY-SUPERSEDED context, statement UNAFFECTED** — and note
  the de-risking positive: his patch proves zeta23's window machinery (§4–5, PrimeSide/ZeroSide)
  accepts non-MT windows with only hypothesis-collection changes — the exact glue dossiers
  20/21/42 must write is demonstrated feasible.
- **02 (bandwidth-k ceilings)**: his `Ceilings/` is a **formalized, parameterized ceiling
  ladder** (s = 6, 8, 10, All) for his pair-energy certificate family — the *program shape* of
  dossier 02 (certificate classes indexed by a data-range parameter + monotone computable
  ceilings + near-attainment) is now **anticipated**. Different certificate notion (index-
  distance pair energy vs zeta23's (c₀, r) window certificates; different axis than our pair-
  *mass* bandwidth k) and no LP-duality representation visible in his files. **COLLIDING-in-part
  (framing), structurally distinct (axis + method)**. Re-scope: drop "first formal barrier
  theory"; lead with (i) the LP/weak-duality computability theorem, (ii) the B₂ *pair-mass*
  question for zeta23's own certificate class, (iii) the relation between his index-distance
  axis and our bandwidth axis (a dictionary theorem would be a genuine contribution).
- **21 (window constants / A2)**: **STRUCTURALLY-ANSWERED-BY-EXAMPLE**: a non-MT window beating
  the MT constant *within bandwidth-one* is now proved formally (0.67354 > 0.67250), with his
  own ceilings capping his class at 0.67383. A2 as posed ("certificate class collapses to the
  MT constant") is refuted for the method family; the surviving question is only about zeta23's
  (c₀, r)-certificate class specifically. **Recommend demote/absorb into 02** as a case study.
- **Not touched**: 03/10/11/12/22/30/31/32/40/41/42/50/60 — no overlap (his work is entirely in
  the ζ-proportion domain). For **32** specifically (coordinator's question): his free-clipping
  inequality is an optimization inside the *zero-proportion* energy argument; it says nothing
  about 3sum-apsp's Rc savings frontier — **no subsumption** (methodological analogy only:
  free parameter → frontier).
- **Shadow ecosystem** (from his two abstracts): unverified/unrefereed claims at 0.83671,
  0.83672, 0.83805, 0.8981, 0.673492 (Chandru 0.83652 unrefereed) — multiple actors, moving
  fast, publication hygiene uneven.

### T(c) Repo hunt (final)

- `kristianmk/839` = the proof of record for paper 2 (Lean + Python/C++ certificates + sha256
  checksums); paper 1's Lean is in arXiv ancillary files. No other repo; his GitHub (30 repos,
  mostly teaching/robotics) confirms identity. zeta23 base commit pinned `fbdc36bb`.

### T(d) Verdicts per dossier

| Dossier | Verdict | Re-scope |
|---|---|---|
| 01 | **NUMERICALLY-SUPERSEDED (context); statement UNAFFECTED** | structural defect identity + tightness only; cite Knausgård Thm 2 as the competitor inequality; A2's overlap-correction is now his |
| 02 | **COLLIDING-in-part (ceiling-ladder framing anticipated); axis distinct** | LP-duality + B₂-pair-mass + Knausgård-axis dictionary; drop "first barrier theory" |
| 21 | **STRUCTURALLY-SUPERSEDED (outcome B realized formally; A2 refuted for the family)** | demote to case study inside 02; surviving kernel: sup over zeta23's own (c₀,r) class |

### T(e) Timing

- Knausgård v1 2026-09-27 → v2 2026-10-07 → paper 2 arXiv 2026-10-06, repo 2026-10-04→09. Wang
  v1 2026-09-21. **All of it predates this project's start (2026-11-09) by four to seven weeks,
  and is public with formal proof-of-record.** The race for ζ-proportion *constants* is over —
  we enter it two formal generations behind (survey's 0.67250/0.83625 → Wang 0.6725067 →
  Knausgård 0.67354/0.83900, each with ceilings). Consequences: (i) any pilot whose bottom line
  is a ζ constant should be re-scoped to a structural statement or dropped; (ii) the open
  windows are the *other axes* — Hecke/ζ_K (dossiers 20/40/42), pair-mass bandwidth (02),
  machine-model conjunctions (10/11/12), q-algebra (41), Hall/Parseval (30) — none of which the
  AF-cluster actors have touched; (iii) if we want any ζ-adjacent formal statement at all, the
  cheap reactive option is to build on Knausgård's patched zeta23 (his patch shows the
  interface accepts it), but that is commentary, not discovery.
