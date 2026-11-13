# A Statistics-Universal Creation–Annihilation Calculus and the Fermionic Dual-Family Theorem

*cross-math-fronttier research article 52 · 2026-11-09 · dossier
`research/candidates/52-unified-ccr-fock-layer.md` · Lean pilot `research/pilots/52/M1.lean` ·
blueprint `research/pilots/52-blueprint.md`*

**Status: PROVED, unconditional, kernel-verified** (mathlib `ff2494ea`, Lean `v4.36.0-rc2`;
`dual_family` and `sign_transposition` use only `[propext, Quot.sound]` — not even choice;
the concrete fermionic instance uses `[propext, Classical.choice, Quot.sound]`; no `sorry`,
no `native_decide`).

---

## Abstract

Four Lean corpora contain creation/annihilation layers: eth's bosonic operators
(∇_{±k}, with a weighted dual-family lemma), openai-math's CAR layer for Laughlin states,
tauceti's CAR/Fock layer for gl(n), and mathlib's exterior and Clifford algebras. None
states the common structure. We axiomatize it as an *occupation pair* with the statistics
sign ε as a parameter — creation/annihilation endomorphisms c_i, a_i of an R-module with
c_ic_j = ε c_jc_i, a_ia_j = ε a_ja_i, a_ic_i = 1 + ε c_ia_i, a_ic_j = ε c_ja_i (i ≠ j), and a
vacuum killed by all a_i — and prove, once and without case distinction on ε, the
**dual-family theorem**: for every duplicate-free word t and every x killed by the
annihilators of t, a_{t}·c_{t^rev}·x = x. Specializations give the fermionic dual family, a
sign-transposition law (the transposed two-mode contraction of the vacuum is ε·vac) and
the Pauli principle, which we show holds exactly when 2 is not a zero divisor on the module
(it fails in characteristic 2 and on 2-torsion). A concrete fermionic instance on mathlib's
`ExteriorAlgebra` (= `CliffordAlgebra 0`) is constructed with all six axioms proved.

## 1. Introduction

The bridge maps (`research/bridges/tensor-algebra.md`, Fock/Heisenberg ↔ Hall) found the
same algebraic pattern — "an annihilation monomial is a left inverse of the reversed
creation monomial on the vacuum" — proved separately in a bosonic, weighted form (eth
`LemmaDual`, `AppHalfPiecesStatement.lean:175`) and implicit in fermionic Fock space
constructions (openai-math `OAI/Analysis/Laughlin/Operators/CAR.lean`; tauceti
`TauCeti/Algebra/Lie/GeneralLinear/CAR/`). The point of this article is that the pattern is
*statistics-free*: the proof uses the mixed relations only to slide an annihilator past
creators of other modes, and the sign it collects cancels between the two slides.

The mathematics is elementary; the contribution is the right axiomatization, the
ε-uniform proof, the exact boundary of the Pauli principle, and a verified instance on
mathlib's exterior algebra that ties the openai CAR base to a mathlib object.

## 2. Definition

Let R be a commutative ring, M an R-module, ι a type with decidable equality, ε ∈ R.

**Definition (occupation pair).** An `OccupationPair R M ε ι` consists of linear maps
c_i, a_i : M → M (i ∈ ι) and a vector vac ∈ M with

  (cc) c_ic_j = ε·c_jc_i,  (aa) a_ia_j = ε·a_ja_i,
  (ac_self) a_ic_i = 1 + ε·c_ia_i,  (ac_ne) a_ic_j = ε·c_ja_i (i ≠ j),
  (avac) a_i vac = 0.

ε = −1 is the fermionic (CAR) case, ε = +1 the unweighted bosonic case. For a word
w = [w₁, …, w_k] put c_w = c_{w₁}⋯c_{w_k} and a_w = a_{w₁}⋯a_{w_k}.

## 3. Results

**Theorem 1 (ε-universal dual family).** If t is duplicate-free and a_j x = 0 for all j ∈ t,
then a_t(c_{t^rev} x) = x.

**Theorem 2 (orthogonality half).** If i ∉ w and a_i x = 0 then a_i(c_w x) = 0 (slide a_i
past each creator with (ac_ne)); in particular a_i c_w vac = 0.

**Theorem 3 (sign transposition).** For i ≠ j, a_{[i,j]}(c_{[i,j]} vac) = ε·vac.

**Theorem 4 (Pauli principle, exact form).** Let K be a field, M a K-vector space and
ε = −1. If 1 + 1 ≠ 0 in K, then c_i c_i = 0. Over a general commutative ring the conclusion
can fail on modules with 2-torsion, and in characteristic 2 it fails outright (ε = −1 = +1).

**Theorem 5 (fermionic instance).** On the exterior algebra Λ(ℂⁿ) (mathlib
`ExteriorAlgebra ℂ (Fin n → ℂ)`), left multiplication by the basis vector e_i and
contraction against the dual basis vector form an `OccupationPair ℂ Λ(ℂⁿ) (−1) (Fin n)`
with vacuum 1.

## 4. Proofs

**Theorem 1.** Induct on t. For t = i :: t' (so i ∉ t' and t' is duplicate-free),
c_{t^rev} x = c_{t'^rev}(c_i x) and a_t = a_i·a_{t'}. The vector y = c_i x is killed by every
annihilator of t': for j ∈ t', j ≠ i, so (ac_ne) gives a_j c_i x = ε·c_i a_j x = 0. The
induction hypothesis applied to y gives a_{t'}(c_{t'^rev} y) = y, hence
a_t(c_{t^rev} x) = a_i(c_i x) = x + ε·c_i(a_i x) = x by (ac_self) and a_i x = 0. No step
depends on the value of ε. ∎

**Theorem 3.** By (cc), c_{[i,j]} = ε c_{[j,i]}; Theorem 1 with t = [i, j] gives
a_{[i,j]} c_{[j,i]} vac = vac. ∎

**Theorem 4.** From (cc) at i = j with ε = −1: c_ic_i = −c_ic_i, so 2·c_ic_i x = 0 for all x.
If 2 is invertible this forces c_ic_i = 0. Over ℤ acting on ℤ/2, or over 𝔽₂, the relation
c_ic_i = −c_ic_i is vacuous and c_ic_i ≠ 0 is consistent. ∎

**Theorem 5.** The six axioms reduce to the contraction calculus of `CliffordAlgebra`
(`contractLeft_ι_mul` :123, `contractLeft_comm` :198, `contractLeft_one` :176 in
`Mathlib/LinearAlgebra/CliffordAlgebra/Contraction.lean`), since
`ExteriorAlgebra R M` is by definition `CliffordAlgebra (0 : QuadraticForm R M)`. ∎

## 5. Formal verification

| statement | Lean (`CrossMath.Pilot52`, `research/pilots/52/M1.lean`, 294 LoC) |
|---|---|
| definition | `OccupationPair`, `OccupationPair.cW`, `.aW` |
| slides | `cW_append`, `cW_swap_pair`, `slide_ne`, `slide_self` |
| Theorem 1 | `OccupationPair.dual_family` (axioms `[propext, Quot.sound]`) |
| Theorem 2 | `OccupationPair.annih_outside`, `fermionic_annih_outside` |
| Theorem 3 | `OccupationPair.sign_transposition`, `fermionic_sign_transposition` |
| Theorem 4 | `OccupationPair.fermionic_create_sq` (hypothesis `1 + 1 ≠ 0`) |
| bosonic fragment | `bosonic_unweighted` (ε = +1, weight 1) |
| Theorem 5 | `fermionicPair n : OccupationPair ℂ (Sp n) (-1) (Fin n)`, 6/6 fields proved |

Final run `research/pilots/52/logs/m1-run14-green.log` (0 errors, 0 sorry); final-sweep
axcheck `research/pilots/52/logs/axcheck-final.log` (15 axiom lines, 0 sorryAx). An interim
"definitional-equality blocker" reported mid-pilot was retracted: it was an unreduced
scalar coefficient in a hand-rolled `simp only` list.

## 6. Relation to prior work

Canonical (anti)commutation relations are classical (Jordan–Wigner; Bratteli–Robinson,
vol. 2); "q-commutation" interpolations (ε = q) are classical too (Greenberg's quons,
Bożejko–Speicher). The statistics-universal *dual-family* statement for an abstract pair,
proved once, is absent from all four corpora (R8 round 2) and we found no literature
statement in this form; we do not claim new physics. eth's `LemmaDual` is the *weighted*
bosonic analogue with partition-indexed families and z_μ normalization.

## 7. Limitations and open problems

- **Weighted layer (M2).** eth's bosonic `LemmaDual` needs mixed weights w_k = k
  (a_ic_i = w_i + ε c_ia_i), multiset/partition indexing, the z_μ = ∏ k^{m_k} m_k!
  normalization and the sign-twisted families aFam. A weighted `OccupationPair` would let
  the eth lemma be re-derived and compared with article 30's Hall identification.
- **Dictionary with tauceti's CAR** (occupation projections ↔ our weights) is open.
- The axioms are instantiated here only for ε = −1 (and stated for ε = +1); which other
  values of ε admit nontrivial models with a vacuum is not studied.

## References

- mathlib `Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean:60`,
  `Mathlib/LinearAlgebra/CliffordAlgebra/Contraction.lean`.
- anthropics_formal-math `eth/proof/statements/AppHalfPiecesStatement.lean:166–175`.
- openai-math `OAI/Analysis/Laughlin/Operators/CAR.lean:15–21`; tauceti
  `TauCeti/Algebra/Lie/GeneralLinear/CAR/`.
- O. Bratteli, D. W. Robinson, *Operator Algebras and Quantum Statistical Mechanics 2*.

---

## Nearest-neighbor addendum (2026-11-14, dated — per A5's Cycle-2 novelty sign-off)

Post-publication development: **physlib's `ExchangeSign` post-dates this article's
2026-11-09 publication** and is now a nearest-neighbor declaration for the
statistics-universal occupation calculus's sign-exchange layer. Status: **theorems
stand** — no claim here is affected (the calculus's universality statements remain
unclaimed elsewhere); the novelty record gains one dated nearest neighbor, recorded so
future sweeps do not mistake priority. Physlib itself remains outside this project's
consumed corpora (G5a staging pending, AreaLaw2D-adjacent only).
