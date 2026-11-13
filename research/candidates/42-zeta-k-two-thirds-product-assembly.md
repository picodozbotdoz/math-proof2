# Candidate dossier 42 — zeta-k-two-thirds-product-assembly

Lane R1 (tauceti-surveyor), 2026-11-09. Realizes C1(ii) of
`research/bridges/tauceti-contributions.md` §2. **Option call (required by division note):** of
the two offered picks, this dossier takes **(a)** — the easy-instance COMPANION to R5's dossier
20 — because option (b)'s content (inertia complementarity: zeta23 `posIndex_conj_le` × tauceti
`signature_congr` → unified inertia API) is already realized as dossier 03 / EZ3
(`research/candidates/03-ez3-compression-rank-trace.md`, `research/bridges/linear-algebra.md`
§2 L3, §4 EZ3); writing it again would duplicate R6's Theorem M. Division of labor with R5:
dossier 20 instantiates zeta23's *engine* (`PaperInputs`/`PaperInputsChi` field discharge) on
ζ_K — the strong, engine-grade route, effort L; **this dossier reaches a proportion theorem for
ζ_K by pure assembly over the already-submitted zeta23 Challenge theorems, via the quadratic
factorization — a different proof route, no engine** — and cross-references 20 throughout.
Tags: [VERIFIED] / [HYPOTHESIS].

**Honesty note up front.** As mathematics, the assembly theorem is *corollarical*: the ζ_K
on-line proportion follows formally from the Alpöge–Furman ζ and Dirichlet theorems plus
Euler's factorization, and no new analytic idea appears. Its value is: (i) the **first formal
zero-density statement for a number-field zeta** (no corpus has any, verified below); (ii) the
cheapest end-to-end exercise of the three-corpus pipeline (tauceti object × zeta23 theorem ×
mathlib multiplicity glue) — the natural pilot for the whole R1/R5 cluster; (iii) the overlap
defect term it isolates (common zeros of ζ and L(χ_D)) is a genuinely unstudied quantity
(§ Theorem C-K).

---

## Name

zeta-k-two-thirds-product-assembly

## One-line pitch

The completed-critical-line theory of ζ_K = ζ·L(s,χ_D) for quadratic K is assembled, not
re-proved: zero multiplicities add by mathlib's `analyticOrderAt_mul`, and the submitted
zeta23 proportions for ζ and for primitive Dirichlet L sum by elementary fraction algebra,
giving liminf ≥ 2/3 (and ≥ 2−1/c₁* ≈ 0.6725 in the Montgomery–Taylor window) for the
number-field zeta — the first formal zero-density theorem beyond ℚ.

## Precise mathematical statement

**Setting [VERIFIED].** `K = ℚ(√d)`, `d` squarefree ≠ 1, fundamental discriminant `D`,
`χ_D := TauCeti.Multiquadratic.fundamentalDiscriminantChar` (primitive quadratic character,
conductor |D|; used in `TauCeti/NumberTheory/LFunctions/DedekindZeta/Quadratic.lean`).
`ζ_K^C := TauCeti.LFunctions.dedekindZetaC K` — the canonical meromorphic continuation of
mathlib's `NumberField.dedekindZeta K` (`Mathlib/NumberTheory/NumberField/DedekindZeta.lean:50`;
continuation defined and unique-in-normal-form in
`TauCeti/NumberTheory/LFunctions/DedekindZeta/Basic.lean` [VERIFIED header]). On `Re s > 1`,
`ζ_K^C s = riemannZeta s * χ_D.LFunction s`
(`TauCeti.NumberField.dedekindZeta_eq_riemannZeta_mul_LFunction`, `Quadratic.lean` [VERIFIED
name via header]; note: as an identity of Dirichlet coefficients there, transferable to the
continued functions by uniqueness — glue (a)).

**Definitions (mirroring zeta23's `ChallengeDeps.lean` shapes).** For a meromorphic-on-ℂ
function `f` and `ρ ∈ ℂ`:
`mult f ρ := (analyticOrderAt f ρ).toNat` (mirror `zeroMult`, `ChallengeDeps.lean:46`);
`zerosIn_f T₁ T₂ := {ρ | f ρ = 0 ∧ 0 < ρ.re ∧ ρ.re < 1 ∧ T₁ < ρ.im ∧ ρ.im ≤ T₂}` (mirror
`zerosIn :50` [erratum 2026-11-09, H/QA: v1 cited :48; the ChallengeDeps def is at :50]);
`N_f(T₁,T₂) := ∑ᶠ ρ ∈ zerosIn_f T₁ T₂, mult f ρ` (mirror `Ncount :55`, with
multiplicity); `N^{on}_f(T₁,T₂) := ∑ᶠ ρ ∈ zerosIn_f T₁ T₂ with ρ.re = 1/2, mult f ρ`
(on-line, **with multiplicity** — see glue (b)); `Nd^{on}_f` the distinct on-line count
(mirror `N_d/N0star` family, `ChallengeDeps.lean:52–60`).

**Theorem A-K (multiplicity identity) [VERIFIED ingredients].** For all real `T₁ < T₂`:

```
N_{ζ_K^C}(T₁,T₂) = N_{riemannZeta}(T₁,T₂) + N_{χ_D.LFunction}(T₁,T₂)
N^{on}_{ζ_K^C}(T₁,T₂) = N^{on}_{riemannZeta}(T₁,T₂) + N^{on}_{χ_D.LFunction}(T₁,T₂)
```

(At every `ρ` in the open strip, both factors are analytic at `ρ` — the only pole of either is
at `s = 1` (ζ) which is not in the strip — so `analyticOrderAt_mul`
(`Mathlib/Analysis/Analytic/Order.lean:548` [VERIFIED name:line]) gives
`mult_{ζ·L}(ρ) = mult_ζ(ρ) + mult_L(ρ)`; the windowed sums add. The Dirichlet counterpart
definitions mirror `zeroMultL`/`N_χ`, `ChallengeDeps.lean:82,87`.)

**Theorem B-K (first number-field zero-density; the headline).** With zeta23's submitted
statements `two_thirds_on_critical_line` (`Challenge.lean:131`) and
`dirichlet_two_thirds_on_critical_line` (`Challenge.lean:191`) [VERIFIED names:lines] as
hypotheses (see Feasibility for the conditional-theorem packaging):

```
liminf_{T→∞} N^{on}_{ζ_K^C}(T,2T) / N_{ζ_K^C}(T,2T) ≥ 2/3
```

and, with `montgomery_taylor_on_critical_line` (`Challenge.lean:163`) and
`dirichlet_montgomery_taylor_on_critical_line` (`Challenge.lean:212`) [VERIFIED names:lines],
the stronger Montgomery–Taylor-window form with the same constant `2 − 1/c₁* = 0.6725…`
(both submitted statements carry the *same* constant — zeta23's Theorem D and its Dirichlet
analogue E; `ChallengeDeps.lean:107 cMT` per `research/survey/anthropics.md` §1.3):

```
liminf_{T→∞} N^{on}_{ζ_K^C}(T,2T) / N_{ζ_K^C}(T,2T) ≥ 2 − 1/c₁*.
```

Proof shape: each submitted statement is an ε-form `∀ε>0 ∃T₀ ∀T≥T₀: (c−ε)·N ≤ X` (the
liminf convention recorded in `ChallengeDeps.lean` reading notes, per
`research/survey/anthropics.md` §1.3); with `N^{on} ≥` the submitted numerator convention
(glue (b)) and A-K, `T₀ := max(T₀^ζ, T₀^χ)` gives `(c−ε)(N_ζ + N_χ) ≤ N^{on}_ζ + N^{on}_χ =
N^{on}_K`. **No absolute zero-count asymptotic is consumed** — pure ratio algebra; in
particular no RvM port is needed (contrast dossier 20, which discharges counting fields).

**Theorem C-K (distinct counts, honest overlap defect).** With
`five_sixths_distinct` (`Challenge.lean:152`) and `dirichlet_five_sixths_distinct`
(`Challenge.lean:205`) [VERIFIED names:lines]:

```
liminf_{T→∞} Nd^{on}_{ζ_K^C}(T,2T) / N_{ζ_K^C}(T,2T)
  ≥ 5/6 − limsup_{T→∞} C_D(T,2T) / N_{ζ_K^C}(T,2T),
```

where `C_D(T,2T) := #{ρ : ρ.re = 1/2, T < ρ.im ≤ 2T, riemannZeta ρ = 0 ∧ χ_D.LFunction ρ = 0}`
is the count of **common on-line zeros of ζ and L(s,χ_D)** — an unstudied quantity
[HYPOTHESIS: no bound on `C_D = o(N)` exists in any corpus or (to our knowledge) the
literature; conjecturally `C_D` is small (a common zero is a multiple zero of ζ_K)]. C-K is a
defect-form statement, deliberately explicit about what the assembly cannot reach.

Quantifier order (Lean, B-K): `∀ {d : ℤ} (hd : d.IsSquarefree) (hd1 : d ≠ 1), Hypζ → Hypχ →
∀ ε > 0, ∃ T₀, ∀ T ≥ T₀, (2/3 − ε) * N_K T (2*T) ≤ N^{on}_K T (2*T)` with `Hypζ/Hypχ` the
ε-form re-statements of the two submitted theorems (Prop-parameters — see F5).

## Novelty check

- **Corpus side** (rg, 2026-11-09):
  - mathlib: `rg -i -c 'dedekindZeta' Mathlib/` → only the series-side object
    (`NumberField/DedekindZeta.lean`); zero-counting of any kind absent (R3 §1: "no counting
    function of any kind"). **No density statement.**
  - tauceti: `rg -n 'two_thirds|zero.?density|N0star' TauCeti/NumberTheory/` → hits only in
    `ArithmeticDirichletSeries/Transfer.lean:31,40,123` [VERIFIED lines], where "zero-density"
    means the **δ = 0 prime-density case of the prime ideal theorem transfer** (`o(x)`
    logarithmic counts) — a prime-side statement, not zero-proportions. **No zero-proportion
    content** (survey `tauceti.md` §2d: `LFunctions/Zeros/` contains completions only).
  - anthropics (zeta23): `rg -i -c 'dedekind' zeta23/` → **0 hits**; ζ and Dirichlet only.
  - openai-math: zero-side is zero-free (quasi-RH, Siegel — R5 §0); no proportions;
    `IdealThetaXi.lean` object noted in dossier 40, no counting.
  - Synonym sweep (`simple zeros|critical line|on-line proportion` over tauceti + mathlib):
    nothing for L-functions beyond mathlib's `HardyZ.lean` (line-side API, no counting, R3 §1).
- **Literature side: PENDING lane R8 round-2.** Queries:
  1. `"Dedekind zeta" "critical line" zeros proportion OR density` — decides whether any
     explicit ζ_K on-line-proportion corollary has been stated (expectation: the AF paper
     (arXiv:2608.13637) states ζ and Dirichlet only; a ζ_K corollary is trivial-to-state and
     may exist as a remark — this is the main novelty risk, and it caps novelty at 2–3);
  2. `"common zeros" "Riemann zeta" "Dirichlet L-function"` — for the C_D defect quantity;
  3. `"zeros of Dedekind zeta functions" simple` (also feeds dossier 40's query 3).
- `[R8 confirmation pending]`.
- **Known nearest misses:** (a) zeta23's A/D/E families (`Challenge.lean:131–229`) — same
  constants, ζ/Dirichlet only; (b) tauceti's prime-ideals "zero-density case"
    (`Transfer.lean:123`) — same words, different meaning (prime density δ=0); (c) the
  classical statement "zeros of ζ_K = zeros of ζ ∪ zeros of L(s,χ_D)" (textbook, e.g.
  Davenport §5–16 territory) — A-K is its multiplicity-refined formal form, with
  `analyticOrderAt_mul` as the refinement tool; (d) R5's dossier 20 — engine route to a
  strictly stronger theorem family (per-window local counts, uniformity), at L effort.

## Bridge analysis

- **Corpora bridged:** tauceti (the object: `dedekindZetaC`, the factorization, the
  discriminant character) × anthropics/zeta23 (the two submitted proportion theorems) ×
  mathlib (`riemannZeta`, `DirichletCharacter.LFunction`, `analyticOrderAt_mul`,
  `riemannZetaZeros` + `IsCompact.inter_riemannZetaZeros_finite`
  (`Mathlib/NumberTheory/LSeries/ZetaZeros.lean:37,68` — finiteness in windows, the third leg
  per R3 §1 "Nearest API/glue points").
- **Why essential:** zeta23 has no number-field object at all (`rg dedekind → 0`); tauceti has
  the object and factorization but **no counting function anywhere** (survey §2d) and no
  proportion theorem; mathlib has the multiplicity arithmetic but neither object nor theorem.
  Removing any one corpus kills the statement: without tauceti there is no ζ_K; without zeta23
  there is no proportion; without mathlib's `analyticOrderAt_mul` the multiplicity bookkeeping
  is manual (and R5 §1 documents zeta23 re-proving even window-finiteness rather than porting).
- **Empty-zone fit:** `bridges/tauceti-contributions.md` §2 C1(ii) (this dossier),
  C1(i) = Theorem A-K here; `bridges/analytic-nt.md` §0 headline asymmetry row "Zero-density /
  proportions: none" × "L-functions beyond Dirichlet: tauceti Dedekind zeta" — the table cell
  this dossier fills.
- **vs dossier 20 (R5):** 20 = engine instantiation (`thmA_of_traces`/`thmD_lam_abstract` at a
  ζ_K `ZeroConfig`, discharging `PaperInputs` fields — R5 §2 [VERIFIED genericity]) — stronger
  theorem family, L effort; 42 = assembly over *submitted* statements only, S effort, and —
  importantly — 42's Theorem C-K isolates `C_D`, which 20's route does not surface (the engine
  treats ζ_K monolithically). If both are piloted, 42 is the milestone-1 smoke test of the
  shared glue (definitions + `analyticOrderAt_mul` port) that 20 then reuses.

## Proof-strategy sketch

1. **Glue (a): the continued-product identity (routine).** From
   `dedekindZeta_eq_riemannZeta_mul_LFunction` (agreement of Dirichlet coefficients on
   `Re s > 1`, `Quadratic.lean`) plus normal-form uniqueness of `TauCeti.meromorphicContinuation`
   (`DedekindZeta/Basic.lean`): `ζ_K^C = riemannZeta * χ_D.LFunction` as meromorphic functions
   on ℂ. Window-finiteness of both sides' zeros from mathlib
   (`IsCompact.inter_riemannZetaZeros_finite` for ζ; the Dirichlet counterpart from the
   continuation's zero-discreteness — glue item, S).
2. **Theorem A-K (routine).** For `ρ` in the open strip, both factors are analytic at `ρ`;
   `analyticOrderAt_mul` (`Mathlib/Analysis/Analytic/Order.lean:548`) gives the order of the
   product as the sum; `∑ᶠ` over the (finite) window adds. On-line restriction commutes.
3. **Theorem B-K (the assembly — elementary but this is the theorem).** ε-form composition
   with `T₀ = max`: if `(c−ε)·N_ζ ≤ X_ζ` and `(c−ε)·N_χ ≤ X_χ` then `(c−ε)·(N_ζ+N_χ) ≤
   X_ζ + X_χ`; conclude by A-K. Hardest *content* step: verifying the submitted theorems'
   numerator convention dominates `N^{on}` (glue (b)): the submitted A/E statements count
   on-line zeros per zeta23's `N0star` convention (`ChallengeDeps.lean:52–60` — read the exact
   distinct-vs-multiplicity convention at port time; with-multiplicity dominates distinct
   pointwise, so the assembly holds under either convention).
4. **Theorem C-K (defect form).** `Nd^{on}_K = Nd^{on}_ζ + Nd^{on}_χ − C_D` (inclusion–
   exclusion on the two on-line zero sets); combine with step 3's algebra; the defect term
   `limsup C_D/N_K` is output, not bounded. [HYPOTHESIS on `C_D`: no corpus can bound it;
   a genuine open quantity — flagged for R8 query 2.]
5. **Montgomery–Taylor upgrade.** Identical algebra at constant `2 − 1/c₁*` with the two MT
   statements (`Challenge.lean:163,212`); note both constants coincide, so the min-step is
   vacuous — worth stating explicitly in the pilot (it is *false* for generic pairs of
   L-functions and true here only because E was proved with D's window).

## Feasibility

- **F0.** Target: B-K (+ A-K as its engine, + C-K as the honest corollary), as a **conditional
  theorem** over the two zeta23 statements restated as Prop-parameters (kernel-only route; see
  F5(iii)).
- **F1. Mathlib entry points** (v4.36.0-rc2, checkout `ff2494ea`): `riemannZeta`
  (`LSeries/RiemannZeta.lean:121`), `DirichletCharacter.LFunction`
  (`LSeries/Dirichlet.lean`), `analyticOrderAt`/`analyticOrderAt_mul`
  (`Analysis/Analytic/Order.lean:49,548`), `riemannZetaZeros` +
  `IsCompact.inter_riemannZetaZeros_finite` (`LSeries/ZetaZeros.lean:37,68`),
  `NumberField.dedekindZeta` + `dedekindZeta_residue` (`NumberField/DedekindZeta.lean:50,57`)
  — the residue is not consumed but pins the pole's location for the strip-exclusion step.
- **F2. Donor lemmas:** zeta23 (statements only, not proofs — see F5): `two_thirds_on_critical_line`
  (`Challenge.lean:131`), `dirichlet_two_thirds_on_critical_line` (`:191`),
  `montgomery_taylor_on_critical_line` (`:163`), `dirichlet_montgomery_taylor_on_critical_line`
  (`:212`), `five_sixths_distinct` (`:152`), `dirichlet_five_sixths_distinct` (`:205`); the
  definitional shapes `zeroMult/zerosIn/Ncount/N0star/zeroMultL` (`ChallengeDeps.lean:46–87`).
  tauceti: `dedekindZetaC` + uniqueness (`LFunctions/DedekindZeta/Basic.lean`),
  `dedekindZeta_eq_riemannZeta_mul_LFunction` (`Quadratic.lean`),
  `Multiquadratic.fundamentalDiscriminantChar`. Toolchain split: zeta23 is v4.33.0-rc2
  (statements re-stated, not imported — F5(iii)); tauceti is v4.36.0-rc2, same toolchain as the
  encore checkout and this project — **tauceti donors import cleanly**;
  `research/feasibility/port-probe.md` is **pending** (probe dir exists with RHLinalg probes
  only).
- **F3. Missing glue:** (a) continued-product identity (step 1; S — mostly uniqueness plumbing);
  (b) numerator-convention reconciliation between zeta23's `N0star` family and the with-
  multiplicity `N^{on}` here (S; one domination lemma + a careful docstring); (c) Dirichlet
  window-finiteness from the continuation (S; mirror of the ζ case, Tauceti's
  `Zeros/Completion/Dirichlet.lean` discreteness or mathlib `Nonvanishing`-side tools);
  (d) no genuinely absent mathematics — that is the point of the assembly route (contrast
  dossier 20, whose F3(b) is the whole engine).
- **F4. Effort: S** (~800–1,500 LoC: definitions mirroring `ChallengeDeps` ~200, step-1 glue
  ~300, A-K ~150, B-K/C-K algebra ~200, hypothesis-statement restatements ~150, packaging).
- **F5. Risks:** (i) definitional mismatch of the window/liminf conventions between
  `ChallengeDeps` shapes and the restatement (the ε-form must be transcribed exactly — the
  submitted files' reading notes are the reference; mitigate by porting the *statement text*
  verbatim); (ii) `∑ᶠ` vs `Finset` counting friction (zeta23 uses `∑ᶠ` over `zerosIn`;
  mathlib's finiteness gives the bridge); (iii) **the conditional-theorem posture**: B-K is
  proved under `Hypζ ∧ Hypχ` as Prop-parameters because zeta23's library cannot be a lake
  dependency across the v4.33/v4.36 split (and porting 102k lines is out of scope); the
  unconditional claim is then "zeta23's repo proves `Hypζ`, `Hypχ`; our repo proves
  `Hypζ → Hypχ → B-K`" — kernel-only, no sorry, and honestly labeled; (iv) novelty cap: if R8
  finds a ζ_K proportion remark in the AF paper, the dossier's value drops to formalization-
  first + the C_K defect term; (v) churn: `ZetaZeros.lean` landed 2026-10-31 (R3 §1) — re-pin
  at pilot time.
- **F6.** Kernel-only; milestones: (1) definitions + A-K (self-contained, unconditional — the
  natural first sorry-free milestone and the smoke test of the whole pipeline);
  (2) B-K conditional; (3) C-K; (4) MT upgrade. Modal build via math-proof1
  `lean_build.py`/`lean_check.py` once lake scaffolding exists; reuse of the probe scaffolding
  in `research/feasibility/probe/`.

## Significance

Solid infrastructure-grade: the first formal zero-density statement for any number-field
zeta, the cheapest complete traversal of the tauceti→zeta23→mathlib pipeline (which is why it
should be piloted *first* in this cluster), the reusable glue (definitions + product-identity +
convention reconciliation) for dossiers 20 and 40, and one genuinely new object — the common-
zero defect `C_D` — surfaced for the first time and stated where the assembly's reach ends.

## Score (filled at triage — leave empty)

- Novelty (1–5):
- Significance (1–5):
- Effort (S/M/L → 1–5):
- Rank (novelty × significance ÷ effort):

**Lane proposal (R1, non-binding):** Novelty 2 (corollarical as mathematics; absent from all
corpora; AF-remark risk flagged), Significance 3 (first formal number-field density; pipeline
pilot; feeds 20/40), Effort 1 (S) → proposed rank ≈ 6.0 as a number, but read as "cheapest
credible pilot", not "best theorem"; recommend sequencing 42 → (41 core) → 40, with 42's
milestone 1 as the cluster's first Lean milestone.

## F4 grade by lane R9

2026-11-09, round 4. Evidence: Modal port-probe runs 1–6 (`research/feasibility/port-probe.md`
§8); pilot blueprint read (`research/pilots/42-blueprint.md` — M1 not yet landed, no overlap).

- **Grade: S — confirmed and now pre-validated empirically.** The exact posture F5(iii)
  rests on — zeta23's submitted statements as Prop-binders — was elaborated standalone:
  `ProbeE_Zeta23Binder.lean` restates the four A/B-mult/C/D shapes (`Challenge.lean:131,
  145,157,163`) with the `ChallengeDeps` counting defs (`IsNontrivialZero/zeroMult/zerosIn/
  Ncount/Ndist/N0star/N0simple/cMT`, wholesale `import Mathlib` as the donor) as
  hypothesis-binder types plus a trivial binder-consuming wrapper: **0 errors, 0 warnings**
  against v4.36 @ ff2494ea (runs 5–6). The conditional-theorem pattern is valid for the NT
  cluster, not just asserted.
- **F1 confirmations**: `riemannZetaZeros`/`IsCompact.inter_riemannZetaZeros_finite`,
  `analyticOrderAt`, `completedRiemannZeta₀` all probe-verified (runs 1–2). **tauceti side:
  zero port friction** — `tauceti/lean-toolchain` = `v4.36.0-rc2`, identical to this
  project's toolchain (F2's claim verified by direct file read); the `dedekindZetaC`
  uniqueness layer imports as-is.
- No F1 corrections. Verdict: S with high confidence; the ~800–1,500 LoC estimate stands,
  with the M1 milestone de-risked by ProbeE.

## Pilot outcome (lane R1 closure, 2026-11-09)

**Executed end-to-end** (M1 → M2a → M3 → M2b; all files under `research/pilots/42/`,
all GREEN on Modal `crossmath-probe`, mathlib v4.36.0-rc2 @ `ff2494ea`; raw logs in
`research/pilots/42/logs/`; blueprint run logs in `research/pilots/42-blueprint.md`):

- **M1** (`M1.lean`, 337 LoC, GREEN 0/0/0): the assembly layer — windows, `multOf`
  (= mathlib `analyticOrderNatAt`), `ZeroMult`, window-additivity (`sum_inter_distrib`),
  Theorem A-K, the division-free ε-form `EpsLower`, `assemble_eps`/`_min`,
  `zetaK_two_thirds` (dyadic, conditional).
- **M2a** (`M2a.lean`, 612 LoC, GREEN 0/0/0): structural discharge — germ congruence
  (`multOf_congr`), the half-plane→global identity bridge (`funEq_of_factorization`,
  (s−1)-multiplier + identity principle), window-restricted A-K, ζ/L(χ) analyticity, the
  χ-side `≠ ⊤` discharge; `zetaK_two_thirds_wired`. Residue: `hntopζ`.
- **M3** (`M3.lean`, 453 LoC, GREEN 0/0/1-benign): the C_K defect layer — distinct
  counts, `commonOnLine` (= C_D), inclusion–exclusion, `assemble_eps_defect`,
  `zetaK_five_sixths_defect` + the explicit `hCZ` binder form.
- **M2b** (`M2b.lean`, 1,121 LoC, GREEN 0/0/1-benign): the donor swap — cumulative
  (0,T] layer; Knausgård's clean endpoints transcribed as `K673OfLayers`/`K839OfLocal`
  (certificate `cert` = his `LocalInequality` as an explicit hypothesis binder — EnclOK
  precedent; his native_decide headlines never consumed; C++/Python certificates +
  CHECKSUMS.sha256 cited as audit artifacts only); monotone absorption; and the LANDED
  theorems `zetaK_two_thirds_landed`, `zetaK_distinct_five_sixths_landed` (+ the
  hCZ-seamed `_of_negligible`). **`#print axioms` on all three: exactly
  [propext, Classical.choice, Quot.sound].**

**Honest inventory of what was proved:**

- *Unconditional (given only the structural/ported binders listed below)*: the count
  algebra — multiplicities add under products (`multOf_mul`, mathlib-backed), window and
  cumulative window counts add, inclusion–exclusion `D_{z+w} + C_D = D_z + D_w`, the
  ε-form assembly and its defect form, monotone absorption, and the a-fortiori upgrade
  (with-multiplicity numerators dominate every submitted numerator convention).
- *Certificate-conditional*: `zetaK_two_thirds_landed` — liminf N^{on}(0,T]/N(0,T] ≥ 2/3
  for the zero data of the quadratic Dedekind zeta, conditional on `hCert` (Knausgård's
  LocalInequality) + the transcribed `hK673` + ThmE (`hEχ`) + the tauceti ported
  statements + `hntopζ`. Also `zetaK_distinct_five_sixths_landed` (5/6 + C_D defect,
  via `hK839` + ThmE-distinct).
- *hCZ-seamed stronger form*: `zetaK_distinct_five_sixths_landed_of_negligible` — the
  full 5/6 distinct proportion for ζ_K given additionally the common-zeros negligibility
  binder `hCZ` (no corpus can supply it; a common zero of ζ and L(χ_D) is a multiple zero
  of ζ_K).
- *Remaining binders in the landed theorems (exactly)*: `hCert`/`hK673`/`hK839`
  (Knausgård clean layer + certificate), `hEχ`/`hEχd` (zeta23 ThmE, cumulative),
  `hfac`/`hK`/`hK1`/`hP1`/`hζ`/`hχ`/`hfinK/ζ/χ` (tauceti ported statements:
  `dedekindZetaC` continuation + `dedekindZeta_eq_riemannZeta_mul_LFunction` +
  window-finiteness), and `hntopζ` (M2a residue: ζ not-identically-zero near any point —
  path recorded: `IsCompact.inter_riemannZetaZeros_finite` (ZetaZeros.lean:68) vs an
  infinite-ball family).

**Constant race caveat (R8 round-3 §T / VERDICTS §5.3)**: the ζ-proportion constants
themselves are a lost race (Knausgård 0.83900/0.67354 predate us); this pilot's value is
the **assembly architecture** — the first formal zero-density statements for a
number-field zeta and the first charter-compliant consumption of an external Lean tree
via certificate binders.

**Must-cites**: DLRT 2019 (arXiv:1908.04876) — 45% distinct for Dedekind zetas **[erratum
2026-11-14, H QA Part 7 / A5 standing note 3: GRH-conditional, fixed quadratic K, T→∞
asymptotic — NOT unconditional; the comparison is hypothesis-shape-to-hypothesis-shape
(their GRH binder vs our certificate/ThmE binders), per dossier 75's resolved DLRT
scope]**, the
direct literature comparison our 5/6+defect form improves; Majdoddin
(arXiv:2610.17420 + `Majdoddin/formal-math`) — the second independent anthropics-tree
build-out, concurrent-ecosystem context for the donor-consumption pattern; Knausgård
(arXiv:2610.08965 + `kristianmk/839`) — the donor; Alpöge–Furman (arXiv:2608.13637) and
the zeta23 corpus — the method and the engine conventions; zeta23's EnclOK/PairCeiling
(`PairCeiling/NumericCert.lean:72`) — the certificate-binder precedent.

**Lane proposal (R1, as completed work)**: the dossier's F-estimates were validated
(M1: S at 337 LoC; M2a: S–M at 275 new LoC; M3: S at ~140; M2b: S at ~350, incl. the
cumulative layer the dossier did not budget — the donor's cumulative forms forced it).
Novelty stands at 2 (corollarical mathematics, first formal statement, DLRT-2019
comparison) × significance 3 (first number-field zero-density + the donor-consumption
template) ÷ effort 1 → rank ≈ 6 as the cluster's pipeline pilot — now with the pilot
complete and axioms-clean. Recommend: M2b's certificate-binder pattern be reused for
any future external-tree consumption (Majdoddin's tree is the obvious next donor).

## Pilot outcome — Cycle-2 M4 addendum (appended by A9 2026-11-14, per the orchestrator's ledger-final instruction; main-run record above frozen)

- **M4a (strip-distinct successor layer): GREEN + axcheck-clean, FINAL.**
  `M4a.lean` (1,194 LoC / 54 thms) — logs `logs/m4-run2.log` (OK, 0 errors / 0
  sorry-warnings; the three M4a landing theorems
  `zetaK_distinct_five_sixths_strip_landed(_of_negligible)` etc. exactly
  [propext, Classical.choice, Quot.sound]) and `logs/m4-axcheck-run1.log` (full sweep:
  every 'depends on axioms' line the triad — 83 axiom prints, zero non-triad, zero
  sorryAx/native_decide). Vocabulary: `distinctCountCum` (:821),
  `EpsLowerDistinctStripCum` (:833), `commonStripCum`, the `hCZ′` binder schema.
- **M4b (the ZetaZerosV2 ζ-column discharge): run2 GREEN on disk 2026-11-14,
  marked PENDING A3 OFFICIAL RELAY.** `M4b.lean` (1,560 LoC / 66 thms; log
  `logs/m4b-run2.log`, lane A3-relaunch: OK, 0 errors / 0 sorry-warnings; all 6 landing
  theorems — 3 M4a-carried + 3 `_of_V2` (`zetaK_two_thirds_landed_of_V2`,
  `zetaK_distinct_five_sixths_strip_landed_of_V2`(+`_of_negligible`)) — exactly the
  triad, zero sorryAx). Route: G2-cleared direct V2 import recorded APPLIED in the file
  header (:40–44, `import ZetaZeros`), fallback binders hV2d4/hV2d5 retained as
  documented fallback. `hCert`/`hK673`/`hK839` dropped on the ζ side. Article:
  `research/articles/42M4-zetaK-proportions-unconditional-zeta-column.md` (standalone by
  orchestrator decision; slots [VERDICT:M4b] / [VERDICT:M4b-upgrade] await the relay).
