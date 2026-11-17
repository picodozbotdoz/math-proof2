/-
Pilot FF-EZ4 P0 — genus-1 identification (tauceti zetaFunction ↔ Weil/LeanEval zeta
data), STATEMENT-FIRST probe. NOT A PROOF ARTIFACT (probe convention): every stmt is a
Prop-valued def; ZERO `sorry` (the Prop-def convention of pilots/01/MasterIdentity.lean —
nothing is proved here except one trivial binder-consumption wrapper, so no probe
scaffolding sorry is needed either). Elaboration verdict only.

Iteration-4 slot: r5 backlog §3 rank 9 / §14 row 9 (the FF-EZ4 + 22-T2a task-slot pair;
this file is FF-EZ4's half — 22-T2a's G9 preflight is GREEN separately). Week-1 relay
2026-11-17: execute the statement-first P0 on the warm route, fix-loop ≤ 3.

Statement architecture (binder-shaped statement-first, per the charter pairing):
  * Weil side — the LeanEval `weil_conjectures` statement, G3-VALIDATED verbatim
    (`feasibility/probe/ProbeG3_Weil.lean`: 0 errors on ff2494ea; the three geometric
    classes IsProper/GeometricallyIrreducible/SmoothOfRelativeDimension are MATHLIB
    classes on our pin — Stacks is proof-side only). Carried verbatim here as
    `HypWeilConjectures` plus the d = 1 instantiation `WeilBody1`.
  * tauceti side — G6b verdict (`feasibility/axiommath-donor-probes.md` §G6b): the
    EllipticCurve→Scheme path exists ONLY in tauceti (`projModel`,
    `Scheme/ProjModel.lean:98`; `toEllipticCurveGeom`, `Scheme/OfWeierstrass.lean`), and
    zetaFunction/Frobenius objects live in tauceti's isogeny layer — NOT transcribable.
    They therefore enter as BINDERS: trace `a : ℤ` (frobeniusTrace), counts
    `N : ℕ → ℤ` (deg(1 − πⁿ), Frobenius/Zeta.lean:153's coefficient function), zeta
    series `ζ : PowerSeries ℚ` (zetaFunction), each pinned by its DEFINING EQUATION as
    a hypothesis Prop (tauceti's `zetaFunction_def` :161, `zetaFunction_eq_mul_inv`
    :203, `frobeniusPowTrace`-shape bookkeeping, `coeff_finrank_logOf_zetaFunction`).
  * Transport — the count identification `HypTransport` (tauceti's isogeny-degree point
    counts = the scheme's morphism counts over every finite extension): the load-bearing
    content of "S is a model of E", opaque at P0 (instantiated at `projModel E` in the
    eventual pilot per G6b's route).

Identification target (the charter's dictionary node): with both defining systems in
place, the zeta data AGREE — α + β = a, αβ = q, N m = q^m + 1 − (α^m + β^m), and ζ is
the rational normal form (1 − aT + qT²)/((1 −T)(1 − qT)); tauceti's genus-1 RH
(Zeta.lean:244) and the Hasse bound (HasseBound.lean:44,
frobeniusTrace_sq_le_four_mul_card) are the trace form of the Weil-side norm clause
(FF-EZ1(iii) at g = 1).

Target: mathlib ff2494ea (toolchain v4.36.0-rc2). No sorry, no native_decide, no
external CAS; read-only donors cited by file:line only.
-/

import Mathlib

open CategoryTheory AlgebraicGeometry Polynomial

namespace CrossMath.FFEZ4

/-! ## Anchor preflight (mathlib ff2494ea homes of every bound surface) -/

#check @WeierstrassCurve.IsElliptic      -- AlgebraicGeometry/EllipticCurve/Weierstrass.lean:366
#check @AlgebraicGeometry.IsProper       -- Morphisms/Proper.lean:40 (G3)
#check @AlgebraicGeometry.GeometricallyIrreducible  -- Geometrically/Irreducible.lean:42 (G3)
#check @AlgebraicGeometry.SmoothOfRelativeDimension -- Morphisms/Smooth.lean:126 (G3)
#check @CategoryTheory.Over
#check @AlgebraicGeometry.Spec
#check @PowerSeries.exp                 -- RingTheory/PowerSeries/Exp.lean:50
#check @PowerSeries.subst
#check @PowerSeries.mk
#check @PowerSeries.C
#check @PowerSeries.X

/-! ## Weil side: the LeanEval statement (G3 verbatim) and its d = 1 instantiation -/

/-- **The Weil conjectures**, LeanEval conclusion as a binder Prop (verbatim carry of
`ProbeG3_Weil.lean`'s `HypWeilConjectures`, itself the verbatim conclusion of
`LeanEval.AlgebraicGeometry.WeilConjectures.weil_conjectures` :185–194). -/
def HypWeilConjectures {F : Type*} [Finite F] [Field F] (X : Over (Spec (.of F))) (d : ℕ) :
    Prop :=
  ∃ A : ℕ → Multiset ℂ, A 0 = {1} ∧
      (∀ i ≤ 2 * d, A (2 * d - i) = (A i).map (Nat.card F ^ d / · : ℂ → ℂ) ∧
        (∀ φ : ℂ ≃+* ℂ, (A i).map φ = A i) ∧
        ∀ α ∈ A i, IsIntegral ℤ α ∧ ‖α‖ = √(Nat.card F ^ i)) ∧
      ∀ (E : Type _) [Field E] [Algebra F E] [FiniteDimensional F E],
        Nat.card (.mk (Spec.map <| CommRingCat.ofHom <| algebraMap F E) ⟶ X) =
          ∑ i ∈ Finset.Iic (2 * d), (-1) ^ i * ((A i).map (· ^ Module.finrank F E)).sum

/-- The LeanEval conclusion body at `d = 1`, as a predicate of the multiset family
(the specialization `HypWeilConjectures S 1 ↔ ∃ A, WeilBody1 S A`; stated as a Prop
below, `stmt_leanEval_d1_iff`). -/
def WeilBody1 {F : Type*} [Finite F] [Field F] (S : Over (Spec (.of F)))
    (A : ℕ → Multiset ℂ) : Prop :=
  A 0 = {1} ∧
    (∀ i ≤ 2, A (2 - i) = (A i).map (Nat.card F ^ 1 / · : ℂ → ℂ) ∧
      (∀ φ : ℂ ≃+* ℂ, (A i).map φ = A i) ∧
      ∀ α ∈ A i, IsIntegral ℤ α ∧ ‖α‖ = √(Nat.card F ^ i)) ∧
    ∀ (L : Type _) [Field L] [Algebra F L] [FiniteDimensional F L],
      Nat.card (.mk (Spec.map <| CommRingCat.ofHom <| algebraMap F L) ⟶ S) =
        ∑ i ∈ Finset.Iic 2, (-1) ^ i * ((A i).map (· ^ Module.finrank F L)).sum

/-- The d = 1 instantiation equivalence (definitional; the eventual P1 discharge). -/
def stmt_leanEval_d1_iff {F : Type*} [Finite F] [Field F] (S : Over (Spec (.of F))) : Prop :=
  HypWeilConjectures S 1 ↔ ∃ A, WeilBody1 S A

/-- Genus-1 multiset family determined by the Frobenius pair (α, β):
`A 0 = {1}`, `A 1 = {α, β}`, `A 2 = {q}`, `A i = ∅` for `i > 2`. -/
def genus1A (α β q : ℂ) : ℕ → Multiset ℂ :=
  fun i => match i with
    | 0 => {1}
    | 1 => {α, β}
    | 2 => {q}
    | _ => ∅

/-- The Weil-side zeta datum of `S` in pure count form at genus 1: over every finite
extension of degree `m`, the morphism count is `q ^ m + 1 − (α ^ m + β ^ m)`. -/
def HypWeilGenus1 {F : Type*} [Finite F] [Field F] (S : Over (Spec (.of F))) (α β : ℂ) : Prop :=
  ∀ (L : Type _) [Field L] [Algebra F L] [FiniteDimensional F L],
    ((Nat.card (.mk (Spec.map <| CommRingCat.ofHom <| algebraMap F L) ⟶ S) : ℕ) : ℂ)
      = (Nat.card F : ℂ) ^ (Module.finrank F L : ℕ) + 1
          - ((α ^ (Module.finrank F L : ℕ) : ℂ) + (β ^ (Module.finrank F L : ℕ) : ℂ))

/-- Bridge (multiset → count): if the LeanEval witness at `S` can be taken to be the
genus-1 family, the count form holds (proof = summing the three multisets; P1). -/
def stmt_leanEval_to_genus1 {F : Type*} [Finite F] [Field F] (S : Over (Spec (.of F)))
    (α β : ℂ) : Prop :=
  (∃ A : ℕ → Multiset ℂ, WeilBody1 S A ∧ A = genus1A α β (Nat.card F)) → HypWeilGenus1 S α β

/-! ## tauceti side: defining equations as binders (G6b: not transcribable) -/

/-- Frobenius power-sum sequence determined by the trace alone (tauceti `PowTrace`
shape): `s 0 = 2`, `s 1 = a`, `s (n+2) = a·s(n+1) − q·s(n)`. -/
def tracePowSum (a q : ℤ) : ℕ → ℤ
  | 0 => 2
  | 1 => a
  | (n + 2) => a * tracePowSum a q (n + 1) - q * tracePowSum a q n

/-- tauceti count bookkeeping (Frobenius/Zeta.lean:153's coefficient function +
`frobeniusPowTrace` line): `N m = q ^ m + 1 − s_m(a)` for every `m`. -/
def HypTaucetiCounts {F : Type*} [Finite F] [Field F] (N : ℕ → ℤ) (a : ℤ) : Prop :=
  ∀ m : ℕ, N m = (Nat.card F : ℤ) ^ m + 1 - tracePowSum a (Nat.card F : ℤ) m

/-- The zeta numerator `1 − aT + qT²` (tauceti Zeta.lean:203/:94 shapes). -/
noncomputable def zetaNum (a q : ℚ) : PowerSeries ℚ :=
  1 - PowerSeries.C (R := ℚ) a * PowerSeries.X (R := ℚ)
    + PowerSeries.C (R := ℚ) q * (PowerSeries.X (R := ℚ)) ^ 2

/-- The zeta denominator `(1 − T)(1 − qT)`. -/
noncomputable def zetaDen (q : ℚ) : PowerSeries ℚ :=
  (1 - PowerSeries.X (R := ℚ)) * (1 - PowerSeries.C (R := ℚ) q * PowerSeries.X (R := ℚ))

/-- tauceti `zetaFunction_eq_mul_inv` (:203), restated multiplicatively as
`ζ · den = num` (equivalent to the mul-inv form for the unit denominator; avoids the
inverse API at statement level). -/
def HypTaucetiZetaRat (ζ : PowerSeries ℚ) (a q : ℚ) : Prop :=
  ζ * zetaDen q = zetaNum a q

/-- tauceti `zetaFunction_def` (:161), restated at binder `N`:
`ζ = exp ∘ subst (mk fun n => N n / n)`. -/
def HypTaucetiZetaDef (ζ : PowerSeries ℚ) (N : ℕ → ℤ) : Prop :=
  ζ = (PowerSeries.exp ℚ).subst (PowerSeries.mk fun n => (N n : ℚ) / (n : ℚ))

/-- The transport binder (G6b's `projModel` route, opaque at P0): tauceti's
isogeny-degree point counts equal the scheme's morphism counts over every finite
extension — the load-bearing content of "`S` is a model of `E`". -/
def HypTransport {F : Type*} [Finite F] [Field F] (S : Over (Spec (.of F))) (N : ℕ → ℤ) : Prop :=
  ∀ (L : Type _) [Field L] [Algebra F L] [FiniteDimensional F L],
    ((N (Module.finrank F L) : ℤ) : ℂ)
      = ((Nat.card (.mk (Spec.map <| CommRingCat.ofHom <| algebraMap F L) ⟶ S) : ℕ) : ℂ)

/-! ## The FF-EZ4 identification statements -/

/-- FF-EZ4 headline (statement-first; `E`'s tauceti data enter as the binder triple
`a`, `N`, `ζ`): if the transported scheme `S` has Weil-zeta genus-1 datum `(α, β)` and
tauceti's zeta data satisfy their defining equations, the two zeta data AGREE —
`α + β = a`, `αβ = q`, the count identification for every `m`, and `ζ` is the rational
normal form. -/
def stmt_ff_ez4_identification {F : Type*} [Finite F] [Field F]
    (E : WeierstrassCurve F) [E.IsElliptic] (S : Over (Spec (.of F)))
    (a : ℤ) (N : ℕ → ℤ) (ζ : PowerSeries ℚ) : Prop :=
  ∀ α β : ℂ,
    HypWeilGenus1 S α β → HypTransport S N → HypTaucetiZetaDef ζ N →
      (α + β = (a : ℂ)
        ∧ α * β = (Nat.card F : ℂ)
        ∧ ∀ m : ℕ, ((N m : ℤ) : ℂ)
            = (Nat.card F : ℂ) ^ (m : ℕ) + 1
                - ((α ^ (m : ℕ) : ℂ) + (β ^ (m : ℕ) : ℂ))
        ∧ HypTaucetiZetaRat ζ (a : ℚ) (Nat.card F : ℚ))

/-- The full conditional (the shape the eventual pilot proves): tauceti's count
bookkeeping for `E`'s data plus the identification. -/
def stmt_ff_ez4 {F : Type*} [Finite F] [Field F]
    (E : WeierstrassCurve F) [E.IsElliptic] (S : Over (Spec (.of F)))
    (a : ℤ) (N : ℕ → ℤ) (ζ : PowerSeries ℚ) : Prop :=
  HypTaucetiCounts (F := F) N a → stmt_ff_ez4_identification E S a N ζ

/-- tauceti genus-1 RH restated (Zeta.lean:244,
`norm_eq_inv_sqrt_card_of_one_sub_frobeniusTrace_mul_add_card_mul_sq_eq_zero`):
every complex zero of the zeta numerator has `|z| = q ^ (-1/2)`. -/
def stmt_ff_ez4_rh_g1 {F : Type*} [Finite F] [Field F] (a : ℤ) : Prop :=
  ∀ z : ℂ, 1 - (a : ℂ) * z + (Nat.card F : ℂ) * z ^ 2 = 0 → ‖z‖ = (√(Nat.card F : ℝ))⁻¹

/-- Hasse bound restated (HasseBound.lean:44, `frobeniusTrace_sq_le_four_mul_card`):
`a ^ 2 ≤ 4q` — the trace form of the g = 1 RH. -/
def stmt_ff_ez4_hasse_g1 {F : Type*} [Finite F] [Field F] (a : ℤ) : Prop :=
  a ^ 2 ≤ 4 * (Nat.card F : ℤ)

/-- FF-EZ1(iii) at g = 1 (Weil-side norm clause from the trace form): the genus-1 pair
of a real trace `a` with `αβ = q` and Hasse has `‖α‖ = ‖β‖ = √q`. -/
def stmt_ff_ez4_norm_from_hasse {F : Type*} [Finite F] [Field F] (a : ℤ) (α β : ℂ) : Prop :=
  α + β = (a : ℂ) → α * β = (Nat.card F : ℂ) → stmt_ff_ez4_hasse_g1 (F := F) a →
    ‖α‖ = √(Nat.card F : ℝ) ∧ ‖β‖ = √(Nat.card F : ℝ)

/-- RH transfer (tauceti ↔ Weil forms): the norm clause on the genus-1 pair gives
tauceti's RH form (zeros of the numerator are the inverted roots). -/
def stmt_ff_ez4_rh_transfer {F : Type*} [Finite F] [Field F] (a : ℤ) (α β : ℂ) : Prop :=
  α * β = (Nat.card F : ℂ) → ‖α‖ = √(Nat.card F : ℝ) → ‖β‖ = √(Nat.card F : ℝ) →
    stmt_ff_ez4_rh_g1 (F := F) a

/-- Binder-consumption pattern (trivial; validates the conditional-theorem shape,
ProbeG3's `conditional_shape` precedent). -/
theorem conditional_shape {F : Type*} [Finite F] [Field F]
    (E : WeierstrassCurve F) [E.IsElliptic] (S : Over (Spec (.of F)))
    (a : ℤ) (N : ℕ → ℤ) (ζ : PowerSeries ℚ)
    (h : stmt_ff_ez4 E S a N ζ) : stmt_ff_ez4 E S a N ζ := h

end CrossMath.FFEZ4
