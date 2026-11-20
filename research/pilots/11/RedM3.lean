/-
  Pilot 11, M3 — the CH20∘VW13 instantiation through the M1 `Red` calculus
  (dossier 11 §plan item 2; the last benched rung, DECISION-6 drain activation).

  The two cited-literature claims of the donor corpus
  (anthropics_formal-math/3sum-apsp, read-only; never imported):
    * Claim.CH20_Theorem_5_1  (3SUM → Convolution-3SUM, [CH20, Thm 5.1])
    * Claim.VW13_Theorem_4_3  (Convolution-3SUM → Exact Triangle, [VW13, Thm 4.3])
  enter as HYPOTHESIS BINDERS (the M1 `theorem19_of_red` precedent; nothing of the
  donor tree is imported, built, or re-proved; the ChanHe program is not re-ported).
  New content: the two `RedB.Red` lifts + the composed acceptance
  `composed_21a_of_ch20_vw13`, which routes the pair through `RedB.Red.comp`
  (calls multiply, extras add) — the one-level-up twin of M1's acceptance, and the
  calculus-side replacement of the donor's hand-carried `theorem_21a_compose`
  arithmetic (Sec3/Theorem21.lean:44–57; its `n^{3/2+o(1)}` NOTE term = the composed
  extras/calls shape produced below, at the six verbatim asymptotic side-conditions).

  Sign convention: `Red.calls_nonneg` is unconditional, while the donor's O-class
  witnesses carry no sign information — the lifts clamp calls at 0
  (`max 0 ·`) and carry the sign in the guard, the corpus's own partiality
  convention ("Where the hypotheses … fail, nothing is claimed",
  TimeClaims/Sec3/Definitions.lean:189). At guard-satisfying parameters the clamp
  is the identity, so the composed bound is exactly the hand-composed one.

  Transcript (def-only, verbatim): `logU` (Util/Log.lean:104), `IsPowLittleO` /
  `IsPowPolylog` / `IsBigOPow` (PaperStatements.lean:1172–1183), and the two Claim
  defs (TimeClaims/Sec3/Definitions.lean:219–243). No `sorry`, no `native_decide`,
  no external CAS. Substrate: mathlib ff2494ea…, Lean v4.36.0-rc2.
-/
import Mathlib
import RedCompB

/-! ## Transcript: the asymptotic vocabulary (def-only, verbatim) -/

namespace ThreeSumApsp

/-- The logarithm of the weight bound, floored at 2 (Util/Log.lean:104, verbatim). -/
noncomputable def logU (u : ℝ) : ℝ := Real.log (max u 2)

/-- `f(n) = n^{a+o(1)}` (PaperStatements.lean:1172–1175, verbatim, def-only). -/
def IsPowLittleO (f : ℕ → ℝ) (a : ℝ) : Prop :=
  ∃ ε : ℕ → ℝ, Filter.Tendsto ε Filter.atTop (nhds 0) ∧
    ∀ᶠ n : ℕ in Filter.atTop, |f n| ≤ (n : ℝ) ^ (a + ε n)

/-- `f(n) = O(n^a (log n)^{O(1)})` (PaperStatements.lean:1177–1179, verbatim). -/
def IsPowPolylog (f : ℕ → ℝ) (a : ℝ) : Prop :=
  ∃ e : ℕ, Asymptotics.IsBigO Filter.atTop f fun n : ℕ => (n : ℝ) ^ a * Real.log n ^ e

/-- `f(n) = O(n^a)` (PaperStatements.lean:1181–1183, verbatim). -/
def IsBigOPow (f : ℕ → ℝ) (a : ℝ) : Prop :=
  Asymptotics.IsBigO Filter.atTop f fun n : ℕ => (n : ℝ) ^ a

namespace Claim

/-- CITED.  [CH20, Thm 5.1 proof-epilogue]: from 3SUM to Convolution-3SUM
(TimeClaims/Sec3/Definitions.lean:207–229, verbatim). -/
def CH20_Theorem_5_1 (M : DetTimeModel) : Prop :=
  ∀ κ : ℝ, 0 ≤ κ → ∃ (E Num mag : ℕ → ℝ) (N : ℕ → ℕ) (c' κ' : ℝ),
    IsPowPolylog E (3 / 2) ∧ IsPowPolylog Num 0 ∧ IsPowPolylog (fun n => (N n : ℝ)) 1 ∧
    (∀ n : ℕ, 1 ≤ n → 1 ≤ N n ∧ 1 ≤ mag n ∧ mag n ≤ c' * (n : ℝ) ^ κ') ∧
    ∀ T : ℕ → ℝ → ℝ, M.convolution3SUM T →
      ∃ T' : ℕ → ℝ → ℝ, M.threeSum T' ∧
        ∀ n : ℕ, 1 ≤ n → T' n ((n : ℝ) ^ κ) ≤ E n + Num n * T (N n) (mag n)

/-- CITED.  [VW13, Thm 4.3]: from Convolution-3SUM to Exact Triangle
(TimeClaims/Sec3/Definitions.lean:231–243, verbatim). -/
def VW13_Theorem_4_3 (M : DetTimeModel) : Prop :=
  ∃ (c : ℝ) (E Num : ℕ → ℝ) (size : ℕ → ℕ), 1 ≤ c ∧
    IsPowLittleO E (3 / 2) ∧ IsBigOPow Num (1 / 2) ∧ IsBigOPow (fun N => (size N : ℝ)) (1 / 2) ∧
    (∀ N : ℕ, 1 ≤ N → 1 ≤ size N) ∧
    ∀ T : ℕ → ℝ → ℝ, M.exactTriangle T →
      M.convolution3SUM fun N u => E N * (1 + logU u) + Num N * T (size N) (c * u)

end Claim

end ThreeSumApsp

/-! ## The M3 instantiation (new content) -/

namespace CrossMath.RedM3

open ThreeSumApsp CrossMath.RedB

/-- Problem adapters over `ℕ × ℝ` (the RedCompB padding pattern; the corpus time
type for all three problems here is `ℕ → ℝ → ℝ`). -/
def TS (M : DetTimeModel) : ((ℕ × ℝ) → ℝ) → Prop :=
  fun S => ∃ f : ℕ → ℝ → ℝ, M.threeSum f ∧ S = fun p => f p.1 p.2

def C3S (M : DetTimeModel) : ((ℕ × ℝ) → ℝ) → Prop :=
  fun S => ∃ f : ℕ → ℝ → ℝ, M.convolution3SUM f ∧ S = fun p => f p.1 p.2

def ETp (M : DetTimeModel) : ((ℕ × ℝ) → ℝ) → Prop :=
  fun S => ∃ f : ℕ → ℝ → ℝ, M.exactTriangle f ∧ S = fun p => f p.1 p.2

/-- **Lift 1** — CH20 as a `Red` instance (3SUM from Convolution-3SUM), at a fixed
weight exponent `κ`. Calls `Num₁`, extra `E₁`, shape `(n, u) ↦ (N n, mag n)`; the
guard carries the corpus partiality conditions (`1 ≤ n`, the weight `u = n^κ`) and
the call-sign clause released by the `max 0` clamp. -/
theorem red_of_CH20 (M : DetTimeModel) (hCH20 : Claim.CH20_Theorem_5_1 M)
    (κ : ℝ) (hκ : 0 ≤ κ) :
    ∃ (E₁ Num₁ mag : ℕ → ℝ) (N : ℕ → ℕ),
      IsPowPolylog E₁ (3 / 2) ∧ IsPowPolylog Num₁ 0 ∧
        IsPowPolylog (fun n => (N n : ℝ)) 1 ∧ (∀ n : ℕ, 1 ≤ n → 1 ≤ N n) ∧
      Red (TS M) (C3S M)
        (fun p => (N p.1, mag p.1))
        (fun p => max 0 (Num₁ p.1))
        (fun p => E₁ p.1)
        (fun p => 1 ≤ p.1 ∧ 0 ≤ Num₁ p.1 ∧ p.2 = (p.1 : ℝ) ^ κ) := by
  obtain ⟨E₁, Num₁, mag, N, c', κ', hE, hNum, hN, hbound, htrans⟩ := hCH20 κ hκ
  refine ⟨E₁, Num₁, mag, N, hE, hNum, hN, fun n hn => (hbound n hn).1, ?_⟩
  refine ⟨fun p => le_max_left 0 (Num₁ p.1), ?_⟩
  intro T hT
  obtain ⟨f, hfC3, hTpad⟩ := hT
  obtain ⟨T', hTS, hle⟩ := htrans f hfC3
  refine ⟨fun p => T' p.1 p.2, ⟨T', hTS, rfl⟩, ?_⟩
  intro p hp
  obtain ⟨hn, hnum, hu⟩ := hp
  show T' p.1 p.2 ≤ E₁ p.1 + max 0 (Num₁ p.1) * T (N p.1, mag p.1)
  rw [hu, hTpad, max_eq_right hnum]
  exact hle p.1 hn

/-- **Lift 2** — VW13 as a `Red` instance (Convolution-3SUM from Exact Triangle):
calls `Num₂`, extra `E₂ · (1 + logU u)`, shape `(N, u) ↦ (size N, c · u)`; the
bound is an equality, the donor's own membership function. -/
theorem red_of_VW13 (M : DetTimeModel) (hVW13 : Claim.VW13_Theorem_4_3 M) :
    ∃ (E₂ Num₂ : ℕ → ℝ) (size : ℕ → ℕ) (c : ℝ),
      IsPowLittleO E₂ (3 / 2) ∧ IsBigOPow Num₂ (1 / 2) ∧
        IsBigOPow (fun N => (size N : ℝ)) (1 / 2) ∧ 1 ≤ c ∧
        (∀ N : ℕ, 1 ≤ N → 1 ≤ size N) ∧
      Red (C3S M) (ETp M)
        (fun p => (size p.1, c * p.2))
        (fun p => max 0 (Num₂ p.1))
        (fun p => E₂ p.1 * (1 + logU p.2))
        (fun p => 0 ≤ Num₂ p.1) := by
  obtain ⟨c, E₂, Num₂, size, hc, hE, hNum, hsize, hge, htrans⟩ := hVW13
  refine ⟨E₂, Num₂, size, c, hE, hNum, hsize, hc, hge, ?_⟩
  refine ⟨fun p => le_max_left 0 (Num₂ p.1), ?_⟩
  intro T hT
  obtain ⟨f, hf, hTpad⟩ := hT
  refine ⟨fun p => E₂ p.1 * (1 + logU p.2) + Num₂ p.1 * f (size p.1) (c * p.2),
          ⟨fun N u => E₂ N * (1 + logU u) + Num₂ N * f (size N) (c * u),
            htrans f hf, rfl⟩,
          fun p hp => ?_⟩
  show E₂ p.1 * (1 + logU p.2) + Num₂ p.1 * f (size p.1) (c * p.2)
      ≤ E₂ p.1 * (1 + logU p.2) + max 0 (Num₂ p.1) * T (size p.1, c * p.2)
  rw [hTpad, max_eq_right hp]

/-- **The M3 acceptance** — the CH20∘VW13 composition THROUGH `Red.comp`: from the
two binder claims, at every weight exponent `κ ≥ 0`, the composed data exist with
the six asymptotic side-conditions in `theorem_21a_compose`'s exact hypothesis
shapes, and every Exact-Triangle time `T` yields a 3SUM time `T₃` with the composed
bound — calls `Num₁ · (Num₂ ∘ N)` multiply, extras `E₁ + Num₁ · (E₂ ∘ N)` add (the
NOTE-carried `n^{3/2+o(1)}` skeleton; the honest `logU (mag n)` weight factor
rides the inner extra, as in the donor's own VW13 statement). -/
theorem composed_21a_of_ch20_vw13 (M : DetTimeModel)
    (hCH20 : Claim.CH20_Theorem_5_1 M) (hVW13 : Claim.VW13_Theorem_4_3 M) :
    ∀ κ : ℝ, 0 ≤ κ →
      ∃ (E₁ Num₁ mag : ℕ → ℝ) (N : ℕ → ℕ) (E₂ Num₂ : ℕ → ℝ) (size : ℕ → ℕ) (c : ℝ),
        IsPowPolylog E₁ (3 / 2) ∧ IsPowPolylog Num₁ 0 ∧
          IsPowPolylog (fun n => (N n : ℝ)) 1 ∧
        IsPowLittleO E₂ (3 / 2) ∧ IsBigOPow Num₂ (1 / 2) ∧
          IsBigOPow (fun m => (size m : ℝ)) (1 / 2) ∧
        1 ≤ c ∧ (∀ n : ℕ, 1 ≤ n → 1 ≤ N n) ∧ (∀ m : ℕ, 1 ≤ m → 1 ≤ size m) ∧
        ∀ T : ℕ → ℝ → ℝ, M.exactTriangle T →
          ∃ T₃ : ℕ → ℝ → ℝ, M.threeSum T₃ ∧
            ∀ n : ℕ, 1 ≤ n → 0 ≤ Num₁ n → 0 ≤ Num₂ (N n) →
              T₃ n ((n : ℝ) ^ κ) ≤
                E₁ n + Num₁ n * (E₂ (N n) * (1 + logU (mag n)) +
                  Num₂ (N n) * T (size (N n)) (c * mag n)) := by
  intro κ hκ
  obtain ⟨E₁, Num₁, mag, N, hE, hNum, hN, hN1, r₁⟩ := red_of_CH20 M hCH20 κ hκ
  obtain ⟨E₂, Num₂, size, c, hE₂, hNum₂, hsize, hc, hge, r₂⟩ := red_of_VW13 M hVW13
  refine ⟨E₁, Num₁, mag, N, E₂, Num₂, size, c, hE, hNum, hN, hE₂, hNum₂, hsize,
    hc, hN1, hge, ?_⟩
  intro T hT
  have hTp : ETp M (fun p => T p.1 p.2) := ⟨T, hT, rfl⟩
  obtain ⟨T'p, hTS, hbound⟩ := (Red.comp r₁ r₂).transfer _ hTp
  obtain ⟨T₃, hT₃, hpad⟩ := hTS
  refine ⟨T₃, hT₃, ?_⟩
  intro n hn hnum₁ hnum₂
  have hb := hbound (n, (n : ℝ) ^ κ) ⟨⟨hn, hnum₁, rfl⟩, hnum₂⟩
  rw [hpad] at hb
  dsimp only [Function.comp_def] at hb
  rw [max_eq_right hnum₁, max_eq_right hnum₂] at hb
  calc T₃ n ((n : ℝ) ^ κ)
      ≤ E₁ n + Num₁ n * (E₂ (N n) * (1 + logU (mag n)))
          + Num₁ n * Num₂ (N n) * T (size (N n)) (c * mag n) := hb
    _ = E₁ n + Num₁ n * (E₂ (N n) * (1 + logU (mag n))
          + Num₂ (N n) * T (size (N n)) (c * mag n)) := by ring

#print axioms red_of_CH20
#print axioms red_of_VW13
#print axioms composed_21a_of_ch20_vw13

#check @ThreeSumApsp.Claim.CH20_Theorem_5_1
#check @ThreeSumApsp.Claim.VW13_Theorem_4_3
#check @ThreeSumApsp.IsPowLittleO
#check @ThreeSumApsp.IsPowPolylog
#check @ThreeSumApsp.IsBigOPow
#check @ThreeSumApsp.logU

end CrossMath.RedM3
