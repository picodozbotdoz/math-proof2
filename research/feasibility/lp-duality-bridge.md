# Phase 2 mini-bridge — LP-DUALITY LAYER (dossiers 02-core + 74-T3; iteration-4 slot-1 seed)

Lane A1, 2026-11-14. The bridge doc the fresh run's LP lane would otherwise write cold.
Scope: the exact statement forms on both consumer sides, the mathlib absence evidence, the
proposed shared layer, and the consumer-mapping table. Companion artifacts:
`feasibility/ITERATION4-SEED-DOSSIERS.md` seed 2, `novelty/iter4-seed-triage.md` row 9
(NEW-LEAN, "fastest de-risk — do it FIRST").

## §0 Cluster snapshot

Two dossier cores, two cycles apart, share ONE layer unclaimed in the **Lean
ecosystem**: a finite-dimensional **linear-program weak-duality theorem native to
mathlib** (the theorem class itself is owned outside Lean — Isabelle AFP trio + Coq;
see §2). Dossier 02 (bandwidth-k ceiling laws,
re-scoped core item 1) and dossier 74 (surprisal moment-hierarchy ceilings, T3) each
define a *certificate class* (linear functional of the certificate, linear validity
inequalities against a data set) and a *ceiling constant* B = sup of value over valid
certificates — i.e., the value of a maximization LP — and each needs exactly the weak-
duality direction (`primal value ≤ dual value`) to certify ceilings. Neither needs
Farkas, strong duality, or an algorithm. mathlib has no such theorem (§2) — it is
mathlib's OWN declared TODO.

## §1 Intersection table — the same objects under two names

| Layer concept | dossier 02 (`candidates/02-…md` §Precise + §Re-scope item 1) | dossier 74 (`candidates/74-…md` §Precise T3) |
|---|---|---|
| Certificate (LP variable `x`) | `(c₀, r₁, r₂)`, `r_i ∈ C¹[0,1]` — **sign-free components** (§Re-scope: validity `c₀ + Σ_j s j·r₁(j/N) + Σ_j s₂ j·r₂(j/N) ≤ p₁` at every datum) | `(c₀, a : Fin k → ℝ)` — **sign-free** (validity `∀ q spectrum, c₀ + Σ_{i<k} a i · d^(k)(q) i ≤ F(q)`) |
| Constraint rows `A x ≤ b` | one row per datum in `𝒟_k(N, τ)` (near-CUE k-data sets; k=1 rows certified by `EnclOK` enclosures — the zeta23 binder pattern, `CeilingLaw256.lean:38`) | one row per grid spectrum `q ∈ 𝒢_N` (grid classes `{e^{-j/N}}`, N ≤ 8); `F(q)` = the bound `b` — **through the `moment p u` identification, `u ≠ 1` side condition mandatory** (A5 row-74 glue note: at u=1 `Real.rpow` counts zero atoms, `moment p 1 = card ι`) |
| Objective `c · x` | value `v₂ := c₀ + ∫₀¹ r₁·x dx + ∫₀¹ r₂·x dx` (linear in the certificate) | `c₀` (the objective selects the constant coordinate) |
| Ceiling constant | `B_k(N,τ) := sup {v(cert) : valid at every datum}` | `B_k(F) := sup {c₀ | ∃ a, F-valid}` |
| What each needs from the layer | **`B_k(N,τ) ≤ LP-dual value`** (Re-scope item 1 deliverable, verbatim: "weak duality suffices for a ceiling; separation-hyperplane route over mathlib's `Convex/Separation`") | T3's `≤` direction (the `=` claims ride vertex enumeration on the finite grid, N ≤ 8 — NOT the layer) |
| Quantization bridge | cert class infinite-dim (`C¹`) → grid-quantize to finite-dim first (02's own program) | finite-dim by construction (`Fin k`) |

Shared adjacent objects: zeta23 `PairCeiling` certificate calculus (`Defs.lean:27–36`
`Csum/Cstep/Dfun/Efun`, `Ceiling.lean:28–34` — the (c₀, r) class 02 generalizes);
Knausgård `Ceilings/` (`PairCert s x₁ x₂ b` ladder — the counterpart class for 02's
dictionary axis, formalized, `kristianmk/839`); openai family-265 interface (§3).

## §2 mathlib absence evidence (verified on the encore checkout @ ff2494ea, 2026-11-14)

- **Tree-grep (A1, this session)**: no `LinearProgramming`/optimizer files anywhere in
  `Mathlib/`; every `*Simplex*` hit is algebraic-topology/affine geometry
  (`SimplexCategory`, `StdSimplex`, `AffineSpace/Simplex`); `Analysis/Convex/` carries
  separation (`Separation`/`StoneSeparation`), Krein–Milman, Birkhoff, Carathéodory —
  no duality-pair theorem.
- **mathlib's own TODO (verified by direct read, confirming A5's find)**:
  `Analysis/Convex/Cone/Basic.lean:31–37` — the file's TODO list declares ":35 Define
  primal and dual cone programs and prove weak duality", ":37 Define linear programs and
  prove LP duality as a special case of cone duality", with :21–22 noting Farkas ⇔ strong
  duality. **LP duality is a declared mathlib gap, not an oversight.**
- **Nearest formal neighbor**: Yamashita 2026-06 (Lean 4 HSD interior-point for LP; R8
  `novelty/RELATED-WORK.md`) — an ALGORITHM, not a duality theorem; not reusable for our
  statement (02 §Re-scope, verbatim).
- **AFP/Coq verdict (A5 check RUN 2026-11-14, `novelty/iter4-seed-triage.md` §seed-9
  evidence block): AFP-HAS-LP_DUALITY — the theorem CLASS is formalized outside Lean.**
  LP duality (weak AND strong) is formalized in Isabelle/AFP (`Farkas`,
  Bottesch–Haslbeck–Thiemann 2019; `Linear_Programming`, Parsert–Kaliszyk 2019
  (= arXiv:2403.19639); `LP_Duality`, Thiemann 2022 — maintained through Isabelle2026)
  and in Coq (Allamigeon–Katz 1706.10269, 2017); it is absent from mathlib (explicit
  TODO, `Analysis/Convex/Cone/Basic.lean:37`, verified on our pin) and from the Lean
  ecosystem (Yamashita 2026-06 is an algorithmic HSD variant; no Lean preprint 2024–26).
  Ours: the first **mathlib/Lean-native** duality layer and the first **application** of
  formal LP weak duality to zero-proportion/entropic certificate programs (02's ceiling
  programs; 74-T3's surprisal LPs). — the five must-cites are mandatory nearest-miss
  citations in every artifact citing this layer.
- **Informal precedent**: Knausgård `law_lp.py` — Python LP solver reconstructing AF's
  period-256 law; cite as motivation, never competition (02 §Re-scope).
- Residual [NOVELTY-CHECK-NEEDED]: mathlib PRs in flight only (the TODO invites exactly
  this contribution — date against the mathlib-Cone clock).

## §3 The proposed shared layer (S-class)

Both consumers have **sign-free primal variables**, so the layer is stated in the
asymmetric standard form (x free; dual equality constraint; y nonnegative) — this covers
02 and 74 verbatim; the textbook symmetric form (x ≥ 0, inequality dual) is a one-line
corollary if ever needed:

```
theorem lp_weak_duality {m n : Type*} [Fintype m] [Fintype n] {R : Type*}
    [LinearOrderedRing R] (A : m → n → R) (b : m → R) (c : n → R)
    (x : n → R) (y : m → R)
    (hAx : ∀ i, ∑ j, A i j * x j ≤ b i)            -- primal feasible (x FREE)
    (hy : ∀ i, 0 ≤ y i)                            -- dual multipliers nonneg
    (hATy : ∀ j, ∑ i, y i * A i j = c j) :         -- dual equality feasibility
    ∑ j, c j * x j ≤ ∑ i, b i * y i
```

**Proof (termwise, ~15 Lean lines + interfaces)**:
`∑ c_j x_j = ∑_j (∑_i y_i A_ij) x_j` (hATy) `= ∑_i y_i (∑_j A_ij x_j)` (Finset.sum_comm +
mul_sum/sum_mul) `≤ ∑_i y_i b_i` (hAx pointwise, `mul_le_mul_of_nonneg_left` under hy,
then `Finset.sum_le_sum`). Over ℝ (or any `LinearOrderedRing`; both consumers are ℝ).
mathlib interface points: `Finset.sum_comm`, `Finset.mul_sum`, `Finset.sum_mul`,
`mul_le_mul_of_nonneg_left`, `Finset.sum_le_sum` — all stable API. (A `Matrix`-typed
variant is cosmetic; plain function types are the portable form.)

**Effort class**: S (~100–200 LoC incl. header/docs; empirical anchor pilot-22-M1, 68
LoC). Estimated shape: 1 layer theorem + 1 symmetric-form corollary + 2 consumer-adaptor
definitions. The CONSUMERS are the M-class work (02 item 1 M; 74-T3 ≈ +0.5–1k LoC on top
of its S core, per dossier 74 §Feasibility).

## §4 Consumer-mapping table (layer lemma → consumer clause)

| Layer artifact | discharges | consumer clause | adaptor needed on the consumer side |
|---|---|---|---|
| `lp_weak_duality` (≤ direction) | 02 §Re-scope item 1 | `B_k(N,τ) ≤ LP-dual value` | grid-quantize the `(c₀, r₁, r₂)` class to finite dim; assemble `A, b, c` from datum rows; dual feasible `y` = the nonneg combination the certificate analysis supplies |
| `lp_weak_duality` (≤ direction) | 74 T3 | `B_k(F) ≤ dual value` on `𝒢_N`, for `F` with `u ≠ 1` moment parameters | rows = grid spectra, `b i = F(q_i)` computed through the `moment` identification (u ≠ 1 enforced in the statement); `x = (c₀, a)`; objective selects `c₀` |
| symmetric-form corollary (optional) | (reserve) | any future consumer with nonneg variables (e.g., 02 absorptions) | — |
| — (NOT the layer) | 74 T2 | `B_k ≤ B_{k+1}` — pure injection `(c₀,a) ↦ (c₀, a∘castLE)`, no LP needed | — |
| — (NOT the layer) | 74 T1 | Cantelli floor / MGF ceiling / MarginalTails binder — analysis, feeds B_k by exhibiting valid certificates | — |
| — (NOT the layer) | 02 Theorems A/B/C | stability law / near-CUE propagation / ceiling law — the zeta23-verbatim analysis | — |

**Reading.** The layer is the rate-limiter for exactly two clauses (both `≤`-direction);
everything else in both dossiers is independent of it. This matches A5's current bullet:
"do it FIRST regardless of which discovery-grade seeds win slots (it is the 74/02
dependency either way)" — with AFP/Coq owning the theorem class, the slot's value is the
mathlib-native layer + the two in-repo consumers, not theorem-class priority.

## §5 openai family-265 interface shape (the 74-side donor surface)

- `moment p u := ∑ i, (p i)^(1-u)` (`OAI/MathematicalPhysics/PEPSSubvolume/EntropyMoments.lean:93`,
  ns `PolynomialPEPS.Subvolume.MGFScalar`); `entropy` :94; `logMoment` :95;
  `logMoment_derivative : HasDerivAt (logMoment p) (entropy p) 0` :128 — the
  moment↔entropy glue 74's T1 consumes.
- `MarginalTails` first clause (AreaLaw2D `OpenAI/Statements.lean:460–490`, verbatim at
  :482–485): bounds exactly `Real.log (∑_{0 < p j} p j * Real.exp (-u * Real.log (p j)))`
  = `logMoment p u` on the support — consumed as hypothesis binder `hMGF` (74 T1c), the
  G5a `HypAreaLaw`/conditional pattern.
- Spectrum-side facts: `MState.sum_eigenvalues_eq_one` (AreaLaw2D `Region/State.lean:164`)
  + PSd nonnegativity — the spectrum axioms of 74's §Setting.

## §6 Risks / decay

1. **AFP prior art — RESOLVED (A5, 2026-11-14: AFP-HAS-LP_DUALITY)**: the theorem class
   is owned outside Lean (AFP `LP_Duality`/`Linear_Programming`/`Farkas` + Coq
   1706.10269 — all five are mandatory nearest-miss citations). NEVER phrase the layer
   as "first formal LP duality", "unformalized", or any unqualified "first"; every claim
   is **Lean/mathlib-native scope only** (tier unchanged: NEW-LEAN,
   infrastructure-grade, two-consumer).
2. **mathlib-Cone clock**: the TODO invites a mathlib contribution; if mathlib lands LP
   duality first, the layer drops to transcription (formalization-grade) — charter fast.
3. The layer alone is math-trivial — never a headline; bundle a consumer (02 item 1 or
   74-T3) in any pilot slot.
4. 74-T3 stays [HYPOTHESIS] until the LP representation is proved (vertex enumeration,
   N ≤ 8); the layer only ever supplies its `≤` half.

— end bridge (A1). Feeds: ITERATION4-CHARTER-DRAFT slot 1; SEED-DOSSIERS seed 2.
