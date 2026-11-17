/-
Pilot FF-EZ2 P0 — the surviving base-change simplicity statement (the exclusion-based
half of the Lamzouri-proportions zone), STATEMENT-FIRST probe. NOT A PROOF ARTIFACT
(probe convention): every stmt is a Prop-valued def; ZERO `sorry` (the Prop-def
convention of pilots/01/MasterIdentity.lean, achieved by the FF-EZ4 sibling
`pilots/ff-ez4/P0.lean`); nothing is proved here except one trivial binder-consumption
wrapper. Elaboration verdict only.

Iteration-4 slot: r5 backlog §2 S4 / §14 row 13 (FF-EZ2 survivor, seed-6's counting
half folded); CHARTER-GO 2026-11-17 on the battery
(`bridges/function-field.md` §4 FF-EZ2 "Battery (2026-11-17)"). S-class per the
battery; architecture = the FF-EZ4 P0 template (all-binder, mathlib-only, C1 [WARM]).

BATTERY GUARDS BINDING (bridge §4 design rule + battery pins, dated 2026-11-17):
  * Exclusion/family-quantified shapes ONLY — no uniform-in-family or "every curve"
    statement appears in this file. The falsity trap: families containing maximal
    members have all Frobenius angles θ = π (all eigenvalues equal), forcing zeta
    zeros of multiplicity ~ g. Pins (battery item 3, granularity-corrected):
    Fuhrmann arXiv:alg-geom/9610023 (maximal curves over F_{q²}; hyperelliptic
    maximal ⇒ g ≤ (q−1)/2) and Tafazolian–Torres 2012 (the maximal-hyperelliptic
    family; even-q instance y² + y = x^{q+1} of genus q/2). The vdG–vdV tables
    lineage (Zbl 0729.11066) is the survey source, not a theorem-number carrier.
  * Weil side = statement-level binder ONLY (G3/G6b class, never a build dep): the
    purity clause from `LeanEval/WeilConjectures.lean:185–194` and the base-change
    eigenvalue law = the conclusion of `Weil.rationalFrobeniusCharpolyReverse_
    eq_comp_of_comp_specAlgebraMap_eq` (`Weil/AlgebraicGeometry/EtaleCohomology/Trace/
    FieldOfConstantsFrobenius.lean:163`) — the direct import stays priced-out (G6a).
  * Claims dated 2026-11-17: month-clock clean (no new FF-proportion occupants;
    Suzuki arXiv:2610.41115 remains a method-neighbor without proportions;
    Bui–Florea arXiv:1605.07092 owns the informal family-average lower bound, not
    this statement class).

STATEMENT-RUNG CORRECTION (recorded, like the FF-EZ4/A2 precedent class): the bridge
sketch claims the unconditional per-level proportion satisfies `distinct powers ≥
distinct values`. The true direction is `≤` (powering can only merge values: {1, −1}
at m = 2). The corrected statement is carried below (`stmt_power_merge_le`); what the
exclusion hypothesis buys is equality for a density-one set of m, which is the
headline statement.

Target: mathlib ff2494ea (toolchain v4.36.0-rc2). No sorry, no native_decide, no
external CAS; read-only donors cited by file:line only.
-/

import Mathlib

open Multiset Polynomial

namespace CrossMath.FFEZ2

/-! ## Anchor preflight (mathlib ff2494ea homes of every bound surface) -/

#check @Multiset.Nodup          -- Data/Multiset/Nodup.lean
#check @Multiset.map            -- Data/Multiset/Basic.lean
#check @Multiset.dedup          -- Data/Multiset/Dedup.lean
#check @Finset.filter           -- Data/Finset/Filter.lean
#check @Finset.Ioc              -- Order/Interval/Finset/Nat.lean
#check @Squarefree              -- Algebra/Squarefree/Basic.lean
#check @Multiset.prod           -- Algebra/BigOperators/Multiset.lean

/-! ## Weil side: statement-level binders (G3/G6b class) -/

/-- Weil-side binder: `A` is the H¹ Frobenius eigenvalue multiset of a smooth proper
geometrically irreducible curve over 𝔽_q, in the purity normal form of the
Weil-conjecture existential (`LeanEval/WeilConjectures.lean:185–194`, the RH clause;
statement-level citation — never imported). -/
def HypFrobeniusSpectrum (q : ℕ) (A : Multiset ℂ) : Prop :=
  1 < q ∧ ∀ α ∈ A, α ≠ 0 ∧ IsIntegral ℤ α ∧ ‖α‖ = √((q : ℝ))

/-- The base-change power law as data: the spectrum of the m-fold constant extension
`C_m = C ×_{𝔽_q} 𝔽_{q^m}` is the m-th power multiset. -/
def baseChange (A : Multiset ℂ) (m : ℕ) : Multiset ℂ := A.map (fun α => α ^ m)

/-- Weil-side base-change binder: the conclusion of
`Weil.rationalFrobeniusCharpolyReverse_eq_comp_of_comp_specAlgebraMap_eq`
(`FieldOfConstantsFrobenius.lean:163` — the Frobenius charpoly of a base change
composes with `X ^ finrank`, i.e. eigenvalues `{α_i ^ m}`; statement-level citation,
never a build dep): a geometric spectrum family `B` agrees with the power law. -/
def HypBaseChangePower (A : Multiset ℂ) (B : ℕ → Multiset ℂ) : Prop :=
  ∀ m : ℕ, 0 < m → B m = baseChange A m

/-! ## The combinatorial simplicity layer -/

/-- All zeros of the H¹ numerator of `Z_{C_m}(T)` are simple: the powered spectrum has
no repeated elements (each factor `1 − α^m T` is linear, so squarefreeness of the
product is exactly nodup-ness of the powers). -/
def ZerosSimpleAt (A : Multiset ℂ) (m : ℕ) : Prop := (baseChange A m).Nodup

/-- The L-polynomial at level `m` (the H¹ numerator of `Z_{C_m}(T)`; `lPoly` carried
from `pilots/71/P2.lean:57`, the pilot-01 self-contained convention; spelled as a
mapped-multiset product — `Multiset.prod` of `Multiset.map`, the form `P2.lean`'s
`lPoly` elaborates to). -/
noncomputable def lPolyM (A : Multiset ℂ) (m : ℕ) : Polynomial ℂ :=
  ((baseChange A m).map (fun α => 1 - Polynomial.C α * Polynomial.X)).prod

/-- Zeta-side reading of `ZerosSimpleAt`: the numerator is squarefree iff the powered
spectrum is nodup (multiset-product factorization; P1's first lemma). -/
def stmt_lpoly_squarefree_iff (A : Multiset ℂ) (m : ℕ) : Prop :=
  Squarefree (lPolyM A m) ↔ ZerosSimpleAt A m

/-- The per-level simple proportion: distinct powered values over the spectrum size. -/
noncomputable def simpleProportion (A : Multiset ℂ) (m : ℕ) : ℝ :=
  ((baseChange A m).dedup.card : ℝ) / (A.card : ℝ)

/-! ## The exclusion hypothesis (the battery's binding guard) and the trap -/

/-- The exclusion hypothesis: no repeated eigenvalues, and the ratio of any two
distinct eigenvalues is never a root of unity — the exact condition under which
powers stay faithful. This is the EXCLUSION-BASED shape the design rule mandates;
maximal-curve spectra violate it outright (see `stmt_maximal_violates_exclusion`). -/
def NoRootOfUnityCollisions (A : Multiset ℂ) : Prop :=
  A.Nodup ∧ ∀ x ∈ A, ∀ y ∈ A, x ≠ y → ∀ n : ℕ, 0 < n → (x / y) ^ n ≠ 1

/-- The falsity trap, stated as the guard's justification (NOT a family statement —
a negation): a spectrum with all elements equal — the maximal-curve shape, every
Frobenius angle θ = π; Fuhrmann arXiv:alg-geom/9610023, Tafazolian–Torres 2012
(battery pins 2026-11-17) — violates the exclusion hypothesis whenever the spectrum
has at least two elements, so no uniform statement can reach it. -/
def stmt_maximal_violates_exclusion (A : Multiset ℂ) : Prop :=
  2 ≤ A.card → (∀ x ∈ A, ∀ y ∈ A, x = y) → ¬NoRootOfUnityCollisions A

/-! ## The FF-EZ2 survivor statements -/

open Classical in
/-- FF-EZ2 headline (density form; the bridge §4 candidate, exclusion-guarded): under
the purity binder and the exclusion hypothesis, the set of extension degrees `m`
whose base-changed zeta has all-simple zeros has natural density one — for every
`ε > 0`, beyond some `M` the fraction of `m ≤ M'` with `Z_{C_m}` simple exceeds
`1 − ε`. [Elementary engine, P1's work: each colliding pair `(x, y)` with
`(x/y) ^ n = 1` — excluded here — would remove one residue-class family; with none,
the bad set is empty. The honest P1 shape: the exclusion hypothesis makes EVERY m
simple at the H¹ level unless a ratio is a root of unity; density 1 is then the
counting residue of the finite collision set. -/
def stmt_ff_ez2_base_change_density (q : ℕ) (A : Multiset ℂ) : Prop :=
  HypFrobeniusSpectrum q A → NoRootOfUnityCollisions A →
    ∀ ε : ℝ, 0 < ε → ∃ M : ℕ, ∀ M' : ℕ, M ≤ M' →
      ((Finset.filter (fun m => ZerosSimpleAt A m) (Finset.Ioc 0 M')).card : ℝ)
        / (M' : ℝ) > 1 - ε

open Classical in
/-- The family form (transport to the geometric spectrum family `B` via the Weil :163
binder): if `B` obeys the power law, simplicity of `Z_{C_m}` for a set of densities
one reads off the powered multiset. -/
def stmt_ff_ez2_family_form (q : ℕ) (A : Multiset ℂ) (B : ℕ → Multiset ℂ) : Prop :=
  HypFrobeniusSpectrum q A → HypBaseChangePower A B → NoRootOfUnityCollisions A →
    ∀ ε : ℝ, 0 < ε → ∃ M : ℕ, ∀ M' : ℕ, M ≤ M' →
      ((Finset.filter (fun m => (B m).Nodup) (Finset.Ioc 0 M')).card : ℝ)
        / (M' : ℝ) > 1 - ε

/-- Unconditional monotonicity-under-powering (STATEMENT-RUNG CORRECTION of the
bridge sketch: the sketch claimed `distinct powers ≥ distinct values`; the true
direction is `≤` — powering can only merge values, e.g. `{1, −1}` at `m = 2`;
equality on a density-one set is what the exclusion hypothesis buys, per the
headline). -/
def stmt_power_merge_le (A : Multiset ℂ) : Prop :=
  0 < A.card → ∀ m : ℕ, 0 < m → (baseChange A m).dedup.card ≤ A.dedup.card

/-- Binder-consumption pattern (trivial; validates the conditional-theorem shape,
`pilots/ff-ez4/P0.lean`'s `conditional_shape` / ProbeG3 precedent). -/
theorem conditional_shape (q : ℕ) (A : Multiset ℂ)
    (h : stmt_ff_ez2_base_change_density q A) : stmt_ff_ez2_base_change_density q A := h

end CrossMath.FFEZ2
