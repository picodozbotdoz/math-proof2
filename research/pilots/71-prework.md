# Pre-work spec — pilot 71 (function-field s-plane dictionary, FF-EZ1 route)

Lane A2, 2026-11-13. Companion docs: `research/bridges/function-field.md` §4 FF-EZ1/FF-EZ5 and
§5 (feasibility; the Stacks wall), dossier 71 (`research/candidates/
71-function-field-splane-dictionary.md`, lane A9 — on disk at writing; consistency split per the
72-prework §3.4 pattern: dossier owns novelty/positioning, this file owns statements, binder
inventory, tiers, risks, Modal plan), `research/novelty/round-4.md` §1 (zone FF — not binding on
this pilot's statements, but its falsity-trap rule shapes §2.4's quantifier choices). This is
SPEC ONLY — no Lean execution; the pilot lane is assigned after triage. **Verdict up front:
GO, with zero import gates.** The entire pilot runs on mathlib `ff2494ea` alone: the Weil
conjectures enter as a verbatim-transcribed hypothesis binder (Tier C, the hQRH/`EnclOK`
precedent), so nothing waits on G6 (Stacks pricing, A7 queued). G6 only upgrades provenance
(Tiers B/A, §3).

---

## §1 The pilot in one page

Route **FF-EZ1-first** (bridge §4 ranking item 3 — "the dictionary every other zone consumes";
best value-to-effort; EZ3-first would be the Stacks-blocked FF-EZ3 route, pre-registered as
dossier 73). Scope = dossier 71 items (P)(i)–(iii) + (C); stretch = (P)(iv); NOT in scope =
dossier 71's (W) base-change warm-up and (S) family proportions (those are separate tranches,
and (S) is hypothesis-binder territory by its own header).

Milestones: **P0** statement-elaboration probe (doubles as A7-style preflight, §6);
**P1** dictionary layer (the `q^{−s}` substrate + multiset glue lemmas);
**P2** the three theorems (window W1, zero-location W2 = perfect density, point-count HW) +
optional (C)/(iv) packaging; **P3** axcheck sweep. Effort ≈ 0.6–1.0k LoC new content — pilot-42
scale, no donor builds.

The mathematical content is deliberately glue-grade (triangle inequality + modulus
computation; bridge §4 FF-EZ1 verdict "formal-first/classical"): the deliverable is the first
formal s-plane function-field zeta and the optimal-window/point-count statements in the
DZDF-comparable shape — the dictionary, not new analysis.

---

## §2 Exact statement specs

### 2.1 The producer endpoint, transcribed exactly [VERIFIED this session]

The ONLY mathlib-only statement of the four Weil conjectures anywhere is
`LeanEval.AlgebraicGeometry.WeilConjectures.weil_conjectures`
(`axiommath/Weil/LeanEval/WeilConjectures.lean:185`, statement spanning :185–194; the file's
imports are Stacks-gated but the statement itself uses only mathlib names — `Over`,
`Spec`, `GeometricallyIrreducible`, `IsProper`, `SmoothOfRelativeDimension`, `Multiset`,
`Module.finrank`, `Nat.card`; README §"All in one statement, with Mathlib only" says the same):

```lean
theorem weil_conjectures (F : Type*) [Finite F] [Field F]
    (X : Over (Spec (.of F))) [GeometricallyIrreducible X.hom] [IsProper X.hom]
    (d : ℕ) [SmoothOfRelativeDimension d X.hom] :
    ∃ A : ℕ → Multiset ℂ, A 0 = {1} ∧
      (∀ i ≤ 2 * d, A (2 * d - i) = (A i).map (Nat.card F ^ d / · : ℂ → ℂ) ∧
        (∀ φ : ℂ ≃+* ℂ, (A i).map φ = A i) ∧
        ∀ α ∈ A i, IsIntegral ℤ α ∧ ‖α‖ = √(Nat.card F ^ i)) ∧
      ∀ (E : Type _) [Field E] [Algebra F E] [FiniteDimensional F E],
        Nat.card (.mk (Spec.map <| CommRingCat.ofHom <| algebraMap F E) ⟶ X) =
        ∑ i ∈ Finset.Iic (2 * d), (-1) ^ i * ((A i).map (· ^ Module.finrank F E)).sum
```

(Clauses: duality `A (2d−i) = (A i).map (q^d/·)` :189, Galois stability :190, per-eigenvalue
integrality + `‖α‖ = √(q^i)` :191, point-count formula :192–194. Verified line-by-line this
session against the file, not the README.)

Mathlib import set for the transcription (all confirmed on `ff2494ea`):
`Mathlib.AlgebraicGeometry.Morphisms.Smooth` (`SmoothOfRelativeDimension`,
Morphisms/Smooth.lean:126), `Mathlib.AlgebraicGeometry.Morphisms.Proper` (`IsProper`,
Morphisms/Proper.lean:40), `Mathlib.AlgebraicGeometry.Geometrically.Irreducible`
(`GeometricallyIrreducible`), `Mathlib.CategoryTheory.Over` (`Over`), plus the analysis imports
of §4. P0 exists to confirm this list elaborates bare.

### 2.2 The binder packaging (`WeilData`)

Not a raw `∃ A` binder — a named record-shaped Prop so every target theorem quantifies over the
data once and the Tier-A discharge stays a one-liner:

```lean
/-- Tier C transcription of `LeanEval…weil_conjectures`'s existential, per (F, X, d). -/
structure WeilData (F : Type*) [Finite F] [Field F] (X : Over (Spec (.of F)))
    [GeometricallyIrreducible X.hom] [IsProper X.hom] (d : ℕ)
    [SmoothOfRelativeDimension d X.hom] extends (ℕ → Multiset ℂ) where
  zero : toFun 0 = {1}
  duality : ∀ i ≤ 2 * d, toFun (2 * d - i) = (toFun i).map (Nat.card F ^ d / · : ℂ → ℂ)
  galois : ∀ i ≤ 2 * d, ∀ φ : ℂ ≃+* ℂ, (toFun i).map φ = toFun i
  purity : ∀ i ≤ 2 * d, ∀ α ∈ toFun i, IsIntegral ℤ α ∧ ‖α‖ = √(Nat.card F ^ i)
  pointCount : ∀ (E : Type _) [Field E] [Algebra F E] [FiniteDimensional F E],
    Nat.card (.mk (Spec.map <| CommRingCat.ofHom <| algebraMap F E) ⟶ X) =
      ∑ i ∈ Finset.Iic (2 * d), (-1) ^ i * ((toFun i).map (· ^ Module.finrank F E)).sum

/-- The hypothesis binder. Tier A discharge: `fun F _ X _ d _ => weil_conjectures F X d`. -/
hWeil : ∀ (F : Type*) [Finite F] [Field F] (X : Over (Spec (.of F)))
    [GeometricallyIrreducible X.hom] [IsProper X.hom] (d : ℕ)
    [SmoothOfRelativeDimension d X.hom], ∃ A, WeilData F X d A
```

(Universe/instance discipline: keep `Type*` and the exact binder order of the donor so Tier A's
`exact` typechecks; any deviation is caught only at Tier A, hence verbatim-first.)

### 2.3 Formalization home for the s-plane object — decision and justification

**Decision: define ζ_C(s) as a concrete ℂ-valued function from the eigenvalue multiset —
`Polynomial ℂ` evaluated at `Complex.exp (−s · log q)` — over mathlib's `Complex`/`Polynomial`
API. NOT ℂ(s)-formal, NOT ℚ_ℓ-adic, NOT `RatFunc`, NOT `PowerSeries.eval`.**

Justification:
1. **The only mathlib-only producer data is the multiset `A i`** (§2.1). Weil's own zeta objects
   (`zetaSeries` ℚ⟦t⟧, `zetaFunction` ℚ_ℓ⟦T⟧) are Stacks-gated at the *definition* level
   (`pointCount` = `Nat.card (fieldValuedPoints …)` imports Stacks, `Definitions.lean:57`; bridge
   §5), so any home requiring them is Tier-B-gated for no mathematical gain.
2. **No convergence theory is needed.** The window/location/point-count theorems never need
   ζ_C's power-series identity with `exp(∑ A_m/m tᵐ)`; they need only the rational-function
   skeleton, which the multiset gives directly: `P₁ := ∏_{α ∈ A 1}(1 − αT)` and
   `ζ_C(s) = P₁(q^{−s}) / ((1 − q^{−s})(1 − q·q^{−s}))`. The analytic continuation clause of
   dossier 71 (P)(i) is then a 10-line quotient-of-entire-functions packaging (optional §2.6),
   not a power-series study. (`PowerSeries.eval`-route would additionally need summability on
   \|T\| < q^{−2g}+ — real analysis for zero payoff.)
3. **Precedent:** the only in-corpus s-adjacent FF zeta is tauceti's genus-1 island —
   `WeierstrassCurve.zetaFunction` (`TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Frobenius/
   Zeta.lean:153`) as ℚ⟦X⟧ with rationality `:201`, FE `mobiusAutOf_zetaRatFunc :112`
   (Z(W/F, 1/(qT)) = Z(W/F, T), Silverman V.2.4), RH `norm_eq_inv_sqrt_card_… :244`
   (\|z\| = q^{−1/2}) — elementary trace-based, no cohomology, and *also* never an s-plane
   object. Our construction is exactly that island's shape with `frobeniusPowTrace` replaced by
   the LeanEval multiset (generic genus). A genus-1 identification theorem (bridge FF-EZ4) is
   OUT of scope here (needs an E-as-`Over (Spec F)` bridge, flagged for A7), noted so nobody
   re-derives `zetaFunction`'s normalization inside this pilot.
4. **No `cpow`, no `rpow`** (risk R2, §5): the substitution `q^{−s}` is defined as
   `Complex.exp (−s * Real.log q)` — entire in `s` by composition of `Complex.exp` with a
   linear map, modulus by one lemma (`Complex.norm_exp`, §4). Every quantity in the targets is
   then either an exponential, a `Real.sqrt`, or a natural power — no branch cuts anywhere.

### 2.4 The dictionary layer (P1 deliverables)

```lean
variable (q : ℕ) (h2 : 2 ≤ q)

/-- `T = q^{-s}`, entire in `s`. -/
noncomputable def wOf (q : ℕ) (s : ℂ) : ℂ := Complex.exp (-(s * Real.log (q : ℝ)))

/-- `P₁(T) = ∏_{α ∈ A} (1 − αT)`, the L-polynomial carried by the eigenvalue multiset. -/
def lPoly (A : Multiset ℂ) : Polynomial ℂ := (A.map fun α => 1 - Polynomial.C α * Polynomial.X).prod

/-- The s-plane zeta of a curve, from the d = 1 WeilData. -/
noncomputable def zetaC (A : Multiset ℂ) (q : ℕ) (s : ℂ) : ℂ :=
  (lPoly A).eval (wOf q s) / ((1 - wOf q s) * (1 - (q : ℂ) * wOf q s))
```

**D1 (modulus dictionary; the load-bearing lemma).**
`theorem norm_wOf (q : ℕ) (hq : 0 < q) (s : ℂ) : ‖wOf q s‖ = Real.exp (-(s.re * Real.log (q:ℝ)))`
— i.e. `‖q^{−s}‖ = q^{−σ}` in exponential form. Proof: `Complex.norm_exp`
(`Mathlib/Analysis/Complex/Trigonometric.lean:993` : `‖exp z‖ = Real.exp z.re`) +
`neg_mul`, `Real.log_nonneg`/`Real.log_pos (1 < q)`. Strict monotonicity corollaries:
`norm_wOf_lt_iff : ‖wOf q s‖ < r ↔ Real.exp (−s.re * log q) < r` etc., and the strict
`‖wOf q s‖ < 1 ↔ 0 < s.re` (via `Real.exp_lt_one_iff`, `Real.log_pos` from `2 ≤ q` —
field ⇒ `1 < Nat.card F` via `Fintype.one_lt_card`, `Mathlib/Data/Fintype/EquivFin.lean:257`).

**D2 (multiset norm-sum helper; the only genuinely missing mathlib lemma).**
`theorem multiset_norm_sum_le (s : Multiset ℂ) (f : ℂ → ℂ) :
  ‖s.sum f‖ ≤ (s.map fun x => ‖f x‖).sum` — by `Multiset.induction` + `norm_add_le`
(mathlib has the Finset form `Complex.abs_sum`/`norm_sum_le_sum_norm`; a Multiset form was not
found — P0 confirms absence, D2 supplies it, ~15 LoC). Plus `Multiset.prod_ne_zero`
(`Mathlib/Algebra/BigOperators/Ring/Multiset.lean:39`, via `prod_eq_zero_iff`) for W1, and
`Multiset.card_map`/`Multiset.card_prod`-adjacent counting for HW.

**D3 (duality extraction).** From `WeilData.duality` at `d = 1`, `i = 0`:
`theorem a2_eq (W : WeilData F X 1 A) : A 2 = {(Nat.card F : ℂ)}` — since
`A 2 = (A 0).map (q/·) = {1}.map (q/·) = {q}` (`A 0 = {1}` by `zero`, `Nat.card F ^ 1 = Nat.card F`).

### 2.5 The target theorems (P2 deliverables)

**W1 — optimal window (FF-EZ1(ii), the FF Cureton–Thorner with constant exactly 1/2).**

```lean
theorem curve_zeta_ne_zero (W : WeilData F X 1 A) (hq : 1 < Nat.card F)
    (s : ℂ) (hs : (1/2 : ℝ) < s.re) (hs1 : s ≠ 1) :
    zetaC A (Nat.card F) s ≠ 0
```

Proof shape: denominator factors — `1 − wOf q s ≠ 0` since `‖wOf q s‖ = q^{−σ} < q^{−1/2} ≤ 1`
(σ > 1/2, q ≥ 2); `1 − q·wOf q s ≠ 0` since `‖q·wOf q s‖ = q^{1−σ} < 1` for σ > 1 (and
σ > 1/2 with the factor vanishing forces `q^{1−σ} = 1 ∧ arg = 0` ⇒ σ = 1 ⇒ `wOf q 1 = q^{−1}`…
cleanest: `1 − q·wOf q s = 0 → ‖wOf q s‖ = 1/q → q^{−σ} = q^{−1} → σ = 1 → s = 1` by
`Complex.exp_eq_exp` injectivity on the real-and-imaginary decomposition — needs the
`hs1` clause exactly as in DZDF `Main.lean:13`'s `s ≠ 1` exclusion; this is the statement-shape
parity the dossier wants). Numerator — `Multiset.prod_ne_zero`: each factor
`1 − α·(wOf q s)` has `‖α·wOf q s‖ = √q·q^{−σ} ≠ 1` because `σ ≠ 1/2` (strict `<`); uses the
purity clause `‖α‖ = √(Nat.card F ^ 1)` at `i = 1`.

**W2 — exact zero location = perfect zero-density (FF-EZ5 core).**

```lean
theorem curve_zero_re_eq_half (W : WeilData F X 1 A) (hq : 1 < Nat.card F) (s : ℂ)
    (h : (lPoly A).eval (wOf (Nat.card F) s) = 0) : s.re = 1/2
```

Proof shape: some factor `1 − α·wOf q s = 0` (`Multiset.prod_eq_zero_iff`) ⇒
`‖α‖·‖wOf q s‖ = 1` ⇒ `√q·q^{−σ} = 1` ⇒ `σ = 1/2` by `Real.exp` injectivity
(`Real.exp_eq_exp` / log route) — the two-sided analog of W1's numerator step. Converse
(zeros exist at every solution of `α·wOf q s = 1`, giving the arithmetic-progression structure,
period `2πi/log q`) = optional P2c via `Complex.exp_periodicity`; NOT needed for the pairing
theorem.

**HW — Hasse–Weil point-count transport (FF-EZ1(iii)), ∀E-form.**

```lean
theorem hasse_weil_point_count (W : WeilData F X 1 A) (hq : 1 < Nat.card F)
    (m : ℕ) (hm : 0 < m) (E : Type _) [Field E] [Algebra F E] [FiniteDimensional F E]
    (hfrank : Module.finrank F E = m) :
    ‖(Nat.card (.mk (Spec.map <| CommRingCat.ofHom <| algebraMap F E) ⟶ X) : ℂ)
        - ((Nat.card F : ℂ) ^ m + 1)‖
      ≤ (A 1).card * (Real.sqrt (Nat.card F : ℝ)) ^ m
```

Proof shape: expand the point-count clause over `Finset.Iic 2`: the `i = 0` term is
`(A 0).sum (·^m) = 1` (`zero`), the `i = 2` term is `(A 2).sum (·^m) = q^m` (D3); the middle is
`−(A 1).sum (·^m)`; so `#X(E) = q^m + 1 − Σ_{α∈A1} α^m` and D2 + purity give
`‖Σ_{α∈A1} α^m‖ ≤ Σ ‖α‖^m = card(A1)·(√q)^m` (`(Real.sqrt (q:ℝ))^m` — no rpow, R2 decision).
Genus note: `card (A 1) = 2g` is Tier-A bookkeeping (`natDegree_rationalFrobeniusCharpolyReverse`,
`axiommath/Weil/…/Trace/CharpolyDegree.lean:67`) — deliberately NOT needed; the bound stands
with `card (A 1)` explicit, which keeps the statement binder-honest. **Family shape note (the
falsity-trap design rule):** all three theorems are uniform magnitude statements — ∀ curves,
∀ q, ∀ genus, ∀ m/E — with no multiplicity content, so the supersingular trap cannot bite
(trap-free by construction; bridge §4 standing rule noted for reviewers).

### 2.6 Optional packaging (P2c; only after W1+W2+HW land)

(i) *Meromorphic form of dossier 71 (P)(i):* `MeromorphicOnNhd`-style packaging of `zetaC` on
ℂ minus poles via `Mathlib/Analysis/Meromorphic/Basic.lean` (`MeromorphicAt` :36; products
meromorphic `MeromorphicAt.prod` :110) — poles exactly at `s ∈ {0, 1}`: `wOf q s = 1` iff
`s ∈ 2πi·(log q)^{-1}·ℤ` (incl. 0) and `q·wOf q s = 1` iff `s = 1 + 2πi…` — the "exactly"
clause needs the full kernel description of `Complex.exp`, `Complex.exp_eq_one_iff`
(`Exponential.lean:324`). If the fresh Meromorphic API (NormalForm/Divisor/LogDeriv) fights
back, degrade to: `Differentiable ℂ (zetaC A q)` on `{s | s.re ≠ 0 ∧ s ≠ 1}` — kernel-light,
statement equally comparable. (ii) *Periodicity* of the nontrivial zero set: `s ↦ s + 2πi/log q`
invariance from `Complex.exp_periodicity` (`exp_add` route). (iii) *Anti-CT pairing (dossier 71
(C)):* one theorem conjoining W1 with the DZDF challenge statement imported from the
DedekindZetaZeroFree challenge file — **Tier B-DZDF only** (that challenge file is elaborable on
our pin per `axiommath-bump` logs, but importing it adds the DZZF project as a dependency;
default OFF, on if the pilot has slack).

---

## §3 Import-tier ladder (Stacks-gated tiers marked)

| Tier | Producer side | What changes vs §2 | Gated by |
|---|---|---|---|
| **C (default, this spec)** | transcribe §2.1's statement verbatim into a probe-convention preamble (~25 LoC + header "not a proof artifact", the `research/pilots/01/BindingSurface.lean` pattern); `hWeil` is the §2.2 binder | nothing — all §2 statements are Tier C as written | **nothing** (mathlib `ff2494ea` only) |
| **B** | import `Weil.LeanEval.WeilConjectures` and use `weil_conjectures'` Prop directly as the binder body | binder body becomes the imported exact Prop (provenance fidelity only; no new conclusions) | **G6** (AxiomMath/Stacks clone + build of the Weil tree's StacksFrontier imports; ~63k modules, no olean cache — bridge §5; A7 pricing queued as G6). Note: no "statement-only" middle tier exists — Lean imports are transitive, `Weil/Definitions.lean:4–6` already reaches StacksFrontier, so **B′ = C** |
| **A** | discharge `hWeil := fun F _ X _ d _ => LeanEval…weil_conjectures F X d` | the pilot's theorems become unconditional, kernel-checking the whole Deligne chain (StacksFrontier purity → Weil → LeanEval) | G6 + full Weil build on Modal (axbump never built Weil; treat as aspirational bonus, 72-prework R6 pattern) |

DZZF side (optional P2c(iii) only): the `Challenge/DedekindZetaChallenge.lean` statement imports
mathlib alone and elaborates on our pin (`axiommath-bump` logs: "challenge
DedekindZetaZeroFree/Challenge/DedekindZetaChallenge.lean: OK") — ungated if wanted.

---

## §4 Port / substrate inventory (all [VERIFIED] on `ff2494ea` this session)

**From Weil (cite-only at Tier C; never imported):** `LeanEval…weil_conjectures`
(`WeilConjectures.lean:185–194`, transcribed §2.1); `satisfiesWeilEstimate`
(`DeligneWeilConjecture.lean:367` — the RH engine behind the binder, Stacks-gated);
`exists_zetaSeries_mul_prod_even_eq_prod_odd` (`WeilRiemannHypothesisForm.lean:206` — the
ℤ-polynomial form our `lPoly` mirrors at the multiset level); `logDerivative_zetaSeries`
(`ZetaSeries.lean:144` — cited in the dossier, unused in the pilot);
`natDegree_rationalFrobeniusCharpolyReverse` (`CharpolyDegree.lean:67` — the Tier-A genus
bookkeeping). tauceti genus-1 island (§2.3 precedent): `zetaFunction :153`, `mobiusAutOf :112`,
`:201`, `:244`, Hasse `HasseBound.lean:44` (cited; identification = FF-EZ4, out of scope).

**From mathlib (the working substrate):**
- `Complex.norm_exp (z : ℂ) : ‖exp z‖ = Real.exp z.re` — `Mathlib/Analysis/Complex/
  Trigonometric.lean:993` (D1's engine; note the *real* version `Real.abs_exp` is
  `Exponential.lean:289`, and only the ≤-bound `norm_exp_le_exp_norm` :477 is in Exponential.lean).
- `Complex.exp_eq_exp : exp x = exp y ↔ x = y` (real x y) — `Exponential.lean:320`;
  `Complex.exp_eq_one_iff : exp x = 1 ↔ x = 0` — `:324` (periodicity/pole work, P2c);
  `Complex.exp_re : (exp x).re = Real.exp x.re * Real.cos x.im` — `:522` (backup route).
- `Polynomial.differentiable : Differentiable 𝕜 fun x => p.eval x` —
  `Mathlib/Analysis/Calculus/Deriv/Polynomial.lean:96` (entireness of `lPoly`'s eval; P2c(i)).
- `Multiset.prod_ne_zero` / `Multiset.prod_eq_zero_iff` —
  `Mathlib/Algebra/BigOperators/Ring/Multiset.lean:39,36` (+ `Ring/List.lean` List twin);
  `Multiset.card_map` — `Mathlib/Data/Multiset/MapFold.lean:105`; the `Multiset.sum_map_*`
  family (`Algebra/BigOperators/GroupWithZero/Multiset.lean` et al.) for D3/HW.
- `Fintype.one_lt_card [Nontrivial α] : 1 < card α` — `Mathlib/Data/Fintype/EquivFin.lean:257`
  (the `1 < Nat.card F` side condition, from `Field ⇒ Nontrivial`).
- `Real.log_pos`, `Real.exp_lt_exp`/`Real.exp_le_exp`/`Real.exp_lt_one_iff`,
  `Real.exp_mul`, `Real.sq_sqrt`, `Real.sqrt_nat_cast` — `Mathlib/Analysis/SpecialFunctions/`
  (`Pow/Real.lean`, `Functions.lean`; standard, spot-checked present).
- Optional P2c: `Mathlib/Analysis/Meromorphic/Basic.lean` (`MeromorphicAt` :36,
  `MeromorphicAt.prod` :110), `…/NormalForm.lean`, `…/IsolatedZeros.lean`, `…/Order.lean`
  (fresh-but-present API; R3).
- `norm_add_le`, `Complex.norm_mul`, `Complex.norm_natCast`, `Complex.norm_eq_abs`-family —
  standard normed-field layer.

**Absent from mathlib (confirmed):** any zeta of a variety over 𝔽_q; any `PowerSeries.eval`-based
analytic-evaluation shortcut we'd need (D1 route replaces it); a Multiset norm-sum lemma (D2
supplies); `Real.sqrt (x^n) = (Real.sqrt x)^n` as a one-liner (avoided by the `(√q)^m`
normalization, R2).

---

## §5 Risk register

- **R1 — statement-fidelity of the transcription.** A universe/instance/order deviation from
  `WeilConjectures.lean:185` surfaces only at Tier A. Mitigation: verbatim transcription
  discipline (§2.2 note), P0 elaborates the binder against the §2.1 import set, and the
  `WeilData` field text is copied clause-for-clause. Residual: low.
- **R2 — real-power representation.** `q^{−s}`, `q^{m/2}` tempt `cpow`/`rpow` (branch cuts,
  `rpow`-lemma friction). Decision (§2.3.4 / §2.4–2.5): `wOf` via `Complex.exp (−s·log q)`,
  moduli via `Real.exp (−σ·log q)`, the HW bound as `(Real.sqrt (q:ℝ))^m` — zero `rpow`
  occurrences in the whole pilot. The `hs1 : s ≠ 1` pole exclusion of W1 is the one place a
  kernel computation (`exp_eq_exp` + imaginary part) is genuinely needed; budgeted in P2.
- **R3 — Meromorphic API maturity (optional P2c only).** `Mathlib/Analysis/Meromorphic/*` is
  fresh (NormalForm/Divisor/LogDeriv landed recently); the pole-"exactly" clause needs the full
  `exp` kernel description. Fallback: plain `Differentiable`-on-complement form (§2.6(i)),
  equally comparable. No effect on W1/W2/HW.
- **R4 — scope creep (explicitly banned).** OUT: dossier 71 (W) base-change warm-up and (S)
  family proportions (separate tranches; (S) is hypothesis-binder research territory); any
  proportion/multiplicity statement (falsity trap — bridge §4 standing rule); genus-1
  identification (FF-EZ4); sheaf L-functions (FF-EZ3/dossier 73); anything needing Stacks
  (that's G6/Tier B/A, post-success). Success criterion: W1 + W2 + HW kernel-clean + axcheck.
- **R5 — Suzuki clock (2610.41115).** Depreciates dossier 71's (S) zone, NOT this pilot's
  dictionary/statements (transfer-of-statement, formal, no competitor found by FF-1/FF-6).
  Noted so triage prices 71's items separately.
- **R6 — ∀E-form vs Weil's `pointCountOfDegree`.** HW quantifies over arbitrary `E` with
  `finrank F E = m` (matches the binder's own clause; no irreducible-polynomial or
  `FiniteField.Extension` construction needed). Instantiating at Weil's chosen degree-m
  extension (for the literal `A_m = #C(𝔽_{q^m})` reading) needs a finrank lemma Weil proves
  internally — Tier A concern only; noted so nobody burns pilot time on it.
- **R7 — `Nat.card` vs `Fintype.card` friction.** The donor mixes `Nat.card F` (statement) with
  `Fintype` instances (`one_lt_card`); the cast lemmas are standard but fiddly; concentrated
  once in D1's side conditions (`hq : 1 < Nat.card F`), not scattered through the theorems.

---

## §6 Modal run plan sketch (no execution now) + effort

- **Runner:** clone `research/pilots/32/run_pilot.sh` → `research/pilots/71/run_pilot.sh`
  (stage `/tmp/crossmath-71-stage`, world-readable; app `crossmath-pilot-71`; image recipe =
  `feasibility/axiommath-bump/axbump.py`'s: elan v4.2.4, `v4.36.0-rc2`, mathlib clone at
  `ff2494ea` + `lake exe cache get`; cold ≈ 3¾ min, warm ≈ 68 s–2.5 min, AGENTS.md cost model).
  **P0 doubles as the A7-style preflight** for the FF cluster's mathlib-only tier: it elaborates
  the §2.1 import list + all §2.2–2.5 statements in one staged file (probe-convention header,
  `sorry` allowed in the probe file per AGENTS.md probe convention — statements only), and its
  log is the evidence G6-independent feasibility. Feed P0's log to A7 alongside G6 so the
  Stacks-pricing decision has the no-Stacks baseline on record.
- **Milestones:** P0 (S, ≤ 1 warm run) = statement elaboration probe; P1 (S–M, ≈ 0.2–0.35k
  LoC) = D1 + D2 + D3 + side-condition plumbing; P2 (M, ≈ 0.3–0.5k LoC) = W1, then W2, then HW
  (that order: W1's denominator work is shared with W2's kernel step; HW is independent);
  P2c (optional S–M) = meromorphic packaging / periodicity / anti-CT pairing; P3 (S) =
  axcheck sweep (`research/feasibility/probe/run_axcheck.sh` pattern, TARGETS in make_axcheck;
  every new theorem `#print axioms`-clean, 0 sorry — pilot standard). Logs to
  `research/pilots/71/logs/` with provenance headers (log-rescue lesson).
- **Total estimate: 0.6–1.0k LoC, M overall** — comparable to pilot 42; no donor builds; every
  gate is self-imposed (scope, not infrastructure).

## §7 Recommendation — GO (ungated), sequencing

1. P0 first (one warm Modal run) — it is simultaneously the pilot's statement check, the FF
   cluster's mathlib-tier preflight, and G6's baseline datum.
2. P1 (D1–D3) — the dictionary; everything downstream is elementary once D1 is in.
3. P2 in order W1 → W2 → HW; P2c only with slack; Tier B/A upgrades wait on G6 and are never
   dependencies. R4's ban list enforced at every milestone.

## §8 Sources (this session)

Weil: `Weil/LeanEval/WeilConjectures.lean:185–194` (verbatim), `:85`, `:321` (context);
`Weil/Definitions.lean:4–6,57,87`; `…/Trace/WeilRiemannHypothesisForm.lean:206–213`;
`…/Trace/DeligneWeilConjecture.lean:367`; `…/Trace/CharpolyDegree.lean:67`;
`…/Defs/…/Trace/ZetaSeries.lean:144`; README (LeanEval section). tauceti:
`TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Frobenius/Zeta.lean:112,153,201,244`,
`…/HasseBound.lean:44`. mathlib (`ff2494ea`): `Analysis/Complex/Trigonometric.lean:993`,
`Analysis/Complex/Exponential.lean:289,320,324,522,477`,
`Analysis/Calculus/Deriv/Polynomial.lean:96`, `Algebra/BigOperators/Ring/Multiset.lean:39`,
`Data/Fintype/EquivFin.lean:257`, `Analysis/Meromorphic/Basic.lean:36,110` (+ dir listing),
`AlgebraicGeometry/Morphisms/{Smooth.lean:126,Proper.lean:40}`,
`AlgebraicGeometry/Geometrically/Irreducible.lean`. This repo: `research/bridges/
function-field.md` (own, this cycle), `research/candidates/71-function-field-splane-dictionary.md`
(A9, on disk), `research/novelty/round-4.md` §1, `research/pilots/72-prework.md` (format model),
`research/pilots/32/run_pilot.sh`, `research/pilots/01/BindingSurface.lean` (header pattern),
`research/feasibility/axiommath-bump/{axbump.py,logs/}`, `research/feasibility/probe/
run_axcheck.sh`.
