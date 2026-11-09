/-
M1 pilot — dossier 52 (unified-ccr-fock-layer), milestone N1a:
the statistics-universal occupation calculus, sorry-free, zero ports.

Posture (research/pilots/52-blueprint.md §1–2): one abstract structure `OccupationPair`
parameterized by the statistics sign ε; the ε-universal lemmas are proved ONCE with no
case-split on ε; the fermionic (ε = -1) theorems are specializations; the concrete instance
is built over mathlib's ExteriorAlgebra — which IS `CliffordAlgebra 0` by abbrev
(Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean:60), so the whole Contraction.lean API is
available (contractLeft_ι_mul :123, contractLeft_comm :198, contractLeft_one :176; the
section variables there make `Q` and the dual `d` EXPLICIT arguments).

Provenance (read-only donors):
  * structure + relations ~ openai Laughlin CAR layer
    (openai-math OAI/Analysis/Laughlin/Operators/CAR.lean:15–58: `create i := ι (mode i) * ·`,
    `annihilate i := contractLeft (Q := 0) (proj i)`, proved `annihilate_anticommute`/
    `create_anticommute`/`mixed_car` — templates for the instance relations below; the
    donor's single `mixed_car` corresponds to the two fields `ac_self`/`ac_ne` here) and its
    adjointness layer (`Fock/NormalSquare.lean:10 annihilate_create_inner` — M2).
  * dual-family statement shape ~ eth `LemmaDual`
    (anthropics_formal-math/eth/proof/statements/AppHalfPiecesStatement.lean:175 — bosonic,
    weighted; the weight-1 fragment is `bosonic_unweighted` here; the full weighted form is
    the M2 target `WeightedOccupationPair`, blueprint §2 M2).
  * sign phenomenon ~ openai `sourcePairCreate_inner` (Fock/NormalSquare.lean:22).
-/
import Mathlib

namespace CrossMath.Pilot52

/-! ## The ε-universal calculus -/

/-- A creation/annihilation calculus with statistics sign `ε` and a vacuum:
`c`/`a` are endomorphisms indexed by `ι`; `cc`/`aa` are the ε-commutation relations;
`ac_self`/`ac_ne` are the mixed relation on and off the diagonal (weight 1); `vac` is
annihilated by every `a i`. Fermionic: `ε = -1` (instance `fermionicPair` below).
Bosonic: `ε = +1` (eth's Boson layer is the weighted refinement, `w k = k` — blueprint §2). -/
structure OccupationPair (R : Type*) [CommRing R] (M : Type*) [AddCommGroup M] [Module R M]
    (ε : R) (ι : Type*) [DecidableEq ι] where
  c : ι → (M →ₗ[R] M)
  a : ι → (M →ₗ[R] M)
  cc : ∀ i j, c i * c j = ε • (c j * c i)
  aa : ∀ i j, a i * a j = ε • (a j * a i)
  ac_self : ∀ i, a i * c i = 1 + ε • (c i * a i)
  ac_ne : ∀ i j, i ≠ j → a i * c j = ε • (c j * a i)
  vac : M
  avac : ∀ i, a i vac = 0

namespace OccupationPair

variable {R : Type*} [CommRing R] {M : Type*} [AddCommGroup M] [Module R M]
  {ε : R} {ι : Type*} [DecidableEq ι] (P : OccupationPair R M ε ι)

/-- Creation monomial over a word: `cW (i :: w) = c i * cW w` (foldr form; the cons equation
holds by `rfl`). -/
def cW (w : List ι) : M →ₗ[R] M := (w.map P.c).foldr (· * ·) 1

/-- Annihilation monomial over a word: `aW (i :: w) = a i * aW w`. -/
def aW (w : List ι) : M →ₗ[R] M := (w.map P.a).foldr (· * ·) 1

@[simp] theorem cW_nil : P.cW [] = 1 := rfl

@[simp] theorem cW_cons (i : ι) (w : List ι) : P.cW (i :: w) = P.c i * P.cW w := rfl

@[simp] theorem aW_nil : P.aW [] = 1 := rfl

@[simp] theorem aW_cons (i : ι) (w : List ι) : P.aW (i :: w) = P.a i * P.aW w := rfl

theorem cW_append (w : List ι) (k : ι) : P.cW (w ++ [k]) = P.cW w * P.c k := by
  induction w with
  | nil => simp [mul_one]
  | cons i w' ih => simp [ih, mul_assoc]

/-- **ε-exchange at word level (unconditional):** `cW [i, j] = ε • cW [j, i]`. -/
theorem cW_swap_pair (i j : ι) : P.cW [i, j] = ε • P.cW [j, i] := by
  simp only [cW_cons, cW_nil, mul_one]
  exact P.cc i j

/-- Slide of an annihilator past a *different* creator. -/
theorem slide_ne (i j : ι) (h : i ≠ j) (x : M) : P.a i (P.c j x) = ε • P.c j (P.a i x) := by
  have h1 : P.a i * P.c j = ε • (P.c j * P.a i) := P.ac_ne i j h
  have h3 := congrArg (fun f : M →ₗ[R] M => f x) h1
  simpa using h3

/-- The mixed relation on the diagonal. -/
theorem slide_self (i : ι) (x : M) : P.a i (P.c i x) = x + ε • P.c i (P.a i x) := by
  have h1 := congrArg (fun f : M →ₗ[R] M => f x) (P.ac_self i)
  simpa using h1

/-- An annihilator kills any creation monomial over a word not containing its index,
provided it kills the base point (orthogonality half of the dual family). -/
theorem annih_outside (i : ι) (w : List ι) (x : M) (hw : i ∉ w) (hx : P.a i x = 0) :
    P.a i (P.cW w x) = 0 := by
  induction w generalizing x with
  | nil => exact hx
  | cons j w' ih =>
    have hij : i ≠ j := fun h => hw (by simp [h])
    rw [cW_cons, mul_apply_eq_comp, slide_ne P i j hij,
      ih x (fun hm => hw (by simp [hm])) hx, map_zero, smul_zero]

/-- **THE ε-universal dual-family theorem (N1a core):** for a duplicate-free word `t`, the
annihilation monomial over `t` is a left inverse of the creation monomial over `t.reverse`,
on any point killed by the annihilators of `t`. The proof never case-splits on `ε`: it is
statistics-free. Fermionic instance: `fermionic_sign_transposition`; bosonic instance:
`bosonic_unweighted`. -/
theorem dual_family (t : List ι) (ht : t.Nodup) (x : M)
    (hx : ∀ j ∈ t, P.a j x = 0) : P.aW t (P.cW t.reverse x) = x := by
  induction t generalizing x with
  | nil => simp
  | cons i t' ih =>
    have hnd : t'.Nodup := (List.nodup_cons.mp ht).2
    have himem : i ∉ t' := (List.nodup_cons.mp ht).1
    have hsplit : P.cW (i :: t').reverse x = P.cW t'.reverse (P.c i x) := by
      simp only [List.reverse_cons, cW_append, mul_apply_eq_comp]
    rw [hsplit, aW_cons, mul_apply_eq_comp]
    have hx' : ∀ j ∈ t', P.a j (P.c i x) = 0 := by
      intro j hj
      rw [slide_ne P j i (fun h => himem (h ▸ hj)), hx j (List.mem_cons_of_mem _ hj),
        map_zero, smul_zero]
    rw [ih hnd (P.c i x) hx', slide_self P i x, hx i (List.mem_cons_self ..), map_zero,
      smul_zero, add_zero]

/-- **The sign refinement (dossier N1b's fermionic phenomenon), universally:** the
transposed two-mode contraction picks up exactly the statistics sign. -/
theorem sign_transposition (i j : ι) (h : i ≠ j) :
    P.aW [i, j] (P.cW [i, j] P.vac) = ε • P.vac := by
  have h1 : P.cW [i, j] P.vac = ε • P.cW [j, i] P.vac := by
    rw [P.cW_swap_pair i j]; simp
  have h2 : P.aW [i, j] (P.cW [j, i] P.vac) = P.vac :=
    P.dual_family [i, j] (by simp [h]) P.vac (fun k _ => P.avac k)
  rw [h1, LinearMap.map_smul, h2]

/-! ## Fermionic specializations (ε = -1) -/

section Fermionic

variable {R : Type*} [CommRing R] {M : Type*} [AddCommGroup M] [Module R M]
  {ι : Type*} [DecidableEq ι] (P : OccupationPair R M (-1 : R) ι)

/-- The same-order fermionic dual family at the vacuum. -/
theorem fermionic_dual_family_vac (t : List ι) (ht : t.Nodup) :
    P.aW t (P.cW t.reverse P.vac) = P.vac :=
  P.dual_family t ht P.vac (fun _ _ => P.avac _)

/-- Fermionic transposed contraction carries the minus sign. -/
theorem fermionic_sign_transposition (i j : ι) (h : i ≠ j) :
    P.aW [i, j] (P.cW [i, j] P.vac) = -P.vac := by
  have := P.sign_transposition i j h
  simpa using this

/-- Orthogonality: an annihilator kills creation monomials of other modes at the vacuum. -/
theorem fermionic_annih_outside (i : ι) (w : List ι) (hw : i ∉ w) :
    P.a i (P.cW w P.vac) = 0 :=
  P.annih_outside i w P.vac hw (P.avac i)

/-- **Pauli principle (ε = -1, char ≠ 2):** no repeated creation. Stated over a field:
over a general CommRing acting on a module with torsion the statement is FALSE, and in
characteristic two `-1 = 1` makes it fail outright — both obstructions are recorded in the
blueprint §M2 design notes; `h2 : 1 + 1 ≠ 0` is exactly `char ≠ 2`. -/
theorem fermionic_create_sq {K : Type*} [Field K] {M : Type*} [AddCommGroup M]
    [Module K M] {ι : Type*} [DecidableEq ι] (P : OccupationPair K M (-1 : K) ι)
    (h2 : (1 : K) + 1 ≠ 0) (i : ι) (x : M) : P.c i (P.c i x) = 0 := by
  have h := congrArg (fun f : M →ₗ[K] M => f x) (P.cc i i)
  simp only [mul_apply_eq_comp, LinearMap.smul_apply] at h
  have hsum : P.c i (P.c i x) + P.c i (P.c i x) = 0 := by
    nth_rewrite 2 [h]
    rw [neg_one_smul]
    exact add_neg_cancel _
  have h8 : ((1 : K) + 1) • P.c i (P.c i x) = 0 := by
    rw [add_smul, one_smul]
    exact hsum
  have hkey := inv_smul_smul₀ h2 (P.c i (P.c i x))
  rw [← hkey, h8, smul_zero]

end Fermionic

/-! ## Bosonic side (ε = +1): the weight-1 fragment and the weighted target -/

section Bosonic

variable {R : Type*} [CommRing R] {M : Type*} [AddCommGroup M] [Module R M]
  {ι : Type*} [DecidableEq ι] (P : OccupationPair R M (1 : R) ι)

/-- ε = +1 specialization of the universal dual family: the weight-1 fragment of eth's
`LemmaDual` shape. The FULL bosonic dual-family theorem (eth `AppHalfPiecesStatement.lean:
175`, `op (aFam μ) (-h) (bFam ν) = C (if μ = ν then h! else 0)`) needs the weighted
refinement of `OccupationPair` (mixed weights `w i`, Multiset/partition indexing, the
`z_μ = ∏ k^{m_k} m_k!` normalization and the `aFam` sign-twists of
AppHalfPiecesStatement.lean:166–174) — recorded as M2 design target, NOT provable in the
weight-1 layer, and deliberately NOT asserted here. -/
theorem bosonic_unweighted (t : List ι) (ht : t.Nodup) (x : M)
    (hx : ∀ j ∈ t, P.a j x = 0) : P.aW t (P.cW t.reverse x) = x :=
  P.dual_family t ht x hx

end Bosonic

end OccupationPair

/-! ## The fermionic instance over mathlib's ExteriorAlgebra

`ExteriorAlgebra ℂ V := CliffordAlgebra ℂ (0 : QuadraticForm ℂ V)` (abbrev,
Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean:60), so `CliffordAlgebra.contractLeft` is
the exterior contraction. Donor template: openai's CAR layer
(OAI/Analysis/Laughlin/Operators/CAR.lean:15–58) — same construction, same three relation
proofs, here packaged into `OccupationPair` at ε = -1 with vacuum `1` (`avac` =
`CliffordAlgebra.contractLeft_one`, Contraction.lean:176).
-/

section Instance

variable (n : ℕ)

/-- The one-particle space of `n` modes (Pi type, as in openai's `Orbital Q`). -/
abbrev Sp : Type := ExteriorAlgebra ℂ (Fin n → ℂ)

/-- The standard mode vectors (openai `mode`, CAR.lean:13). -/
def eVec (n : ℕ) (i : Fin n) : Fin n → ℂ := Pi.single i 1

/-- Creation by wedge-insertion of mode `i` (openai `create`, CAR.lean:15–19). -/
noncomputable def fermCreate (n : ℕ) (i : Fin n) : Module.End ℂ (Sp n) where
  toFun x := ExteriorAlgebra.ι ℂ (eVec n i) * x
  map_add' _ _ := by simp [mul_add]
  map_smul' _ _ := by simp [mul_smul]

/-- Annihilation by contraction against mode `i` (openai `annihilate`, CAR.lean:20–21;
`Q := 0` explicit since Contraction.lean's section variables are explicit). -/
noncomputable def fermAnnihilate (n : ℕ) (i : Fin n) : Module.End ℂ (Sp n) :=
  CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℂ (Fin n → ℂ))) (LinearMap.proj i)

/-- The fermionic `OccupationPair` on `n` modes. -/
noncomputable def fermionicPair (n : ℕ) : OccupationPair ℂ (Sp n) (-1 : ℂ) (Fin n) where
  c := fermCreate n
  a := fermAnnihilate n
  cc := by
    intro i j
    refine LinearMap.ext fun x => ?_
    show ExteriorAlgebra.ι ℂ (eVec n i) * (ExteriorAlgebra.ι ℂ (eVec n j) * x)
        = (-1 : ℂ) • (ExteriorAlgebra.ι ℂ (eVec n j) * (ExteriorAlgebra.ι ℂ (eVec n i) * x))
    rw [← mul_assoc, ← mul_assoc]
    have h0 : ExteriorAlgebra.ι ℂ (eVec n i) * ExteriorAlgebra.ι ℂ (eVec n j) * x
        + ExteriorAlgebra.ι ℂ (eVec n j) * ExteriorAlgebra.ι ℂ (eVec n i) * x = 0 := by
      rw [← add_mul, ExteriorAlgebra.ι_add_mul_swap, zero_mul]
    simpa only [neg_one_smul] using eq_neg_of_add_eq_zero_left h0
  aa := by
    intro i j
    refine LinearMap.ext fun x => ?_
    show CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℂ (Fin n → ℂ)))
        (LinearMap.proj i)
        (CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℂ (Fin n → ℂ)))
          (LinearMap.proj j) x)
      = (-1 : ℂ) • CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℂ (Fin n → ℂ)))
          (LinearMap.proj j)
          (CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℂ (Fin n → ℂ)))
            (LinearMap.proj i) x)
    rw [CliffordAlgebra.contractLeft_comm]
    simp
  ac_self := by
    intro i
    refine LinearMap.ext fun x => ?_
    have h1 := CliffordAlgebra.contractLeft_ι_mul (Q := (0 : QuadraticForm ℂ (Fin n → ℂ)))
      (LinearMap.proj i) (eVec n i) x
    show CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℂ (Fin n → ℂ)))
        (LinearMap.proj i) (ExteriorAlgebra.ι ℂ (eVec n i) * x)
      = x + (-1 : ℂ) • (ExteriorAlgebra.ι ℂ (eVec n i) *
          CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℂ (Fin n → ℂ)))
            (LinearMap.proj i) x)
    rw [h1]
    simp [eVec, LinearMap.proj, sub_eq_add_neg, neg_one_smul]
  ac_ne := by
    intro i j h
    refine LinearMap.ext fun x => ?_
    have h1 := CliffordAlgebra.contractLeft_ι_mul (Q := (0 : QuadraticForm ℂ (Fin n → ℂ)))
      (LinearMap.proj i) (eVec n j) x
    show CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℂ (Fin n → ℂ)))
        (LinearMap.proj i) (ExteriorAlgebra.ι ℂ (eVec n j) * x)
      = (-1 : ℂ) • (ExteriorAlgebra.ι ℂ (eVec n j) *
          CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℂ (Fin n → ℂ)))
            (LinearMap.proj i) x)
    rw [h1]
    simp [eVec, LinearMap.proj, h, sub_eq_add_neg, neg_one_smul, zero_smul]
  vac := 1
  avac := fun _ => by
    show CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm ℂ (Fin n → ℂ)))
        (LinearMap.proj _) (1 : Sp n) = 0
    exact CliffordAlgebra.contractLeft_one _ _

end Instance

#print axioms OccupationPair.dual_family
#print axioms OccupationPair.sign_transposition
#print axioms fermionicPair

end CrossMath.Pilot52
