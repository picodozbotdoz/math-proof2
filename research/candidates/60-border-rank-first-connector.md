# Candidate 60 — border-rank-first-connector

(Created by lane R3, 2026-11-09. Template: `research/candidates/TEMPLATE.md`. Cross-ref
dossiers 32 (R7, tensor-algebra bridge map) and 51 (R2, openai-math survey). R5's dossier 22 is
the PNT statement doc, unrelated. Score fields empty per template — Phase 4 fills them.)

> **Classification (honesty-first, per the orchestrator's convention): ECOSYSTEM-NOT-DISCOVERY.**
> The mathematics (Schönhage's ten-term identity, border rank ≤ 10 for the direct sum
> ⟨3,1,3⟩ ⊕ ⟨2,2,1⟩; Strassen's rank ≤ 7 for ⟨2,2,2⟩) is classical and known. What is new is the
> *connector*: the first concrete classical tensor-decomposition instance stated as a rank/border-
> rank theorem in any of the four corpora, transplanted from 3sum-apsp's trilinear machinery onto
> openai-math's `Tensor.BorderRankAtMost` API (and, secondarily, onto mathlib's `Holor.cprank`).
> This dossier is the feasibility feeder for the tensor lane's *discovery* candidates (§ follow-up),
> not itself a discovery. Novelty is expected to score 1–2 at triage; it is filed so the lane's
> real candidates inherit verified glue.

## Name

border-rank-first-connector

## One-line pitch

Port 3sum-apsp's ten-term Schönhage identity (`Lemma_6`, an integer polynomial identity in 24
variables) as the first concrete instance theorem on openai-math's existing-but-instantiate-only-
by-CW `Tensor.BorderRankAtMost` API — `BorderRankAtMost T_G 10` for the direct-sum tensor
G = ⟨3,1,3⟩ ⊕ ⟨2,2,1⟩ — plus exact-ℤ variants landing on mathlib's `Holor.cprank`.

## Precise mathematical statement

All three statements are self-contained. Let `LeftVar` be the 7-element type
`x (i : Fin 3) ⊕ p (i j : Fin 2)`, `RightVar` the 7-element `y (Fin 3) ⊕ q (Fin 2)`, `OutVar` the
10-element `z (i j : Fin 3) ⊕ z0` (donor's `LeftVar/RightVar/OutVar`,
`3sum-apsp/PaperStatements.lean:~88-101` [VERIFIED constructors; OutVar at :98-101]).

**Target API (openai-math, over ℂ).** `Tensor K X Y Z` with `rankOne (a b c) x y z := a x * b y * c z`
(`openai-math/lean/OAI/LinearAlgebra/MatrixFields/Tensors/ComplexDotPairing.lean:22-24`),
`RankAtMost T r` (:25-27), and `BorderRankAtMost T r : Prop := T ∈ closure {S | RankAtMost S r}`
(:228-230) — closure in the function-space (Π) topology [VERIFIED definition].

Define `T_G : Tensor ℂ LeftVar RightVar OutVar` by

    T_G x y z := (∑ i j : Fin 3, x (.x i) * y (.y j) * z (.z i j))
               + (∑ i j : Fin 2, x (.p i j) * y (.q i j)) * z .z0

(the tensor of donor `G`, `PaperStatements.lean:178-181`; as a trilinear form this is the direct
sum of a 3×3 outer product and a 2·2 inner product: ⟨3,1,3⟩ ⊕ ⟨2,2,1⟩).

**C60.1 (primary).**
`theorem tensor_G_borderRank_le : Tensor.BorderRankAtMost T_G 10` — over ℂ, Π-topology.

**C60.2 (exact family; honest content over ℤ, no topology).** For t : ℂ (resp. ℤ), let `S_t` be
the endomorphism scaling the inner variables: `S_t x (.p i j) = t * x (.p i j)`, `S_t y (.q i j) =
t * y (.q i j)`, identity on all `x_i, y_j, z`. With `T_E` the tensor of donor `E`
(`PaperStatements.lean:183-188`, whose every monomial contains ≥ 1 inner variable [VERIFIED]):

`theorem tensor_G_plus_tE_rank_le (t : ℂ) : RankAtMost (T_G + S_t T_E) 10`

and its ℤ mirror on mathlib `Holor ℤ [7,7,10]` (`Holor.cprank`, `Mathlib/Data/Holor.lean:333`):
`cprank (holorOf (T_G + S_t T_E)) ≤ 10`. C60.1 follows from C60.2 by t → 0.

**C60.3 (warm-up, Strassen via donor `Eq_1`).** With `T₂ : Tensor ℂ (Fin 2) (Fin 2) (Fin 2)` the
2×2 multiplication tensor: `theorem tensor_2_borderRank_le : BorderRankAtMost T₂ 7` (and exact
`RankAtMost T₂ 7` over any ring). Source: donor `Eq_1`
(`PaperStatements.lean:603-616` — **correction**: `Eq_1` is Strassen's *2×2 seven-product*
identity over an arbitrary ring, NOT a 3×3 border-rank identity as `research/survey/anthropics.md`
§4 has it; the 3×3 asymptotic-sum content is `Lemma_6`).

**Explicitly NOT claimed (topology trap, per `research/feasibility/mathlib-assembly-maps.md` §E):
any border-rank statement over ℤ or over `Holor ℤ` — over a discrete ring the border rank
collapses to CP rank, so the only honest ℤ-statements are the exact family C60.2. All border
content is stated over ℂ (or a normed field), where openai-math's definition already lives.**

## Novelty check

Corpus searches (run 2026-11-09, this session):

- **mathlib** (`encore-mathlib/repo/mathlib4`):
  - `grep -ric 'schönhage\|schonhage' Mathlib/` → 0 files with hits.
  - `grep -rn 'border rank\|borderRank\|border_rank' Mathlib/` → 0 hits.
  - `grep -rni 'strassen' Mathlib/` → 1 hit, a docstring (AkraBazzi/AkraBazzi.lean:21, motivation).
  - `Holor.cprank` exists (`Mathlib/Data/Holor.lean:333`) with `cprank_upper_bound` (:336) — no
    instance theorem, no border notion, zero consumers (frontier survey §4).
- **tauceti** (`tauceti/`): `grep -rni 'strassen|schönhage|tensor rank|border rank|trilinear'` →
  5 files; all different domains, checked: `RepresentationTheory/Spin/Triality/TrilinearForm.lean`
  is the type-D₄ triality-invariant form (header [VERIFIED]), the other four are `Associator/
  Casimir/ GromovProkhorov/ Curvature` tensor-calculus files. No rank/exponent machinery.
- **openai-math** (nearest miss — machinery present, classical instances absent):
  - `Tensor K X Y Z`, `rankOne` (ComplexDotPairing.lean:22-24), `RankAtMost` (:25-27),
    `BorderRankAtMost` (:228-230, closure definition), `DegeneratesTo`/`restrictionOrbit`
    (:235-240); `exactRank` (MatrixMultiplication/AuxiliarySeparation/Arithmetic/RankExponent.lean:36)
    with `exists_rankAtMost` (:22); a `RankAtMost → BorderRankAtMost` implication is used as
    `(.borderRankAtMost)` (Separation/ComplexStageHierarchyResources.lean:186).
  - Concrete instance in corpus: only their CW tensor — `borderRankAtMost : Tensor.BorderRankAtMost
    tensor 3` (CoppersmithWinograd/ComplexCWBoundary.lean:237-238).
  - `grep -rni 'strassen|laderman|schönhage' lean/OAI/LinearAlgebra/MatrixMultiplication/` → 0.
    So: no classical named scheme (Strassen/Schönhage/Laderman) anywhere in the corpus.
- **anthropics 3sum-apsp**: the identity exists as `Lemma_6` (`PaperStatements.lean:618-620`, an
  identity of integer polynomials in 24 variables), but `grep -rni 'trilinear|tensor rank'
  PaperStatements.lean` → 0 hits: the corpus never states any rank theorem.
- **Literature**: Strassen 1969 (rank ⟨2,2,2⟩ ≤ 7) and Schönhage 1981 *Partielle und virtuelle
  Matrixmultiplikation* (the ten-term asymptotic-sum identity; border rank ≤ 10 for exactly this
  G) are classical/textbook (Bürgisser–Clausen–Shokrollahi Ch. 15) [VERIFIED classical-status,
  exact bibliographic form `[R8 confirmation pending]`]. The 3×3 rank-23 scheme the orchestrator
  asked about is **Laderman 1976**, not Smirnov [HYPOTHESIS attribution — route to R8]; border
  rank ⟨3,3,3⟩ ≤ 21 is the Schönhage-lineage bound [HYPOTHESIS attribution — route to R8].
  Numerical exponent consequences (ω < 2.55 from this instance via the asymptotic-sum inequality)
  are deliberately NOT claimed here — see follow-up.
- `[R8 confirmation pending]` for: Schönhage 1981 exact reference form; Laderman attribution;
  ⟨3,3,3⟩ border-rank-21 attribution; whether any corpus-external formalization (isabelle/AFP,
  Coq) already instances a classical scheme as border rank (AFP *Deep_Learning* has CP rank
  only, per Holor.lean provenance).

**Verdict: the statements are known mathematics; corpus-novelty is only as a connector instance.
Filed as ecosystem-not-discovery (label above). Nearest misses: openai-math's CW instance
(ComplexCWBoundary.lean:237 — their tensor, not a classical named scheme) and 3sum-apsp `Lemma_6`
(identity, never a rank statement).**

## Bridge analysis

- Corpora bridged: **anthropics (3sum-apsp) ↔ openai-math ↔ mathlib**.
- Why the bridge is essential (ecosystem sense): the concrete ten-term decomposition exists ONLY
  in 3sum-apsp (`phi : Term → LeftVar → ℤ` :140, `psi` :147, `chi` :153, `G` :178, `E` :183,
  `Lemma_6` :618 — proved there as `Items.Lemma_6` per `docs/INDEX.md`'s 137-statement registry);
  the rank/border-rank definitional layer + topology exists ONLY in openai-math
  (`ComplexDotPairing.lean`); a ℤ-exact third landing exists ONLY in mathlib (`Holor.cprank`).
  No single corpus can state C60.1 today.
- Empty-zone fit: realizes `research/feasibility/mathlib-assembly-maps.md` §E (glue list E-G1…E-G5,
  now re-targeted: openai-math's `BorderRankAtMost` supersedes the proposed mathlib-side
  `borderCPRank` definition); frontier survey §7 hook 5 (Holor island); tensor-algebra bridge map
  (dossier 32, R7 — cross-ref).

## Proof-strategy sketch

1. **Transport** [routine, ~100 LoC]: trilinearize the donor polynomials. `G + E` is degree ≤ 1
   in each variable group, so define `T_{G+E}` by evaluation; `formL/formR/formO`
   (`PaperStatements.lean:164-171`) make each side of `Lemma_6` a sum of ten `rankOne` terms
   after base change ℤ → ℂ (`Int.cast` push).
2. **Instance** [routine]: `Lemma_6` (a polynomial identity over ℤ) gives
   `RankAtMost T_{G+E} 10` — the ten terms are `rankOne (φ_λ ∘ ℤ→ℂ) (ψ_λ) (χ_λ)`, λ ∈ `Term`
   (10 constructors [VERIFIED]). In a fresh port this is `ring_nf` on 24-variable monomial sums;
   the donor's own proof (`ThreeSumApsp` Sec2 library) can be consulted but is not needed.
3. **Scaling family** [the one genuinely new formal object]: define `S_t` (scale `.p`/`.q`
   coordinates by t). Each `rankOne` term composes to a `rankOne` term (coefficients stay
   linear), and `S_t (G + E) = G + S_t E` because every monomial of `E` has an inner factor
   [VERIFIED from the definition at :183-188]. Hence C60.2: `RankAtMost (T_G + S_t T_E) 10`.
4. **Limit** [routine finite-dimensional topology]: t ↦ S_t(T_G + S_t T_E)... concretely t ↦
   (T_G + S_t T_E) is polynomial in t coefficientwise, hence continuous into the Π-space;
   T_G = limit at t = 0, so `T_G ∈ closure {S | RankAtMost S 10}` — C60.1, matching
   openai-math's closure definition verbatim (their `RankAtMost.borderRankAtMost` route,
   ComplexStageHierarchyResources.lean:186, is the same pattern).
5. **Warm-up C60.3** [routine]: donor `Eq_1` (:603) is exactly seven `rankOne` terms for the 2×2
   tensor over any ring.

Genuinely new ideas: none in the mathematics; the new work is the transport layer (step 1) —
`MvPolynomial Var ℤ` ↔ `Tensor ℂ X Y Z` ↔ (optionally) `Holor ℤ` — which every later tensor-lane
candidate reuses.

## Feasibility (R9 §3 shape, `research/feasibility/mathlib-verification.md`)

- F0. Target: C60.1 (+ C60.2 ℂ/ℤ, C60.3) as above — mathlib/openai-math-ready phrasing.
- F1. Entry points: openai-math `ComplexDotPairing.lean` (`Tensor`/`rankOne` :22-24,
  `RankAtMost` :25-27, `BorderRankAtMost` :228-230), `RankExponent.lean` (`exists_rankAtMost`
  :22, `exactRank` :36); mathlib `Mathlib/Data/Holor.lean` (`Holor`, ⊗, `CPRankMax` lemmas
  :265-309, `cprank` :333); donor `3sum-apsp/PaperStatements.lean` (`phi/psi/chi` :140-155,
  `pHat/qHat` :127-134, `G` :178, `E` :183, `Lemma_6` :618, `Eq_1` :603).
- F2. Donor lemmas: `Lemma_6` (:618) and `Eq_1` (:603) — both are explicit identities; porting
  friction ≈ zero (re-provable by `ring_nf` in ~20 lines each rather than importing 3sum's module
  system).
- F3. Missing glue: (a) MvPolynomial → Tensor trilinearization transport (~100 LoC, depth 1);
  (b) scaling endomorphism `S_t` + coefficientwise-continuity lemma (~80 LoC, depth 1);
  (c) optional `Holor` mirror + `Tensor ↔ Holor` bridge (~120 LoC, depth 1);
  (d) NOT included: asymptotic-sum exponent corollary (needs an inequality openai-math states
  only for *exact* finite-block exponents, `Arithmetic/Exponent.lean` "bounded by each exact
  finite-block exponent" :98 region — border-rank version is a genuine gap and a separate,
  possibly-discovery-grade dossier).
- F4. Effort: **S** (≈ 400–700 new LoC total for C60.1–C60.3 + transport).
- F5. Risks: (i) openai-math has two `rankOne` defs (`MatrixFields/Tensors/ComplexDotPairing.lean:22`
  and `MatrixMultiplication/Tensor/ComplexTensor.lean:24`) — pick the one `BorderRankAtMost`
  closes over (ComplexDotPairing) and check the two `Tensor` types agree at pilot time
  [HYPOTHESIS: they are the same shape, not verified]; (ii) the Π-topology instance behind
  `closure` must be the product topology (instance derivation — verify); (iii) donor file uses
  Lean 4 module system (`public import`) — re-derivation preferred over import; (iv) no analytic
  content, so no kernel risk beyond arithmetic; (v) ℤ↔ℂ base-change `push_cast` noise.
- F6. Verification plan: kernel-only (math-proof1 standard: no `sorry`, no `native_decide`, no
  external CAS); build on Modal via the probe harness (`research/feasibility/probe/run_probe.sh`,
  `MATHLIB_REV=ff2494ea…`) extended with an openai-math dependency stage (their `lean/OAI` tree,
  toolchain to be matched — see blueprint risk on toolchain drift).

## Significance

Not a discovery; it is the tensor lane's keystone connector. It makes openai-math's
`BorderRankAtMost` load-bearing for classical instances for the first time, gives the 3sum-apsp
trilinear machinery its first rank-theoretic consumer, and deposits the MvPolynomial↔Tensor↔Holor
transport that every later tensor candidate (including the genuinely open follow-up: a
*border-rank* asymptotic-sum inequality feeding their arithmetic exponent, and any combination of
3sum's pruned-recursion counts `alpha`/`beta`/`Pruned` :509 with the exponent machinery) would
build on. It also demonstrates the corpus-transplant pipeline on the cheapest possible statement.

## Score (filled at triage — leave empty)

- Novelty (1–5):
- Significance (1–5):
- Effort (S/M/L → 1–5):
- Rank (novelty × significance ÷ effort):

---

### Editor note for triage (non-template, informational)

Proposed (non-binding, from the author): Novelty 1–2 (classical statement; connector packaging —
per TRIAGE.md's novelty scale this scores 1 unless the corpus-transplant framing is credited),
Significance 2 (reusable transport + makes an existing corpus API load-bearing), Effort 1 (S).
Expected rank ≈ 0.5–1: do NOT select as a discovery pilot; select as pipeline warm-up for the
tensor lane alongside the PNT pilot 22 (whose glue is comparably small but whose statement is
mathlib-chartered). The discovery-grade follow-up to watch: border-rank asymptotic-sum inequality
(§ Feasibility F3(d)) — filed separately when its statement is verified novel.

## F4 grade by lane R9

2026-11-09, round 4. Evidence: rg verification this round + OAI closure measurements
(`research/feasibility/port-probe.md` §7); Modal runs 3–4 for the OAI defs-family precedent.

- **Grade: S — confirmed, with the machinery chain measured self-contained.** The openai
  `ComplexDotPairing.lean` (which defines `Tensor`/`rankOne` :22, `RankAtMost` :25,
  `BorderRankAtMost` :228) has **def-chain closure 1 file / 778 LoC / depth 0** (imports
  only `Mathlib`) — the connector statement ports standalone against the OAI statement
  layer without dragging the MatrixMultiplication tree. The two other OAI citations are
  verified at their real path: `exists_rankAtMost` :22 and `exactRank` :36 live in
  `OAI/LinearAlgebra/MatrixMultiplication/AuxiliarySeparation/Arithmetic/RankExponent.lean`
  (F1 wrote "RankExponent.lean" without the path — cosmetic correction; note it is a
  cross-directory pairing the dossier itself assembles).
- **F1 correction (strengthening)**: `Holor.cprank` **exists** — `Mathlib/Data/Holor.lean:333`
  `noncomputable def cprank [Ring α] (x : Holor α ds) : Nat := @Nat.find (fun n =>
  CPRankMax n x) …` plus `cprank_upper_bound` :336. My round-2 correction ("only rank-at-most
  predicates") was itself incomplete: mathlib has the CP-rank *function* too. This makes the
  optional Holor mirror (F3(c)) cheaper than assumed — `cprank` is directly consumable.
- Residual risk: `ComplexDotPairing.lean` itself was not elaborated ( defs file, 778 LoC,
  imports `Mathlib` wholesale — same category as `Model.lean`, which ported verbatim OK);
  F5(i)'s two-`rankOne` check remains a pilot-time task. Verdict: S stands.
