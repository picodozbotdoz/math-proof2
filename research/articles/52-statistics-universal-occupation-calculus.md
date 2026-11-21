# A Statistics-Universal Creation–Annihilation Calculus and the Fermionic Dual-Family Theorem

*kind: TECHNICAL-RECORD — axiomatization + ε-universal dual-family lemma, formal-first
(TEMPLATE-iter4 §0 kept set) · date: 2026-11-09 · revised: 2026-11-21 (external referee
report applied) · supersedes: none · artifacts: `research/pilots/52/M1.lean`,
`research/pilots/52/logs/m1-run14-green.log`,
`research/pilots/52/logs/axcheck-final.log`*

| theorem | status | hypotheses | evidence |
|---|---|---|---|
| Thm 1 `OccupationPair.dual_family` (ε-universal dual family) | PROVED-UNCONDITIONAL | none beyond the `OccupationPair` definition-of-subject | `pilots/52/logs/axcheck-final.log:843` — `[propext, Quot.sound]` (not even choice) |
| Thm 2 `OccupationPair.annih_outside` (orthogonality half) | PROVED-UNCONDITIONAL | none (as Thm 1) | `axcheck-final.log:850` — `[propext, Quot.sound]` |
| Thm 3 `OccupationPair.sign_transposition` | PROVED-UNCONDITIONAL | none (as Thm 1) | `axcheck-final.log:844` — `[propext, Quot.sound]` |
| Thm 4 `OccupationPair.fermionic_create_sq` (Pauli principle) | PROVED-UNCONDITIONAL | hypothesis `h2 : (1 : K) + 1 ≠ 0` — the base field has characteristic ≠ 2 (statement antecedent, not an open condition) | `axcheck-final.log:856` — `[propext, Classical.choice, Quot.sound]` |
| Thm 5 `fermionicPair` (exterior-algebra instance) | PROVED-UNCONDITIONAL | none (mathlib `ExteriorAlgebra ℂ (Fin n → ℂ)`) | `axcheck-final.log:845` — `[propext, Classical.choice, Quot.sound]` |

Substrate: mathlib `ff2494ea`, Lean v4.36.0-rc2; no `sorry`, no `native_decide` anywhere
in the artifact.

---

## Abstract

Do the creation/annihilation layers of four Lean corpora — eth's weighted bosonic
operators, openai-math's CAR layer, tauceti's CAR/Fock layer for gl(n), mathlib's exterior
and Clifford algebras — share one structure? We axiomatize it as
an *occupation pair*: creation/annihilation endomorphisms c_i, a_i of an R-module with
statistics sign ε ∈ R satisfying c_ic_j = ε c_jc_i, a_ia_j = ε a_ja_i, a_ic_i = 1 + ε c_ia_i,
a_ic_j = ε c_ja_i (i ≠ j), and a vacuum killed by every a_i. Theorem 1 (PROVED-UNCONDITIONAL,
Lean/mathlib `ff2494ea`): for every duplicate-free word t and every x with a_j x = 0 for all
j ∈ t, a_t(c_{t^rev} x) = x — proved once, without case distinction on ε. Specializations
give the fermionic dual family and the sign-transposition law a_{[i,j]}(c_{[i,j]} vac) = ε·vac.
The Pauli principle c_ic_i = 0 is proved (PROVED-UNCONDITIONAL) over any field of
characteristic ≠ 2; it can fail on 2-torsion modules (explicit (ℤ/2)² example) and in
characteristic 2. An instance on mathlib's `ExteriorAlgebra ℂ (Fin n → ℂ)` realizes it with
all five relation fields proved (PROVED-UNCONDITIONAL). The abstraction and the
ε-uniform proof are new within these four corpora; nearest prior work: classical CCR/CAR
theory, its q-deformations, eth's weighted bosonic `LemmaDual`.

## 1. Introduction

The corpus's cross-project connection notes (`research/bridges/tensor-algebra.md`,
Fock/Heisenberg ↔ Hall) recorded the same algebraic pattern — "an annihilation monomial is
a left inverse of the reversed creation monomial on the vacuum" — proved separately in a
bosonic, weighted form (eth `LemmaDual`, `AppHalfPiecesStatement.lean:175`) and implicit in
fermionic Fock space constructions (openai-math
`lean/OAI/Analysis/Laughlin/Operators/CAR.lean`; tauceti
`TauCeti/Algebra/Lie/GeneralLinear/CAR/`). The point of this article is that the pattern is
*statistics-free*: the proof uses the mixed relations only to slide an annihilator past
creators of other modes, and the sign it collects cancels between the two slides.

The mathematics is elementary; the contribution is the right axiomatization, the
ε-uniform proof, the Pauli principle's field-level scope with explicit failure examples,
and a verified instance on mathlib's exterior algebra that ties the openai CAR base to a
mathlib object.

## 2. Setting and notation

Let R be a commutative ring, M an R-module, ι a type with decidable equality, ε ∈ R.

**Definition (occupation pair).** An `OccupationPair R M ε ι` consists of linear maps
c_i, a_i : M →ₗ[R] M (i ∈ ι) and a vector vac ∈ M with

  (cc) c_ic_j = ε·c_jc_i,  (aa) a_ia_j = ε·a_ja_i,
  (ac_self) a_ic_i = 1 + ε·c_ia_i,  (ac_ne) a_ic_j = ε·c_ja_i (i ≠ j),
  (avac) a_i vac = 0.

(In the Lean structure `OccupationPair`, `M1.lean:37–46`, these five relations are the
propositional fields, besides the data fields `c`, `a`, `vac`.) ε = −1 is the fermionic
(CAR) case, ε = +1 the unweighted bosonic case. For a word w = [w₁, …, w_k] put
c_w = c_{w₁}⋯c_{w_k} and a_w = a_{w₁}⋯a_{w_k}.

## 3. Main results

**Theorem 1 (ε-universal dual family).** If t is duplicate-free and a_j x = 0 for all j ∈ t,
then a_t(c_{t^rev} x) = x.

**Theorem 2 (orthogonality half).** If i ∉ w and a_i x = 0 then a_i(c_w x) = 0 (slide a_i
past each creator with (ac_ne)); in particular a_i c_w vac = 0.

**Theorem 3 (sign transposition).** For i ≠ j, a_{[i,j]}(c_{[i,j]} vac) = ε·vac.

**Theorem 4 (Pauli principle).** Let K be a field of characteristic ≠ 2 (the Lean
declaration carries the hypothesis `h2 : (1 : K) + 1 ≠ 0`), M a K-vector space and ε = −1.
Then c_i c_i = 0 for every mode i. *Remark (elementary, unformalized).* The argument uses
only that 2 acts injectively on the module; the kernel theorem is the field-level
implication above. On modules with 2-torsion the conclusion can fail: over R = ℤ acting on
M = (ℤ/2)², with a single mode, c = [[0,1],[1,0]], a = [[0,1],[0,0]], vac = e₁ (standard
basis) satisfy all five relations with ε = −1 — (ac_self) reads ac + ca = I, and indeed
ac = E₁₁, ca = E₂₂ (elementary matrices) — while c² = I ≠ 0. The same matrices over 𝔽₂
give the characteristic-2 failure (there ε = −1 = +1). On ℤ/2 itself no occupation pair
exists at all (End_ℤ(ℤ/2) ≅ ℤ/2 is commutative, so (ac_self) would force 2·(ac) = 1;
§7).

**Theorem 5 (fermionic instance).** On the exterior algebra Λ(ℂⁿ) (mathlib
`ExteriorAlgebra ℂ (Fin n → ℂ)`), left multiplication by the basis vector e_i and
contraction against the dual basis vector form an `OccupationPair ℂ Λ(ℂⁿ) (−1) (Fin n)`
with vacuum 1.

The ε-specialized forms `fermionic_dual_family_vac`, `fermionic_sign_transposition`,
`fermionic_annih_outside` and the ε = +1 case `bosonic_unweighted` are proved with axioms
`[propext, Quot.sound]` (`axcheck-final.log:853–855, 857`).

## 4. Novelty and nearest misses

| prior work (exact citation) | what it proves | why this differs |
|---|---|---|
| classical CCR/CAR and its q-deformations: P. Jordan, E. Wigner, "Über das Paulische Äquivalenzverbot", Z. Phys. 47 (1928) 631–651; O. Bratteli, D. W. Robinson, *Operator Algebras and Quantum Statistical Mechanics*, vol. 2, 2nd ed., Springer, 1997, §5.2 (the CCR/CAR algebras); O. W. Greenberg, "Example of infinite statistics" (the quon algebra), Phys. Rev. Lett. 64 (1990) 705–708; M. Bożejko, R. Speicher, "An example of a generalized Brownian motion" (q-commutation relations), Commun. Math. Phys. 137 (1991) 519–531 | the (anti)commutation relations and their ε = q interpolations | the relations are classical; the ε-universal dual-family statement for an abstract occupation pair, proved once without case distinction, is the axiomatization's content — no new physics claimed |
| eth `LemmaDual` (`AppHalfPiecesStatement.lean:175`) | the *weighted* bosonic analogue, partition-indexed families, z_μ normalization | the weighted layer is §7's open extension; the unweighted ε-uniform form is what is proved here |
| the four corpora: `rg -rl "OccupationPair|occupation pair"` over all sibling trees found only openai-math `lean/OAI/Analysis/CoulombIonization/Fermionic/OccupationPairDensity.lean` — a fermion *density* object, not the CCR axiomatization (`research/qa/iter4-review/r2-discovery-strength.md` §5 q8); physlib `ExchangeSign` (`FieldStatistics/ExchangeSign.lean`: `exchangeSign : FieldStatistic →* FieldStatistic →* ℂ`) | no occupation-pair axiomatization in any corpus; physlib takes the exchange-sign layer only | `ExchangeSign` lives in leanprover-community/physlib — the same repository that AxiomMath/AreaLaw2D vendors at the older rev `a50684a1`; it was first recorded by this corpus at the 2026-11-13 master scan (`pushed_at` 2026-11-13T16:16:11Z; `research/novelty/physlib-surface.md`), so whether the file predates this article's 2026-11-09 record is not established — the nearest-neighbor status is scan-dated. The occupation-pair axioms remain unclaimed elsewhere |

Scope statement. Technical-record billing (kind: TECHNICAL-RECORD): the contribution is
the right abstraction and the ε-uniform proof, not difficulty. The novelty record is the
four-corpora absence check (`r2-discovery-strength.md` §5 q8) and the physlib
nearest-neighbor survey (`novelty/physlib-surface.md`).

## 5. Proofs

**Theorem 1.** Induct on t. For t = i :: t' (so i ∉ t' and t' is duplicate-free),
c_{t^rev} x = c_{t'^rev}(c_i x) and a_t = a_i·a_{t'}. The vector y = c_i x is killed by every
annihilator of t': for j ∈ t', j ≠ i, so (ac_ne) gives a_j c_i x = ε·c_i a_j x = 0. The
induction hypothesis applied to y gives a_{t'}(c_{t'^rev} y) = y, hence
a_t(c_{t^rev} x) = a_i(c_i x) = x + ε·c_i(a_i x) = x by (ac_self) and a_i x = 0. No step
depends on the value of ε. ∎

**Theorem 2.** Induct on w. For w = j :: w', a_i(c_w x) = a_i(c_j(c_{w'} x)) =
ε·c_j(a_i(c_{w'} x)) by (ac_ne) (i ≠ j), and the induction hypothesis gives a_i(c_{w'} x) = 0;
so a_i(c_w x) = 0. Instantiating x = vac (a_i vac = 0 by (avac)) gives a_i c_w vac = 0. ∎

**Theorem 3.** By (cc), c_{[i,j]} = ε·c_{[j,i]}; Theorem 1 with t = [i, j] gives
a_{[i,j]} c_{[j,i]} vac = vac; hence a_{[i,j]}(c_{[i,j]} vac) = a_{[i,j]}(ε·c_{[j,i]} vac) =
ε·vac. ∎

**Theorem 4.** From (cc) at i = j with ε = −1: c_ic_i = −c_ic_i, so 2·(c_ic_i x) = 0 for
all x. If K has characteristic ≠ 2 (the hypothesis `h2 : 1 + 1 ≠ 0`), 2 is invertible and
this forces c_ic_i = 0; the Lean proof divides by 1 + 1. The failure examples in §3's
remark are elementary and unformalized. ∎

**Theorem 5.** The five relations reduce to the contraction calculus of `CliffordAlgebra`
(`contractLeft_ι_mul` :123, `contractLeft_comm` :198, `contractLeft_one` :176 in
`Mathlib/LinearAlgebra/CliffordAlgebra/Contraction.lean`), since
`ExteriorAlgebra R M` is by definition `CliffordAlgebra (0 : QuadraticForm R M)`. ∎

## 6. Formal record

All declarations in namespace `CrossMath.Pilot52`, file `research/pilots/52/M1.lean`
(292 lines); axiom prints from the final-sweep axiom audit (the corpus-wide `#print axioms`
audit; 29/29 files OK, 0 sorryAx — `axcheck-final.log:1`).

| theorem | Lean declaration | file:line | axioms | log path:line |
|---|---|---|---|---|
| Theorem 1 | `OccupationPair.dual_family` | `research/pilots/52/M1.lean:105` | `[propext, Quot.sound]` | `research/pilots/52/logs/axcheck-final.log:843` |
| Theorem 2 | `OccupationPair.annih_outside` | `research/pilots/52/M1.lean:91` | `[propext, Quot.sound]` | `research/pilots/52/logs/axcheck-final.log:850` |
| Theorem 3 | `OccupationPair.sign_transposition` | `research/pilots/52/M1.lean:124` | `[propext, Quot.sound]` | `research/pilots/52/logs/axcheck-final.log:844` |
| Theorem 4 | `OccupationPair.fermionic_create_sq` | `research/pilots/52/M1.lean:159` | `[propext, Classical.choice, Quot.sound]` | `research/pilots/52/logs/axcheck-final.log:856` |
| Theorem 5 | `fermionicPair` | `research/pilots/52/M1.lean:230` | `[propext, Classical.choice, Quot.sound]` | `research/pilots/52/logs/axcheck-final.log:845` |

## 7. Limitations and open problems

- **Weighted layer.** eth's bosonic `LemmaDual` needs mixed weights w_k = k
  (a_ic_i = w_i + ε c_ia_i), multiset/partition indexing, the z_μ = ∏ k^{m_k} m_k!
  normalization and the sign-twisted families aFam (`AppHalfPiecesStatement.lean:166–174`).
  A weighted `OccupationPair` would let the eth lemma be re-derived and compared with
  article 30's Hall identification.
- **Dictionary with tauceti's CAR** (occupation projections ↔ our weights) is open.
- The axioms are instantiated here only for ε = −1 (and stated for ε = +1); which other
  values of ε admit nontrivial models with a vacuum is not studied.
- **Existence of pairs and the module-level Pauli boundary are open.** The kernel theorem
  covers fields of characteristic ≠ 2. On ℤ/2 no occupation pair exists (§3, Theorem 4
  remark), while (ℤ/2)² does; which 2-torsion modules admit occupation pairs, and exactly
  when the conclusion c_ic_i = 0 holds on them, is not studied.

## 8. Prior work and references

Literature:

- P. Jordan, E. Wigner, "Über das Paulische Äquivalenzverbot", Z. Phys. 47 (1928) 631–651.
- O. Bratteli, D. W. Robinson, *Operator Algebras and Quantum Statistical Mechanics*,
  vol. 2, 2nd ed., Springer, 1997; §5.2 (the CCR/CAR algebras).
- O. W. Greenberg, "Example of infinite statistics" (the quon algebra), Phys. Rev. Lett.
  64 (1990) 705–708.
- M. Bożejko, R. Speicher, "An example of a generalized Brownian motion" (q-commutation
  relations), Commun. Math. Phys. 137 (1991) 519–531.

Project artifacts:

- mathlib at the substrate pin `ff2494ea`:
  `Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean:60`,
  `Mathlib/LinearAlgebra/CliffordAlgebra/Contraction.lean:123,176,198`.
- anthropics_formal-math: `eth/proof/statements/AppHalfPiecesStatement.lean:166–175`.
- openai-math: `lean/OAI/Analysis/Laughlin/Operators/CAR.lean:15–21`.
- tauceti: `TauCeti/Algebra/Lie/GeneralLinear/CAR/`.
- this record: `research/pilots/52/M1.lean`, `research/pilots/52/logs/m1-run14-green.log`,
  `research/pilots/52/logs/axcheck-final.log`, `research/pilots/52-blueprint.md`,
  `research/candidates/52-unified-ccr-fock-layer.md`,
  `research/qa/iter4-review/r2-discovery-strength.md` (§5 q8),
  `research/novelty/physlib-surface.md`.
