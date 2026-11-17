# A Statistics-Universal Creation–Annihilation Calculus and the Fermionic Dual-Family Theorem

*kind: TECHNICAL-RECORD — axiomatization + ε-universal dual-family lemma, formal-first
(TEMPLATE-iter4 §0 kept set) · date: 2026-11-09 (header modernized 2026-11-17) ·
supersedes: none · artifacts: `research/pilots/52/M1.lean`,
`research/pilots/52/logs/m1-run14-green.log`,
`research/pilots/52/logs/axcheck-final.log`; dossier
`research/candidates/52-unified-ccr-fock-layer.md`; blueprint
`research/pilots/52-blueprint.md`*

| theorem | status | hypotheses | evidence |
|---|---|---|---|
| Thm 1 `OccupationPair.dual_family` (ε-universal dual family) | PROVED-UNCONDITIONAL | none beyond the `OccupationPair` definition-of-subject | `pilots/52/logs/axcheck-final.log:843` — `[propext, Quot.sound]` (not even choice) |
| Thm 2 `OccupationPair.annih_outside` (orthogonality half) | PROVED-UNCONDITIONAL | none (as Thm 1) | `axcheck-final.log:850` — `[propext, Quot.sound]` |
| Thm 3 `OccupationPair.sign_transposition` | PROVED-UNCONDITIONAL | none (as Thm 1) | `axcheck-final.log:844` — `[propext, Quot.sound]` |
| Thm 4 `OccupationPair.fermionic_create_sq` (Pauli, exact form) | PROVED-UNCONDITIONAL | statement scope: `1 + 1 ≠ 0` in the field (characteristic ≠ 2) | `axcheck-final.log:856` — `[propext, Classical.choice, Quot.sound]` |
| Thm 5 `fermionicPair` (exterior-algebra instance, 6/6 fields) | PROVED-UNCONDITIONAL | none (mathlib `ExteriorAlgebra ℂ (Fin n → ℂ)`) | `axcheck-final.log:845` — `[propext, Classical.choice, Quot.sound]` |

Substrate: mathlib `ff2494ea`, Lean v4.36.0-rc2; no `sorry`, no `native_decide`; sweep
verdict 29/29 stages OK, 0 sorryAx (`axcheck-final.log:1`).

Change log (2026-11-17, lane A9 — header modernization only, no content change): the
byline was brought to the TEMPLATE-iter4 front matter with the kind tag of the README
relabel (2026-11-16); the prose status line ("PROVED, unconditional, kernel-verified")
was replaced by the per-theorem status rows above in the closed vocabulary, with the
per-theorem axiom sets preserved as evidence. Theorems, proofs, the §5 declaration
table, and all dated records (incl. the 2026-11-14 nearest-neighbor addendum) are
unchanged. Same-day residual pass: §6 converted to the mandatory nearest-miss table
(same citations); the §5 retracted-blocker sentence reworded as the plain correction it
records. Same-day depth pass: §5 gained the per-theorem verification blocks (decl
file:line + coverage; binder inventory empty).

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
axcheck `research/pilots/52/logs/axcheck-final.log` (15 axiom lines, 0 sorryAx). A
mid-pilot report of a "definitional-equality blocker" stands retracted — the obstruction
was an unreduced scalar coefficient in a hand-rolled `simp only` list, not a definitional
one.

Verification-block depth (R3 §5; 2026-11-17 depth pass — per-theorem file:line;
the status rows in the header carry the axiom-print log lines):

- Thm 1 `OccupationPair.dual_family` — `pilots/52/M1.lean:105`; no hypothesis binders
  (duplicate-freeness and annihilation of x are the statement's data); substrate
  mathlib `ff2494ea` / v4.36.0-rc2; honest label PROVED-UNCONDITIONAL.
- Thm 2 `OccupationPair.annih_outside` — `M1.lean:91`; no binders (i ∉ w, a_i x = 0
  are the statement's data); PROVED-UNCONDITIONAL.
- Thm 3 `OccupationPair.sign_transposition` — `M1.lean:124`; no binders (i ≠ j);
  PROVED-UNCONDITIONAL.
- Thm 4 `OccupationPair.fermionic_create_sq` — `M1.lean:159`; statement scope: the
  field hypothesis `1 + 1 ≠ 0` (characteristic ≠ 2) — a scope condition, not a donor
  binder; PROVED-UNCONDITIONAL.
- Thm 5 `fermionicPair` — `M1.lean:230` (definition, noncomputable); the six
  `OccupationPair` fields are proved (the instance rows of the §5 table); elaborated
  by the OK compile; triad print as in the status row.
- Coverage: 12 theorems in the sweep stage (`axcheck-final.log:821` verdict), all
  direct-printed triad (`:843–857`); binder inventory empty throughout — no donor
  statement is consumed anywhere in the file.

## 6. Novelty and nearest misses

| prior work (exact citation) | what it proves | why this differs |
|---|---|---|
| classical CCR/CAR: Jordan–Wigner; Bratteli–Robinson, *Operator Algebras and Quantum Statistical Mechanics 2*; q-commutations (Greenberg's quons; Bożejko–Speicher) | the (anti)commutation relations and their ε = q interpolations | the relations are classical; the ε-universal dual-family statement for an abstract occupation pair, proved once without case distinction, is the axiomatization's content — no new physics claimed |
| eth corpus `LemmaDual` (`AppHalfPiecesStatement.lean:175`) | the *weighted* bosonic analogue, partition-indexed families, z_μ normalization | the weighted layer is §7's open extension; the unweighted ε-universal form is what is proved here |
| the four corpora (R8 round 2; `qa/iter4-review/r2-discovery-strength.md` §5 q8: no `OccupationPair` anywhere) + physlib `ExchangeSign` (dated nearest neighbor, 2026-11-13, the addendum below) | no occupation-pair layer in any corpus; physlib takes the exchange-sign layer only | the axioms remain unclaimed elsewhere; the physlib neighbor narrows the sign-exchange claims (recorded in the dated addendum below) |

Scope statement. Technical-record billing (axiomatization + ε-universal lemma,
formal-first): the contribution is the right abstraction and the ε-uniform proof, not
difficulty; the novelty record is the main-run verdict plus the dated nearest-neighbor
addendum below.

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
future sweeps do not mistake priority. Precision (A5 delta re-check 2026-11-14, per `novelty/physlib-surface.md` §3.4's
name-collision trap): `ExchangeSign` lives in **leanprover-community/physlib** (the
HEPLean successor) — for which NO G5a staging exists or is planned; **G5a concerns a
DIFFERENT Physlib**, the package vendored inside AxiomMath/AreaLaw2D. Per §3.1:
physlib TAKES the exchange-sign layer (any new statistics-universal ε-sign framing
without differentiation is dead) but does NOT touch the occupation-pair layer —
article 52's axioms remain ours-and-unclaimed-by-others.
