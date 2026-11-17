/-
Pilot 75-N2 P0 — the statement rung of the ℚ ray-class↔Dirichlet consumer.

CHARTER: orchestrator GO ruling of 2026-11-17 ("75-N2 pilot P0 is GO, executed by you"),
executing dossier `research/candidates/75-N2-rayclass-dirichlet-consumer.md` §Pilot
spec skeleton (P0), the Iteration-4 continuation of dossier 75's C2 arm. Engine: the
GREEN `zetaL_assembly_landed` (`research/pilots/75/Pa.lean:1473`, run6-final triad),
consumed by sibling import (`import Pa`; the pilot-11 dependency-order olean pattern —
runner `run_n2p0.py` compiles Pa.lean first with `lean -o` and puts it on LEAN_PATH).

HYGIENE CLASS: STATEMENT RUNG, ZERO-SORRY BY CONSTRUCTION. No probe-header sorry class
is used: every mathematical obligation is an explicit named hypothesis binder of the
theorem below or a named Prop below (the P1/P2/P3 discharge targets); the only proof
in this file is one application of the GREEN engine plus mathlib one-liners for the
component analyticity (`DirichletCharacter.differentiable_LFunction`,
`Mathlib/NumberTheory/LSeries/DirichletContinuation.lean:97`). This is the M2b
`zetaK_two_thirds_landed` binder posture (pilots/42/M2b.lean:1062) one degree up the
tower, not a proof-artifact probe.

FENCES (dossier §F2, standing):
* DZDF is DO-NOT-CONSUME as a build dependency (G1b FAIL; vendor CFT breaks vs our
  pin ff2494ea) — its `RayClassCharacter` structure fields and `abelianFactorization`
  statement are QUOTED as Props below (`IsDZDFRayClassCharacterQ`,
  `DZDFAbelianFactorizationQ`), never imported.
* zeta23 is v4.33 — statement-port only: the Theorem-E counting vocabulary
  (`Challenge.lean:92-108`, read verbatim 2026-11-16) and the `thmE_A₀` conclusion
  shape (`Zeta23/ThmE/Final.lean:93-96`; audit GREEN `pilots/zeta23e/logs/
  zeta23e-p0-run1.log`, triad-only) are transcribed here under this namespace.
* ZetaZerosV2 direct import (the M4b ζ-column discharge) is deferred to P3; at P0 the
  ζ-column is the engine's own `hAK` slot at 2/3.

RUN-2 NOTE (error classes fixed vs run 1, log `logs/n2-p0-run1.log`): the transcription
section now carries `[NeZero q]` (zeta23 parity; `DirichletCharacter.LFunction`
requires it — DirichletContinuation.lean:50); `zeroMultL`/`NcountL`/`N0starL` are
`noncomputable` (`analyticOrderAt` is noncomputable); the landing is stated over an
abstract component-function family `Lχ` identified to the L-functions by an
@-explicit binder `hLχ` (with `hN : ∀ i, NeZero (q i)` as instance DATA), so instance
search never runs on the dependent family; the P2 port schema is stated at the
primitive level and the immunity schema in pair form (no `primitiveCharacter`
instantiation inside defs — its `NeZero conductor` demand is not synthable there).

BINDER INVENTORY (the honest ledger; discharge milestones per the dossier):
* consumed by the landing `zetaL_rat_two_thirds_landed`: hK/hL (continuation
  analyticity off {1}; classical), hntopK/hntopL/hntopψ (non-degeneracy; classical,
  dischargeable), hAbFacQ (the Dirichlet-form factorization over ℚ — P1 derives it
  from `DZDFAbelianFactorizationQ` + the dictionary), hne (nonprincipality transfer
  `1 < q i ∧ ψ i ≠ 1` — P1, from DZDF ¬IsPrincipal), hN/hLχ (level-instance data +
  definitional identification `Lχ i = (ψ i).LFunction`, @-passed — discharged by rfl
  at the consumer once levels are fixed), hfinK/hfinL/hfinψ (window finiteness; fL
  classical-unformalized, components dischargeable P2 from entireness), hAK (ζ-column
  at 2/3 — P3, V2 import `ZetaZeros.simple_proportion_d4` per the M4b pattern),
  hEχcum (per-component cumulative 2/3 proportions — P2, from the dyadic donor binder
  + hUnb).
* named discharge targets (Props below, not consumed by the landing):
  `DZDFAbelianFactorizationQ` (P1 input; the DZDF statement-binder),
  `HasQDirichletDictionary` (P1: the N2-a dictionary), `DirichletFactorizationTransferQ`
  (P1: dictionary ⇒ Dirichlet-form factorization), `HasEulerStripImmunity` (P2 first
  half: N2-b imprimitivity strip immunity, pair form over (ψ, primitive associate)),
  `ThmEDyadic` + `CountsUnbounded` + `ThmEDyadicToCumulative` (P2 second half: the
  N2-c port with the classical zero-infinitude structural binder hUnb — Titchmarsh
  §5.8/Davenport ch. 9, unformalized; stated at the primitive level, composed with
  the immunity schema for imprimitive components).
-/
import Mathlib
import Pa

namespace CrossMath.Pilot75N2

open Set Finset Filter
open scoped NumberField Classical Topology

open CrossMath.Pilot75

/-! ## The zeta23 Theorem-E counting vocabulary, transcribed (statement-port)
Verbatim shapes of `anthropics_formal-math/zeta23/Challenge.lean:92-108` over mathlib's
`DirichletCharacter.LFunction` (`Mathlib/NumberTheory/LSeries/DirichletContinuation.lean:60`,
on-pin ff2494ea; `[NeZero q]` per the zeta23 section, Challenge.lean:87). `∑ᶠ` is
mathlib's `finsum` (BigOperators/Finprod.lean). -/

variable {q : ℕ} [NeZero q] (χ : DirichletCharacter ℂ q)

/-- ρ is a nontrivial zero of L(·,χ) (zeta23 `IsNontrivialZeroL`, Challenge.lean:92). -/
def IsNontrivialZeroL (ρ : ℂ) : Prop := χ.LFunction ρ = 0 ∧ 0 < ρ.re ∧ ρ.re < 1

/-- Order of vanishing of L(·,χ) at ρ (zeta23 `zeroMultL`, Challenge.lean:95). -/
noncomputable def zeroMultL (ρ : ℂ) : ℕ := (analyticOrderAt χ.LFunction ρ).toNat

/-- Nontrivial zeros with `T₁ < Im ρ ≤ T₂` (zeta23 `zerosInL`, Challenge.lean:98). -/
def zerosInL (T₁ T₂ : ℝ) : Set ℂ := {ρ | IsNontrivialZeroL χ ρ ∧ T₁ < ρ.im ∧ ρ.im ≤ T₂}

/-- `N_χ(T₁,T₂)`: with multiplicity (zeta23 `NcountL`, Challenge.lean:101). -/
noncomputable def NcountL (T₁ T₂ : ℝ) : ℕ := ∑ᶠ ρ ∈ zerosInL χ T₁ T₂, zeroMultL χ ρ

/-- `N*_{0,χ}(T₁,T₂)`: distinct on the critical line (zeta23 `N0starL`, Challenge.lean:105). -/
noncomputable def N0starL (T₁ T₂ : ℝ) : ℕ := (zerosInL χ T₁ T₂ ∩ {ρ | ρ.re = 1 / 2}).ncard

/-- **ThmE_A₀, donor statement-port** (`Zeta23/ThmE/Final.lean:93-96`, wrapper
`Solution.lean:106-109`; scope hypotheses as implications, EnclOK style): for every
primitive Dirichlet character mod q > 1, at least (2/3 − ε)·N_χ(T,2T] of the zeros are
matched by DISTINCT critical-line zeros, dyadic windows. Donor chain audited triad-only
at the zeta23 pin (`pilots/zeta23e/logs/zeta23e-p0-run1.log`). -/
def ThmEDyadic : Prop :=
  1 < q → χ.IsPrimitive →
    ∀ ε > 0, ∃ T₀ : ℝ, ∀ T ≥ T₀,
      (2 / 3 - ε) * (NcountL χ T (2 * T) : ℝ) ≤ N0starL χ T (2 * T)

/-! ## The DZDF statement-binders, quoted (never imported; G1b fence) -/

/-- Verbatim-field quote of DZDF `RayClassCharacter F 𝔪` at F = ℚ
(`axiommath/DedekindZetaZeroFree/Challenge/DedekindZetaChallenge.lean:14-20`):
a multiplicative, normalized function on the ideals of 𝓞 ℚ, vanishing exactly off the
coprime cone, trivial on totally-positive principal generators ≡ 1 mod m (the narrow-ray
congruence — over ℚ, α > 0; the modulus (q)·∞ of the tauceti dictionary). The carrier is
flattened to a bare function because the DZDF structure itself cannot be imported. -/
def IsDZDFRayClassCharacterQ (m : Ideal (𝓞 ℚ)) (χ : Ideal (𝓞 ℚ) → ℂ) : Prop :=
  (∀ I J : Ideal (𝓞 ℚ), χ (I * J) = χ I * χ J) ∧
    χ ⊤ = 1 ∧
    (∀ I : Ideal (𝓞 ℚ), χ I = 0 ↔ I = ⊥ ∨ I ⊔ m ≠ ⊤) ∧
    ∀ α : 𝓞 ℚ, α ≠ 0 → α - 1 ∈ m → (∀ φ : ℚ →+* ℝ, 0 < φ (α : ℚ)) →
      χ (Ideal.span {α}) = 1

/-- Verbatim quote of DZDF `RayClassCharacter.IsPrincipal` at F = ℚ
(`DedekindZetaChallenge.lean:26-28`). -/
def IsDZDFPrincipalQ (m : Ideal (𝓞 ℚ)) (χ : Ideal (𝓞 ℚ) → ℂ) : Prop :=
  ∀ I : Ideal (𝓞 ℚ), I ≠ ⊥ → I ⊔ m = ⊤ → χ I = 1

/-- **The DZDF factorization statement-binder** — verbatim quote of `abelianFactorization`
at K = ℚ (`…/DedekindZetaZeroFree/LFunctions/Dedekind/AbelianRayCharacterFactorization.lean:62-73`,
read at the sibling 2026-11-17): for every abelian Galois L/ℚ there exist finitely many
moduli and DZDF ray-class characters, nonprincipal, with ζ_L = (∏ Hecke series)·ζ on
ℜs > 1. A THEOREM in the donor (CFT via `conductorRayRealization`); we cannot import it
(G1b) — P1 consumes this binder through the dictionary. -/
def DZDFAbelianFactorizationQ (L : Type) [Field L] [NumberField L]
    [Algebra ℚ L] [IsGalois ℚ L]
    (hcomm : ∀ σ τ : L ≃ₐ[ℚ] L, σ * τ = τ * σ) : Prop :=
  ∃ (n : ℕ) (m : Fin n → Ideal (𝓞 ℚ)) (χ : (i : Fin n) → Ideal (𝓞 ℚ) → ℂ),
    (∀ i, m i ≠ ⊥ ∧ ¬ IsDZDFPrincipalQ (m i) (χ i)
      ∧ IsDZDFRayClassCharacterQ (m i) (χ i)) ∧
    ∀ s : ℂ, 1 < s.re →
      NumberField.dedekindZeta L s =
        (∏ i : Fin n, ∑' I : Ideal (𝓞 ℚ), χ i I * (Ideal.absNorm I : ℂ) ^ (-s)) *
          NumberField.dedekindZeta ℚ s

/-! ## The named P1/P2 discharge targets (Props; the dossier's N2-a/N2-b/N2-c shapes)
Inside these Props the L-function is referenced `@`-explicitly (`⟨hq⟩`-style instance
witnesses) because ∃-bound level variables do not feed instance search. -/

/-- **N2-a, the ℚ dictionary (P1 target)**: for a DZDF-quoted character of the modulus
(q) of 𝓞 ℚ there is a Dirichlet character χ̂ mod q with the value dictionary on
principal ideals, the L-series identification on ℜs > 1 (Hecke tsum = mathlib
`LFunction`), and principality transfer. -/
def HasQDirichletDictionary (m : Ideal (𝓞 ℚ)) (χ : Ideal (𝓞 ℚ) → ℂ) : Prop :=
  ∃ (q : ℕ) (hq : q ≠ 0) (hm : m = Ideal.span {(q : 𝓞 ℚ)})
    (ψ : DirichletCharacter ℂ q),
    (∀ k : ℕ, χ (Ideal.span {(k : 𝓞 ℚ)}) = ψ (k : ZMod q)) ∧
    (∀ s : ℂ, 1 < s.re →
      ∑' I : Ideal (𝓞 ℚ), χ I * (Ideal.absNorm I : ℂ) ^ (-s)
        = @DirichletCharacter.LFunction q ⟨hq⟩ ψ s) ∧
    (IsDZDFPrincipalQ m χ ↔ ψ = 1)

/-- **P1 target (factorization transfer)**: the dictionary converts a DZDF-quoted
factorization (Hecke-series form, ℜs > 1) into the Dirichlet-LFunction form the engine
consumes, delivering the nonprincipality scope `1 < q i ∧ ψ i ≠ 1`. The half-plane →
ℂ∖{1} identity-theorem extension (the DZDF `EntireAbelianQuotient.lean:34-49` pattern)
is part of P1's proof, not of this shape. -/
def DirichletFactorizationTransferQ (fK fL : ℂ → ℂ) (n : ℕ)
    (m : Fin n → Ideal (𝓞 ℚ)) (χ : (i : Fin n) → Ideal (𝓞 ℚ) → ℂ) : Prop :=
  (∀ i, HasQDirichletDictionary (m i) (χ i)) →
    (∀ s : ℂ, 1 < s.re →
      fL s = (∏ i : Fin n, ∑' I : Ideal (𝓞 ℚ), χ i I * (Ideal.absNorm I : ℂ) ^ (-s)) * fK s) →
    ∃ (q : Fin n → ℕ) (hN : ∀ i, NeZero (q i)) (ψ : (i : Fin n) → DirichletCharacter ℂ (q i)),
      (∀ i, 1 < q i ∧ ψ i ≠ 1) ∧
      ∀ s : ℂ, 1 < s.re →
        fL s = (∏ i : Fin n, @DirichletCharacter.LFunction (q i) (hN i) (ψ i) s) * fK s

/-- **N2-b, Euler-correction strip immunity (P2 target, first half; pair form)**: an
imprimitive character ψ and its primitive associate χ' have the same strip zero
multiplicities (at application time χ' := mathlib `ψ.primitiveCharacter`; the correction
factors `1 − ψ p p⁻ˢ` vanish only on ℜs = 0 — mathlib `LSeries_changeLevel`,
EulerProduct/DirichletLSeries.lean:173). -/
def HasEulerStripImmunity {N q' : ℕ} [NeZero N] [NeZero q']
    (ψ : DirichletCharacter ℂ N) (χ' : DirichletCharacter ℂ q') : Prop :=
  ∀ ρ : ℂ, 0 < ρ.re → ρ.re < 1 →
    multOf ψ.LFunction ρ = multOf χ'.LFunction ρ

/-- **The classical structural binder hUnb**: the component zero count is unbounded
(zero-infinitude for Dirichlet L — Titchmarsh §5.8 / Davenport ch. 9; classical,
unformalized in mathlib; needed only for the dyadic→cumulative absorption). -/
def CountsUnbounded {N : ℕ} [NeZero N] (ψ : DirichletCharacter ℂ N)
    (hfin : WindowFinite (multOf ψ.LFunction)) : Prop :=
  Filter.Tendsto (fun T => ((⟨multOf ψ.LFunction, hfin⟩ : ZeroMult).countCum T : ℝ))
    atTop atTop

/-- **N2-c, the hEχ port schema (P2 target, second half; stated at the primitive
level)**: for a PRIMITIVE χ, the donor's dyadic distinct-numerator 2/3 bound plus the
classical unboundedness binder yields the engine's cumulative with-multiplicity
`EpsLowerCum` at 2/3. For imprimitive components P2 composes this with
`HasEulerStripImmunity` (the distinct→with-multiplicity and window-identification
arguments are article-42 §4's recorded safe-direction conversions, part of P2's proof,
not of this shape). -/
def ThmEDyadicToCumulative (χ : DirichletCharacter ℂ q)
    (hfin : WindowFinite (multOf χ.LFunction)) : Prop :=
  CountsUnbounded χ hfin → ThmEDyadic χ → EpsLowerCum ⟨multOf χ.LFunction, hfin⟩ (2 / 3)

/-! ## P0 — the statement-rung landing (the only proof: one engine application)
The composed N2-d shape at its P0 honesty level: for every abelian L/ℚ whose
factorization data has been translated to Dirichlet form (hAbFacQ; P1's output), with
the ζ-column at 2/3 (hAK; P3 discharges via V2) and every Dirichlet component at 2/3
(hEχcum; P2 derives from the audited donor binder + hUnb), the assembled ζ_L zero data
carries 2/3 — every proportion input a named binder, the engine GREEN since run6.
The component functions are an abstract family `Lχ` identified to the L-functions by
the @-explicit binder `hLχ` (with the level instances `hN` as data): instance search
never runs on the dependent family inside the statement. -/

/-- **N2-d at P0** — `zetaL_rat_two_thirds_landed`: conditional on the Dirichlet-form
factorization binder + the structural set + the two proportion binder slots, the
with-multiplicity cumulative on-line proportion of ζ_L is ≥ 2/3, for every abelian
extension L/ℚ (the L-side data enters only through fL, hL, hfinL, hAbFacQ). -/
theorem zetaL_rat_two_thirds_landed {fK fL : ℂ → ℂ} {n : ℕ} {q : Fin n → ℕ}
    (ψ : (i : Fin n) → DirichletCharacter ℂ (q i))
    (Lχ : Fin n → ℂ → ℂ)
    (hN : ∀ i, NeZero (q i))
    (hne : ∀ i, 1 < q i ∧ ψ i ≠ 1)
    (hLχ : ∀ i, Lχ i = @DirichletCharacter.LFunction (q i) (hN i) (ψ i))
    (hK : ∀ ρ : ℂ, ρ ≠ 1 → AnalyticAt ℂ fK ρ)
    (hL : ∀ ρ : ℂ, ρ ≠ 1 → AnalyticAt ℂ fL ρ)
    (hntopK : ∀ ρ : ℂ, ρ ≠ 1 → analyticOrderAt fK ρ ≠ ⊤)
    (hntopL : ∀ ρ : ℂ, ρ ≠ 1 → analyticOrderAt fL ρ ≠ ⊤)
    (hntopψ : ∀ i (ρ : ℂ), analyticOrderAt (Lχ i) ρ ≠ ⊤)
    (hAbFacQ : ∀ s : ℂ, s ≠ 1 → fL s = (∏ i, Lχ i s) * fK s)
    (hfinK : WindowFinite (multOf fK)) (hfinL : WindowFinite (multOf fL))
    (hfinψ : ∀ i, WindowFinite (multOf (Lχ i)))
    (hAK : EpsLowerCum ⟨multOf fK, hfinK⟩ (2 / 3))
    (hEχcum : ∀ i, EpsLowerCum ⟨multOf (Lχ i), hfinψ i⟩ (2 / 3)) :
    EpsLowerCum ⟨multOf fL, hfinL⟩ (2 / 3) :=
  zetaL_assembly_landed (c₀ := 2 / 3) (cStar := 2 / 3) (c := fun _ => 2 / 3)
    (F := Lχ) hK
    (fun i ρ => by
      haveI : NeZero (q i) := hN i
      rw [hLχ i]
      exact DifferentiableOn.analyticAt
        ((DirichletCharacter.differentiable_LFunction (hne i).2).differentiableOn)
        (isOpen_univ.mem_nhds (mem_univ ρ)))
    hntopK hntopψ hAbFacQ hfinK hfinL hfinψ (le_refl _) (fun _ => le_refl _) hAK hEχcum

-- Statement-layer name/shape pins (the binder inventory, elaborated).
#check @CrossMath.Pilot75N2.ThmEDyadic
#check @CrossMath.Pilot75N2.IsDZDFRayClassCharacterQ
#check @CrossMath.Pilot75N2.IsDZDFPrincipalQ
#check @CrossMath.Pilot75N2.DZDFAbelianFactorizationQ
#check @CrossMath.Pilot75N2.HasQDirichletDictionary
#check @CrossMath.Pilot75N2.DirichletFactorizationTransferQ
#check @CrossMath.Pilot75N2.HasEulerStripImmunity
#check @CrossMath.Pilot75N2.CountsUnbounded
#check @CrossMath.Pilot75N2.ThmEDyadicToCumulative
#check @CrossMath.Pilot75N2.zetaL_rat_two_thirds_landed

-- audit (expect: [propext, Classical.choice, Quot.sound] only; 0 sorryAx by construction).
-- Run-3 diagnostics: per-declaration prints pinpoint any sorryAx carrier (run 2 showed
-- the landing sorry-dependent with no visible error — the per-decl prints localize it).
#print axioms CrossMath.Pilot75N2.IsNontrivialZeroL
#print axioms CrossMath.Pilot75N2.zeroMultL
#print axioms CrossMath.Pilot75N2.zerosInL
#print axioms CrossMath.Pilot75N2.NcountL
#print axioms CrossMath.Pilot75N2.N0starL
#print axioms CrossMath.Pilot75N2.ThmEDyadic
#print axioms CrossMath.Pilot75N2.IsDZDFRayClassCharacterQ
#print axioms CrossMath.Pilot75N2.IsDZDFPrincipalQ
#print axioms CrossMath.Pilot75N2.DZDFAbelianFactorizationQ
#print axioms CrossMath.Pilot75N2.HasQDirichletDictionary
#print axioms CrossMath.Pilot75N2.DirichletFactorizationTransferQ
#print axioms CrossMath.Pilot75N2.HasEulerStripImmunity
#print axioms CrossMath.Pilot75N2.CountsUnbounded
#print axioms CrossMath.Pilot75N2.ThmEDyadicToCumulative
#print axioms CrossMath.Pilot75N2.zetaL_rat_two_thirds_landed

end CrossMath.Pilot75N2
