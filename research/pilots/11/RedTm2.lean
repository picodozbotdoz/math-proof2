/-
  Pilot 11, M2 — the TM2 realization layer (dossier 11 Theorem B(ii), pilot grain).

  Posture (11-blueprint §4, dossier §"The two theorems" B(ii) + F5): define the machine
  cost model on mathlib's OWN TM2 machines (`Turing.TM2ComputableAux` /
  `TM2OutputsInTime` — the eth MainResults.lean:158 shape, surface validated on v4.36
  by ProbeB2), and prove the closure axioms of the dossier's CostModel layer:

    * monotone   — PROVED from mathlib alone (`EvalsToInTime` carries `steps ≤ m`).
    * choice     — PROVED from eth interface statements: the size-branching machine is
                   eth's `Stepped.ite` (Prog/Comb.lean, ported in P11T3); its poly-time
                   is eth's IsPolyT-closure interface (ToTuring/Poly/Comb.lean) plus the
                   size-threshold decision (Lib/Nat1.decide_lt ∘ Lib/Nat1b.length).
    * charging   — PROVED from eth interfaces, routed through `exists_tm` step counts
                   exactly as dossier F5 sanctions: the composed machine is eth's
                   `Stepped.foldWhile` (ported with proofs in P11T3) walking the query
                   list's suffixes, the callee run per query via `mapIn`; steps =
                   Σ over queries of (callee time + 1).

  The eth donor results whose proofs need the fragment library (not ported) enter as
  VERBATIM hypothesis binders — eth's own interface convention (Interfaces.lean: "a
  file that needs the statement takes it as a hypothesis"): `EthExistsTm` (exists_tm,
  Machine/Host.lean:305–309, Prop-valued), `EthPoly` (function-level PolyT closures,
  Closure/Basic.lean:53–127, Closure/Cases.lean:166–169, Lib/List1b.lean:28/:33/:38,
  Lib/Nat1b.lean:84, Lib/Nat1.lean:304 — Prop-valued), `EthIsPoly` (IsPolyT closures
  for the Stepped combinators, ToTuring/Poly/Basic.lean, Poly/IsPoly.lean:42/:98,
  Poly/Comb.lean:50/:63 — DATA-valued, since `IsPolyT` is a class). Everything here is
  proved unconditionally ON those interfaces; no `sorry`, no `native_decide`, no
  external CAS.

  Encoding convention: a problem input is a bit string (`List Bool`); the caller's
  query pattern is a LIST of queries (`qs x : List (List Bool)`); the charging machine
  walks the suffixes of `qs x` and hands each suffix's head to the callee.

  Relaunch fixes (2026-11-14, lane A8, completing the four pinpoint fixes): the
  `hsomeCons` plumbing rebuilt (the prior annotation was ill-typed: the match-fun's
  pair domain is `suffix-list × query × rest`; `hstart` now via `comp hsfOpt hqs`
  instead of a second case-split); `composed_sum_le` re-proved (length-form inner
  induction + `Nat.mul_le_mul_right` — the k-form statement with `hk` cannot close
  by direct induction); `hTm` applied to the explicit charging machine (avoids
  instance synthesis on a metavariable machine).
-/
import P11T3

namespace CrossMath.Pilot11.M2

open Groundwork Groundwork.Stepped Turing

/-! ## §1 The TM2 cost model and the monotone closure (proved) -/

/-- Machine-solvability on bit strings: ONE of Mathlib's bundled TM2 machines answers
every input `x` within `T x` steps (the eth `MainResults.lean:158` `CountsWithin`
shape; single-bit answers as in `DecidesKSat`). -/
def Tm2Sol (f : List Bool → Bool) (T : List Bool → ℕ) : Prop :=
  ∃ M : TM2ComputableAux Bool Bool, ∀ x : List Bool,
    Nonempty (TM2OutputsInTime M.tm (x.map M.inputAlphabet.invFun)
      (some ([f x].map M.outputAlphabet.invFun)) (T x))

/-- Time bounds widen: `EvalsToInTime` remembers `steps ≤ m` (mathlib,
Computability/StateTransition.lean:266). A value, not a proof — `TM2OutputsInTime`
is data (it carries the step count). -/
def tm2OutputsInTime_mono {tm : FinTM2} {l : List (tm.Γ tm.k₀)}
    {l' : Option (List (tm.Γ tm.k₁))} {t t' : ℕ} (ht : t ≤ t')
    (h : TM2OutputsInTime tm l l' t) : TM2OutputsInTime tm l l' t' :=
  ⟨h.toEvalsTo, h.steps_le_m.trans ht⟩

/-- **Closure 1 (monotone)** — `Sol A T → Sol A T'` when `T ≤ T'` pointwise: the same
machine, more time (dossier §machine-model layer, closure 1; corpus instance
`Closure.MonoExactTriangle`). -/
theorem Tm2Sol.mono {f : List Bool → Bool} {T T' : List Bool → ℕ} (hT : ∀ x, T x ≤ T' x)
    (h : Tm2Sol f T) : Tm2Sol f T' := by
  obtain ⟨M, hM⟩ := h
  exact ⟨M, fun x => (hM x).map (tm2OutputsInTime_mono (hT x))⟩

/-! ## §2 The eth interface statements (donor shapes as hypothesis binders) -/

/-- eth interface: `exists_tm` — VERBATIM statement of
`Groundwork.exists_tm` (ToTuring/Machine/Host.lean:305–309). A stepped computation
with polynomial-time init/step/out and states of size ≤ (|x|+2)^d runs on one of
Mathlib's TM2 machines within `c·(T+1)·(|x|+1)^c` steps. The donor proof (fragment
assembly: prologue/main-loop/output gluing) is not ported; the statement is taken as a
hypothesis per the eth interface convention (CircuitLowerBound/Interfaces.lean). -/
def EthExistsTm : Prop :=
  ∀ (M : Stepped (List Bool) Bool) [IsPolyT M] (d : ℕ),
    ∃ (N : TM2ComputableAux Bool Bool) (c : ℕ), (∀ k, Finite (N.tm.Γ k)) ∧
      ∀ (x : List Bool) (T S : ℕ) (b : Bool), M.Runs x T S b → S ≤ (x.length + 2) ^ d →
        Nonempty (TM2OutputsInTime N.tm (x.map N.inputAlphabet.invFun)
          (some ([b].map N.outputAlphabet.invFun)) (c * (T + 1) * (x.length + 1) ^ c))

/-- eth interface: the function-level `PolyT` closures — VERBATIM statements of the
donor lemmas (file:line per field). Together these are the fragment-free face of eth's
Closure/ layer; the donor proofs glue stack fragments (not ported). -/
structure EthPoly : Prop where
  /-- Closure/Basic:53 -/
  id' : ∀ {α β : Type} [Enc α] [Enc β], PolyT (fun x : α => x)
  /-- Closure/Basic:56 -/
  const : ∀ {α β : Type} [Enc α] [Enc β] (b : β), PolyT fun _ : α => b
  /-- Closure/Basic:61 -/
  comp : ∀ {α β γ : Type} [Enc α] [Enc β] [Enc γ] {f : β → γ} {g : α → β},
    PolyT f → PolyT g → PolyT (fun x => f (g x))
  /-- Closure/Basic:69 -/
  prodMk : ∀ {α β γ : Type} [Enc α] [Enc β] [Enc γ] {f : α → β} {g : α → γ},
    PolyT f → PolyT g → PolyT (fun x => (f x, g x))
  /-- Closure/Basic:115 -/
  fst : ∀ {α β γ : Type} [Enc α] [Enc β] [Enc γ] {f : α → β × γ},
    PolyT f → PolyT (fun x => (f x).1)
  /-- Closure/Basic:117 -/
  snd : ∀ {α β γ : Type} [Enc α] [Enc β] [Enc γ] {f : α → β × γ},
    PolyT f → PolyT (fun x => (f x).2)
  /-- Closure/Basic:121 -/
  some' : ∀ {α β : Type} [Enc α] [Enc β] {f : α → β},
    PolyT f → PolyT (fun x => some (f x))
  /-- Closure/Basic:123 -/
  inl' : ∀ {α β γ : Type} [Enc α] [Enc β] [Enc γ] {f : α → β},
    PolyT f → PolyT (fun x => (Sum.inl (f x) : β ⊕ γ))
  /-- Closure/Basic:125 -/
  inr' : ∀ {α β γ : Type} [Enc α] [Enc β] [Enc γ] {f : α → γ},
    PolyT f → PolyT (fun x => (Sum.inr (f x) : β ⊕ γ))
  /-- Closure/Basic:127 -/
  cons' : ∀ {α β : Type} [Enc α] [Enc β] {f : α → β} {l : α → List β},
    PolyT f → PolyT l → PolyT (fun x => f x :: l x)
  /-- Closure/Cases:166 — case distinction on a list -/
  listCases : ∀ {α β γ : Type} [Enc α] [Enc β] [Enc γ] {l : α → List β} {d : α → γ}
    {f : α → β → List β → γ}, PolyT l → PolyT d →
    PolyT (fun p : α × β × List β => f p.1 p.2.1 p.2.2) →
    PolyT (fun x => match l x with | [] => d x | e :: r => f x e r)
  /-- Lib/List1b:28 -/
  head? : ∀ {α β : Type} [Enc α] [Enc β] {l : α → List β},
    PolyT l → PolyT (fun x => (l x).head?)
  /-- Lib/List1b:33 -/
  headD : ∀ {α β : Type} [Enc α] [Enc β] {l : α → List β} {d : α → β},
    PolyT l → PolyT d → PolyT (fun x => (l x).headD (d x))
  /-- Lib/List1b:38 -/
  tail : ∀ {α β : Type} [Enc α] [Enc β] {l : α → List β},
    PolyT l → PolyT (fun x => (l x).tail)
  /-- Lib/Nat1b:84 — the length of a list, in binary -/
  length : ∀ {α β : Type} [Enc α] [Enc β] {l : α → List β},
    PolyT l → PolyT (fun x => (l x).length)
  /-- Lib/Nat1:304 -/
  decide_lt : ∀ {α : Type} [Enc α] {f g : α → ℕ},
    PolyT f → PolyT g → PolyT (fun x => decide (f x < g x))

/-- eth interface: `IsPolyT` closure for the Stepped combinators — VERBATIM statements
(ToTuring/Poly/Basic.lean, Poly/IsPoly.lean, Poly/Comb.lean). Data-valued (each field
yields an `IsPolyT` instance), so this interface is a structure in `Type`, taken as a
hypothesis. -/
structure EthIsPoly where
  /-- ToTuring/Poly/IsPoly:42 -/
  ofFun : ∀ {α β : Type} [Enc α] [Enc β] [HasSize α] [HasSize β] [Carried α] [Carried β]
    {f : α → β}, PolyT f → IsPolyT (Stepped.ofFun f)
  /-- ToTuring/Poly/Basic:41 (`IsPolyT.mapIn`) -/
  mapIn : ∀ {α β γ : Type} [Enc α] [Enc β] [Enc γ] {f : α → β} {M : Stepped β γ} [IsPolyT M],
    PolyT f → IsPolyT (Stepped.mapIn f M)
  /-- ToTuring/Poly/Basic:66 (`IsPolyT.mapOut`) -/
  mapOut : ∀ {α β γ : Type} [Enc α] [Enc β] [Enc γ] {M : Stepped α β} [IsPolyT M] {f : β → γ},
    PolyT f → IsPolyT (Stepped.mapOut M f)
  /-- ToTuring/Poly/Basic:104 (`IsPolyT.bind`) -/
  bind : ∀ {α β γ : Type} [Enc α] [Enc β] [Enc γ] {M : Stepped α β} {N : Stepped (α × β) γ}
    [IsPolyT M] [IsPolyT N] [HasSize α] [Carried α], IsPolyT (Stepped.bind M N)
  /-- ToTuring/Poly/Comb:63 (`IsPolyT.iteSel_poly`) -/
  iteSel_poly : ∀ {α : Type} [Enc α] {p : α → Bool}, PolyT p → PolyT (Stepped.iteSel p)
  /-- ToTuring/Poly/Comb:50 (`IsPolyT.branch`) -/
  branch : ∀ {α α₁ α₂ β : Type} [Enc α] [Enc α₁] [Enc α₂] [Enc β] {sel : α → α₁ ⊕ α₂}
    {M₁ : Stepped α₁ β} {M₂ : Stepped α₂ β} [IsPolyT M₁] [IsPolyT M₂],
    PolyT sel → IsPolyT (Stepped.branch sel M₁ M₂)
  /-- ToTuring/Poly/IsPoly:98 (`IsPolyT.foldWhile`) -/
  foldWhile : ∀ {α β γ τ : Type} [Enc τ] [Enc γ] [Enc α] [Enc β] {start : α → Option τ}
    {nxt : τ → Option τ} {M : Stepped τ β} [IsPolyT M] {g : γ → τ → β → γ} {c₀ : α → γ}
    [HasSize τ] [HasSize γ] [Carried τ] [Carried γ], PolyT start → PolyT nxt →
    PolyT (fun p : γ × τ × β => g p.1 p.2.1 p.2.2) → PolyT c₀ →
    IsPolyT (Stepped.foldWhile start nxt M g c₀)

/-! ## §3 Closure 2: size-threshold choice (proved from the interfaces) -/

/-- **Closure 2 (choice)** — both machines solve `f`; one machine within the piecewise
bound `if |x| < n₀ then T₁ else T₂`, up to the exists_tm poly-widening factor
`c·(·+1)·(|x|+1)^c` (the dossier's `∃C₀` slack; corpus instance `Closure.ChooseBySize`,
Definitions.lean:127–130). The branching machine is eth's `Stepped.ite`; its poly-time
is the eth branch closure + the size-threshold decision
(`Nat1b.length ∘ id` vs `const n₀`, `Nat1.decide_lt`). -/
theorem tm2_choice (hTm : EthExistsTm) (hPoly : EthPoly) (hComb : EthIsPoly)
    {M₁ M₂ : Stepped (List Bool) Bool} [IsPolyT M₁] [IsPolyT M₂]
    (f : List Bool → Bool) (T₁ T₂ : List Bool → ℕ) (d₁ d₂ n₀ : ℕ)
    (r₁ : ∀ x, M₁.Runs x (T₁ x) ((x.length + 2) ^ d₁) (f x))
    (r₂ : ∀ x, M₂.Runs x (T₂ x) ((x.length + 2) ^ d₂) (f x)) :
    ∃ c : ℕ, Tm2Sol f fun x =>
      c * ((if x.length < n₀ then T₁ x else T₂ x) + 1) * (x.length + 1) ^ c := by
  have hp : PolyT fun x : List Bool => decide (x.length < n₀) :=
    hPoly.decide_lt (hPoly.length (hPoly.id' (α := List Bool) (β := List Bool)))
      (hPoly.const n₀)
  haveI hM : IsPolyT (Stepped.branch (Stepped.iteSel (fun x => decide (x.length < n₀)))
      M₁ M₂) :=
    hComb.branch (α := List Bool) (α₁ := List Bool) (α₂ := List Bool) (β := Bool)
      (hComb.iteSel_poly hp)
  obtain ⟨N, c, -, hb⟩ :=
    hTm (Stepped.branch (Stepped.iteSel (fun x => decide (x.length < n₀))) M₁ M₂)
      (max d₁ d₂ + 1)
  refine ⟨c, N, fun x => ?_⟩
  have hb2 : 2 ≤ x.length + 2 := by omega
  by_cases hx : x.length < n₀
  · have hr := branch_runs_inl (sel := Stepped.iteSel (fun y => decide (y.length < n₀)))
      (M₂ := M₂) (a := x) (x := x) (by simp [iteSel, hx]) (r₁ x)
    have hS : (x.length + 2) ^ d₁ + 1 ≤ (x.length + 2) ^ (max d₁ d₂ + 1) := by
      have h1 : (1:ℕ) ≤ (x.length + 2) ^ d₁ := Nat.one_le_pow _ _ (by omega)
      have h3 : (x.length + 2) ^ d₁ + 1 ≤ (x.length + 2) ^ d₁ * (x.length + 2) := by
        calc (x.length + 2) ^ d₁ + 1 ≤ (x.length + 2) ^ d₁ * 2 := by omega
          _ ≤ (x.length + 2) ^ d₁ * (x.length + 2) := Nat.mul_le_mul_left _ hb2
      calc (x.length + 2) ^ d₁ + 1 ≤ (x.length + 2) ^ (d₁ + 1) :=
            h3.trans_eq (by rw [Nat.pow_succ])
        _ ≤ (x.length + 2) ^ (max d₁ d₂ + 1) :=
            Nat.pow_le_pow_right (by omega) (by omega)
    show Nonempty (TM2OutputsInTime N.tm (x.map N.inputAlphabet.invFun)
        (some ([f x].map N.outputAlphabet.invFun))
        (c * ((if x.length < n₀ then T₁ x else T₂ x) + 1) * (x.length + 1) ^ c))
    split
    · exact hb x (T₁ x) _ (f x) hr hS
    · next h => exact absurd hx h
  · have hr := branch_runs_inr (sel := Stepped.iteSel (fun y => decide (y.length < n₀)))
      (M₁ := M₁) (a := x) (y := x) (by simp [iteSel, hx]) (r₂ x)
    have hS : (x.length + 2) ^ d₂ + 1 ≤ (x.length + 2) ^ (max d₁ d₂ + 1) := by
      have h1 : (1:ℕ) ≤ (x.length + 2) ^ d₂ := Nat.one_le_pow _ _ (by omega)
      have h3 : (x.length + 2) ^ d₂ + 1 ≤ (x.length + 2) ^ d₂ * (x.length + 2) := by
        calc (x.length + 2) ^ d₂ + 1 ≤ (x.length + 2) ^ d₂ * 2 := by omega
          _ ≤ (x.length + 2) ^ d₂ * (x.length + 2) := Nat.mul_le_mul_left _ hb2
      calc (x.length + 2) ^ d₂ + 1 ≤ (x.length + 2) ^ (d₂ + 1) :=
            h3.trans_eq (by rw [Nat.pow_succ])
        _ ≤ (x.length + 2) ^ (max d₁ d₂ + 1) :=
            Nat.pow_le_pow_right (by omega) (by omega)
    show Nonempty (TM2OutputsInTime N.tm (x.map N.inputAlphabet.invFun)
        (some ([f x].map N.outputAlphabet.invFun))
        (c * ((if x.length < n₀ then T₁ x else T₂ x) + 1) * (x.length + 1) ^ c))
    split
    · next h => exact absurd h hx
    · exact hb x (T₂ x) _ (f x) hr hS

/-! ## §4 Closure 3: call-charging through exists_tm step counts (proved) -/

/-- The nonempty suffixes of a query list, longest first: the orbit walked by the
charging machine. -/
def sf : List (List Bool) → List (List (List Bool))
  | [] => []
  | h :: t => (h :: t) :: sf t

/-- The first point of the walk: the whole list, if nonempty. -/
def sfOpt (l : List (List Bool)) : Option (List (List Bool)) :=
  match l with | [] => none | _ => some l

/-- The suffix walk: after a nonempty suffix, the next suffix is its tail, if nonempty. -/
def sfNext (s : List (List Bool)) : Option (List (List Bool)) := sfOpt s.tail

/-- The walk visits exactly the nonempty suffixes. -/
theorem orbit_sf : ∀ l : List (List Bool), Orbit sfNext (sfOpt l) (sf l)
  | [] => .nil
  | _ :: t => .cons (orbit_sf t)

/-- The heads of the nonempty suffixes are exactly the queries, in order. -/
theorem map_headD_sf (l : List (List Bool)) :
    (sf l).map (fun s => s.headD []) = l := by
  induction l with
  | nil => rfl
  | cons q t ih => exact congrArg (q :: ·) ih

/-- The suffix-sum rewrites to the query-sum: walking the suffixes charges each query
exactly once. -/
theorem sum_sf (l : List (List Bool)) (F : List Bool → ℕ) :
    ((sf l).map fun s => F (s.headD [])).sum = (l.map F).sum := by
  induction l with
  | nil => rfl
  | cons q t ih =>
    show F ((q :: t).headD []) + ((sf t).map fun s => F (s.headD [])).sum
        = F q + (t.map F).sum
    rw [ih]
    rfl

/-- **Closure 3 (charging)** — the callee `Md` solves each query in `tquery` steps; the
caller's query pattern is the list `qs x` with polynomial-time plumbing (`qs`, `g`,
`c₀`); then ONE TM2 machine computes the fold of the callee's answers within
`c·(Σ_q (tquery q + 1) + 1)·(|x|+1)^c` steps: each call charged exactly its running
time plus one (the corpus convention, TimeClaims/Sec3/Definitions.lean:54–58). The
machine is eth's `foldWhile` over the suffix walk; the size bookkeeping of the caller
skeleton is the hypothesis `hsz` (per dossier F5, charging is routed through exists_tm
step counts, not through per-call clock fragments). -/
theorem tm2_charging (hTm : EthExistsTm) (hPoly : EthPoly) (hComb : EthIsPoly)
    (qs : List Bool → List (List Bool)) (hqs : PolyT qs)
    {Md : Stepped (List Bool) Bool} [IsPolyT Md]
    (v : List Bool → Bool) (tquery : List Bool → ℕ) (Sm : ℕ)
    (hrun : ∀ q, Md.Runs q (tquery q) Sm (v q))
    (g : Bool → List Bool → Bool → Bool)
    (hg : PolyT fun p : Bool × List Bool × Bool => g p.1 p.2.1 p.2.2)
    (c₀ : List Bool → Bool) (hc₀ : PolyT c₀) (d : ℕ)
    (hsz : ∀ x : List Bool, ∃ Sx Sc : ℕ,
      (∀ s ∈ sf (qs x), size s ≤ Sx) ∧
      (∀ l, l <+: sf (qs x) →
        size (l.foldl (fun c s => g c (s.headD []) (v (s.headD []))) (c₀ x)) ≤ Sc) ∧
      Sx + (Sc + Sm) + 1 ≤ (x.length + 2) ^ d) :
    ∃ c : ℕ, Tm2Sol
      (fun x => (sf (qs x)).foldl (fun c s => g c (s.headD []) (v (s.headD []))) (c₀ x))
      (fun x => c * (((qs x).map fun q => tquery q + 1).sum + 1) * (x.length + 1) ^ c) := by
  -- the poly-time plumbing of the walk
  have htail : PolyT fun s : List (List Bool) => s.tail :=
    hPoly.tail (hPoly.id' (α := List (List Bool)) (β := List (List Bool)))
  -- concretely-typed identity plumbing: `id'`'s β binder is statement-unused, so a
  -- bare `hPoly.id'` leaves `Enc ?β` stuck; β must be supplied explicitly.
  have pid1 : PolyT (fun x : List (List Bool) => x) :=
    hPoly.id' (α := List (List Bool)) (β := List Bool)
  have pid3 : PolyT (fun x : List (List Bool) × List Bool × List (List Bool) => x) :=
    hPoly.id' (α := List (List Bool) × List Bool × List (List Bool)) (β := List Bool)
  have pid2 : PolyT (fun x : Bool × (List (List Bool) × Bool) => x) :=
    hPoly.id' (α := Bool × (List (List Bool) × Bool)) (β := Bool)
  have hsomeCons : PolyT
      (fun p : List (List Bool) × List Bool × List (List Bool) =>
        some (p.2.1 :: p.2.2)) :=
    hPoly.some' (hPoly.cons' (hPoly.fst (hPoly.snd pid3))
      (hPoly.snd (hPoly.snd pid3)))
  have hsfOpt : PolyT sfOpt :=
    (hPoly.listCases (f := fun _ e r => some (e :: r)) pid1 (hPoly.const none)
      hsomeCons).congr
      fun s => by cases s <;> rfl
  have hstart : PolyT fun x : List Bool => sfOpt (qs x) :=
    hPoly.comp (f := sfOpt) (g := qs) hsfOpt hqs
  have hnext : PolyT sfNext :=
    (hPoly.comp (f := sfOpt) (g := fun s : List (List Bool) => s.tail) hsfOpt htail).congr
      fun s => rfl
  have hbody : PolyT fun s : List (List Bool) => s.headD [] :=
    hPoly.headD pid1 (hPoly.const [])
  have hg' : PolyT (fun p : Bool × (List (List Bool) × Bool) =>
      g p.1 (p.2.1.headD []) p.2.2) :=
    hPoly.comp (f := fun q : Bool × (List Bool × Bool) => g q.1 q.2.1 q.2.2)
      (g := fun p : Bool × (List (List Bool) × Bool) => (p.1, (p.2.1.headD [], p.2.2))) hg
      (hPoly.prodMk (hPoly.fst pid2)
        (hPoly.prodMk (hPoly.headD (hPoly.fst (hPoly.snd pid2)) (hPoly.const []))
          (hPoly.snd (hPoly.snd pid2))))
  -- the composed machine and its poly-time
  haveI hMb : IsPolyT (Stepped.mapIn (fun s : List (List Bool) => s.headD []) Md) :=
    hComb.mapIn (α := List (List Bool)) (β := List Bool) (γ := Bool) hbody
  haveI hM : IsPolyT (Stepped.foldWhile (fun x => sfOpt (qs x)) sfNext
      (Stepped.mapIn (fun s : List (List Bool) => s.headD []) Md)
      (fun c s b => g c (s.headD []) b) c₀) :=
    hComb.foldWhile (α := List Bool) (β := Bool) (γ := Bool) (τ := List (List Bool))
      hstart hnext hg' hc₀
  obtain ⟨N, c, -, hb⟩ :=
    hTm (Stepped.foldWhile (fun x => sfOpt (qs x)) sfNext
        (Stepped.mapIn (fun s : List (List Bool) => s.headD []) Md)
        (fun c s b => g c (s.headD []) b) c₀) d
  refine ⟨c, N, fun x => ?_⟩
  obtain ⟨Sx, Sc, hxs, hxc, hxd⟩ := hsz x
  have hr : (Stepped.foldWhile (fun x => sfOpt (qs x)) sfNext
      (Stepped.mapIn (fun s : List (List Bool) => s.headD []) Md)
      (fun c s b => g c (s.headD []) b) c₀).Runs x
      ((sf (qs x)).map fun s => tquery (s.headD []) + 1).sum (Sx + (Sc + Sm) + 1)
      ((sf (qs x)).foldl (fun c s => g c (s.headD []) (v (s.headD []))) (c₀ x)) :=
    Stepped.foldWhile_runs (g := fun c s b => g c (s.headD []) b) (c₀ := c₀)
      (orbit_sf (qs x)) (fun s => tquery (s.headD []))
      (fun s => v (s.headD [])) Sx Sc Sm
      (fun s _ => Stepped.mapIn_runs (hrun (s.headD []))) hxs hxc
  have hmono : c * (((sf (qs x)).map fun s => tquery (s.headD []) + 1).sum + 1)
        * (x.length + 1) ^ c
      ≤ c * (((qs x).map fun q => tquery q + 1).sum + 1) * (x.length + 1) ^ c := by
    have hsum := sum_sf (qs x) (fun q => tquery q + 1)
    rw [hsum]
  exact (hb x _ _ _ hr hxd).map (tm2OutputsInTime_mono hmono)

/-! ## §5 The composed bound in the Red-calculus shape (acceptance) -/

/-- The Red-shape arithmetic: `Σ_q (t q + 1) ≤ calls·(T+1)` when every call is at most
`T` and there are at most `calls` queries. With `calls·(T+1) = calls·T + calls`, this
is exactly the composed bound of Theorem A — `extra + calls·T` — with the `+ calls`
slack folded into `extra` (Design B: constants folded into extra at the leaves). -/
theorem composed_sum_le (l : List (List Bool)) (t : List Bool → ℕ) (Tn k : ℕ)
    (ht : ∀ q ∈ l, t q ≤ Tn) (hk : l.length ≤ k) :
    (l.map fun q => t q + 1).sum ≤ k * (Tn + 1) := by
  have hlen : (l.map fun q => t q + 1).sum ≤ l.length * (Tn + 1) := by
    clear hk
    induction l with
    | nil => simp
    | cons q l ih =>
      have h1 := ht q (by simp)
      have h2 : ∀ r ∈ l, t r ≤ Tn := fun r hr => ht r (by simp [hr])
      have hih := ih h2
      simp only [List.map_cons, List.sum_cons, List.length_cons] at hih ⊢
      have h3 : l.length * (Tn + 1) + (Tn + 1) ≤ (l.length + 1) * (Tn + 1) := by
        rw [Nat.add_mul, Nat.one_mul]
      omega
  exact hlen.trans (Nat.mul_le_mul_right (Tn + 1) hk)

/-- **M2 acceptance (Theorem B(ii), pilot grain).** A callee machine solving every
query within `Tn`, called at most `calls x` times by a polynomial-time caller
skeleton, is realized by ONE of Mathlib's TM2 machines within
`c·(calls·T + calls + 1)·(|x|+1)^c` — the calculus's composed bound realized at
machine level: "every (single-step) calculus transfer is realized by a single TM2 with
the composed bound", up to the exists_tm poly-widening (the dossier's `C₀` slack). -/
theorem tm2_realized_composed (hTm : EthExistsTm) (hPoly : EthPoly) (hComb : EthIsPoly)
    (qs : List Bool → List (List Bool)) (hqs : PolyT qs)
    {Md : Stepped (List Bool) Bool} [IsPolyT Md]
    (v : List Bool → Bool) (tquery Tn : List Bool → ℕ) (Sm : ℕ)
    (hrun : ∀ q, Md.Runs q (tquery q) Sm (v q))
    (hT : ∀ x, ∀ q ∈ qs x, tquery q ≤ Tn x)
    (g : Bool → List Bool → Bool → Bool)
    (hg : PolyT fun p : Bool × List Bool × Bool => g p.1 p.2.1 p.2.2)
    (c₀ : List Bool → Bool) (hc₀ : PolyT c₀) (d : ℕ)
    (hsz : ∀ x : List Bool, ∃ Sx Sc : ℕ,
      (∀ s ∈ sf (qs x), size s ≤ Sx) ∧
      (∀ l, l <+: sf (qs x) →
        size (l.foldl (fun c s => g c (s.headD []) (v (s.headD []))) (c₀ x)) ≤ Sc) ∧
      Sx + (Sc + Sm) + 1 ≤ (x.length + 2) ^ d)
    (calls : List Bool → ℕ) (hk : ∀ x, (qs x).length ≤ calls x) :
    ∃ c : ℕ, Tm2Sol
      (fun x => (sf (qs x)).foldl (fun c s => g c (s.headD []) (v (s.headD []))) (c₀ x))
      (fun x => c * (calls x * (Tn x + 1) + 1) * (x.length + 1) ^ c) := by
  obtain ⟨c, hc⟩ := tm2_charging hTm hPoly hComb qs hqs v tquery Sm hrun g hg c₀ hc₀ d hsz
  refine ⟨c, Tm2Sol.mono (fun x => ?_) hc⟩
  have hsum := composed_sum_le (qs x) tquery (Tn x) (calls x) (hT x) (hk x)
  exact Nat.mul_le_mul (Nat.mul_le_mul_left c (by omega)) (le_refl _)

end CrossMath.Pilot11.M2

#print axioms CrossMath.Pilot11.M2.Tm2Sol.mono
#print axioms CrossMath.Pilot11.M2.tm2_choice
#print axioms CrossMath.Pilot11.M2.tm2_charging
#print axioms CrossMath.Pilot11.M2.composed_sum_le
#print axioms CrossMath.Pilot11.M2.tm2_realized_composed
