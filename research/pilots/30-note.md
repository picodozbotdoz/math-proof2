# Pilot 30 — falsification milestone for dossier 30 Theorem B: outcome note

Lane R7 → R7' → R7'' (interrupted twice) → closed in the 2026-11-09 resume session.
Status: **CLOSED — VERDICT: REFUTED (Theorem B2 at h = 1), plus a proved replacement
(Theorem B′, closed form).** Kernel-only; mathlib `ff2494ea`, Lean v4.36.0-rc2.

## 1 Files and runs

| file | role | final run |
|---|---|---|
| `pilots/30-falsify-TheoremB-h1.lean` (≈410 LoC) | Fin-7 model of eth's operators at h = 1; faithfulness checks + refutation + moment instances | `pilots/30/logs/run3-green.log`: **OK**, 0 errors, 0 sorry-warnings |
| `pilots/30/ClosedForm.lean` (≈190 LoC) | faithful model `MvPolynomial ℕ ℚ` (all labels); general closed form + spectral form | `pilots/30/logs/run3-green.log`: **OK**, 0 errors, 0 sorry-warnings |

Run history (Modal app `crossmath-pilot-32`, runner `pilots/32/run_pilot.sh`):
- run1 (R7', `logs/run1.log`): falsify FAIL 12 errors — `simp only […] (config := …)` with the
  config *after* the lemma list is a parse error (`unexpected token '('`), so every proof
  using it was truncated; plus a `push_cast` on no goals.
- run2 (`logs/run2.log`): falsify 6 errors (t₁²-line evaluations: `C 5` vs numeral `5`
  normal-form mismatch under `ring_nf`; `map_smul` has no `MulActionHomClass` instance for
  `Derivation` — use `Derivation.map_smul`); ClosedForm 1 error (same `map_smul`).
- run3 (`logs/run3-green.log`): **both OK**. The t₁²-line of V₂ moved from the Fin-7 file to
  the general spectral theorem (`Qh1_monomial`, spot-checked by `Qh1_zero_t1sq`).

## 2 Verdict: Theorem B2 is REFUTED at h = 1

Dossier 30's Theorem B2 asserted `Q_s ∘ Q_t = [s = t]·pairing(h,a,b)·Q_s` on `V_E`
(mutually orthogonal idempotents after normalization) and the Parseval identity
`Σ_s {Q_s f, Q_s g} = pairing·{f, g}`. At h = 1, a = b = t₁ (pairing 1 t₁ t₁ = 1,
`pairing_h1`), on V₁ = ℚ·t₁ the operators act by the scalars

  (Q₋₂, Q₋₁, Q₀, Q₁, Q₂) t₁ = (1, −2, 3, −2, 1) t₁.

They sum to 1 (LemmaQ (c) holds) but are not {0,1}-valued, so:

| theorem | content | axioms |
|---|---|---|
| `B2_idempotence_fails` | `Q₀(Q₀ t₁) = 9 t₁ ≠ 3 t₁ = Q₀ t₁` | `[propext, Classical.choice, Quot.sound]` |
| `B2_annihilation_fails` | `Q₋₂(Q₀ t₁) = 3 t₁ ≠ 0` | idem |
| `B2_parseval_fails` | `Σ_s Q_s(Q_s t₁) = 19 t₁ ≠ t₁` (operator form; equivalent to the form version given B1 and nondegeneracy) | idem |
| **`TheoremB2_refuted_h1`** | `¬ ∀ s t ∈ [−2,2], Q_s(Q_t t₁) = if s = t then Q_s t₁ else 0` | idem |

Faithfulness of the instantiation is **checked, not assumed** (all standard axioms):
`LemmaQc_V0`, `LemmaQc_V1`, `LemmaQc_V2_t2` (the corpus LemmaQ (c) `Σ_{|s|≤E+1} Q_s = pairing·Id`
on V₀, V₁ and the t₂-line of V₂), `LemmaQa_V1` (LemmaQ (a), factors exchanged),
`pairing_h1`, and `pairing_h2_check` (the h = 2 generalized-binomial sign mechanism of
dossier 30 Theorem A: `C(−3,1) = −3` gives pairing 2 = 2!).

## 3 What survives — Theorem B′ (closed form at h = 1), proved for all s and all f

Every term of display (48) at h = 1, a = b = t₁ is of the form ∇_x∇_{−x}, and

  **`nab_nab`**: ∇_x ∇_{−x} = x⁺·Id + |x|·N_{|x|}  (N_k = t_k ∂/∂t_k, every x ∈ ℤ).

Hence (with `scalar_second_diff`: (1−s)⁺ − 2(−s)⁺ + (−s−1)⁺ = [s = 0])

  **`Qh1_closed_form`**: Q_s = [s = 0]·Id + |1−s|·N_{|1−s|} − 2|s|·N_{|s|} + |s+1|·N_{|s+1|},

and on monomials (**`Qh1_monomial`**) Q_s t^m = q_s(m)·t^m with
q_s(m) = [s=0] + |1−s|·m_{|1−s|} − 2|s|·m_{|s|} + |s+1|·m_{|s+1|}: the Q_s are simultaneously
diagonal and commute (**`Qh1_comm_monomial`**). Writing ψ_m(j) := |j|·m_{|j|} (an even,
finitely supported function of j ∈ ℤ), q_s(m) = δ_{s0} + (Δ²ψ_m)(s) — **a discrete second
difference**. This explains the refutation: second differences are not idempotent.

Axioms (run3): `nab_nab`, `Qh1_closed`, `Qh1_closed_form`, `Num_monomial`, `Qh1_monomial`,
`Qh1_comm_monomial`, `Qh1_zero_t1sq` = `[propext, Classical.choice, Quot.sound]`;
`scalar_second_diff` = `[propext, Quot.sound]`.

**Moment identities (corollaries).** Summation by parts against the finitely supported ψ_m
gives, on V_E and for any window |s| ≤ M with M ≥ E + 1:
Σ_s Q_s = Id (= LemmaQ (c) at h = 1), Σ_s s·Q_s = 0 (all odd moments vanish: ψ even),
and **Σ_s s²·Q_s = 4·E·Id** (Σ_j j²Δ²ψ(j) = Σ_j ψ(j)Δ²(j²) = 2Σ_j ψ(j) = 4Σ_k k·m_k).
Generating function: Σ_s Q_s z^s = Id + (z − 2 + z⁻¹)·Σ_{k≥1} k(z^k + z^{−k})·N_k.
Kernel-checked instances: `moment1_V1` (Σ s·Q_s t₁ = 0), `moment2_V1` (= 4 t₁),
`moment2_V2_t2` (= 8 t₂). The general moment statements are paper proofs from the
kernel-checked closed form; their Lean finite-window telescoping is not formalized.

## 4 Impact on dossier 30

Theorem B (Parseval/idempotence) is **dropped** as stated. Theorem A (pairing ↔ Hall inner
product with the ω-twist) is untouched by this milestone (its h = 2 sign mechanism is
re-confirmed by `pairing_h2_check`). The new, proved replacement B′ is a small structural
theorem about eth's operators (absent from eth, which proves only LemmaQ (a)–(c)), and the
moment identity Σ s²Q_s = 4·Euler is a genuinely new identity in this family at h = 1.
The general-h question — whether Q_s(a,b) is always a finite-difference family of number
operators (and what replaces 4·Euler) — is open.
