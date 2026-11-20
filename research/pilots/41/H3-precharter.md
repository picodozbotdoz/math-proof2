# Pilot 41-H3 PRE-CHARTER — the n ≥ 4 TL hunt (two-fiber rank closure + the TL₄ dictionary question)

*Lane R4 (worktree agent-08), 2026-11-20, Iteration 5 (restarted), the deferred-seed unit.
Seed lineage: 41H article §7 ("the n ≥ 4 remainder, with its raised prior") + `H-record.md`
tranche-3 scope note (the orchestrator-ruled DEFERRED seed, 2026-11-19). This is a
CANDIDATE spec — **charter-grade work only: NO Modal fires; every run below is priced for
post-approval execution** (fires come after orchestrator approval, per the tasking). R9's
round-7 novelty battery ran on THIS file in parallel (§8 inputs — ANSWERED: novelty
cleared); write-first dependency honored — the first complete draft's sha
`726e3d695e766da6` was reported before any refinement; this file is the post-battery
final.*

## 0. Scope + claim discipline (locked, inherited)

- The question: **does the 41H 3-strand no-go verdict extend to n ≥ 4 strands, or does a
  dictionary open up there?** 41H closed the 3-strand tier FALSE (Thm A traciality, Thm B
  rank) and re-scoped the host search to n ≥ 4 (TL₄, dim Catalan₄ = 14 ≥ 8 — necessary,
  not sufficient), non-tracial by force. This precharter enumerates that hunt's concrete
  hypothesis family, its statement surface, its prior art, and its price.
- Headline wording locks inherited verbatim: sign-rule/parallelogram-defect-shaped claims
  only; NEVER "first q-deformation of a composition algebra" (Benkart–Pérez-Izquierdo
  1998, arXiv:math/9801141, owns the q-composition object level); negative-class register
  "elementary certificates, nonelementary closure" (41H §N3 / R9's §NEGATIVE). **Battery
  minted (round-7, `87659f58`, 2026-11-20):** (i) NEVER "first Hadamard–TL connection"
  (Avan et al. arXiv:1306.2927 owns the Hadamard–TL adjacency — §3 row 6); (ii) the
  Walsh/affine-permutation mechanism is NEVER claimed (classical in spirit — §3 row 4);
  (iii) the spin-model contribution is worded as the dictionary-through-spinRep content,
  never the model (§3 row 2b). **Battery verdict (folded): TARGET-C NEW-narrow,
  TARGET-D NEW-narrow, the P4 rider NEW-narrow method-grade, dim-14 COVERED-classically
  + corpus-NONE, no collisions — this precharter CLEARS NOVELTY.**
- Kernel-only: no `sorry`, no `native_decide`, no external CAS. Decide discipline per the
  H2 substrate notes (durable): **integer arithmetic only** under kernel decide
  (`Rat.add`/`Rat.div` are extern-opaque on v4.36.0-rc2); no `Matrix.mul` / `Finset.sum` /
  `Matrix.det` under decide (literal-list `lsum` foldrs instead); the ᵀ postfix only on
  bare identifiers; hypothesis-binder (EnclOK) pattern for pigeonhole/dependence premises.
- This precharter makes NO proof claims: every hand computation in §2 is
  hypothesis-grade until decide-discharged (those marked "mechanically cross-checked"
  passed an exhaustive 64-pair check over the eth-exact formulas this session — the
  decides remain the record); every statement in §4 is elaboration-tier until fired.
  P0/article eligibility is decided by the orchestrator, not here.
- **Protocol (coordinator rulings, 2026-11-20):** fires stay gated — the S/M/L ladder
  (proposed cap 1.2k LoC / 10 runs) reaches charter approval only AFTER R9's round-7
  battery AND this file's final sha land together in a report; on unit completion H
  lands this file as ONE batch (single landing, no intermediate versions on main).
  Headline/novelty wording for TARGET-C/D aligns with R9's battery rows at their
  landing (the spin-model row 2b and its wording lock included).

## 1. The mathematical question + the concrete hypothesis family (tasking item a)

**Host tier.** TL₄(δ): generators e₁, e₂, e₃ with the TL relations — e_i² = δ·e_i;
e_i e_j = e_j e_i for |i−j| ≥ 2 (here: e₁e₃ = e₃e₁); e₁e₂e₁ = e₁ and e₂e₃e₂ = e₂.
Dimension 14 (Catalan₄; planar-matching diagram basis — classical, NOT corpus-formal:
see §3 row 1). A DICTIONARY is a word family w : Block → TL₄(δ) plus a ℤ-linear
functional φ with φ(w_p · w_p′) = (table)(p,p′) for all 64 pairs — the 41H §2 class,
d = 14 now.

**The fiber table (which q/parameter):**

| fiber | table | δ = −(A²+A⁻²) at q = −A² | status |
|---|---|---|---|
| q = −1 | M₋(p,p′) = (−1)^{φQ(p,p′)} (Walsh; H2's Thm B home) | A = ±1 ⇒ **δ = −2** | certificates GREEN (H2) |
| q = +1 | M₊(p,p′) = (−1)^{φ(p,p′)} = **eth's own σ** (φ = φQ+τ) | A = ±i ⇒ **δ = +2** | §2 Finding P1: also Walsh — decide-planned |
| q = −A² (Jones) | σ_q entries ±(A²)^τ, Laurent in A | δ = −(A²+A⁻²) | the original (H) shape at n = 4 |
| q generic | det M(q) ∈ ℤ[q], deg ≤ 24 (entries deg ≤ 3, τ ≤ 3) | — | §2 Finding P4 rider |

Both closed fibers sit at **root-of-unity-degenerate δ ∈ {−2, +2}** of the TL family
(generic TL₄(ℚ) ≅ M₁ ⊕ M₂ ⊕ M₃, 1+4+9 = 14; at δ = ±2 the semisimplicity collapses) —
§2 Q2.

**The verdict-extension map (what 41H already proves vs. what is open):**

1. TRACIAL no-go — **extends to ALL n verbatim** (dimension-free): traciality forces
   table symmetry; both closed fibers are asymmetric (q = −1 witness (100,110) — H1's
   decided pair; q = +1 witness (100,010) — σ(100,010) = −1 ≠ 1 = σ(010,100), §2 P1
   cross-check). Any n ≥ 4 dictionary is NECESSARILY non-tracial at either fiber.
2. RANK no-go — extends to **every d ≤ 7** (dimension-free up to the hdep binder): the
   H2 proof uses d only through the EnclOK dependence binder; 8 > d gives hdep. At every
   fiber with det ≠ 0 (both closed fibers, §2), no d ≤ 7 linear-functional realization
   exists — abstract hosts of dim 8–13 stay open (note the d = 8 borderline: the
   Morin-Duchesne dimer family has d = 2ⁿ⁻¹ = 8 at n = 4, where the eight word-images
   would need to be a basis — §3 row 7), TL₄ (d = 14) is exactly the hunt.
3. The OPEN tier — d ≥ 8, concretely TL₄: **does a dictionary exist?** The scope note's
   honest read carries: the two obstructions RAISE the prior that none exists at any
   strand count (Walsh-rigidity); this unit is priced SEARCH-WITH-NO-GO-ESCALATION —
   the negative outcome of the bounded search is itself reportable (the third
   obstruction finding).

**The hypothesis family (enumerated, one line each):**

| id | statement | shape |
|---|---|---|
| H4-DICT-−1 | ∃ w : Block → TL₄(−2) (diagram-basis words), φ : TL₄(−2) →ₗ ℤ, φ(w_p w_p′) = M₋(p,p′) ∀ 64 | the abstract hunt (any functional) |
| H4-DICT-spin | ∃ words w_p ∈ TL₄(δ), K ∈ M₁₆(ℤ) (or matrix coefficient (s,t)): tr(K·spinRep(w_p w_p′)) = M(p,p′) — the corpus-native route (§2 P5) | the LEAD positive route (R9-flagged) |
| H4-DICT-Jones | the same at q = −A² over ℤ[A±], δ = −(A²+A⁻²), entries as Laurent identities | the original (H) at n = 4 |
| H4-DICT-+1 | ∃ dictionary for eth's own σ in TL₄(+2) | the eth-anchored variant |
| NEG-H4-rank≤7 | no d ≤ 7 linear-functional realization at q ∈ {−1, +1} | **Theorem C** (near-certain; §6) |
| NEG-H4-generic | det M(q) ≢ 0 ⇒ all but ≤ 24 fibers kill every d ≤ 7 | the rider (§2 P4) |
| NEG-H4-tracial-n4 | no tracial dictionary at any n at either closed fiber (Thm A extension restated) | corollary-grade |
| NEG-H4-bounded | no dictionary with words of length ≤ L (L = 3 first) in the searched host (spin host lead / A14 literal fallback) + its full functional dual | the search's negative outcome, reportable — host-scoped per the no-injectivity caveat |
| H4-M3-quotient | does TL₄(δ) at δ ∈ {−2, +2} have an M₃-class quotient image supporting an tr(K·)-with-insertion realization of the table? | paper-level ansatz (§2 P5) |

**Which certificate class** (the §N3 lock): kernel `decide` over raw six-Boolean
statements and literal-list ℤ sums (`lsum`), 8·-scaled division-free forms, EnclOK
hypothesis binders (hdep-class), zero ℚ under decide, zero Matrix/Finset under decide.
The 64-equation checks per dictionary candidate are the same class (each entry a short
integer sum of small products).

## 2. Paper-level findings to date (this session's own math; hand-verified, each with a decide-discharge plan)

- **P1 — both closed fibers are permuted Walsh matrices** (over the eth-exact defs:
  `phiQ`/`phi1/2/3` at anthropics eth `proof/networks/Eight/SecCrossing_Identity.lean:126–133`,
  `phi_parts :136`, `Eight.signs :261` — the same verbatim surface H2 §0 carries).
  M₋(p,p′) = (−1)^{b(p)·p′} with b(p) = (p₁, p₁⊕p₂, p₁⊕p₂⊕p₃) the cumsum bijection of
  (𝔽₂)³ (so H2's B1 orthogonality is character orthogonality; |det M₋| = 8⁴). For
  M₊ = eth's σ: φ(p,p′) ≡ (b(p) + c(p))·p′ over 𝔽₂, where c(p) = (p₂p₃, p₁p₃, p₁p₂)
  collects the cubic row-gradient; the index map a₊ = b + c is ALSO a bijection:
  a₊(000)=(000), a₊(100)=(111), a₊(010)=(011), a₊(001)=(001), a₊(110)=(101),
  a₊(101)=(100), a₊(011)=(110), a₊(111)=(010) — the eight values distinct. Hence
  |det M₊| = 8⁴ and the q = +1 orthogonality certificate is the same raw six-Bool
  decide as H2's B1. **Verification state:** every claim in this bullet mechanically
  cross-checked this session by an exhaustive 64-pair table over the eth-exact
  formulas (both row-form identities, both bijections, both orthogonality relations,
  both asymmetry witnesses: σ(100,110)=1≠−1=σ(110,100) at q=−1 [H1's decided pair] and
  σ(100,010)=−1≠1=σ(010,100) at q=+1, and max τ = 3 — the §1 degree bound). **Discharge
  plan:** `sigmaOneOrth_raw` decide (§4); the a₊ table above is the fallback audit
  trail. (Honesty note: the first pass at this computation in this session had an
  arithmetic slip in b — caught by the direct φ cross-check; exactly why the decides,
  not the hands, are the record.)
- **P2 — the fiber↔δ dictionary.** q = −1 ⇔ A = ±1 ⇔ δ = −2; q = +1 ⇔ A = ±i ⇔
  δ = +2. Both certified fibers are degenerate points of the TL family (generic
  semisimple TL₄(ℚ) ≅ M₁⊕M₂⊕M₃ collapses at δ = ±2cos(π/k)-class points, ±2 included).
  Opened sub-question **Q2**: the exact cell/quotient structure of TL₄(±2) — classical
  (Martin, Westbury; §3 row 3) — the hunt's δ-specializations live at the degenerate
  points, which cuts BOTH ways (fewer quotients to host a dictionary; richer radical
  to hide one).
- **P3 — the necessity corridor at n = 4.** At either closed fiber any dictionary has:
  (i) φ non-tracial (P1 asymmetry + Thm A, all n); (ii) the eight word-vectors spanning
  ≥ 8 of the 14 dims (rank ≥ 8 vs. d ≤ 7 closure); hence (iii) the word set is NOT
  contained in any two-generator subalgebra — ⟨e₁,e₃⟩ is commutative of dim 4
  (span{1,e₁,e₃,e₁e₃}; e₁²e₃² = δ²e₁e₃ closes it), ⟨e₁,e₂⟩ ≅ TL₃(δ) of dim 5
  (span{1,e₁,e₂,e₁e₂,e₂e₁}; e₁e₂e₁ = e₁ closes it), same for ⟨e₂,e₃⟩. The search space
  is precisely: 8 words spanning ≥ 8 dims, using ≥ 3-generator reach, + non-tracial φ.
- **P4 — the genericity rider, refined.** det M(q) ∈ ℤ[q] has degree ≤ 24 (entries
  (−1)^{φQ}(−q)^τ, τ ≤ 3) and det M(−1) = ±8⁴ ≠ 0 (H2's certificates), so the
  polynomial is nonzero and vanishes at ≤ 24 fibers: **one certified fiber already
  proves nonzero-ness — the scope note's 25-point scan is over-designed and is dropped**;
  the surviving Lean cost is the det-eval commutation (eval(det) = det(eval) via
  Polynomial.map/Matrix det ring-homomorphism lemmas) — priced at §5's L-rung. What the
  rider then buys: the d ≤ 7 no-go at EVERY fiber except ≤ 24 unknown ones.
- **P5 — the positive ansatz, now corpus-native (spin model; R9 cross-relay
  2026-11-20).** If π : TL₄(δ) → (matrix algebra) is an algebra map and X_p = π(w_p),
  K a matrix with tr(K X_p X_p′) = M(p,p′), then w_p := any preimage choice and
  φ := tr(K π(·)) IS a TL₄ dictionary (linear functional on TL₄; the composition is
  legitimate). **The corpus already contains the map**: tauceti's spin (vertex) model —
  `TauCeti.TemperleyLieb.spinRep : TemperleyLieb R δ n →ₐ[R] Matrix (Fin n → Bool)
  (Fin n → Bool) R` (`Algebra/TemperleyLieb/MarkovTrace.lean:300`, an algebra
  homomorphism with all three TL relation families PROVED for the generator matrices
  `spinGenerator q j k` :153–155 — rank-one cup⊗cap matrices, cup(true,false) = −q,
  cup(false,true) = 1, cap(true,false) = 1, cap(false,true) = −q⁻¹). At n = 4 the host
  is M₁₆ (configs `Fin 4 → Bool`), dim 256 of functionals — and the natural dictionary
  class is φ_K(x) = tr(K · spinRep x) with K OUTSIDE the commutant, or plain matrix
  coefficients (s,t)-entries — **non-tracial on the word subalgebra exactly as Thm A
  demands** (the spin Markov trace itself is tracial on the image and is thereby
  EXCLUDED by Thm A — a useful narrowing, not an obstruction to the class). The fiber
  arithmetic is decide-friendly at BOTH closed fibers: δ = −2 ⇔ spin parameter 1
  (cup/cap ∈ {−1, 1}), δ = +2 ⇔ spin parameter −1 (cup/cap ∈ {1, −1}) — integer
  matrices throughout. **Honest scoping (tauceti's own words, Spin/Positive.lean
  header): "No injectivity of the spin representation is asserted"** — the spin route
  is SUFFICIENT for Theorem D (any dictionary found pulls back through the algebra
  map), but a negative spin-search does NOT exhaust TL₄ (the kernel may hide
  dictionaries); the bounded-negative claim must be scoped to the spin host. The
  M₃-block quotient variant of P5 stays as the secondary ansatz (generic TL₄(ℚ) ≅
  M₁⊕M₂⊕M₃, 1+4+9 = 14; degenerate-point quotient structure = Q2).
- **P6 — rigidity heuristics (the honest negative counterweight).** (a) Rank-one
  matrix-unit constructions X_p = u_p v_pᵀ give Gram tables of rank ≤ 1 — cannot reach
  the nonsingular M. (b) Diagonal-associative 8-dim hosts (basis w_p, w_pw_p′ :=
  M(p,p′)w_{κ(p,p′)} with κ ∈ {p,p′}) force M degenerate-constant: associativity at
  κ = p requires M(p,p″) = M(p′,p″) for all p′ (cancel the ±1 M(p,p′)) — every COLUMN
  constant; κ = p′ requires M(p,p′) = M(p,p″) for all p″ (cancel M(p′,p″)) — every ROW
  constant. Both fail at both fibers (mechanically checked this session: neither table
  is row- or column-constant). Associativity + a single linear functional is a real
  constraint; the Walsh structure resists cheap hosts. This sharpens (does not
  formalize) the scope note's raised no-go prior.

## 3. Nearest-miss / prior-art scan (tasking item b)

Base rows inherited verbatim from 41H §4 (all still load-bearing): Benkart–Pérez-
Izquierdo 1998 (q-composition object level — no realization/host question); the tauceti
Jones/TL/Hecke stack (complete formal Jones polynomial — the would-be host, quoted
verbatim under the H1 §T hygiene gate, nothing consumed); eth `Eight.signs`
(`SecCrossing_Identity.lean:261`, the q = 1 fiber); Kauffman bracket skein calculus
(1988, the ambient algebra of the non-tracial dictionaries); openai-math
`HarmonicArtin.TemperleyLieb` + HoneycombChords dilute-TL (Artin/loop-model shaped, no
sign content); tauceti `FactorSet.ofBimultiplicative` (`FactorSet.lean:571–576`, the
bilinear cousin). Plus the 41H negative-class rows N1 3/5/7/P1/P2 (R9's §NEGATIVE).

**New n ≥ 4-specific rows (this session, direct-source where in-corpus):**

| # | source (exact citation) | what it has | delta vs H3 |
|---|---|---|---|
| 1 | tauceti `TauCeti/Algebra/TemperleyLieb/Basic.lean:48–53` (read 2026-11-20) | the presentation (Rel/e/TemperleyLieb) + base-ring embedding; **the diagram-basis/Catalan-rank structure theorem explicitly NOT proved** — "it is not proved here: it needs the diagram basis, which is a separate construction" | the dim-14 fact is corpus-NONE: no H3 design may consume a corpus dimension theorem; the literal-table host (§4 A14) is forced, self-certified by its relations + classical citation |
| 2 | tauceti `Algebra/TemperleyLieb/{JonesWenzl,QuantumDimension}.lean`; `KnotTheory/TemperleyLieb.lean:116/146` | Jones–Wenzl projectors, quantum dimension [n+1], the generic-n Jones representation `jones : BraidGroup n →* (TemperleyLieb R (jonesDelta a) n)ˣ` | generic-n machinery, no n = 4 dictionary content, no rank/realization obstruction class; stays statement-binder-tier donor (H1 §T convention, no consumption) |
| 2b | **tauceti spin model** — `Algebra/TemperleyLieb/MarkovTrace.lean:153` (`spinGenerator`), `:300` (`spinRep`, the PROVED algebra map TL_n(δ = −(q+q⁻¹)) → M_{2^n}); `Spin/Positive.lean` (negative spin parameter: Hermitian generators, faithful positive weighted trace, tracial on the represented algebra only; "No injectivity of the spin representation is asserted") — surfaced by R9's round-7 battery, cross-relayed 2026-11-20 | the corpus-native host machinery for TARGET-D's dictionary class: explicit integer generator matrices at both closed fibers + the non-tracial functional class (matrix coefficients, K-weighted traces) | the model exists and is proved an algebra map; NOTHING in it poses or answers a sign-family dictionary question — the hunt's use of it (φ_K ∘ spinRep realizing σ-tables) is the new content; the Markov trace itself is Thm-A-excluded (tracial on the image) |
| 3 | TL representation theory (external, classical): Westbury, *The representation theory of the Temperley–Lieb algebras* (1995); Martin, TL structure/cellular algebras; Goodman–Wenzl (order ideals, traces) | the semisimplicity/Gram-determinant story, the degenerate δ = ±2cos(π/k) points, TL₄'s cell structure | owns Q2's ground; H3 cites, never claims; no source poses a sign-family ↔ TL-dictionary question of our shape |
| 4 | Walsh/bent-function/permutation-polynomial literature (external; for §2 P1's mechanism) | Walsh spectra of Boolean functions, algebraic normal forms, cubic permutations of 𝔽₂ⁿ | P1's lemma-shape (cubic-phase matrices with affine row indices are permuted Walsh matrices) is classical in spirit — THE WORDING LOCK: H3 never claims the Walsh lemma; the new content is the two-fiber certification for the Graves/cubic-corrected sign + the realization-obstruction tier |
| 5 | Hadamard/Gram realizability (classical linear algebra) | every nonsingular matrix is a Gram matrix over ℚ in dim = rank (trivial) | our constraint is the HOST ALGEBRA + single functional (associativity; P6) — no classical source poses this constrained-Gram shape (battery-confirmed: no collision) |
| 6 | **Avan, Babelon, Rollet, Talon et al., arXiv:1306.2927** (battery row, folded 2026-11-20) | the Hadamard/TL adjacency at the object level | THE wording-lock owner: never "first Hadamard–TL connection" — TARGET-C/D claims are the two-fiber certification + the realization-obstruction/dictionary tier for the deformed sign family, not a Hadamard–TL first |
| 7 | **Morin-Duchesne et al. — dimer/loop-model representations of TL, dimension d = 2ⁿ⁻¹** (battery row) | a classical family of 2ⁿ⁻¹-dimensional TL representations | at n = 4, d = 8 = EXACTLY the table rank — a dimer-rep dictionary would need the eight word-images to form a BASIS of the 8-dim rep (the borderline case the d ≤ 7 closure leaves open by one step); no source realizes sign families through it |
| 8 | **Eisermann, Pacific J. Math. 231 (2007)** (battery row) | TL/Markov-trace foundation content (per R9's scan) | cited as the classical ground for the trace-foundation tier; no sign-family dictionary or realization obstruction posed |
| 9 | **Pourkia, arXiv:2611.10850** (battery row, 2026) | recent TL-adjacent content (per R9's scan) | nearest-recent neighbor; no collision with the two-fiber obstruction or the dictionary tier per the battery's verdict |

## 4. Statement-level targets (tasking item c) — the H3.lean statement surface, 41H binder style

Zero-sorry rung (Prop-valued defs + #check; the P0 convention), Mathlib-only imports,
the §0 surface copied verbatim-class from `H2.lean` §0 (Block, phiQ, phi1/2/3, tau,
sigmaQ, blocks8, lsum + its five lemmas — the shared substrate, source of record
`pilots/41/H2.lean` sha16 `3bc8170121492d18`). Draft (post-approval first fire
elaborates exactly this skeleton):

```lean
import Mathlib

namespace Pilot41H3

/-- VERBATIM-class H2 §0 surface (Block … lsum lemmas) — copied, not re-derived. -/

/-! ## §1 Theorem C part 1 — the q = +1 fiber certificates (eth's own table) -/

/-- eth's σ = the q = +1 fiber of σ_q (phi = phiQ + tau, `phi_parts : rfl`). -/
def sigmaOne (p q : Block) : ℤ := (-1 : ℤ) ^ (phiQ p q + tau p q)

/-- Certificate C1 (planned kernel decide, the B1 pattern): M₊ rows are orthogonal. -/
theorem sigmaOneOrth_raw : ∀ a b c d e f : Bool,
    lsum blocks8 (fun x => sigmaOne (a, b, c) x * sigmaOne (d, e, f) x)
      = if (a, b, c) = (d, e, f) then (8 : ℤ) else 0 := by decide

/-- Certificate C2 (planned): the q = +1 basis expansion at basis vectors. -/
theorem sigmaOneExpand_basis_raw : ∀ a b c d e f : Bool,
    (8 : ℤ) * evec (a, b, c) (d, e, f)
      = lsum blocks8 (fun p =>
          lsum blocks8 (fun p' => sigmaOne p p' * evec (a, b, c) p') * sigmaOne p (d, e, f))
    := by decide
-- (+ the sigmaOneExpand lifting: H2 §2 verbatim with sigmaRow → sigmaOne.)

/-- The q = +1 traciality witness (planned decide; Thm A's extension witness). -/
theorem sigmaOne_asym_witness :
    sigmaOne (true, false, false) (false, true, false)
      = -sigmaOne (false, true, false) (true, false, false) := by decide

/-! ## §2 Theorem C part 2 — the strand-free rank no-go (H2's Thm B with 5 → 7) -/

def idx7 : List (Fin 7) := [0, 1, 2, 3, 4, 5, 6]

/-- The d ≤ 7 no-go at q = −1 (H2 proof verbatim, idx5 → idx7; hdep = EnclOK binder,
    satisfiable by pigeonhole 8 > 7 — the note, not the proof obligation). -/
theorem no_realization_dim7 (C : Block → Fin 7 → ℤ) (Φ : Fin 7 → Fin 7 → ℤ)
    (v : Block → ℤ) (hv : v ≠ 0)
    (hdep : ∀ j, lsum blocks8 (fun p => C p j * v p) = 0)
    (hreal : ∀ p p' : Block,
      sigmaRow p p' = lsum idx7 (fun i => lsum idx7 (fun j => C p i * Φ i j * C p' j))) :
    False := by
  -- H2's rank_obstruction_nogo body, idx5 → idx7, sigmaRow unchanged.
  sorry  -- PROBE-CLASS MARKER: statement tier only; fires replace this per §5 pricing

/-- The d ≤ 7 no-go at q = +1 (same proof, sigmaRow → sigmaOne). -/
theorem no_realization_dim7_one : … := sorry  -- same marker convention

/-! ## §3 The 14-dim literal host (the A14 surface) + the dictionary targets -/

/-- TL₄(−2) as literal data: Fin 14 carriers, generator indices, a literal structure-
    constant table mulTab : Fin 14 → Fin 14 → Fin 14 → ℤ (196 products, the §5 M-cost),
    NONCOMPUTABLE up-front (Polynomial-adjacent data precedent Gq :117). -/
noncomputable def mulTab : Fin 14 → Fin 14 → Fin 14 → ℤ := fun i j k => …  -- literals

/-- The host algebra from the table (Mul-style structure or def-level ops; the design
    keeps everything decide-reachable: products reduce by the literal table). -/

/-- SELF-CERTIFICATION (the design's honesty gate): the literal table satisfies the
    TL₄ presentation at δ = −2 — each a kernel decide over small integer sums. -/
def TL4RelationsHold : Prop :=
  (∀ i : Fin 3, … e_i * e_i = (-2 : ℤ) • e_i) ∧ (… e₁ * e₃ = e₃ * e₁ …)
    ∧ (… e₁ * e₂ * e₁ = e₁ …) ∧ (… e₂ * e₃ * e₂ = e₂ …)
-- discharged by decide per relation (planned); the identification with the classical
-- TL₄(−2) diagram algebra is a CITATION (§3 row 3), never an in-file claim.

/-- H4-DICT-−1 as a Prop binder (EnclOK: the words and functional are explicit). -/
def TL4Realizability : Prop :=
  ∃ (w : Block → Fin 14) (φ : Fin 14 → ℤ),
    ∀ p p' : Block,
      lsum idx14 (fun k => φ k * mulTab (w p) (w p') k) = sigmaRow p p'

/-! ## §3b The spin host (the corpus-native lead, R9-flagged): literal generator
    matrices for `Fin 4 → Bool` configs at the integer fibers — cup/cap ∈ {±1}; four
    sparse 16×16 integer matrices as literal data; the TL relations over the literals
    decide-certified (the same self-certification pattern, SMALLER data than the 196-
    product diagram table); identification with tauceti `spinRep` (MarkovTrace.lean:153/
    :300) is CITATION-level at statement tier — actual import = the L-rung + the
    donor-hygiene triad on tauceti's pin FIRST (the standing no-consumption rule). -/

/-- The spin dictionary class: words via generators, functional = tr(K ·) on the
    16-config matrix space (K outside the commutant — non-tracial; matrix coefficients
    are the K = E_{s,t} instances). -/
def SpinRealizability (M : Block → Block → ℤ) : Prop :=
  ∃ (words : Block → List (Fin 3)) (K : (Fin 4 → Bool) → (Fin 4 → Bool) → ℤ),
    ∀ p p' : Block,
      lsum cfg16 (fun s => lsum cfg16 (fun t =>
        K s t * spinWord (words p ++ words p') s t)) = M p p'
-- spinWord : generator-literal products, hand-computed + decide-certified per §5 M.

/-- NEG-H4-bounded at L = 3 (the reportable third obstruction, statement shape). -/
def NoDictWords3 : Prop := ¬ TL4RealizabilityWith (words := enumeratedWordsLen3)

/-! ## §4 The genericity rider (statement tier; L-rung proof) -/
def detM_ne_zero : Prop := (detMpoly : Polynomial ℤ) ≠ 0  -- detMpoly : the det of the
    -- σ_q-table over ℤ[q]; nonzero because detMpoly.eval (-1) = ±8^4 (H2 certificates
    -- + eval/det commutation); degree ≤ 24 ⇒ ≤ 24 bad fibers.

end Pilot41H3
```

Binder-style notes: every no-go keeps H2's exact binder triple (C, Φ, v, hv, hdep,
hreal); every conditional keeps the EnclOK hypothesis-binder discipline; the `sorry`
markers above are the PROBE-CLASS convention (statement tier only, never fired in this
form — the fired H3 replaces them per the pricing; a statement-only file without the
theorem bodies is the zero-sorry alternative rung if the orchestrator prefers).

## 5. Cost pricing (tasking item d) — LoC + runs at SPEC

Route (post-approval): the established pilot-41 Modal line — doz CLI
`/home/doz/dozenv/bin/modal`, profile semraker, warm app `crossmath-probe`, stage
`/tmp/crossmath-41-stage/` (world-readable, chmod a+rX, discard after), SPEC
cpu=2.0 / memory=4096, `LEAN_NUM_THREADS=2`, telemetry in-log, log persisted to
`pilots/41/logs/h3-runN.log` with provenance header. H2 wall profile: 36–77 s warm;
the A14-table decides are the only minutes-scale risk.

| tranche | content | LoC | runs | risk |
|---|---|---|---|---|
| S (first fire) | §4 §1–§2 only: the q = +1 certificates (C1/C2 + lifting + witness) + the d ≤ 7 no-go port (both fibers) + #check skeleton for §3 | 0.35–0.55k | 3–5 | low — every decide is the B1/B2 shape; the port is mechanical (idx5→idx7); one fix-loop budgeted (h2-run10's congr class, lesson recorded) |
| M (search tier, own GO) | **the spin host (lead, §4 §3b)**: four generator-matrix literals at the integer fiber + decide-certified TL relations over them + word enumeration ≤ L = 3 + the 64-equation decide checker (certificate-only), candidates from the §2 P5 ansatz (K-class: sparse K, matrix coefficients, small-support combinations); fallback = the A14 literal diagram table (§4 §3, 196 products — heavier data, same self-certification pattern) | +0.3–0.5k | +2–4 | **the linear-solve step (K given words) is NOT decide-class**: mitigation = paper-level pre-solve (the spin ansatz makes this concrete: rank-one/sparse K families turn the 64 equations into small systems checkable by hand + decide), certificate-only checking in Lean; if no ansatz lands, in-Lean solving is an L-trigger, never silently attempted |
| L (fresh-ruling triggers) | the det-polynomial genericity lemma (eval/det commutation, Polynomial.map machinery); word length ≥ 5; any tauceti actual-import route (spinRep or diagram basis as real dependencies — requires a tauceti-olean-capable image (the G-series layer pattern) AND the donor-hygiene triad on tauceti's pin FIRST; the no-dim-theorem finding §3 row 1 keeps the diagram-basis route priced out) | fresh | fresh | ruling per the preflight precedent |

Headline (matching the scope note's shape): **S+M ≈ 0.5–0.9k LoC, 5–9 runs** at SPEC,
one file `pilots/41/H3.lean` + this precharter's record successor. Cumulative-cap
discipline per the promotion-ruling precedent: state the cap at charter (proposed:
≤ 1.2k LoC / ≤ 10 runs for S+M combined; STOP-at-cap + re-price checkpoint after S).

## 6. Named targets (tasking item e)

- **TARGET-C (negative-shape, near-certain landable) — Theorem C, the two-fiber
  strand-free rank closure.** *Both closed fibers of σ_q — the deformed q = −1 table
  AND eth's own q = +1 table σ — are permuted Walsh character tables of (𝔽₂)³ (affine
  index bijections b = cumsum and a₊ = b + c), kernel-decided; consequently NO
  d ≤ 7-dimensional linear-functional realization exists at either fiber; every TL
  host needs n ≥ 4 with eight words spanning ≥ 8 dimensions — outside every
  two-generator subalgebra (dims 4 and 5) — under a necessarily non-tracial
  functional.* This extends 41H Thm B from (q = −1, d = 5) to (q ∈ {−1,+1}, d ≤ 7),
  covers eth's own table, and is the third-obstruction-class finding the scope note
  pre-ruled reportable. Billing: 41H-lineage negative extension, register locked
  ("elementary certificates, nonelementary closure"); article-grade only per an
  orchestrator ruling (41H successor file or a section — the H-committed decision).
- **TARGET-D (discovery-grade hunt, honest raised-negative prior) — Theorem D, the
  TL₄ dictionary (H4-DICT-−1 / H4-DICT-spin, or the Jones upgrade).** Eight explicit
  words + φ — via the spin host (lead: w_p generator words, φ = tr(K·spinRep(·)) or a
  matrix coefficient, K outside the commutant) or the A14 literal diagram host — with
  64 decide-checked equations. If found: the (H) program's positive resurrection at
  n = 4 (a DISCOVERY — the host exists, non-tracial, and the H1 transports then apply
  verbatim to it). If the bounded search misses: the NEG-H4-bounded negative at L = 3
  (reportable, third obstruction — scoped to the host searched: the spin host per
  P5's no-injectivity caveat, the A14 host per its literal-table identification). The
  P6 rigidity heuristics keep the prior negative-leaning; the P5 spin ansatz (integer
  matrices at both closed fibers, non-tracial functional class native) keeps it live
  and now corpus-anchored.

## 7. GO/NO-GO + descope ladder + non-claims

- **GO to S — SATISFIED at this file's close** (the battery returned §8: novelty
  cleared; S-rung fire approval granted in principle — the fire order issues on this
  final sha's report): fires begin with the §4 §1–§2 file. **GO to M** = S GREEN + a
  paper-level candidate class identified (P5 ansatz or explicit enumeration list) +
  re-price checkpoint passed.
- **Descopes (pre-negotiated):** (1) M unaffordable ⇒ S alone banks Theorem C (the
  two-fiber closure + necessity corridor — a complete, honest close of the n ≥ 4
  *question's obstruction tier*); (2) the q = +1 certificates stall (unexpected — B1's
  shape) ⇒ ship the q = −1 port only + the P1 hand table as hypothesis; (3) A14
  self-certification fails at a relation ⇒ the table is WRONG DATA, fix-and-refire
  (never silently weaken the relations); (4) dictionary found only over ℚ (fractional
  φ) ⇒ report as the ℚ-dictionary finding + the integrality question stated open.
- **NO-GO:** the battery-collision branch is DEAD (round-7 `87659f58`: no collisions —
  TARGET-C/D both NEW-narrow); remaining NO-GO: the orchestrator prefers banking 41H
  as-is (then this precharter is the deferral record — the scope note's alternative
  close already shipped, zero further runs needed). **Post-battery state: S-rung fire
  approval GRANTED IN PRINCIPLE (coordinator, 2026-11-20) — the fire order issues when
  this final sha + the battery fold are reported together (done, this file); M stays
  behind its own GO per §7's first bullet.**
- **Non-claims:** no proof claims (P1–P6 are hypotheses until decided); no Walsh-
  lemma priority (§3 row 4 lock); no TL₄-identification claim in-file (§3 row 1);
  no article-eligibility claim; no runs fired by this unit.

## 8. R9 round-7 battery inputs (the write-first dependency, honored) — ANSWERED

Scan directions posed for the battery on this file: (i) TARGET-C's class — does any
source certify nonsingularity/Walsh structure of cubic-phase sign tables AND draw a
finite-dimensional realization obstruction (the two-fiber + d ≤ 7 shape)? (ii) TARGET-D's
class — sign-family ↔ TL₄/diagram-algebra dictionaries at degenerate δ = ±2 (the
mathematical-physics collision risk the dossier already flagged, now n-specific); (iii)
§3 row 4's mechanism — cubic permutations of 𝔽₂³ + Walsh readings (bent/ANF literature;
the wording lock depends on this scan); (iv) §3 row 5's shape — "constrained Gram
realizability" (host algebra + single functional) anywhere; (v) the corpus re-check —
tauceti/openai-math/mathlib for any n = 4 TL structure-constant or dimension content
(§3 row 1's finding re-verified at battery time).

**Battery verdict (R9 round-7, `87659f58`, relayed 2026-11-20; folded into §0/§3/§7
above): (i) TARGET-C NEW-narrow; (ii) TARGET-D NEW-narrow; (iii) mechanism classical in
spirit — the lock holds (§3 row 4); (iv) no collision; (v) dim-14 COVERED-classically +
corpus-NONE (row 1 confirmed at source). Five §3-table deltas folded (rows 2b, 6–9) and
three wording locks adopted (§0). The P4 genericity rider graded NEW-narrow
method-grade (one certified fiber suffices). Headline wording for C/D drafts ONLY
through the battery rows + the orchestrator's rulings — never direct from this file.

— lane R4 (worktree agent-08), 2026-11-20. Sources this session: 41H article +
H-record + H1/H2/Core.lean + dossier 41 (all on main, read-only); tauceti
`Algebra/TemperleyLieb/Basic.lean` + `MarkovTrace.lean` (spin model, :153/:300) +
`Spin/Positive.lean` + `KnotTheory/TemperleyLieb.lean` (all direct-source, read-only);
`round6-41-battery.md` §NEGATIVE; R9's round-7 verdict `87659f58` (relayed);
`qa/iter4-review/a6-41-p0-precharter.md` (format template); `H-preflight.md`
(tranche-planning template). No Modal runs fired.
