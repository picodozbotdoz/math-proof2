# Candidate 73 — function-field-hecke-tate [SKELETON — PRE-REGISTERED]

Status: pre-registered skeleton (lane A9, 2026-11-13), realizing zone **FF-EZ3** of lane
A2's bridge (`research/bridges/function-field.md` §4) — the bridge's own #1 by discovery
ceiling. Reserved row exists in `research/novelty/VERDICTS.md` Cycle-2 addendum.

- **Statement family (per the bridge, to be made precise on fill):** (i) *Tate dictionary*:
  for K = 𝔽_q(C) and a finite-order ray-class character χ of K (modulus an effective
  divisor; DZDF's `RayClassCharacter` shape transplanted onto mathlib's
  `FunctionField.ringOfIntegers` substrate), the Hecke Euler series L(s,χ) equals the
  L-function of the lisse ℓ-adic Kummer sheaf ℒ_χ (`LAdicSheaf.rationalLFunction`;
  rationality `exists_rationalLFunction_mul_eq_polynomial`,
  `LAdicTraceFormulaFinal.lean:51`) — the first formal Tate-thesis-type statement anywhere;
  (ii) *payoff*: quasi-RH **with window exactly 1/2** for function-field Hecke L
  (L(T,χ) ≠ 0 for |T| < q^{−1/2} outside trivial factors; purity of H¹, Weil II for
  curves) — the function-field analog of DZDF `heckeL_ne_zero` (`HeckeCorollary.lean:12`).
- **Zone:** [PENDING — FF-EZ3, bridge §4; A5 round-4 §6.2 has the informal-status
  pre-check]. **Blocked at the root:** L(X,ℱ) and purity live behind the un-cloned
  StacksFrontier; the Kummer-sheaf construction χ ↦ ℒ_χ is not even in the Weil repo
  (only the constant sheaf, `LAdicSheaf.constantSystem`). Highest ceiling, lowest
  probability; conditional-core grade by construction. Cheap statement-only probe named
  by the bridge: 𝔽_q(T) + Dirichlet character of 𝔽_q[T] (Gauss-sum theory, no sheaves).
- **Category (pre-registered):** CONDITIONAL-CORE / DISCOVERY-grade ceiling
  (first formal Tate-type statement) — Stacks-blocked; probe only after A7 prices a
  partial StacksFrontier build.
- **Template:** `research/candidates/TEMPLATE.md` — all sections on fill.
