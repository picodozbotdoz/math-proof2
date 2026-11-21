# The ETH-Appendix Operators Q_s Are, up to a Kronecker Term, Second Differences of Number Operators: Refutation of a Project-Formulated Parseval Conjecture and a Closed Form at h = 1

*kind: DISCOVERY (new closed form about a corpus-internal operator family + refutation of
a conjecture formulated in this project — the "whose conjecture" caveat carried per
`qa/iter4-review/r2-discovery-strength.md:69`) · date: 2026-11-09 (revised in place
2026-11-17 and 2026-11-21; theorems and proofs unchanged) · supersedes: none ·
artifacts: `research/pilots/30-falsify-TheoremB-h1.lean`,
`research/pilots/30/ClosedForm.lean`,
`research/pilots/30/logs/run3-green.log`,
`research/pilots/30/logs/axcheck-final.log`; candidate record (dossier: the project's
per-candidate research record)
`research/candidates/30-hall-parseval-boson-identification.md`; outcome note
`research/pilots/30-note.md`*

| theorem | status | hypotheses | evidence |
|---|---|---|---|
| Thm 1 (refutation of the conjectured B2) `TheoremB2_refuted_h1` + witnesses `B2_idempotence_fails`, `B2_annihilation_fails`, `B2_parseval_fails` | PROVED-UNCONDITIONAL | none (the h = 1, a = b = t₁ instance is the statement's data) | `pilots/30/logs/run3-green.log:23` (witnesses `:20–22`), axioms `[propext, Classical.choice, Quot.sound]`; axiom audit `axcheck-final.log:562` |
| Lemma 2 (number-operator form) `Pilot30.nab_nab` | PROVED-UNCONDITIONAL | none | `run3-green.log:62`, axioms `[propext, Classical.choice, Quot.sound]`; audit `axcheck-final.log:506` |
| Thm 3 (closed form) `Pilot30.Qh1_closed`, `Pilot30.Qh1_closed_form` | PROVED-UNCONDITIONAL | none | `run3-green.log:64–65`, axioms `[propext, Classical.choice, Quot.sound]` |
| Cor 4 (spectral form; commutativity) `Pilot30.Num_monomial`, `Qh1_monomial`, `Qh1_comm_monomial` (commutativity kernel-checked on monomials, which span V), spot value `Qh1_zero_t1sq` | PROVED-UNCONDITIONAL | none | `run3-green.log:66–69`, axioms `[propext, Classical.choice, Quot.sound]` |
| scalar part (second difference of x ↦ x⁺) `Pilot30.scalar_second_diff` | PROVED-UNCONDITIONAL | none | `run3-green.log:63` — axioms `[propext, Quot.sound]` (not even choice) |
| Cor 5 (moment identities), full generality | PAPER-ONLY | none | paper proof (§5.3); instances kernel-checked: `moment1_V1`, `moment2_V1`, `moment2_V2_t2` — `run3-green.log:24–26`, axioms `[propext, Classical.choice, Quot.sound]` |
| faithfulness checks (LemmaQ (a)/(c) instances on V₀/V₁/V₂, pairings) `LemmaQc_V0`, `LemmaQc_V1`, `LemmaQa_V1`, `LemmaQc_V2_t2`, `pairing_h1`, `pairing_h2_check` | PROVED-UNCONDITIONAL | none (support layer) | `run3-green.log:14–19`, axioms `[propext, Classical.choice, Quot.sound]` |

Substrate: the project pin (mathlib `ff2494ea`, Lean v4.36.0-rc2); no `sorry`, no
`native_decide`, no external CAS. Both artifacts elaborated with 0 errors and 0
sorry-warnings (`run3-green.log:12`, `:60`); the final axiom audit reports 0 sorryAx and
only standard axioms (`axcheck-final.log:506`, `:562`).

---

## Abstract

The "half pieces" appendix of the anthropics ETH corpus builds the operator family
Q_s(a, b) (display (48), on mode operators ∇_{±k} of V = ℚ[t_k]) resolving the identity
Σ_s Q_s = (a[−h]·b)·Id — is the resolution spectral? The project's own conjecture —
orthogonal idempotents with a Parseval identity (B2) — is false: at h = 1, a = b = t₁
the scalars (1, −2, 3, −2, 1) refute idempotence, annihilation and Parseval (Theorem 1).
Theorem 3 explains the failure exactly: at h = 1, Q_s f = [s = 0]·f +
|1−s|·N_{|1−s|}f − 2|s|·N_{|s|}f + |s+1|·N_{|s+1|}f (N_k = t_k∂/∂t_k; every s ∈ ℤ,
f ∈ V); on monomials the eigenvalues are δ_{s0} + Δ²ψ_m, the second difference of the
occupation profile ψ_m(j) = |j|·m_{|j|}. Status: Theorem 1, Lemma 2, Theorem 3,
Corollary 4 PROVED-UNCONDITIONAL (Lean 4 kernel, no hypotheses); Corollary 5's general
moment identities (Σ_s s²Q_s = 4E·Id) PAPER-ONLY with kernel-checked instances.
Scoped novelty: a new closed form and second-difference structure for a corpus-internal
operator family; the classical boson layer (Jing 1991; Macdonald I §5; Kac–Raina 1987)
is consumed, not claimed — no Q_s closed form appears there or in the donor.

## 1. Introduction

The sibling corpus `anthropics_formal-math` formalizes, in its `eth` appendix (**eth**
below), an appendix that constructs integer "piece" polynomials through mode operators on
V = ℚ[t_k : k ∈ ℕ₊] (`AppHalfPiecesStatement.lean`; the setup is recalled in §2). Among
the operators is a family Q_s(a, b) — display (48) below — whose members resolve the
identity on each weight space: Σ_{|s| ≤ E+h} Q_s = (a[−h]·b)·Id (the donor's `LemmaQ` (c)).
Dossier 30 identified the pairing a[−h]·b with an ω-twisted Hall inner product on symmetric
functions (Theorem A, not treated here) and conjectured a spectral strengthening of (c):

> **Theorem B (conjectured).** On V_E, the operators Q_s are self-adjoint for the
> transported form (B1) and satisfy Q_s Q_t = [s = t]·(a[−h]b)·Q_s, equivalently a Parseval
> identity Σ_s {Q_s f, Q_s g} = (a[−h]b)·{f, g} (B2).

(c) says the Q_s resolve the identity; B2 would make them a *spectral* resolution. We test
the smallest case and find that B2 fails (Theorem 1), then determine the operators
exactly: up to the scalar term [s = 0]·Id, each Q_s is a discrete second difference of
number operators (Theorem 3). The second-difference structure explains why the resolution
of the identity survives while every Parseval-type identity fails (Corollary 5).

## 2. Setting and notation

Throughout, V = ℚ[t_k : k ∈ ℕ₊] with weight wt(t_k) = k, and V_E its weight-E graded
piece. The eth operators are built from

  ∇_{−k} f = t_k·f,  ∇_k f = k·∂f/∂t_k  (k ≥ 1),  ∇₀ = 0      (eth :89–90),

combined through generalized binomial coefficients into the mode operators a[r] (display
(47), :93–105) and then

  Q_s(a,b) = Σ_{i=0}^{2h} (−1)^i · a^{⟨i⟩}[s − h + i] · b[h − s − i]      (display (48), :149–150),

with a^{⟨i⟩} = Σ_{h'} C(h'+h, i)·ā_{h'} (angle, :146) and the factors-exchanged variant
Q′ (:153–154). The appendix **states** `LemmaQ` as a `structure … : Prop` (:159); a proof
under six interface-binder structures is
`eth/proof/rates/GeneralPieces/Ring/LemmaQ.lean:350`. Its three items: (a) Q_s(a,b) does
not change when the two factors are exchanged in all products; (b) Q_s = 0 on V_E for
|s| > E + h; (c) Σ_{|s| ≤ E+h} Q_s = (a[−h]·b)·Id on V_E.

**The h = 1 specialization.** Take h = 1 and a = b = t₁ (so b ∈ V₁). The weight parts of
t₁ are (0, t₁), hence a^{⟨i⟩} = C(2, i)·t₁ and the coefficients (−1)^i C(2,i) are
(1, −2, 1). For a monomial with a single part, the choice set of display (47) is forced,
and the binomial weight is C(−k−1, 0) = 1, so t₁[r] = ∇_{−r}. Therefore

  Q_s f = ∇_{1−s}∇_{s−1} f − 2·∇_{−s}∇_{s} f + ∇_{−s−1}∇_{s+1} f.      (Q)

The pairing is t₁[−1]·t₁ = ∇₁ t₁ = 1 (eth `pairing`, :131). (Both facts, and LemmaQ
(a)/(c) for this instance on V₀, V₁ and the t₂-line of V₂, are re-checked by kernel
computation: `LemmaQc_V0`, `LemmaQc_V1`, `LemmaQa_V1`, `LemmaQc_V2_t2`, `pairing_h1`;
§6.)

**Notation.** N_k := t_k ∂/∂t_k (so N_k t^m = m_k t^m), x⁺ = max(x, 0), and for a monomial
exponent m the occupation profile ψ_m : ℤ → ℕ, ψ_m(j) = |j|·m_{|j|} (with ψ_m(0) = 0);
(Δ²u)(s) = u(s+1) − 2u(s) + u(s−1).

**Two Lean models.** The falsification artifact `pilots/30-falsify-TheoremB-h1.lean` works
in `MvPolynomial (Fin 7) ℚ` (t_k = X(k−1); faithful for labels |k| ≤ 7, and only |k| ≤ 4
occur). `pilots/30/ClosedForm.lean` uses `MvPolynomial ℕ ℚ` with t_k = X k, which is eth's
`MvPolynomial ℕ+ ℚ` up to the embedding ℕ₊ ↪ ℕ (X 0 is never touched), so Theorem 3 is
faithful for all labels.

## 3. Main results

**Theorem 1 (refutation of B2).** At h = 1, a = b = t₁, on V₁:

  (Q₋₂, Q₋₁, Q₀, Q₁, Q₂) t₁ = (1, −2, 3, −2, 1)·t₁.

Hence Q₀Q₀t₁ = 9t₁ ≠ 3t₁ = Q₀t₁ (idempotence fails), Q₋₂Q₀t₁ = 3t₁ ≠ 0 (mutual
annihilation fails) and Σ_s Q_s²t₁ = 19t₁ ≠ t₁ (operator Parseval fails), although
Σ_s Q_s t₁ = t₁ (LemmaQ (c) holds).

**Lemma 2 (number-operator form).** For every x ∈ ℤ and f ∈ V,

  ∇_x ∇_{−x} f = x⁺·f + |x|·N_{|x|} f.

**Theorem 3 (closed form).** For every s ∈ ℤ and f ∈ V,

  Q_s f = [s = 0]·f + |1−s|·N_{|1−s|} f − 2|s|·N_{|s|} f + |s+1|·N_{|s+1|} f.

**Corollary 4 (spectral form; commutativity).** For every monomial t^m,

  Q_s t^m = q_s(m)·t^m,  q_s(m) = δ_{s0} + ψ_m(s−1) − 2ψ_m(s) + ψ_m(s+1) = δ_{s0} + (Δ²ψ_m)(s).

In particular all Q_s, Q_t commute (diagonal operators; monomials span V), and Q₀ is
idempotent on V_E only when E = 0 (its eigenvalue on t₁^E is 1 + 2E).

**Corollary 5 (moment identities).** On V_E, summing over any window |s| ≤ M with
M ≥ E + 1:

  Σ_s Q_s = Id,  Σ_s s^{2r+1} Q_s = 0 (r ≥ 0),  Σ_s s²·Q_s = 4·Eul = 4E·Id,

where Eul = Σ_k k·N_k is the Euler (weight) operator. More generally, in the sense of
formal Laurent series,

  Σ_s Q_s z^s = Id + (z − 2 + z⁻¹)·Σ_{k≥1} k·(z^k + z^{−k})·N_k.

## 4. Novelty and nearest misses

| prior work (exact citation) | what it proves | why this differs |
|---|---|---|
| eth corpus: `AppHalfPiecesStatement.lean` (∇ :89–90, display (48) :149–154, `LemmaQ` (a)–(c)) | the three operator lemmas and the dual-family lemma for general h; no closed form, no moment identity beyond (c) (direct-source query: no closed/number-operator/second-difference content in the donor, `qa/iter4-review/r2-discovery-strength.md` §5 q7) | ours: the exact closed form (Thm 3), the spectral form and commutativity (Cor 4), the moment identities (Cor 5), and the refutation of the conjectured Parseval strengthening (Thm 1) |
| N. Jing, *Vertex operators and Hall–Littlewood symmetric functions*, Adv. Math. 87 (1991); Macdonald, *Symmetric Functions and Hall Polynomials*, 2nd ed., Ch. I §5; Kac–Raina (1987) | the classical boson layer: ∇_{±k} as the modes p_k and k ∂/∂p_k; number operators N_k and the Euler operator are standard | the classical layers are consumed, not claimed; no statement of the Q_s family or its second-difference structure found in that literature or any corpus (novelty record: `research/novelty/VERDICTS.md` row 30 — NEW-SUPPORTED, classical anchors verified) |
| dossier 30's Theorem A (this project, unformalized) | the pairing = ω-twisted Hall inner product identification | separate claim, not treated here; the h = 2 check (`pairing_h2_check`) only re-confirms the sign mechanism behind it |

Scope statement. The refuted conjecture (B2) was **formulated in this project** — the
refutation is a disconfirmation of our own conjecture, not of any literature claim; the
discovery billed is the closed form and the structure it reveals
(`qa/iter4-review/r2-discovery-strength.md:69`: "the closed form is a real new theorem
about a corpus-internal operator family"). "No statement of the Q_s family found" means:
not in the eth corpus (direct-source query above) and not in the vertex-operator
literature surveyed; the novelty record is `research/novelty/VERDICTS.md` row 30
(NEW-SUPPORTED, classical anchors verified).

## 5. Proofs

### 5.1 Lemma 2

If x > 0: ∇_x∇_{−x}f = x·∂_x(t_x f) = x·(f + t_x ∂_x f) = x f + x N_x f. If x < 0, put
k = −x > 0: ∇_x∇_{−x}f = t_k·(k ∂_k f) = k N_k f, and x⁺ = 0. If x = 0 both sides vanish. ∎

### 5.2 Theorem 3 and Corollary 4

Each summand of (Q) has the form ∇_x∇_{−x}: x = 1−s, x = −s, x = −s−1 respectively. By
Lemma 2, the scalar part is (1−s)⁺ − 2(−s)⁺ + (−s−1)⁺, which a three-case check shows is
[s = 0] (the second difference of x ↦ x⁺ is the Kronecker delta). The number-operator part
is as displayed. On t^m, N_k acts by m_k, giving q_s(m); since ψ_m is even,
|1−s|·m_{|1−s|} = ψ_m(s−1) and |s+1|·m_{|s+1|} = ψ_m(s+1). Commutativity: both sides of
Q_sQ_t f = Q_tQ_s f are ℚ-bilinear in f and agree on monomials (kernel-checked,
`Qh1_comm_monomial`), and monomials span V, so Q_sQ_t = Q_tQ_s on V. Idempotence: Q₀ acts
on t₁^E by 1 + 2E, so Q₀² = Q₀ on V_E forces (1 + 2E)² = 1 + 2E, i.e. E = 0 (and on V₀,
Q₀ = Id). ∎

Theorem 1 is the instance m = e₁ of Corollary 4: ψ(±1) = 1 and ψ = 0 elsewhere, so
q = δ + (Δ²ψ) evaluated at s = −2, …, 2 is (1, −2, 1 + 2, −2, 1). Q₀ has eigenvalue 3 ≠ 0, 1.

### 5.3 Corollary 5

ψ_m is supported in |j| ≤ E (m has weight E = Σ k m_k), so Δ²ψ_m is supported in
|s| ≤ E + 1 and the window sums are full sums. For a polynomial weight w(s),
Σ_s w(s)·(Δ²ψ)(s) = Σ_j ψ(j)·(Δ²w)(j) (summation by parts, exact for finite support).
For w = 1 and w = s, Δ²w = 0; for w = s², Δ²w = 2; and Σ_j ψ(j) = 2Σ_k k m_k = 2E. Adding
the δ_{s0} term (which contributes 1, 0, 0) gives Σ Q_s = 1, Σ s Q_s = 0, Σ s² Q_s = 4E on
each monomial of V_E. Odd moments vanish because ψ is even. For the generating function,
Σ_s z^s(Δ²ψ)(s) = (z − 2 + z⁻¹)Σ_j ψ(j)z^j = (z − 2 + z⁻¹)Σ_k k m_k(z^k + z^{−k}). ∎

**Interpretation.** LemmaQ (c) — the only spectral fact proved in the donor corpus — is the
statement that the zeroth moment of a second difference of a compactly supported profile
is zero, plus the δ from the positive-part term. The family {Q_s} is a *discrete Laplacian
family* of commuting number-operator combinations, not a family of projectors.

## 6. Formal record

| theorem | Lean declaration | file:line | axioms | log path:line |
|---|---|---|---|---|
| Thm 1 + witnesses | `TheoremB2_refuted_h1`; `B2_idempotence_fails`, `B2_annihilation_fails`, `B2_parseval_fails` | `pilots/30-falsify-TheoremB-h1.lean:364, 339, 345, 350` | ⊆ {propext, Classical.choice, Quot.sound} | `pilots/30/logs/axcheck-final.log:562` (per-decl prints `run3-green.log:20–23`) |
| faithfulness checks | `LemmaQc_V0`, `LemmaQc_V1`, `LemmaQa_V1`, `LemmaQc_V2_t2`, `pairing_h1`, `pairing_h2_check` | `pilots/30-falsify-TheoremB-h1.lean:241, 247, 253, 264, 231, 287` | ⊆ {propext, Classical.choice, Quot.sound} | `axcheck-final.log:562` (per-decl prints `run3-green.log:14–19`) |
| moment instances (of Cor 5) | `moment1_V1`, `moment2_V1` (= 4t₁), `moment2_V2_t2` (= 8t₂) | `pilots/30-falsify-TheoremB-h1.lean:377, 383, 390` | ⊆ {propext, Classical.choice, Quot.sound} | `axcheck-final.log:562` (per-decl prints `run3-green.log:24–26`) |
| Lemma 2 | `Pilot30.nab_nab` | `pilots/30/ClosedForm.lean:61` | ⊆ {propext, Classical.choice, Quot.sound} | `axcheck-final.log:506` (per-decl print `run3-green.log:62`) |
| scalar part | `Pilot30.scalar_second_diff` | `pilots/30/ClosedForm.lean:81` | `[propext, Quot.sound]` | `axcheck-final.log:535` (per-decl print `run3-green.log:63`) |
| Thm 3 | `Pilot30.Qh1_closed`, `Pilot30.Qh1_closed_form` | `pilots/30/ClosedForm.lean:94, 112` | ⊆ {propext, Classical.choice, Quot.sound} | `axcheck-final.log:506` (per-decl prints `run3-green.log:64–65`) |
| Cor 4 | `Pilot30.Num_monomial`, `Pilot30.Qh1_monomial`, `Pilot30.Qh1_comm_monomial` (monomial-level), spot value `Pilot30.Qh1_zero_t1sq` (Q₀ t₁² = 5 t₁²) | `pilots/30/ClosedForm.lean:121, 128, 139, 158` | ⊆ {propext, Classical.choice, Quot.sound} | `axcheck-final.log:506` (per-decl prints `run3-green.log:66–69`) |

## 7. Limitations and open problems

1. **General h and general (a, b).** For h ≥ 2 the mode operators involve products of
   several ∇'s weighted by generalized binomials, and Q_s is no longer obviously a
   combination of number operators. Is Q_s(a, b) always diagonal in a suitable basis (e.g.
   power sums p_μ under the boson–fermion dictionary)? What replaces 4·Eul in the second
   moment?
2. **Self-adjointness (B1)** is not settled by this article. At h = 1 the Q_s are diagonal
   on the monomial basis (Corollary 4), so B1 would follow from a transported form that is
   diagonal on the same basis. Under the dossier's pairing identification the monomials
   t^μ correspond to the power-sum products p_μ (Theorem A′, unformalized), and the Hall
   inner product is diagonal on power sums (`TauCeti.hallInner_psumPart`,
   ⟨p_ρ, p_ρ′⟩ = z_ρ·δ_{ρρ′}); but Theorem A is itself unformalized and not treated here,
   so B1 at h = 1 is at most a paper-level corollary of that identification. Either way
   B1 is of limited interest: the failure of B2 is structural.
3. **Formalizing Corollary 5** (finite-window telescoping over `Finset.Icc` on ℤ) is a
   bounded add-on to `ClosedForm.lean`.

## 8. Prior work and references

**Literature.**

- N. Jing, *Vertex operators and Hall–Littlewood symmetric functions*, Adv. Math. 87
  (1991).
- I. G. Macdonald, *Symmetric Functions and Hall Polynomials*, 2nd ed., OUP 1995, Ch. I
  §5 (the Hall inner product; the power-sum products p_λ and their orthogonality).
- V. Kac, A. Raina, *Bombay Lectures on Highest Weight Representations*, World Scientific,
  1987.

**Project artifacts.**

- Donor corpus (sibling, read-only):
  `anthropics_formal-math/eth/proof/statements/AppHalfPiecesStatement.lean` (∇ :89–90,
  display (47) :93–105, pairing :131, angle :146, display (48) :149–150, factors-exchanged
  Q′ :153–154, `structure LemmaQ : Prop` :159); LemmaQ proof under six binder structures:
  `anthropics_formal-math/eth/proof/rates/GeneralPieces/Ring/LemmaQ.lean:350`; aliases
  `operators`, `dual`: `anthropics_formal-math/eth/proof/PaperIndex.lean:2389,2394`.
- Power-sum orthogonality (kernel-checked, sibling):
  `tauceti/TauCeti/RepresentationTheory/Symmetric/FrobeniusCharacteristic.lean:273`
  (`TauCeti.hallInner_psumPart`).
- This project: `research/pilots/30-falsify-TheoremB-h1.lean`;
  `research/pilots/30/ClosedForm.lean`; logs `research/pilots/30/logs/run3-green.log`,
  `research/pilots/30/logs/axcheck-final.log`; dossier
  `research/candidates/30-hall-parseval-boson-identification.md` (Theorems A/A′; the
  conjectured Theorem B = B1/B2); outcome note `research/pilots/30-note.md`; novelty
  record `research/novelty/VERDICTS.md` row 30; strength audit
  `research/qa/iter4-review/r2-discovery-strength.md` (§2 row 30, §5 q7).
