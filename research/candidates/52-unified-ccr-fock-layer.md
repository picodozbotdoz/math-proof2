# Candidate dossier 52 — unified-ccr-fock-layer

Lane R2 (openai-surveyor), 2026-11-09. **Coordinate with lane R7
(`research/bridges/tensor-algebra.md` §2b — the eth-Boson ↔ symmetric-function/tauceti lift;
this dossier supplies its missing fermionic vertex) and with lane R1's tauceti survey §4
(`research/survey/tauceti.md:436–443`, which already envisions the
"complexity-theory ↔ representation-theory" connection this layer would realize).**
Tags: [VERIFIED] = read in source this lane; [HYPOTHESIS] = proposed, flagged.

> **Honesty-first verdict on the nominal pitch.** "Unify the two CCR formalizations" is, as
> stated, **a port, not new mathematics**: the two layers do not share any definitional base
> (audit below — bosonic ℤ-matrix calculus on `Multiset ℕ` vs fermionic
> `ExteriorAlgebra ℂ` endomorphisms), so a direct unification is definitional engineering.
> The dossier is therefore reframed around what a *sign-universal occupation calculus* layer
> would unlock that no corpus can state today: (N1) the statistics-universal
> normal-ordering/contraction theorem of which the two proved instance statements are the
> ε = ±1 faces; (N2) [HYPOTHESIS] a Laughlin-style spectral transfer onto eth's complexity-
> side piece operators Q_s; (N3) the dictionary identifying eth's weight spaces with tauceti's
> CAR occupation weights (a fourth corpus vertex, already half-built in tauceti). Novelty is
> carried by N1's universal statement + N3's dictionary + (if true) N2; the layer itself is
> also the ecosystem's missing mathlib donation (mathlib has no Heisenberg/Weyl algebra, no
> Fock/occupation layer at all — R7 §1.2 rg → 0 [V]).

---

## Name

unified-ccr-fock-layer

## One-line pitch

A sign-universal occupation-basis calculus (one `OccupationCalculus` structure, commutation
parameter ε ∈ {+1, −1}, weight-graded pairing) whose two proved instances are eth's bosonic
piece operators and openai's fermionic Laughlin CAR, yielding (N1) the first
statistics-universal normal-ordering/contraction identity, (N3) the first formal dictionary
eth weight-spaces ↔ tauceti CAR occupation weights, and (N2, exploratory) the first spectral
lower bounds on the complexity-side operators Q_s via openai's kernel-distance method.

## Precise mathematical statement

**The two layers, audited [VERIFIED].**

- *eth (bosonic, complexity side).* Operators as integer matrices on the monomial basis of
  ℤ[t₁, t₂, …]: `Ker := Multiset ℕ → Multiset ℕ → ℤ` (`eth/proof/rates/ClauseBound/Boson/
 Defs.lean:24`); creation `cre l K π σ = if l ∈ π then K (π.erase l) σ else 0` (= ∇₋ₗ =
  multiplication by t_l, :30), annihilation `ann K π σ = k·σ.count k·K π (σ.erase k)`
  (= ∇ₖ = k·∂/∂t_k, :33), normal-ordered product `nop` (:38), modes `op a r` by recursion
  (:45), weight-m monomials `P m := (Nat.Partition m).image q.parts` (:48). Statement layer:
  V = MvPolynomial ℕ+ ℚ weight-graded (`AppHalfPiecesStatement.lean:73,82`); `LemmaQ`
  structure with resolution `∑_{|s|≤E+h} Q_s a b f = pairing h a b • f` on V_E (:159–163);
  dual families `aFam μ = ∏(−1)^{μᵢ−1}·y_{μᵢ}` with `y_n = ∑ⱼ C(n,j)·tⱼ` (:166,169), `bFam μ
  = (h!/z_μ)·t^μ` (:172), and `LemmaDual : op (aFam μ) (−h) (bFam ν) = C (if μ = ν then h!
  else 0)` (:175; aliases `PaperIndex.dual := AppHalfPieces.lemmaDual`,
  `PaperIndex.lean:2394`). Consequence layer: `Qk_eq`, counting bounds
  (`Boson/Half.lean:69,86,100,123`).
- *openai Laughlin (fermionic, spectral side).* `Space Q := ExteriorAlgebra ℂ (Orbital Q)`,
  `Orbital Q := Fin (Q+1) → ℂ` (`OAI/Analysis/Laughlin/Operators/CAR.lean:10–11`);
  `create i := ExteriorAlgebra.ι ℂ (mode i) * ·` (:15–19), `annihilate i :=
  CliffordAlgebra.contractLeft (LinearMap.proj i)` (:20–21); **proved CAR relations**
  `annihilate_anticommute`, `create_anticommute` (:23,:33); adjointness
  `annihilate_create_inner` — statement `occupationInner Q x (create i y) =
  occupationInner Q (annihilate i x) y` (`Fock/NormalSquare.lean:10` [erratum 2026-11-13,
  H/QA: v1 rendered the equation without the decl name]); the
  fermionic Wick decomposition `sourcePairCreate_inner : ⟨S_p y, S_q z⟩ = δ_{pq}⟨y,z⟩ +
  ∑_{ij} complexThreeGram(p,i)(q,j)·⟨a_i y, a_j z⟩ + ⟨S_q† y, S_p† z⟩` (:22, with
  `S = sourcePairCreateEnd`, coefficients `pairCoefficient/√2` from
  `Model.lean:17–27`); normal-ordered square `sourceFockHamiltonian_normal_square` (:43);
  contraction bounds `annihilate_normSq`, `two_annihilate_normSq_le`
  (`Fock/ContractionBound.lean:27,49` [erratum 2026-11-13, H/QA: v1 wrote
  `annihilate_normSq_le`; the :27 decl is `annihilate_normSq`]); kernel-distance/spectral machinery
  (`Fock/SpectralDistance.lean`) culminating in `OAI.Laughlin.mainTarget_proved`
  (`Main.lean:19`) from `MainTarget : ∃ N₀ ≥ 2, ∀ N ≥ N₀, ∀ ψ antisymmetric,
  (1/100)·distanceToLaughlinSq ψ ≤ energy ψ` (`Model.lean:56–59`; paper constant γ* =
  4616733319001/10¹⁴, `A-Fock-space-inequality-and-the-Laughlin-spectral-gap-…pdf` Thm 1.1).

**Audit conclusion [VERIFIED]:** disjoint bases — bosonic occupation multisets over ℕ with
weights k (commutator `[∇ₖ, ∇₋ₗ] = k·δ_{kl}`) vs fermionic 0/1-occupations over `Fin (Q+1)`
(anticommutators); scalars ℤ vs ℂ; pairings partition-count matrices vs
`complexThreeGram`. No shared definition; a "unification" that only refactors both is a
port. Hence the layer is stated universally and the *theorems* are the new instantiations:

**(N1) Statistics-universal normal-ordering identity.** Define `OccupationCalculus ι R w ε`
(Lean structure): an index type ι with weight `w : ι → R`, base ring R, sign ε ∈ {1, −1};
families `c i, a i : Module.End M` on a weight-graded module with
`a i ∘ c j + ε·(a j ∘ c i) = w i·δ_{ij}` and `c i ∘ c j = ε·(c j ∘ c i)` (and a-ditto), plus a
graded pairing. **Theorem (N1a):** for every square-zero pair-sum S_p = ∑_{ij} g(p,i,j)·c_i∘c_j
with g the Gram of a bilinear form of rank-r profile, the universal contraction identity
  `⟨S_p y, S_q z⟩ = δ_{pq}·⟨y,z⟩ + ∑_{ij} G(p,i;q,j)·⟨a_i y, a_j z⟩ + ⟨S_q† y, S_p† z⟩`
(with G the induced Gram on the complement — the exact shape of
`sourcePairCreate_inner`, NormalSquare.lean:22) holds in `OccupationCalculus`, with BOTH
  - the bosonic matrix instance (∇-operators; eth's `Ker`/`cre`/`ann`), and
  - the fermionic exterior instance (`create`/`annihilate`, CAR.lean)
  as corollaries; and **(N1b)** the dual-family contraction theorem: for ε-weighted dual
  families `A_μ, B_μ` (bosonic: `aFam/bFam` over partitions, weights w(k)=k; fermionic:
  subset-indexed `A_I = ∏_{i∈I}(±c_i)`, `B_I = ∏_{i∈I} a_i` over subsets I — note: **the
  fermionic index type is subsets, not partitions, since exterior occupations are 0/1**),
  `⟨A_μ x, B_ν y⟩ = δ_{μν}·K(μ)·⟨x,y⟩` with K(μ) = ∏ w(μ_i) (bosonic instance:
  `LemmaDual`'s `h!·[μ=ν]` after z_μ-normalization, `AppHalfPiecesStatement.lean:175`;
  fermionic instance: **K(I) = 1 with the sign refinement `δ_{IJ}·sgn(σ)` — the fermionic
  dual-family statement is new, not proved in openai's files** [VERIFIED absent:
  `rg 'dual|Dual' OAI/Analysis/Laughlin` → nothing of this shape]).

**(N2) [HYPOTHESIS] Spectral transfer to the complexity side.** Via the universal layer,
transport openai's kernel-distance method (`Fock/SpectralDistance.lean`,
`Fock/ContractionBound.lean`) to eth's Q_s pieces: *there is a function δ(E,h) → ℝ≥0 with
`∑_s ‖(Q_s − Q̂_s)·f‖² ≤ δ·‖f‖²` on V_E for projected pieces Q̂_s, or a positivity bound
`⟨f, Q_s f⟩ ≥ −δ_s‖f‖²` uniform over the piece family* — a quantitative refinement of
`LemmaQ.c`'s exact resolution. New statements about eth's operators; truth unknown; the
fermionic contraction bounds are the template. If true it feeds R7's transfer #2 (trilinear
dual families for a three-way budget inequality) with the missing quantitative control.
Flagged exploratory; separable from N1/N3.

**(N3) Weight dictionary to tauceti.** eth's weight spaces `P m` (multisets = partitions of
m, `Boson/Defs.lean:48`) ↔ tauceti's CAR occupation weights
(`TauCeti/Algebra/Lie/GeneralLinear/CAR/Occupation.lean`: commuting projections
`p_ij = ½ d_ij d_ji`, `p_ij + p_ji = 1`, `F_ii = ∑_k p_ik`,
`TauCeti.carOccupationElement_add_swap` etc. [V, file header + main-results list]);
openai's fermionic layer ↔ tauceti's `CliffordAlgebra.equivExterior` route into
`Algebra/Lie/GeneralLinear/Fock.lean` (`TauCeti.glCliffordHom`, `carLieModule` [V, tauceti
survey §1]). **Theorem (N3):** a formal identification of the three occupation gradings
(partition-weight grading on ℚ[t₁,t₂,…]; subset grading on ⋀·ℂ^{Q+1}; CAR weight lattice of
tauceti's Fock module) under which the three "count the occupation" operators
(eth: weight `|σ| = σ.sum`; openai: number operator Σ a_i†a_i; tauceti: `F = ∑_i F_{ii}`)
correspond. First theorem linking a complexity-corpus object to tauceti's representation
theory — the exact connection R1's survey §4 (line 443) names as unrealized.

## Novelty check

Corpus side (rg patterns + counts; decl-index caveat observed — OAI TSV rows include
vendored trees, so direct rg over `openai-math/lean/OAI` and `openai-math/preprints` was
also run):

- mathlib: `rg -i -c 'heisenberg|weyl.?algebra' Mathlib/` → **0 files** [V, R7 §1.2 same
  result]; `rg -i 'canonical.?commutation|canonical.?anticommutation|\bCCR\b' Mathlib/` → 0.
  No Fock/occupation layer: `rg 'occupation' Mathlib/` → 0 relevant. The universal layer
  would be a first mathlib donation.
- tauceti: `rg -i -c 'heisenberg' TauCeti/` → 33 files [erratum 2026-11-13, H/QA: v1 said
  35; recount gives 33] — but: discrete/Lie Heisenberg
  (`GroupTheory/SpecificGroups/Heisenberg.lean`, `Algebra/Lie/Heisenberg/Orbit.lean`,
  `RingTheory/DividedPowers/Heisenberg.lean`, the 7-dimensional weighted PBW quotient
  `Algebra/Lie/UniversalEnveloping/PBW/Weighted/Heisenberg.lean` — central bracket survives
  char 2/3 [V, file header; erratum 2026-11-13, H/QA: v1 omitted the `Algebra/Lie/`
  prefix — path verified on disk]) and the **fermionic CAR stack** `Algebra/Lie/GeneralLinear/CAR/` (8
  files + `Fock.lean`). Nearest misses for N1: tauceti's CAR is fermionic-only and
  Lie-theoretic (weights, Casimir, `CliffordAlgebra.equivExterior`); it has no bosonic
  occupation calculus and no normal-ordering/contraction identity; nothing states a
  sign-universal CCR. For N3 the pieces exist on tauceti's side but no dictionary theorem
  exists anywhere.
- openai-math: `rg -i -l 'heisenberg' OAI/` → hits are `OAI/GroupTheory/Heisenberg/`
  (discrete Heisenberg group, Boone–Higman amenability) and
  `OAI/AlgebraicGeometry/HodgeConjecture/CMExtraction/…HeisenbergLattice.lean` (Mumford–Tate
  side of the CM Hodge work) — **no operator CCR algebra** outside the Laughlin CAR layer
  [V, inspected]. `OAI/RepresentationTheory/VertexAlgebra/ModuleCreationTotality.lean`
  exists (VOA mode creation, R7 §2b) — nearest in-corpus miss for "creation operator API":
  it is mode-algebra totality for strongly rational VOAs, not an occupation calculus, and is
  not connected to the Laughlin CAR layer (`rg 'Laughlin' OAI/RepresentationTheory` → 0).
  The fermionic dual-family statement (N1b-fermionic) is absent: `rg -i 'dual.*family|
  LemmaDual' OAI/Analysis/Laughlin` → 0.
- anthropics: eth's `LemmaDual`/`LemmaQ`/`Qk_eq` are the bosonic instances (cited above);
  `rg -i 'fock|creation|annihil' proof/` outside `rates/ClauseBound/Boson/` → 0. zeta23 has
  no operator layer.
- preprints (direct): `rg -i -l 'fock|CCR|CAR' openai-math/preprints/` → the Laughlin
  family's own manuscripts only; the eth paper's Appendix B is the bosonic source. Neither
  paper states a universal/statistics-parametric identity.
- Literature — **[R8 confirmation pending]**; queries for round-2/3: "fermionic Wick theorem
  formalization" (expect: Isabelle/HOL Wick work may exist for QFT — check
  afp/HOL-Analysis adjacency; not in our corpora), "supersymmetric occupation calculus sign
  parameter", "normal ordering exterior algebra commutation formal theorem prover",
  "CAR algebra weight dictionary symmetric functions" (expect: classical
  Heisenberg↔symmetric-functions correspondence — interestingly R7 §2b already identifies
  eth's LemmaDual as the p-basis case of tauceti's Hall duality; N1b-fermionic is its
  exterior/super analogue — no formal or informal source known to this lane).

## Bridge analysis

- Corpora bridged: **anthropics eth × openai-math × tauceti × mathlib** (all four; the
  layer's landing site).
- Why essential: the universal statement N1a/N1b exists in neither instance corpus (each
  proved only its own face — `sourcePairCreate_inner` fermionic, `LemmaDual` bosonic);
  the fermionic dual-family theorem needs eth's dual-family *pattern* (only there) executed
  in openai's exterior world (only there); N3 needs tauceti's CAR weight theory (only
  there) fed by both gradings; N2 needs openai's spectral method applied through the shared
  calculus to eth's pieces. No corpus can state any of N1–N3 alone; mathlib can host none of
  it today.
- Empty-zone fit: R7 `research/bridges/tensor-algebra.md` §1.2 ("Heisenberg / Weyl algebra |
  nothing | the `[∇_k, ∇₋ₗ] = k·δ` layer behind eth's Boson operators") and §2b
  (Fock/Heisenberg lift, points 1–2); R1 `research/survey/tauceti.md` §4 (line 436–443,
  "CAR ↔ exterior algebra via `CliffordAlgebra.equivExterior`, giving the first
  complexity-theory ↔ representation-theory [connection]" — envisioned, not built).

## Proof-strategy sketch

1. (Definitional, routine) `OccupationCalculus` structure per N1; verify the two instances:
   bosonic — eth's `cre/ann` satisfy `[ann k, cre l] = k·δ_{kl}` on `Ker` (immediate from
   `Multiset.count`/`erase` lemmas; eth's `nop` bookkeeping already encodes it,
   `Boson/Defs.lean:38–45`); fermionic — openai's `create/annihilate` satisfy the CAR
   anticommutator version (`CAR.lean:23,33` are exactly two of the four required identities;
   the mixed ones follow from `CliffordAlgebra.contractLeft_comm` as in the existing proofs).
2. (N1a — the genuinely new combinatorial core) Prove the universal contraction identity by
   ε-bookkeeping: every occurrence of `Multiset.count` (bosonic) / swap-sign (fermionic)
   is abstracted to the same `w·δ` contraction; the proof is a double induction on
   occupation multiset/subset generalized to a single "insert/erase with sign" calculus.
   **Hardest step** (the sign-counting for the cross terms G(p,i;q,j)); routine-but-fiddly,
   no analysis.
3. (N1b) Dual families: bosonic side re-derives `LemmaDual`'s statement inside the layer
   (transfer from `AppHalfPiecesStatement.lean:175` shape); fermionic side proves the subset-
   indexed duality with K(I) = 1 and permutation-sign refinement — new theorem; proof by
   the same ε-induction, using `sourcePairCreate_inner`'s Gram structure
   (`NormalSquare.lean:22`, `complexThreeGram`) as the concrete seed.
4. (N3 — dictionary) Compose three already-proved equivalences: openai's
   `Space Q = ExteriorAlgebra ℂ (Orbital Q)` with tauceti's
   `CliffordAlgebra.equivExterior` route (`TauCeti/Algebra/Lie/GeneralLinear/Fock.lean`
   [V]), then tauceti's CAR weight decomposition (`CAR/WeightSpectrum.lean`,
   `CAR/WeightMultiplicity.lean` [V, dir]) against eth's `P m` weight grading; the number-
   operator correspondence is then three commutation computations. Mostly plumbing over
   proved API.
5. (N2 — exploratory, flagged) Inside the layer, state the eth-side pieces Q_s as
   `OccupationCalculus` operators and attempt the contraction-bound transport
   (`Fock/ContractionBound.lean:27,49` pattern). Genuinely open; do not gate N1/N3 on it.

## Feasibility

Preliminary, R9's F0–F6 shape; `research/feasibility/port-probe.md` **pending** — note for
R9: this candidate spans **three** toolchains (eth v4.33.1, openai v4.34.1, tauceti
v4.36.0-rc2, mathlib v4.36); the OAI→v4.36 probe is missing and the layer should be built
on v4.36 mathlib with the two instance sides behind abstract interfaces (same mitigation as
dossiers 50/51), since neither eth nor openai instance imports can move cheaply.

- F0: N1a/N1b universal identities + two instances; N3 dictionary; N2 optional.
- F1 mathlib entry points: `ExteriorAlgebra`, `CliffordAlgebra.contractLeft`,
  `MvPolynomial.pderiv`, `Nat.Partition`, `Multiset.count/erase`.
- F2 donor lemmas: eth `Boson/Defs.lean:24–48` (Ker/cre/ann/nop/P),
  `AppHalfPiecesStatement.lean:159–175` (LemmaQ/LemmaDual shapes); openai
  `Operators/CAR.lean:10–33`, `Fock/NormalSquare.lean:10–43`,
  `Fock/ContractionBound.lean:27–58`, `Fock/Adjoint.lean:8`; tauceti
  `Algebra/Lie/GeneralLinear/{Fock.lean,CAR/Occupation.lean}`,
  `LinearAlgebra/CliffordAlgebra/{SpinorForms,Hermitian/Tensor}.lean` (equivExterior users
  [V]). Porting friction: all three statement layers are self-contained files with narrow
  imports — the cleanest ports of the three corpora.
- F3 missing glue: the sign-universal insert/erase calculus (step 2) — new, combinatorial,
  bounded; the fermionic dual-family theorem (step 3); the N3 composition lemmas.
- F4 effort: **M** (~1.5–3k LoC for N1+N3; N2 open-ended but separable).
- F5 risks: sign-convention mismatches between the three corpora (eth's `bet` binomial
  normalizations vs openai's `pairCoefficient` √-normalizations vs tauceti's ½-normalized
  p_ij — each will fight the universal statement's exact form; mitigation: state N1a with
  an abstract Gram, push normalizations to instances); N2 may be false or vacuous; the
  zeta23-side second-moment unification (R5 E6) is *adjacent but out of scope* — do not
  absorb it here.
- F6: kernel-only; math-proof1 Modal build/check loop; no external CAS; all constants
  discrete (no numerics).

## Significance

A reusable substrate for three clusters at once: it is the missing host for R7's §2b
symmetric-function lift (LemmaDual = Hall-pairing case) and its fermionic N1b extension; it
realizes R1's envisioned complexity ↔ representation-theory dictionary (N3) through tauceti;
and it is the natural mathlib donation (the ecosystem's first Heisenberg/CAR occupation
layer, filling a verified §1.2 gap). N2, if it lands, would be the first quantitative
spectral statement about the operators driving an ETH-refutation — a genuinely new kind of
statement about complexity-side algebra.

## Score (filled at triage — leave empty)

- Novelty (1–5): —
- Significance (1–5): —
- Effort (S/M/L → 1–5): —
- Rank: —

Lane proposal: novelty 2–3 (universal statement + fermionic duality + dictionary are
absent everywhere, but the instance mathematics is known; N2 alone would be 4 yet is
[HYPOTHESIS]), significance 3 (substrate for R7/R1 clusters + mathlib donation), effort 3
(M). Pilot N1a at the two instances first — smallest complete statement: prove
`annihilate_create_inner`-style adjointness once in `OccupationCalculus` and re-derive both
`CAR.lean`'s anticommutators and eth's `[∇ₖ, ∇₋ₗ] = k·δ` as instances.

## F4 grade by lane R9

2026-11-09, round 5. Evidence: `ProbeF_MathlibBatch.lean` (runs 9–10) + rg path
verification of all three donor sides; tauceti toolchain verified same-toolchain.

- **Grade: M (N1+N3) — confirmed.** Mathlib substrate probe-verified: `CliffordAlgebra.
  contractLeft`, `ExteriorAlgebra`, `Nat.Partition`, `MvPolynomial.pderiv` all OK (run 10).
  **Import-path corrections (probe runs 7–9)**: Clifford lives at
  `Mathlib/LinearAlgebra/CliffordAlgebra/{Basic,Contraction}.lean` and Exterior at
  `Mathlib/LinearAlgebra/ExteriorAlgebra/Basic` — the single-module paths
  `Mathlib.Algebra.CliffordAlgebra` / `Mathlib.LinearAlgebra.ExteriorAlgebra` do NOT exist.
- **Donor-side path corrections (rg)**: openai CAR = `OAI/Analysis/Naimark/CAR.lean` (not
  "Operators/CAR.lean"; CARStage C*-tower at :10+); Fock files = `OAI/Analysis/Laughlin/
  Fock/{NormalSquare,ContractionBound,Adjoint}.lean` (not a bare `Fock/` dir). eth
  `Boson/Defs.lean` verified with `cre` :44 / `ann` :47. tauceti
  `Algebra/Lie/GeneralLinear/CAR/Occupation.lean` verified (occupation elements in the CAR
  algebra) — zero port friction (same toolchain).
- **Toolchain trifold dissolved** as in 50/51: OAI statement defs are of the Model.lean
  category (verbatim-clean precedent, ProbeC2); eth statement layer per B-pattern; the
  binder posture (ProbeE) covers the instance imports.
- Verdict: keep M (~1.5–3k LoC); sign-convention normalization (F5) remains the
  mathematical risk, unchanged.

---

## Pilot outcome (2026-11-09, lane R2 closure)

- **Status: GREEN, complete** — `research/pilots/52/M1.lean` (294 LoC; blueprint
  `research/pilots/52-blueprint.md` with the full 14-iteration run log; final run
  `logs/m1-run14-green.log`: errors=0, sorry-warnings=0; 3 cosmetic unused-simp-arg
  linter warnings only).
- **Host decision (confirmed):** mathlib `ExteriorAlgebra` — it IS `CliffordAlgebra 0` by
  abbrev (`ExteriorAlgebra/Basic.lean:60`), so `CliffordAlgebra/Contraction.lean`
  (`contractLeft_ι_mul` :123, `contractLeft_comm` :198, `contractLeft_one` :176) is the
  exterior contraction API, and it is precisely the base openai's own CAR layer is built on
  (`OAI/Analysis/Laughlin/Operators/CAR.lean:15–21`) — the instance proofs are
  donor-templated. tauceti's CAR (`TauCeti/Algebra/Lie/GeneralLinear/CAR/`) remains the
  **N3 dictionary target** (its occupation projections ↔ our `OccupationPair` weights),
  deliberately not the M1 host.
- **Proved inventory (kernel-verified, no sorry anywhere):** the `OccupationPair R M ε ι`
  structure (ε-relations `cc`/`aa` + split mixed `ac_self`/`ac_ne` + vacuum);
  `cW_swap_pair` (ε-exchange at word level); `slide_ne`/`slide_self` (the mixed relations
  as slides); `annih_outside` (orthogonality half); **`dual_family`** — the ε-universal
  dual-family theorem (N1a core): for every duplicate-free word `t`,
  `aW t (cW t.reverse x) = x` on points killed by `t`'s annihilators — proved ONCE with no
  case-split on ε, axioms `[propext, Quot.sound]` (not even Classical);
  **`sign_transposition`** (the N1b sign phenomenon: transposed two-mode contraction picks
  up exactly ε), same axioms; fermionic specializations (`fermionic_dual_family_vac`,
  `fermionic_sign_transposition`, `fermionic_annih_outside`);
  **`fermionic_create_sq`** (Pauli) — with the **genuine mathematical finding** that the
  statement is FALSE over a general CommRing acting on a module with torsion and in
  characteristic 2, so it is stated over a field with the explicit hypothesis
  `1 + 1 ≠ 0` (exactly char ≠ 2) — a statistics-delta datum for the dossier's N1b;
  `bosonic_unweighted` (the ε = +1, weight-1 fragment of eth's `LemmaDual`); and the
  concrete instance **`fermionicPair n : OccupationPair ℂ (Sp n) (-1) (Fin n)` with 6/6
  fields proved** (axioms `[propext, Classical.choice, Quot.sound]`, no `sorryAx`).
- **Debugging-trail correction (honesty):** the interim [BLOCKED-defeq] hypothesis from run
  13 is RETRACTED — the Exterior↔Clifford ι-spellings do unify under simp's reducible-rfl;
  the run-13 rfl failure was against an unreduced scalar-multiplication coefficient from a
  hand-rolled `simp only` list. The v4.36 fragility lesson (recursive `ext` descending into
  the exterior algebra's own ext principle; explicit `Q` args on `contractLeft*`;
  deprecated `Module.End.mul_apply`/`one_apply` aliases) is documented in the run log for
  the next port.
- **Bosonic full-weighted form: M2 binder, unchanged** — eth's `LemmaDual`
  (`AppHalfPiecesStatement.lean:175`) needs the weighted refinement (weights `w_k = k`,
  Multiset/partition indexing, `z_μ = ∏ k^{m_k} m_k!` normalization, `aFam` sign-twists),
  not provable in the weight-1 layer and deliberately not asserted.
- **Updated proposal:** N1a is no longer proposed work — it exists, kernel-verified, at
  294 LoC and ~5 Modal hours including debugging. The new statement per R8's final
  numbering (**N3.5**: the fermionic dual-family theorem with the sign refinement,
  statistics-universal, absent from all four corpora and the literature per round-2) is
  PROVED (universally over `OccupationPair`, hence simultaneously for the concrete
  ExteriorAlgebra instance). Remaining for triage: M2 = the weighted layer (unlocks the
  bosonic `LemmaDual` re-derivation), M2b = the N3 tauceti dictionary, N2 = the
  [HYPOTHESIS] spectral transfer (untouched). Effort estimate for M2 revised DOWN (the
  base layer cost ~S beyond the pilot); novelty/significance stand as proposed.
