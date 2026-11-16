# OAI SiegelZeros + PiExponent as donor — registration of the two unregistered proved OAI trees

Lane R6 (iteration-4 fresh-bridge scan), 2026-11-16. Format follows
`research/novelty/axiommath-as-donor.md` (Cycle-2 donor-remap lane A3); this file registers
the two **proved, sorry-free, previously unregistered** openai-math Lean trees found by the
R6 re-scan (`research/novelty/iter4-fresh-bridges.md` §0.1 — the discovery record, searches,
and preprint reads live there; this file is the donor map). Donor read-only at
`/home/doz/zcode-workdir/openai-math/lean` (toolchain v4.34.1, mathlib `d13f23b7` per the
G7b audit; NOT our pin). Every file:line citation below was read this session.

## 0. Donor status (read this first — it gates every verdict)

| Tree | Status | Evidence |
|---|---|---|
| `OAI/NumberTheory/SiegelZeros/` | **PROVED in donor tree, 0 proof sorries, UNREGISTERED pre-2026-11-16** — donor-pin axiom audit STAGED as probe G11 (`feasibility/probe/ProbeG11_OAI_SiegelZeros.lean`, runs only via `run_gprobe.sh g11`, orchestrator approval) | rg `sorry` over the directory = 0; `Conclusions/Theorem.lean:11–21` |
| `OAI/NumberTheory/PiExponent/` | **PROVED in donor tree, 0 proof sorries, UNREGISTERED pre-2026-11-16** — donor-pin axiom audit STAGED as probe G12 (same g11 run) | rg `sorry` = 0; `Main.lean:9–33` |
| Both | **v4.34.1 pin — DO-NOT-CONSUME as a build dependency. Statement-binder class ONLY** (Liu-1 convention), until the G11/G12 donor-pin `#print axioms` verdict lands triad-clean `[propext, Classical.choice, Quot.sound]` — the Cycle-2 donor hygiene gate (AGENTS.md; G2/G7b precedent: comparator configs and preprints are claims, on-pin `#print axioms` is proof) | probes staged, not run |

**Relation to the 7/8 frontier (do not mis-file these).** Both companion preprints are
*weaker than the already-audited 7/8 tree on the Dirichlet class*:

- `preprints/The-Quasi-Riemann-Hypothesis-October-5-2026/paper2.pdf` (OpenAI, Oct 5 2026),
  Theorem 1.1: zero-free Re s > 11/12 for every finite-order Hecke L over K = ℚ(√−3), hence
  every Dirichlet L incl. ζ. The paper's own words (p.2): "a natural intermediate step toward
  the stronger zero-free region Re s > 7/8 established in [36]" — [36] = the OAI 7/8 paper
  whose Lean tree G7b audited (2026-11-14, PASS). **No Dirichlet-class frontier change.**
  Residual value: the Hecke-over-imaginary-quadratic class (no formal artifact anywhere
  except Liu-1, statement-citation-only) and a simpler proof. Unformalized (rg `elevenTwelf`
  over the lean tree: no statement).
- `preprints/Uniform-exclusion-of-Landau-Siegel-zeros-October-1-2026/paper.pdf` (OpenAI,
  Oct 1 2026), Theorem 1: ∃ absolute c > 0 with (1−β) log q ≥ c for every real zero β ∈ (0,1)
  of every primitive nonprincipal real Dirichlet L of conductor q ≥ 3. Different *shape*
  from any fixed-B half-plane: implied by a 7/8 zero-free half-plane (c = (1/8)·log 3 would
  do), i.e. logically weaker than the audited 7/8 tree on Dirichlet — its value is the
  independent method (biquadratic interpolation determinants) and, if G11 lands, a second
  triad-clean donor for no-Siegel-zero-class binders.

## (a) SiegelZeros — the Landau–Siegel exclusion donor

Donor theorem (exact): `OAI.SiegelZeros.WeightedTorusJets.exists_absolute_real_zero_gap`
(`OAI/NumberTheory/SiegelZeros/Conclusions/Theorem.lean:11–21`; full statement quoted in
ProbeG11's header): ∃ c : ℝ, 0 < c ∧ ∀ q ≥ 3 [NeZero q], ∀ χ : DirichletCharacter ℂ q,
χ.IsPrimitive → χ ≠ 1 → real-valued → ∀ β ∈ (0,1), χ.LFunction (β : ℂ) = 0 →
c ≤ (1 − β) · log q. Delegation roots (G7b convention audit targets):
`SiegelZerosAwei.W50.uniform_exclusion_of_local_isolated_bezout`
(`Intersection/BezoutBoundary.lean:13`); `WeightedTorusJets.W22.
localIsolatedBezout_of_actual_regular_selection`
(`Intersection/IsolatedBezoutFromRegularSelection.lean:346`). Tree layout: 13 subdirs
(Characters, Conclusions, Determinants, Differentials, EntireFunctions, Hilbert,
Intersection, LocalAlgebra, Selection, Structure, Model, Estimates), 0 sorries.

Paper anchor: paper.pdf Theorem 1 + §"The argument" (prime-bias → biquadratic
interpolation determinant; Lemma 3 = the reusable uniform interpolation estimate) [read
pp.1–2].

**Binder forms for consumers** (hypothesis-binder pattern; statement-port≈0 expected — the
objects `DirichletCharacter`, `χ.LFunction`, `IsPrimitive` are the DONOR's defs, so the
our-pin transcription is consumer-pilot work in the G7 Liu-1 pattern, not registration
work):

- `hLS : ∃ c : ℝ, 0 < c ∧ ∀ q (hq : 3 ≤ q), ∀ χ : DirichletCharacter ℂ q, χ.IsPrimitive →
  χ ≠ 1 → IsReal χ → ∀ β ∈ Ioo 0 1, χ.LFunction β = 0 → c ≤ (1 - β) * log q` — discharges
  any "no Landau–Siegel zero" / effective-class-number hypothesis of the QRH-paper2 §1
  corollary family (effective h(D) ≫ √|D|/log log |D|; idoneal-number completeness;
  PNT-AP with x^{7/8+δ}-grade error via the 7/8 binder instead).
- Weakened corollary binders (e.g. `hNoLS_zero : ¬ ∃ χ β, … (1−β) log q < c₀`) for consumers
  that only need exclusion at a fixed window.

**Consumers (none yet; candidate first consumers).** (i) FB-2's PNT-AP corollary pilot
(`novelty/iter4-fresh-bridges.md` §3) — but note the 7/8 binder is the sharper route there;
SiegelZeros is the fallback if the explicit formula machinery is only ever built in the
log-free form. (ii) Any future effective class-number dossier (paper2 §1 consequences).
**Verdict line (pending G11): UNREGISTERED-AS-DONOR → statement-binder class; hygiene gate
not yet executed.**

## (b) PiExponent — the μ(π) = 2 donor

Donor theorems (exact, `OAI/NumberTheory/PiExponent/Main.lean`): `pi_eventual_lower_bound`
:9 (`PiEventualLowerBound Real.pi`), `pi_integer_eventual_lower_bound` :13,
`pi_irrationalityExponent_eq_two` :17 (`irrationalityExponent Real.pi = 2`), `main` :19
(the pair), `flint_hills_summable` :29 (`Summable fun n => 1 / ((n+1)³ * sin (n+1)²)`).
Object layer (`Statement.lean`): `GoodRationalApproximations` :10, `ApproximationExponents`
:15, `irrationalityExponent` :17 (`sSup`), `EventualLowerBound` :21, `PiEventualLowerBound`
:27. Tree layout: 7 subdirs (Ampleness, Analysis, Approximation, Cohomology, Geometry,
Jets, LocalAlgebra, Polynomials — an arithmetic-algebraization/Bost-style apparatus), 0
sorries.

**The binder interface (the reusable find).** `Approximation/InterpolationConsequence.lean`:
`piEventualLowerBound_of_globalInterpolation (hgeometry :
PiExponent.DeterminantContradiction.GlobalInterpolationStatement) : PiEventualLowerBound`
:11 — siblings `pi_irrationalityExponent_of_globalInterpolation` :18 and
`flintHills_of_globalInterpolation` :25. The hypothesis type is one Prop:
`PiExponent.DeterminantContradiction.GlobalInterpolationStatement`
(`Approximation/DeterminantContradiction.lean:94`). The π-specific content enters only via
`PiExponent.LiteralAnalytic.analyticAggregate` (`Analysis/AnalyticAggregate.lean:96`),
consumed inside the proof. **Consequence: the whole conclusion layer (eventual lower bound,
μ = 2, Flint–Hills) is dischargeable from ONE hypothesis binder** — the shape future
μ(x) = 2 attempts at other constants would target (the analytic aggregate is what must be
rebuilt per constant).

Companion trace: `reasoning_traces/irrationality-exponent-of-pi.pdf` (OpenAI summarized
CoT: Part I Flint–Hills via a claimed 62/25 bound, Part II exponent 2 via
interpolation-and-determinant [read pp.1–2]). No formal preprint located under
`preprints/` matching by title (rg over the preprint listing for "irrationality" — absent);
the Lean tree is the settled record. **This exceeds every classical record (Salikhov-type
μ(π) ≤ 7.6063…); the registration does NOT endorse the claim** — G12 audits internal
hygiene (axioms) only, which is what a statement-binder consumer needs; the mathematical
verification burden stays with the donor corpus.

**Binder forms for consumers.**
- Direct: `hμπ : OAI.PiExponent.PiEventualLowerBound` (or its `EventualLowerBound x`
  generalization at x := π) — for any Flint–Hills-type or ‖nπ‖-lower-bound consumer.
- Interface: `hGeo : OAI.PiExponent.DeterminantContradiction.GlobalInterpolationStatement`
  → everything (the minimal witness a re-derivation at another constant must produce).
- Object-layer port (FB-3, `novelty/iter4-fresh-bridges.md` §3): `irrationalityExponent` /
  `EventualLowerBound` are mathlib-absent (mathlib's only adjacency is the qualitative
  `LiouvilleWith`, `Mathlib/NumberTheory/Transcendental/Liouville/{LiouvilleWith,Measure}.
  lean`) — an S-class mathlib-only layer with OAI's defs as the model.

**Consumers (none yet; candidate first consumers).** (i) FB-3's object layer + the
`‖nπ‖` corollary (`n^{ν−1}‖nπ‖` control feeding tauceti's recorded Littlewood Prop at
`NumberTheory/DiophantineApproximation/BadlyApproximable.lean:248`). (ii) The tracker
side-note: μ(π) = 2 (if ever externally confirmed) is the strongest possible answer to the
irrationality-measure clock — date any FB-3 claim against the donor tree's git history.
**Verdict line (pending G12): UNREGISTERED-AS-DONOR → statement-binder class; hygiene gate
not yet executed.**

## Gating language (applies to both)

**DO-NOT-CONSUME as a build dependency until G11/G12 land** (donor-pin `#print axioms`
triad-clean). Until then: statement-citation only, in all dossiers/pilots, in the Liu-1
convention. Full-tree sorry sweeps beyond the two subtrees are unnecessary (G7b scope:
audit the headline + delegation roots; widen only if a consumer lands). Probes:
`feasibility/probe/ProbeG11_OAI_SiegelZeros.lean`, `feasibility/probe/ProbeG12_OAI_PiExponent.lean`
— runner `feasibility/probe/run_gprobe.sh g11` (mode added 2026-11-16; volume
`crossmath-g11-tree`), approval-gated, no runs this cycle.

— lane R6, 2026-11-16
