# A Statistics-Universal Creation–Annihilation Calculus — a beginner's introduction

> **What this file is.** An expository, non-normative companion to the research article
> [A Statistics-Universal Creation–Annihilation Calculus and the Fermionic Dual-Family
> Theorem](../52-statistics-universal-occupation-calculus.md).
> Audience: an undergraduate mathematics background — modular arithmetic and polynomials
> assumed; matrices and linear maps introduced as needed; no Lean, no quantum mechanics, no
> exposure to this project assumed. Nothing here adds, weakens, or replaces any claim of the
> article: if this file and the article ever disagree, the article and its Lean artifacts
> win. Written 2026-11-21 against the article's committed state (external referee report
> applied).

## 1. In plain words

In several formal mathematics libraries there live pieces of the same algebraic pattern:
families of operators that "create" and "annihilate" excitations, one pair per mode, with
signs that differ between the bosonic and fermionic cases. Each library proves its own
version of one key trick — that a product of annihilators undoes the reversed product of
creators on a suitable vector. This article packages the shared pattern into one
definition (an "occupation pair": five algebraic relations and a vacuum vector) and proves
the key trick **once**, for every value of the sign at the same time, instead of once per
case. It also locates the exact boundary of one famous consequence (the Pauli principle:
creating the same mode twice gives zero) — true over fields where 2 is invertible, false
on certain 2-torsion modules, with an explicit worked counterexample. Finally, it builds
a verified instance on a standard mathlib object, tying one library's version to
another's. The mathematics is elementary by design; the deliverable is the right
abstraction and the sign-uniform proof.

## 2. The background, in one page

### 2.1 The actors: modes, modules, and two families of maps

Fix a commutative ring R, an R-module M (a place where vectors live and linear maps act),
and a set of **modes** indexed by a type ι — think of ι as labels 1, …, n. The data is a
family of linear maps c_i and a_i : M → M for each mode i, plus one distinguished vector
vac ∈ M. Physics calls c_i a **creation operator** (add one excitation in mode i) and a_i
an **annihilation operator** (remove one), and vac the **vacuum** (no excitations). In
this article these are just linear maps and a vector: the axioms below are all that is
used, and no physics is claimed anywhere.

### 2.2 The five relations, and the sign ε

An **occupation pair** with sign ε ∈ R is such a family satisfying, for all modes i, j:

- (cc) c_i c_j = ε · c_j c_i — creators of different modes commute up to the sign ε;
- (aa) a_i a_j = ε · a_j a_i — likewise for annihilators;
- (ac_self) a_i c_i = 1 + ε · c_i a_i — annihilating what you just created (or vice
  versa) differs from doing it in the other order by exactly 1;
- (ac_ne) a_i c_j = ε · c_j a_i for i ≠ j — annihilators slide past creators of *other*
  modes, picking up the sign ε;
- (avac) a_i vac = 0 — the vacuum has nothing to annihilate.

The sign ε encodes the **statistics**: ε = −1 is the fermionic case (anticommutation,
the CAR relations of physics), ε = +1 the unweighted bosonic case (commutation). The word
"statistics" here means exactly this exchange sign — it has nothing to do with data
statistics. For a word w = [w₁, …, w_k] of modes, write c_w = c_{w₁}⋯c_{w_k} and
a_w = a_{w₁}⋯a_{w_k} for the composed maps. (classical in origin: the CCR/CAR relations
of Jordan–Wigner 1928 and later literature; the packaging is the article's.)

### 2.3 The trick the libraries each proved separately

The pattern recorded across the corpora is: an annihilation word is a left inverse of the
*reversed* creation word on vectors killed by the relevant annihilators —
a_t(c_{t^rev} x) = x under the right hypotheses (a bosonic, weighted version in one
library, fermionic versions implicit in others' Fock-space constructions). The article's
observation: the proof never needs to know whether ε is +1 or −1 — the signs cancel.

### 2.4 The article's core question

What is the weakest common axiomatization under which the trick holds uniformly in ε?
And exactly when does the fermionic consequence c_i c_i = 0 (the Pauli principle as
algebra) hold — over which coefficient rings, and with what explicit failures?

## 3. One module, by hand

The article's own recorded example is the boundary case for the Pauli principle: an
occupation pair on 2-torsion where c_i c_i ≠ 0. We recompute it completely. Take R = ℤ,
M = (ℤ/2)² — pairs of integers read modulo 2 — one mode, and the 2-by-2 integer matrices

  c = [[0,1],[1,0]]  (the swap),   a = [[0,1],[0,0]],   vac = e₁ = (1, 0),

acting on column vectors. Check the five relations with ε = −1 (all arithmetic on M is
mod 2):

- (avac): a·e₁ is column 1 of a, which is (0, 0). Holds: the vacuum is annihilated.
- (ac_self) reads a·c + c·a = I when ε = −1. Now a·c = [[1,0],[0,0]] and c·a =
  [[0,0],[0,1]] — the two diagonal unit matrices — so a·c + c·a = I. Holds. (The article
  records exactly these: ac = E₁₁, ca = E₂₂.)
- (cc) with ε = −1 asks c² = −c². Here c² = I, and −I = I on M because 2x = 0 for every
  x ∈ M. Holds.
- (aa): a² = 0 = −0. Holds. (ac_ne) is vacuous with one mode.

So this is a genuine occupation pair with ε = −1. The one-mode core of Theorem 1 also
checks by hand: c(vac) = c·e₁ = e₂ (the swap), and a(e₂) = column 2 of a = e₁, so
a(c(vac)) = vac — the annihilator undoes the creator on the vacuum. And the Pauli
principle *fails*: c² = I is not the zero map (I sends e₁ to e₁ ≠ 0), even though every
hypothesis of the fermionic setting holds. The reason Theorem 4 survives over fields of
characteristic ≠ 2 is visible here: (cc) forces 2·c² = 0, and killing c² needs 2 to be
invertible — which fails exactly on 2-torsion like M. The article adds two related
recorded facts: the same matrices over 𝔽₂ give the characteristic-2 failure, and on ℤ/2
itself no occupation pair exists (every endomorphism is a scalar, so (ac_self) would
force 2·(that scalar) = 1 — impossible mod 2).

*Provenance:* the example (R, M, c, a, vac), the elementary-matrix values E₁₁/E₂₂, the
conclusion c² = I ≠ 0, the 𝔽₂ variant, and the ℤ/2 nonexistence remark are all
article-recorded (§3, Theorem 4 remark; §7). Every relation check above is
hand-recomputed from those recorded data and agrees with them; no other instances are
claimed.

## 4. How the proof works, without Lean

Theorem 1's proof is a short induction on the word t, and its beauty is that ε never
gets inspected. Write t = i :: t' with i not in t'. The reversed creation word splits as
c_{t^rev} = c_{t'^rev}·c_i, and the key step is that y = c_i x is killed by every
annihilator of t': for j ∈ t' we have j ≠ i, so (ac_ne) slides a_j past c_i picking up
ε, and a_j x = 0 kills the result — the ε's cancel against the hypothesis, whatever ε
is. The induction hypothesis applied to y returns y from a_{t'}(c_{t'^rev} y), and the
outer step uses (ac_self): a_i(c_i x) = x + ε·c_i(a_i x) = x, since a_i x = 0. Theorem 2
(the orthogonality half) is the same slide applied one mode at a time. Theorem 3
compares the two orderings of a two-letter word via (cc), which produces exactly one
factor of ε. Theorem 4 is (cc) at i = j with ε = −1: c_i c_i = −c_i c_i, so 2·(c_i c_i)
= 0, and over a field of characteristic ≠ 2 one divides by 2 — the Lean proof literally
uses the hypothesis 1 + 1 ≠ 0. Theorem 5 verifies the five relations for a concrete
instance on mathlib's exterior algebra, reducing each to its contraction calculus. The
proofs are short; the point is that they close uniformly in ε, which no single corpus's
version did.

## 5. What the main results say, informally

- **Theorem 1 (`dual_family`, the ε-universal dual-family theorem).** For every
  duplicate-free word t and every vector x killed by a_j for all j ∈ t:
  a_t(c_{t^rev} x) = x. In words: the reversed creation word is undone by the
  annihilator word, for any statistics sign ε at all — one proof, no case split.
  PROVED-UNCONDITIONAL. → article §3, Thm 1.
- **Theorem 2 (`annih_outside`).** If i ∉ w and a_i x = 0, then a_i(c_w x) = 0; in
  particular a_i c_w vac = 0. In words: annihilating a mode that was never created
  destroys the state. PROVED-UNCONDITIONAL. → article §3, Thm 2.
- **Theorem 3 (`sign_transposition`).** For i ≠ j: a_{[i,j]}(c_{[i,j]} vac) = ε·vac.
  In words: swapping the two modes' order costs exactly one factor of the statistics
  sign. PROVED-UNCONDITIONAL. → article §3, Thm 3.
- **Theorem 4 (`fermionic_create_sq`, the Pauli principle).** Over a field K of
  characteristic ≠ 2 (the declaration carries the hypothesis 1 + 1 ≠ 0 — a statement
  antecedent, i.e. part of the implication, not an open condition) with ε = −1:
  c_i c_i = 0. The article also records, unformalized, the failures: the 2-torsion module
  (ℤ/2)² of §3 above, and characteristic 2. PROVED-UNCONDITIONAL. → article §3, Thm 4.
- **Theorem 5 (`fermionicPair`, the exterior-algebra instance).** On Λ(ℂⁿ) (mathlib's
  exterior algebra), left multiplication by basis vectors and contraction against their
  duals form an occupation pair with ε = −1 and vacuum 1 — all five relation fields
  proved. PROVED-UNCONDITIONAL. → article §3, Thm 5.
- **What is *not* here:** the weighted bosonic layer (weights per mode, partition
  indexing, the z_μ normalization) that the donor library's version needs — recorded as
  the open extension; a dictionary with a third library's CAR layer — open; and any
  classification of which ε-values or 2-torsion modules admit occupation pairs — not
  studied. The article bills itself as a technical record: abstraction and the ε-uniform
  proof, not difficulty.

## 6. Glossary

| symbol | one-line meaning | example |
|---|---|---|
| R, M | a commutative ring; an R-module where the maps act | ℤ; (ℤ/2)² |
| ι | the set of mode labels | {1, …, n} |
| c_i | creator for mode i: a linear map M → M | left multiplication by e_i |
| a_i | annihilator for mode i: a linear map M → M | contraction against the dual of e_i |
| vac | the vacuum vector, killed by every a_i | e₁ in §3's example |
| ε | the statistics sign in R | −1 fermionic, +1 bosonic |
| (cc), (aa) | c_i c_j = ε c_j c_i; a_i a_j = ε a_j a_i | the exchange relations |
| (ac_self) | a_i c_i = 1 + ε·c_i a_i | reads ac + ca = I at ε = −1 |
| (ac_ne) | a_i c_j = ε·c_j a_i for i ≠ j | the slide with a sign |
| (avac) | a_i vac = 0 | the vacuum has nothing to remove |
| c_w, a_w | the composed maps of a word w = [w₁, …, w_k] | c_{[1,2]} = c₁c₂ |
| t duplicate-free | no mode repeats in the word | [1, 2] yes; [1, 1] no |
| t^rev | the word reversed | [1, 2]^rev = [2, 1] |
| occupation pair | the five relations + the three data fields | Theorem 5's instance |
| Pauli principle | c_i c_i = 0 over char ≠ 2 fields; fails on 2-torsion | c² = I on (ℤ/2)² |
| triad | the routine Lean axioms: propext, Classical.choice, Quot.sound | Thms 1–3 don't even use choice |
| PROVED-UNCONDITIONAL | kernel-checked with no assumed mathematical hypotheses | all five theorems |

## 7. What this is — and what it is not

- "Occupation" means Fock-space occupation number — how many excitations a mode carries —
  **not** labor statistics or occupational data. The axioms never mention numbers of
  particles; they encode how the maps compose.
- "Statistics" means the boson/fermion exchange sign ε in the relations — **not** data
  analysis or probability. "Creation/annihilation" are the standard operator names; here
  they are plain linear maps, and the article claims no physics.
- "Vacuum" is a technical datum: one vector killed by every annihilator — not a statement
  about empty space.
- The Pauli principle here is the algebraic c_i c_i = 0, and the article's contribution is
  its **exact scope**: true over fields with 2 invertible, with explicit counterexamples
  on 2-torsion modules and in characteristic 2 — boundary-work, not a physics postulate.
- This is a TECHNICAL-RECORD: the mathematics is elementary (the article says so), the
  deliverable being the right axiomatization, the one-proof-for-both-signs theorem, and
  the verified bridge instance. "Kernel-verified" means: every theorem was machine-checked
  by the Lean type checker against fixed axioms — Theorems 1–3 use only [propext,
  Quot.sound] (not even Classical.choice), Theorems 4–5 the full triad, with zero `sorry`.

## 8. How to read the real article

- Claim in words → §1 here, then the article's abstract.
- Formal statement → article §2 (the OccupationPair definition, fields at `M1.lean:37–46`)
  and §3, with the glossary (§6 here) open.
- Proof idea → §4 here, then article §5 (the induction; the slide; the division by 2).
- Verification → article §6 (formal record), `research/pilots/52/M1.lean`,
  `research/pilots/52/logs/axcheck-final.log`.
- Novelty and nearest misses → article §4 (the four-corpus absence check, eth's weighted
  `LemmaDual` as nearest prior, and the physlib nearest-neighbor scan).
- What stays open → article §7 (the weighted layer; the tauceti dictionary; which modules
  admit occupation pairs).

## 9. What you need going in

- Linear maps and their composition; matrices acting on column vectors; the identity map.
- Working modulo 2 (2x = 0, signs collapsing: −1 = 1 in 𝔽₂) — the boundary examples run
  entirely on this.
- The distributive bookkeeping of multiplying small 2-by-2 matrices by hand (§3 does all
  of it).
- Induction on lists/words, at the level of "peel off the first letter".
- What a Lean kernel check is (one sentence, §7 above) — nothing else about
  formalization.
