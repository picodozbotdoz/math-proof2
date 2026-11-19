/-
Pilot 75-N2 P3 — the landing rung of the ℚ ray-class↔Dirichlet consumer:
the V2 ζ-column discharge + the composed `zetaL_rat_two_thirds_landed`
statement, SKELETON (statements only).

CHARTER: final-grant ruling of 2026-11-19 (R6 unit 3) — P2-a CLOSED GREEN at
run 26 (`logs/n2-p1-run26.log`, 15/15 triad incl. `windowFinite_LFunction`),
authorizing this skeleton in the same unit. Executes dossier
`research/candidates/75-N2-rayclass-dirichlet-consumer.md` §Pilot spec skeleton
(P3) + §Proof-strategy step 6, over the GREEN stack: Pa.lean (engine, run
6-final), N2-P0.lean (statement rung, 15/15), N2-P1.lean (dictionary + transfer
+ window finiteness, runs 19/26).

HYGIENE CLASS: STATEMENT RUNG + EXECUTION RUNGS, ZERO-SORRY BY CONSTRUCTION
(the P0/N2P0 precedent). No probe-header sorry class: every mathematical
obligation is an explicit named hypothesis binder of a Prop or a named Prop.
Unit 7 (R6, 2026-11-19) added the first two execution proofs — P3-b
(`abFacQ_of_factorization`, the two-GREEN-theorem P1 chain) and P3-c
(`analyticOrderAt_lFunction_ne_top`, entireness + the run-30-triad helper) —
each a pure application chain over kernel-verified pieces, plus the P2-a
payoff `windowFinite_family` (one application at the dependent-family
level). GREEN-by-composition, not proof artifacts.

STAGING (the N2P0 precedent; runner note): this module imports `N2P1` — the
repo file `N2-P1.lean` must be staged under the module name `N2P1.lean`
(byte-identical copy; `import N2-P1` is not a legal module path). The P3
runner (to be added at P3 execution: `run_n2p3.sh`/`.py`, a copy of the
`run_n2p1` pair) stages ORDER = [Pa.lean, N2P0.lean, N2P1.lean, N2-P3.lean].
The V2 import (`import ZetaZeros`, the M4b pattern, `pilots/42/M4b.lean:45`)
is DEFERRED to the P3-execution ζ-column rung: this skeleton keeps the
ζ-column as the named binder `hV2col` so the statement rung elaborates on the
plain mathlib substrate (2cpu/4GB warm `crossmath-pilot-75`, same recipe).

FENCES (dossier §F2, standing): DZDF DO-NOT-CONSUME as build dependency (G1b)
— enters only through the quoted `DZDFAbelianFactorizationQ`-shaped hypothesis
slot of `ZetaLRatTwoThirdsOfDZDF` below; zeta23 v4.33 statement-port only
(the `hEχ` slot is the P0-quoted `EpsLowerCum` form, already the
`ThmEDyadicToCumulative` output shape); V2 direct import only at the
P3-execution rung (M4b precedent — G2-green on our pin ff2494ea).

BINDER INVENTORY (P3 discharge ledger; the P0 inventory one level down):
* DISCHARGED ALREADY (GREEN, consumed by this file's one proof):
  `WindowFinite (multOf (ψ i).LFunction)` from `hne : ∀ i, ψ i ≠ 1` — P2-a,
  run 26 (`windowFinite_LFunction`); the hAbFacQ half-plane→ℂ∖{1} extension —
  P1 M3-c2 (`factorization_identity_extension`, run 19); the DZDF→Dirichlet
  family transfer — P1 M3-e (`dirichletFactorizationTransfer`, run 19).
* P3 PROOF OBLIGATIONS (discharge targets stated below):
  `AbFacQOfFactorization` (P3-b: the two-theorem P1 chain application —
  provable NOW from GREEN pieces); `ZetaColumnOfV2Q` (P3-d: the M4b ζ-column
  glue over `import ZetaZeros` — `ZetaZeros.simple_proportion_d4` +
  `two_thirds_le_d4`-class numeral lemma + the count-identification binders
  `hccum`/`hconcum`); `ZetaLRatTwoThirdsOfDZDF` (P3-e: the composed landing).
* STILL-BINDER SLOTS at P3 (honest, per the dossier's billing):
  `hEχ` per component (P2-c, the hEχ port — ThmEDyadicToCumulative + immunity
  + hUnb; P2-b/P2-c not started); `hfinK`/`hfinL`/`hntopK`/`hntopL` (classical
  structural, fL-side); `hntpψ` (component analyticOrderAt ≠ ⊤ — expected
  one-liner from entireness at P3-c); the DZDF factorization hypothesis and
  the dictionary hypotheses (donor theorems / P1 outputs at application time).
-/
import Mathlib
import N2P0
import N2P1

namespace CrossMath.Pilot75N2

open Set Finset Filter
open scoped NumberField Classical Topology

open CrossMath.Pilot75

/-! ### P3-b — the hAbFacQ bridge (the composed P1 chain, statement form)

`dirichletFactorizationTransfer` (run 19) converts the DZDF Hecke-side
factorization + dictionary + nonprincipality into a Dirichlet-LFunction family
with the `1 < q i ∧ ψ i ≠ 1` scope; `factorization_identity_extension`
(run 19) extends the identity from ℜs > 1 to ℂ∖{1}. The composition below is
exactly the engine's `hAbFacQ` slot (N2P0's `zetaL_rat_two_thirds_landed`
consumes this shape). P3-b's proof is the choose-then-apply chain over the two
GREEN theorems — no new mathematics. -/

/-- **P3-b target**: dictionary + nonprincipality + Hecke-side factorization on
the half-plane + continuation analyticity ⇒ the engine's Dirichlet-form
factorization binder on ℂ∖{1}, with the nonprincipality scope. (The composed
output shape of `dirichletFactorizationTransfer` → `factorization_identity_
extension`, both GREEN since run 19.) -/
def AbFacQOfFactorization (fK fL : ℂ → ℂ) (n : ℕ)
    (m : Fin n → Ideal (𝓞 ℚ)) (χ : (i : Fin n) → Ideal (𝓞 ℚ) → ℂ) : Prop :=
  (∀ i, ¬ IsDZDFPrincipalQ (m i) (χ i)) →
  (∀ i, HasQDirichletDictionary (m i) (χ i)) →
  (∀ s : ℂ, 1 < s.re →
    fL s = (∏ i : Fin n, ∑' I : Ideal (𝓞 ℚ), χ i I * (Ideal.absNorm I : ℂ) ^ (-s)) * fK s) →
  (∀ ρ : ℂ, ρ ≠ 1 → AnalyticAt ℂ fK ρ) →
  (∀ ρ : ℂ, ρ ≠ 1 → AnalyticAt ℂ fL ρ) →
    ∃ (q : Fin n → ℕ) (hN : ∀ i, NeZero (q i)) (ψ : (i : Fin n) → DirichletCharacter ℂ (q i)),
      (∀ i, 1 < q i ∧ ψ i ≠ 1) ∧
      ∀ s : ℂ, s ≠ 1 →
        fL s = (∏ i : Fin n, @DirichletCharacter.LFunction (q i) (hN i) (ψ i) s) * fK s

/-- **P3-b (unit 7)** — the hAbFacQ bridge DISCHARGED: the two-theorem P1
chain applied. `dirichletFactorizationTransfer` (run 19) converts the DZDF
Hecke-side factorization + dictionary + nonprincipality into the Dirichlet
family with the `1 < q i ∧ ψ i ≠ 1` scope; `factorization_identity_extension`
(run 19) extends the identity from ℜs > 1 to ℂ∖{1}. Pure application chain —
no new mathematics. -/
theorem abFacQ_of_factorization (fK fL : ℂ → ℂ) (n : ℕ)
    (m : Fin n → Ideal (𝓞 ℚ)) (χ : (i : Fin n) → Ideal (𝓞 ℚ) → ℂ) :
    AbFacQOfFactorization fK fL n m χ := by
  intro hnp hdic hfac hK hL
  obtain ⟨q, hN, ψ, hscope, hhpDir⟩ := dirichletFactorizationTransfer hdic hnp hfac
  exact ⟨q, hN, ψ, hscope,
    factorization_identity_extension hN (fun i => (hscope i).2) hK hL hhpDir⟩

/-! ### P2-a payoff — the landing's component-window-finiteness slot, discharged

The one proof of this file: P2-a (run 26) closes the `hfinψ` slot of
`zetaL_rat_two_thirds_landed` for every nontrivial family member at once
(@-explicit on the dependent family, the P0 convention). -/

/-- **P2-a payoff (GREEN-by-composition)**: for a nontrivial Dirichlet family,
every component's L-function has finite strip windows — the `hfinψ` input of
the engine landing, discharged by run 26's `windowFinite_LFunction`. -/
theorem windowFinite_family {n : ℕ} {q : Fin n → ℕ} (hN : ∀ i, NeZero (q i))
    (ψ : (i : Fin n) → DirichletCharacter ℂ (q i)) (hne : ∀ i, ψ i ≠ 1) :
    ∀ i, WindowFinite (multOf (@DirichletCharacter.LFunction (q i) (hN i) (ψ i))) :=
  fun i => @windowFinite_LFunction (q i) (hN i) (ψ i) (hne i)

/-- **P3-c (unit 7)** — the engine's component `hntopψ` slot DISCHARGED:
entireness plays no role here beyond the helper's own proof — the
run-30-triad `lFunction_not_eventually_zero` plus the root-level
`analyticOrderAt_eq_top` iff (Order.lean:77; the r30-verified reference
form — NOT dot-notation, see the record's Exists-whnf trap) give
`analyticOrderAt ≠ ⊤` at every point for a nontrivial character's
L-function. -/
theorem analyticOrderAt_lFunction_ne_top {N : ℕ} [NeZero N]
    {χ : DirichletCharacter ℂ N} (hχ : χ ≠ 1) (ρ : ℂ) :
    analyticOrderAt χ.LFunction ρ ≠ ⊤ := fun h =>
  lFunction_not_eventually_zero hχ ρ (analyticOrderAt_eq_top.mp h)

/-! ### P3-d — the V2 ζ-column (the M4b pattern, statement form)

At the P3-execution rung: `import ZetaZeros` (root module; the M4b precedent
`pilots/42/M4b.lean:45`, G2-green on our pin) supplies
`ZetaZeros.simple_proportion_d4` (the 0.6725 on-line proportion endpoint,
`ZetaZerosV2/ZetaZeros/Main.lean:130`); the `2/3 ≤ 0.6725` numeral lemma is
`norm_num`-clean (M4b's `two_thirds_le_673`/`two_thirds_le_d4` precedent,
M4b.lean:911/:1381); the abstract fK is tied to the ζ-column zero data by the
count-identification binders `hccum`/`hconcum` (the `EpsLowerCum_congr` glue,
M4b.lean's `zetaK_two_thirds_landed_of_V2` pattern — fK stays abstract exactly
as in the M4b/75 landings; `dedekindZeta ℚ = riemannZeta` is never needed).
This skeleton states the shape with the endpoint as the named binder `hV2`,
so the rung elaborates without the V2 substrate. -/

/-- **P3-d target**: the ζ-column at 2/3 for the abstract fK — conditional on
the V2 on-line-proportion endpoint (as binder here; the import at P3
execution), the ζ-side non-degeneracy, and the count identifications between
fK's zero data and the ζ-column's. -/
def ZetaColumnOfV2Q (fK : ℂ → ℂ) (hfinK : WindowFinite (multOf fK))
    (hfinζ : WindowFinite (multOf riemannZeta)) : Prop :=
  (∀ ρ : ℂ, ρ ≠ 1 → analyticOrderAt fK ρ ≠ ⊤) →
  (∀ T : ℝ, (⟨multOf fK, hfinK⟩ : ZeroMult).countCum T
      = (⟨multOf riemannZeta, hfinζ⟩ : ZeroMult).countCum T) →
  (∀ T : ℝ, (⟨multOf fK, hfinK⟩ : ZeroMult).countOnCum T
      = (⟨multOf riemannZeta, hfinζ⟩ : ZeroMult).countOnCum T) →
  EpsLowerCum ⟨multOf riemannZeta, hfinζ⟩ (2 / 3) →
    EpsLowerCum ⟨multOf fK, hfinK⟩ (2 / 3)

/-! ### The hEχ slot shape (P2-c output; the component-proportion binder)

Stated per family member with the P2-a finiteness DISCHARGED (run 26) — the
`ThmEDyadicToCumulative` conclusion + `HasEulerStripImmunity` composition
target of the P2-c port. (Defined before P3-e, which consumes it in
∀-candidate-family form.) -/

/-- The per-component cumulative 2/3 proportion slot: each nontrivial family
member's L-function zero data carries 2/3, on the P2-a-supplied window
finiteness. -/
def ComponentEpsCum {n : ℕ} {q : Fin n → ℕ} (hN : ∀ i, NeZero (q i))
    (ψ : (i : Fin n) → DirichletCharacter ℂ (q i)) (hne : ∀ i, ψ i ≠ 1) : Prop :=
  ∀ i, EpsLowerCum ⟨multOf (@DirichletCharacter.LFunction (q i) (hN i) (ψ i)),
    windowFinite_family hN ψ hne i⟩ (2 / 3)

/-! ### P3-e — the composed landing (N2-d at P3, statement form)

The full composition: DZDF-quoted factorization data + the dictionary + the
continuation/structural set + the per-component Dirichlet proportions (hEχ —
the P2-c port output shape, still binder) + the ζ-column (P3-d's conclusion as
binder) ⇒ the N2-d headline. P3-e's proof applies `AbFacQOfFactorization`
(discharge via the GREEN P1 chain), `windowFinite_family` (this file),
`ZetaColumnOfV2Q` (discharge via the V2 import) and the P0 landing
`zetaL_rat_two_thirds_landed` (GREEN since n2-p0-run4). The component
non-degeneracy `hntpψ` is carried as binder (P3-c: expected one-liner from
`differentiable_LFunction` — entire ⇒ analyticOrderAt ≠ ⊤). -/

/-- **P3-e target — N2-d composed**: for every abelian L/ℚ whose factorization
is given on the half-plane by a DZDF-quoted nonprincipal family with the ℚ
dictionary, with every Dirichlet component at cumulative 2/3 (hEχ, the P2-c
port output in ∀-candidate-family form — dischargeable per member from the
per-character `ThmEDyadicToCumulative` + `HasEulerStripImmunity` port) and the
ζ-column at 2/3 (hV2col), the with-multiplicity cumulative on-line proportion
of ζ_L is ≥ 2/3. The still-open binders are exactly the dossier's honest set:
the DZDF factorization statement (a donor THEOREM, G1-blocked from import),
the P2-c port slots, and the classical fL-side structural hypotheses. NOTE:
the engine's per-component `hntopψ` slot is NOT a binder here — P3-c is
expected to discharge it inline (entire ⇒ analyticOrderAt ≠ ⊤, a mathlib
application); if P3-c fights, add it in the ∀-family form exactly as hEχ. -/
def ZetaLRatTwoThirdsOfDZDF (fK fL : ℂ → ℂ) (n : ℕ)
    (m : Fin n → Ideal (𝓞 ℚ)) (χ : (i : Fin n) → Ideal (𝓞 ℚ) → ℂ)
    (hfinK : WindowFinite (multOf fK)) (hfinL : WindowFinite (multOf fL))
    (hfinζ : WindowFinite (multOf riemannZeta)) : Prop :=
  (∀ i, ¬ IsDZDFPrincipalQ (m i) (χ i)) →
  (∀ i, HasQDirichletDictionary (m i) (χ i)) →
  (∀ s : ℂ, 1 < s.re →
    fL s = (∏ i : Fin n, ∑' I : Ideal (𝓞 ℚ), χ i I * (Ideal.absNorm I : ℂ) ^ (-s)) * fK s) →
  (∀ ρ : ℂ, ρ ≠ 1 → AnalyticAt ℂ fK ρ) →
  (∀ ρ : ℂ, ρ ≠ 1 → AnalyticAt ℂ fL ρ) →
  (∀ ρ : ℂ, ρ ≠ 1 → analyticOrderAt fK ρ ≠ ⊤) →
  (∀ ρ : ℂ, ρ ≠ 1 → analyticOrderAt fL ρ ≠ ⊤) →
  (∀ (q : Fin n → ℕ) (hN : ∀ i, NeZero (q i))
      (ψ : (i : Fin n) → DirichletCharacter ℂ (q i)),
      (hneF : ∀ i, 1 < q i ∧ ψ i ≠ 1) →
        ComponentEpsCum hN ψ (fun i => (hneF i).2)) →
  (∀ T : ℝ, (⟨multOf fK, hfinK⟩ : ZeroMult).countCum T
      = (⟨multOf riemannZeta, hfinζ⟩ : ZeroMult).countCum T) →
  (∀ T : ℝ, (⟨multOf fK, hfinK⟩ : ZeroMult).countOnCum T
      = (⟨multOf riemannZeta, hfinζ⟩ : ZeroMult).countOnCum T) →
  EpsLowerCum ⟨multOf riemannZeta, hfinζ⟩ (2 / 3) →
    EpsLowerCum ⟨multOf fL, hfinL⟩ (2 / 3)

-- Statement-layer name/shape pins (the P3 binder inventory, elaborated at the
-- P3-a statement rung; expect `theorem`/`def` cards only, 0 sorry).
#check @CrossMath.Pilot75N2.AbFacQOfFactorization
#check @CrossMath.Pilot75N2.windowFinite_family
#check @CrossMath.Pilot75N2.ZetaColumnOfV2Q
#check @CrossMath.Pilot75N2.ZetaLRatTwoThirdsOfDZDF
#check @CrossMath.Pilot75N2.ComponentEpsCum

-- P3-a/unit-7 audit (expect triad only, 0 sorryAx):
#print axioms CrossMath.Pilot75N2.windowFinite_family
#print axioms CrossMath.Pilot75N2.abFacQ_of_factorization
#print axioms CrossMath.Pilot75N2.analyticOrderAt_lFunction_ne_top

end CrossMath.Pilot75N2
