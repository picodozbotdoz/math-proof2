/-
Pilot 10-L1 — counter combinators (lemma L1 of `research/pilots/10-prework.md` §5, milestone M2
of `research/pilots/10-blueprint.md` §Next milestones), pilot-10 lane (Cycle 2), 2026-11-13.

Target: mathlib `ff2494ea` (toolchain leanprover/lean4:v4.36.0-rc2), kernel-only.
No `sorry`, no `native_decide`, no external CAS, no hypothesis binders: everything below is
proved, the donor layer included. Self-contained (`import Mathlib` only): the Modal runner
elaborates each staged file independently, so the small eth donor layer that L1 needs is
transcribed here rather than imported from M1.lean.

What L1 is (prework §2–3): eth's pad — a materialized list of 2^k units — enters the pipeline
through exactly three combinators (`Fuel.lean:35,38,45`): `rng` (enumeration cut), `sumF`
(summation cut), `cap` (state-size cut). The counter layer replaces `pad.length` by a number
`nb : ℕ` and rebuilds each combinator list-free — by plain ℕ-recursion (a binary countdown at
the machine level; that machine is milestone L2's business) — so that no exponentially long
`List.range` is ever built. This file proves the agreement theorem: every counter combinator
equals its pad counterpart at every pad (`nb = pad.length`), cut-offs active or not; and, when
the cut-offs are inactive, the counter combinators compute the uncut mathematical semantics
(the transport of eth's `rng_eq`/`sumF_eq`/`prodL_eq`/`cap_eq`/`len_cap_le`). The agreement of
composite pipeline routines — the prework's «f (pad k, args) = fC (2^k, args) whenever the
cut-offs are inactive, by structural induction mirroring each def» — is proved here for the two
idioms every `Prog.lean` routine is built from: the cut-sum leaf (`termF`'s `bif … else sumF`)
and the generic counted descent (`expand`/`descend`'s `foldl (cap ∘ flatMap (rng-filterMap))`),
including the inactivity transport with the pad's state budget as hypotheses (the `FitsG`
analog). The remaining pipeline routines mirror these idioms; instantiating them at eth's data
types is assembly, not new mathematics.

## Part A — eth's fuel layer, transcribed (read-only sibling
`anthropics_formal-math/eth/proof/`, Lean v4.33.1; statements and proofs copied verbatim except
where marked; the Lean-module syntax `module`/`public import`/`@[expose] public section` is
dropped, and each eth `section … end` becomes a reopened `namespace … end` so that
`research/pilots/10/axcheck_full.py`'s namespace tracker stays exact):

  machines/ToTuring/TM/Tree.lean :28–301 (subset, via M1.lean)   Sym, V, code (all Enc needs;
                                                                mirror/flip are M1's business)
  machines/ToTuring/Enc.lean :35–78 (subset, via M1.lean)        Enc, wd, len (not HasSize/
                                                                Carried: no states here)
  rates/PaddedDescent/F/Fuel.lean (all but Meas)                 U, rng, sumF, prodL, cap,
                                                                rng_eq, sumF_eq, prodL_eq,
                                                                cap_eq, len_cap_le
                                                                (Meas needs the fragment
                                                                calculus — M1.lean's layer)
  rates/PaddedDescent/Pad.lean :30, :65                          pad, length_pad

## Part B — new (this milestone): the counter combinators

  foldC, foldC_zero, foldC_succ      the list-free fold over 0, …, n−1 (the value of the binary
                                     countdown), by plain ℕ-recursion
  foldC_agree                        THE bridge: the list-free fold is the fold of the
                                     materialized `List.range`
  collectC, collectC_agree           the filterMap of the countdown = the filterMap of the range
  findC, findC_agree                 the first hit of the countdown = `find?` of the range (the
                                     rebalF/rebalG search idiom)
  rngC, sumFC, prodC, capC           the counter variants of rng/sumF/prodL/cap (nb for
                                     pad.length, cut at min · nb inside)
  rngC_agree, sumFC_agree, prodC_agree, capC_agree   agreement at every pad (nb = pad.length),
                                     cut-offs active or not
  rngC_eq, sumFC_eq, prodC_eq, capC_eq, len_capC_le  inactivity ⇒ the uncut mathematical
                                     semantics (eth's five lemmas transported to the counter
                                     side)

## Part C — new: the agreement theorem for composite routines (the Prog.lean idioms)

  termFD/termFCD, termFCD_agree, termFCD_eq   the cut-sum leaf (`termF`'s shape: a test, or a
                                     table entry, or sumF over the pad)
  expand/descend (generic, eth's Prog.lean:144,148 shapes)      the pad versions
  expandC/descendC (new)             the counter versions (collectC over min (nR) nb; capC)
  expandU, expandC_uncut             the uncut mathematical expansion; inactivity of the
                                     enumeration cut
  expandC_agree, descendC_agree      agreement at every pad, by structural induction mirroring
                                     the definition (cap/rng/flatMap leaves)
  descendC_agree_pad                 f (pad k, …) = fC (2^k, …) — the prework's L1 statement
  descendC_uncut                     inactivity transport: with the pattern counts and the
                                     work-list words inside the budget nb (the state side of
                                     the pad, the FitsG analog), the counter descent is the
                                     uncut breadth-first expansion

Not claimed here: anything about machines, fragments or `PolyT` (M1.lean and L2's business), or
about eth's concrete pipeline data types (the descent is generic; the instantiation is
assembly). What L1 adds to M1: at the level of the three combinators, the 2^k-unit pad is
replaceable by the number 2^k, with the values of the pipeline unchanged.
-/

import Mathlib

/-! # Part A — eth's fuel layer (transcribed) -/

/-! ## machines/ToTuring/TM/Tree.lean:28–301, the subset Enc needs (via M1.lean) -/

namespace Groundwork.TM

/-- Bits and two brackets. -/
inductive Sym | bit (b : Bool) | L | R

/-- Binary trees whose leaves are bits or empty. -/
inductive V | nil | bit (b : Bool) | cons (x y : V)

/-- The code of a tree: ⟨⟩ for nil, the bit for a bit, ⟨ code x, code y ⟩ for cons x y. -/
def code : V → List Sym
  | .nil => [.L, .R]
  | .bit b => [.bit b]
  | .cons x y => .L :: (code x ++ code y ++ [.R])

end Groundwork.TM

/-! ## machines/ToTuring/Enc.lean:35–78, the core: Enc, wd, len (via M1.lean) -/

namespace Groundwork

open TM

/-- Data as trees. -/
class Enc (α : Type) where
  /-- the tree of a value -/
  toV : α → V

open Enc

instance : Enc Unit := ⟨fun _ => .nil⟩
instance : Enc Bool := ⟨.bit⟩
instance {α β : Type} [Enc α] [Enc β] : Enc (α × β) := ⟨fun p => .cons (toV p.1) (toV p.2)⟩
instance {α : Type} [Enc α] : Enc (List α) := ⟨fun l => l.foldr (fun x v => .cons (toV x) v) .nil⟩
instance {α : Type} [Enc α] : Enc (Option α) := ⟨fun o => o.elim .nil fun x => .cons (toV x) .nil⟩
instance {α β : Type} [Enc α] [Enc β] : Enc (α ⊕ β) :=
  ⟨fun s => s.elim (fun x => .cons (.bit false) (toV x)) fun y => .cons (.bit true) (toV y)⟩
/-- A number is the list of its binary digits, lowest first, no leading zero; 0 is the empty list. -/
instance : Enc ℕ := ⟨fun n => toV (Nat.bits n)⟩
/-- An integer is «negative?» and its absolute value. -/
instance : Enc ℤ := ⟨fun z => toV (decide (z < 0), z.natAbs)⟩

/-- The word that stands for x on a stack. -/
def wd {α : Type} [Enc α] (x : α) : List Sym := code (toV x)

/-- The length of the word of x. -/
def len {α : Type} [Enc α] (x : α) : ℕ := (wd x).length

end Groundwork

/-! ## rates/PaddedDescent/F/Fuel.lean (all but Meas, verbatim) -/

namespace PaddedDescent.F

open Groundwork

/-- A number in unary. -/
abbrev U := List Unit

/-- 0, …, q − 1, cut off at the length of the pad. -/
def rng (pad : U) (q : ℕ) : List ℕ := List.range (min q pad.length)

/-- Σ_{y < N} f y, cut off at the length of the pad. -/
def sumF (N : ℕ) (pad : U) (f : ℕ → ℤ) : ℤ :=
  (List.range (min N pad.length)).foldl (fun acc y => acc + f y) 0

/-- ∏_{y < n} f y (n is small: no cut-off). -/
def prodL (n : ℕ) (f : ℕ → ℤ) : ℤ := (List.range n).foldl (fun acc y => acc * f y) 1

/-- x if its word is no longer than the pad, else d. -/
def cap {γ : Type} [Enc γ] (pad : U) (d x : γ) : γ := if len x ≤ pad.length then x else d

theorem rng_eq {pad : U} {q : ℕ} (h : q ≤ pad.length) : rng pad q = List.range q := by
  rw [rng, min_eq_left h]

theorem sumF_eq {N : ℕ} {pad : U} (h : N ≤ pad.length) (f : ℕ → ℤ) :
    sumF N pad f = ∑ y ∈ Finset.range N, f y := by
  unfold sumF
  rw [min_eq_left h]
  clear h
  induction N with
  | zero => simp
  | succ n ih =>
    rw [List.range_succ, List.foldl_append, Finset.sum_range_succ]
    simp only [List.foldl_cons, List.foldl_nil]
    rw [ih]

theorem prodL_eq (n : ℕ) (f : ℕ → ℤ) : prodL n f = ∏ y ∈ Finset.range n, f y := by
  unfold prodL
  induction n with
  | zero => simp
  | succ n ih =>
    rw [List.range_succ, List.foldl_append, Finset.prod_range_succ]
    simp only [List.foldl_cons, List.foldl_nil]
    rw [ih]

theorem cap_eq {γ : Type} [Enc γ] {pad : U} {d x : γ} (h : len x ≤ pad.length) : cap pad d x = x := by
  simp [cap, h]

theorem len_cap_le {γ : Type} [Enc γ] (pad : U) (d x : γ) : len (cap pad d x) ≤ pad.length + len d := by
  unfold cap; split_ifs <;> omega

end PaddedDescent.F

/-! ## rates/PaddedDescent/Pad.lean:30, :65 (the pad itself) -/

namespace PaddedDescent

/-- The pad of length 2^k. -/
def pad (k : ℕ) : List Unit := List.replicate (2 ^ k) ()

theorem length_pad (k : ℕ) : (pad k).length = 2 ^ k := List.length_replicate

end PaddedDescent

/-! # Part B — the counter combinators (new) -/

namespace PaddedDescent.F

open Groundwork

variable {α : Type}

/-- The list-free fold over 0, …, n − 1: `foldC n g a` applies g to a at 0, then at 1, …, then at
n − 1, by plain recursion on the number n — no list is built. On the machine (milestone L2) this
recursion is a countdown with a binary counter of ⌈log₂ n⌉ + 1 bits; here it is the value of
that countdown. -/
def foldC : ℕ → (α → ℕ → α) → α → α
  | 0, _, a => a
  | n + 1, g, a => g (foldC n g a) n

@[simp] theorem foldC_zero (g : α → ℕ → α) (a : α) : foldC 0 g a = a := rfl

@[simp] theorem foldC_succ (n : ℕ) (g : α → ℕ → α) (a : α) : foldC (n + 1) g a = g (foldC n g a) n := rfl

/-- **The bridge.** The countdown fold is the fold of the materialized range: the counter
discipline and the pad discipline have the same value. -/
theorem foldC_agree (g : α → ℕ → α) : ∀ (n : ℕ) (a : α), foldC n g a = List.foldl g a (List.range n)
  | 0, a => rfl
  | n + 1, a => by
    rw [foldC_succ, foldC_agree g n a, List.range_succ, List.foldl_append, List.foldl_cons,
      List.foldl_nil]

/-- The list-free filterMap over 0, …, n − 1: the defined values of f at those y, in order. The
enumeration is the countdown; the collected list is genuine output — a frontier the algorithm
keeps (polynomially bounded on the real runs, prework §9). -/
def collectC (n : ℕ) (f : ℕ → Option α) : List α :=
  foldC n (fun acc y => (f y).elim acc fun x => acc ++ [x]) []

/-- The collected countdown is the filterMap of the materialized range. -/
theorem collectC_agree (f : ℕ → Option α) : ∀ n : ℕ, collectC n f = (List.range n).filterMap f
  | 0 => rfl
  | n + 1 => by
    have e1 : collectC (n + 1) f = (f n).elim (collectC n f) fun x => collectC n f ++ [x] := by
      unfold collectC
      rw [foldC_succ]
    rw [e1, collectC_agree f n, List.range_succ, List.filterMap_append]
    cases h : f n with
    | none => simp [h]
    | some x => simp [h]

/-- The first y < n with p y, by countdown — the list-free `List.find?` on the range (the
`rebalF`/`rebalG` search idiom `(rng pad (K ^ g)).find? …`). -/
def findC (nb q : ℕ) (p : ℕ → Bool) : Option ℕ :=
  foldC (min q nb) (fun o y => o <|> if p y then some y else none) none

private theorem find?_append' {β : Type} (p : β → Bool) : ∀ (l₁ l₂ : List β),
    (l₁ ++ l₂).find? p = ((l₁.find? p).orElse fun _ => l₂.find? p)
  | [], _ => rfl
  | a :: l₁, l₂ => by
    by_cases h : p a
    · simp [h]
    · simp [h, find?_append' p l₁ l₂]

private theorem findC_range (p : ℕ → Bool) : ∀ n : ℕ,
    foldC n (fun o y => o <|> if p y then some y else none) none = (List.range n).find? p
  | 0 => rfl
  | n + 1 => by
    have e1 : foldC (n + 1) (fun o y => o <|> if p y then some y else none) none =
        (foldC n (fun o y => o <|> if p y then some y else none) none).orElse
          fun _ => if p n then some n else none := by
      rw [foldC_succ]
      rfl
    rw [e1, findC_range p n, List.range_succ, find?_append' p]
    cases hx : (List.range n).find? p with
    | none => cases h : p n <;> simp [h]
    | some a => simp

/-- 0, …, q − 1, cut off at the number nb — as a countdown fold. The counter variant of `rng`:
where the pad discipline enumerates `List.range (min q pad.length)` (a list as long as the
cut), the counter discipline folds over `min q nb` without building anything. -/
def rngC (nb q : ℕ) (g : α → ℕ → α) (a : α) : α := foldC (min q nb) g a

/-- Σ_{y < N} f y, cut off at the number nb — the counter variant of `sumF`. -/
def sumFC (nb N : ℕ) (f : ℕ → ℤ) : ℤ := rngC nb N (fun acc y => acc + f y) 0

/-- ∏_{y < n} f y by countdown (n is small: no cut-off, as in `prodL`). -/
def prodC (n : ℕ) (f : ℕ → ℤ) : ℤ := foldC n (fun acc y => acc * f y) 1

/-- x if its word is no longer than the number nb, else d — the counter variant of `cap`. -/
def capC {γ : Type} [Enc γ] (nb : ℕ) (d x : γ) : γ := if len x ≤ nb then x else d

/-- **Agreement of the enumeration cuts**: at every pad, folding over `rng pad q` is folding the
countdown at the pad's length — cut-offs active or not. -/
theorem rngC_agree (pad : U) (q : ℕ) (g : α → ℕ → α) (a : α) :
    List.foldl g a (rng pad q) = rngC pad.length q g a := by
  unfold rng rngC
  rw [foldC_agree]

/-- **Agreement of the summation cuts.** -/
theorem sumFC_agree (N : ℕ) (pad : U) (f : ℕ → ℤ) : sumF N pad f = sumFC pad.length N f := by
  unfold sumF sumFC rngC
  rw [foldC_agree]

/-- **Agreement of the products** (no cut on either side). -/
theorem prodC_agree (n : ℕ) (f : ℕ → ℤ) : prodL n f = prodC n f := by
  unfold prodL prodC
  rw [foldC_agree]

/-- **Agreement of the state-size cuts.** -/
theorem capC_agree {γ : Type} [Enc γ] (pad : U) (d x : γ) : cap pad d x = capC pad.length d x := rfl

/-- **Agreement of the searches**: the first hit over `rng pad q` is the countdown's first hit at
the pad's length. -/
theorem findC_agree (pad : U) (q : ℕ) (p : ℕ → Bool) : (rng pad q).find? p = findC pad.length q p := by
  unfold rng findC
  rw [findC_range p (min q pad.length)]

/-- The enumeration cut inactive: the countdown enumerates exactly 0, …, q − 1. (Counterpart of
`rng_eq`.) -/
theorem rngC_eq {nb q : ℕ} (g : α → ℕ → α) (a : α) (h : q ≤ nb) : rngC nb q g a = foldC q g a := by
  rw [rngC, min_eq_left h]

/-- The summation cut inactive: the counter sum is the mathematical sum. (Counterpart of
`sumF_eq`.) -/
theorem sumFC_eq {N nb : ℕ} (h : N ≤ nb) (f : ℕ → ℤ) :
    sumFC nb N f = ∑ y ∈ Finset.range N, f y := by
  unfold sumFC rngC
  rw [min_eq_left h]
  clear h
  induction N with
  | zero => simp
  | succ n ih =>
    have e1 : foldC (n + 1) (fun acc y => acc + f y) 0 = foldC n (fun acc y => acc + f y) 0 + f n := by
      rw [foldC_succ]
    rw [e1, ih, Finset.sum_range_succ]

/-- (Counterpart of `prodL_eq`.) -/
theorem prodC_eq (n : ℕ) (f : ℕ → ℤ) : prodC n f = ∏ y ∈ Finset.range n, f y := by
  unfold prodC
  induction n with
  | zero => simp
  | succ n ih =>
    have e1 : foldC (n + 1) (fun acc y => acc * f y) 1 = foldC n (fun acc y => acc * f y) 1 * f n := by
      rw [foldC_succ]
    rw [e1, ih, Finset.prod_range_succ]

/-- The state cut inactive. (Counterpart of `cap_eq`.) -/
theorem capC_eq {γ : Type} [Enc γ] {nb : ℕ} {d x : γ} (h : len x ≤ nb) : capC nb d x = x := by
  simp [capC, h]

/-- (Counterpart of `len_cap_le`.) -/
theorem len_capC_le {γ : Type} [Enc γ] (nb : ℕ) (d x : γ) : len (capC nb d x) ≤ nb + len d := by
  unfold capC
  split_ifs <;> omega

end PaddedDescent.F

/-! # Part C — agreement of composite routines: the Prog.lean idioms (new) -/

namespace PaddedDescent.F

open Groundwork

/-- The `termF` leaf (Prog.lean:50–54) in miniature: a value that is 1, or a table entry, or a
cut sum over the pad. -/
def termFD (N : ℕ) (pad : U) (test : Bool) (tab : ℤ) (f : ℕ → ℤ) : ℤ :=
  if test then 1 else if tab = 0 then tab else sumF N pad f

/-- Its counter variant. -/
def termFCD (nb N : ℕ) (test : Bool) (tab : ℤ) (f : ℕ → ℤ) : ℤ :=
  if test then 1 else if tab = 0 then tab else sumFC nb N f

/-- The cut-sum leaf agrees at every pad. -/
theorem termFCD_agree (N : ℕ) (pad : U) (test : Bool) (tab : ℤ) (f : ℕ → ℤ) :
    termFD N pad test tab f = termFCD pad.length N test tab f := by
  unfold termFD termFCD
  cases test <;> by_cases h : tab = 0 <;> simp [h, sumFC_agree]

/-- With the cut inactive, the counter leaf computes the mathematical sum. -/
theorem termFCD_eq {N nb : ℕ} (h : N ≤ nb) (test : Bool) (tab : ℤ) (f : ℕ → ℤ) :
    termFCD nb N test tab f =
      if test then 1 else if tab = 0 then tab else ∑ y ∈ Finset.range N, f y := by
  unfold termFCD
  cases test <;> by_cases h' : tab = 0 <;> simp [h', sumFC_eq h]

variable {ι : Type} [Enc ι] {Lv : Type}

/-- eth's `expand` (Prog.lean:144), generic: the children of I are the defined values of child
over the patterns 0, …, nR L I − 1, cut off at the pad. -/
def expand (nR : Lv → ι → ℕ) (child : U → Lv → ι → ℕ → Option ι) (pad : U) (L : Lv) (I : ι) : List ι :=
  (rng pad (nR L I)).filterMap (child pad L I)

/-- eth's `descend` (Prog.lean:148), generic: level by level breadth first, the work list capped
at the pad after each round (the state budget). -/
def descend (nR : Lv → ι → ℕ) (child : U → Lv → ι → ℕ → Option ι) (pad : U) (sched : List Lv)
    (I : ι) : List ι :=
  sched.foldl (fun w L => cap pad ([] : List ι) (w.flatMap (expand nR child pad L))) (cap pad [] [I])

/-- The counter variant of `expand`: the patterns run by countdown, nothing is built. -/
def expandC (nR : Lv → ι → ℕ) (childC : ℕ → Lv → ι → ℕ → Option ι) (nb : ℕ) (L : Lv) (I : ι) :
    List ι := collectC (min (nR L I) nb) (childC nb L I)

/-- The counter variant of `descend`. -/
def descendC (nR : Lv → ι → ℕ) (childC : ℕ → Lv → ι → ℕ → Option ι) (nb : ℕ) (sched : List Lv)
    (I : ι) : List ι :=
  sched.foldl (fun w L => capC nb ([] : List ι) (w.flatMap (expandC nR childC nb L)))
    (capC nb [] [I])

/-- The uncut one round: the mathematical semantics of the expansion when no cut-off is active. -/
def expandU (nR : Lv → ι → ℕ) (childC : ℕ → Lv → ι → ℕ → Option ι) (nb : ℕ) (L : Lv) (I : ι) :
    List ι := (List.range (nR L I)).filterMap (childC nb L I)

private theorem filterMap_congr' {α' β : Type} {f g : α' → Option β} (h : ∀ x, f x = g x) :
    ∀ l : List α', l.filterMap f = l.filterMap g
  | [] => rfl
  | a :: l => by
    rw [List.filterMap_cons, List.filterMap_cons, h a, filterMap_congr' h l]

private theorem flatMap_congr' {α' β : Type} {f g : α' → List β} (h : ∀ x, f x = g x) :
    ∀ l : List α', l.flatMap f = l.flatMap g
  | [] => rfl
  | a :: l => by simp [h a, flatMap_congr' h l]

omit [Enc ι] in
/-- **L1 for the descent, 1/3**: with the child function in agreement, one expansion round
agrees at every pad. -/
theorem expandC_agree (nR : Lv → ι → ℕ) {child : U → Lv → ι → ℕ → Option ι}
    {childC : ℕ → Lv → ι → ℕ → Option ι}
    (h : ∀ (pad : U) (L : Lv) (I : ι) (y : ℕ), child pad L I y = childC pad.length L I y)
    (pad : U) (L : Lv) (I : ι) :
    expand nR child pad L I = expandC nR childC pad.length L I := by
  unfold expand expandC rng
  rw [collectC_agree (childC pad.length L I) (min (nR L I) pad.length)]
  exact filterMap_congr' (fun y => h pad L I y) _

private theorem descendC_agree_aux (nR : Lv → ι → ℕ) {child : U → Lv → ι → ℕ → Option ι}
    {childC : ℕ → Lv → ι → ℕ → Option ι}
    (h : ∀ (pad : U) (L : Lv) (I : ι) (y : ℕ), child pad L I y = childC pad.length L I y)
    (pad : U) : ∀ (sched : List Lv) (w w' : List ι), w = w' →
    sched.foldl (fun w L => cap pad ([] : List ι) (w.flatMap (expand nR child pad L))) w =
      sched.foldl (fun w L => capC pad.length ([] : List ι) (w.flatMap (expandC nR childC pad.length L))) w'
  | [], _, _, hw => hw
  | L :: r, w, w', hw => by
    subst hw
    simp only [List.foldl_cons]
    refine descendC_agree_aux nR h pad r _ _ ?_
    have e : w.flatMap (expand nR child pad L) = w.flatMap (expandC nR childC pad.length L) :=
      flatMap_congr' (fun I => expandC_agree nR h pad L I) w
    rw [e]
    exact capC_agree pad ([] : List ι) _

/-- **L1 for the descent, 2/3**: the whole descent agrees at every pad — by structural induction
mirroring the definition (one `cap` and one `rng`-fold per level, the leaves by the combinator
agreements). -/
theorem descendC_agree (nR : Lv → ι → ℕ) {child : U → Lv → ι → ℕ → Option ι}
    {childC : ℕ → Lv → ι → ℕ → Option ι}
    (h : ∀ (pad : U) (L : Lv) (I : ι) (y : ℕ), child pad L I y = childC pad.length L I y)
    (pad : U) (sched : List Lv) (I : ι) :
    descend nR child pad sched I = descendC nR childC pad.length sched I := by
  unfold descend descendC
  exact descendC_agree_aux nR h pad sched (cap pad ([] : List ι) [I]) (capC pad.length [] [I])
    (capC_agree pad [] [I])

/-- **L1 for the descent, 3/3 — the prework's statement shape**: on the pad of length 2^k, the
descent is the counter descent at nb = 2^k. -/
theorem descendC_agree_pad (nR : Lv → ι → ℕ) {child : U → Lv → ι → ℕ → Option ι}
    {childC : ℕ → Lv → ι → ℕ → Option ι}
    (h : ∀ (pad : U) (L : Lv) (I : ι) (y : ℕ), child pad L I y = childC pad.length L I y)
    (k : ℕ) (sched : List Lv) (I : ι) :
    descend nR child (pad k) sched I = descendC nR childC (2 ^ k) sched I := by
  rw [← length_pad k]
  exact descendC_agree nR h (pad k) sched I

omit [Enc ι] in
/-- Inactivity of the enumeration cut: the patterns are exactly 0, …, nR L I − 1. -/
theorem expandC_uncut (nR : Lv → ι → ℕ) (childC : ℕ → Lv → ι → ℕ → Option ι) {nb : ℕ} {L : Lv}
    {I : ι} (h : nR L I ≤ nb) : expandC nR childC nb L I = expandU nR childC nb L I := by
  unfold expandC expandU
  rw [min_eq_left h, collectC_agree]

private theorem descendC_uncut_aux (nR : Lv → ι → ℕ) (childC : ℕ → Lv → ι → ℕ → Option ι)
    (nb : ℕ) (hpat : ∀ (L : Lv) (I : ι), nR L I ≤ nb)
    (hfit : ∀ (w : List ι), len w ≤ nb → ∀ L : Lv, len (w.flatMap (expandC nR childC nb L)) ≤ nb) :
    ∀ (sched : List Lv) (w : List ι), len w ≤ nb →
      sched.foldl (fun w L => capC nb ([] : List ι) (w.flatMap (expandC nR childC nb L))) w =
        sched.foldl (fun w L => w.flatMap (expandU nR childC nb L)) w := by
  intro sched
  induction sched with
  | nil => intro _ _; rfl
  | cons L r ih =>
    intro w hw
    simp only [List.foldl_cons]
    have e : w.flatMap (expandC nR childC nb L) = w.flatMap (expandU nR childC nb L) :=
      flatMap_congr' (fun I => expandC_uncut nR childC (hpat L I)) w
    have hf : len (w.flatMap (expandU nR childC nb L)) ≤ nb := by
      rw [← e]
      exact hfit w hw L
    have ec : capC nb ([] : List ι) (w.flatMap (expandU nR childC nb L)) =
        w.flatMap (expandU nR childC nb L) := capC_eq hf
    rw [e, ec]
    exact ih _ hf

/-- **The inactivity transport.** With the pattern counts and the work-list words inside the
budget nb — the state side of the pad, the `FitsG` analog — no cut-off of the counter descent is
active: it is the uncut breadth-first expansion. -/
theorem descendC_uncut (nR : Lv → ι → ℕ) (childC : ℕ → Lv → ι → ℕ → Option ι) (nb : ℕ)
    (hpat : ∀ (L : Lv) (I : ι), nR L I ≤ nb)
    (hfit : ∀ (w : List ι), len w ≤ nb → ∀ L : Lv, len (w.flatMap (expandC nR childC nb L)) ≤ nb)
    (sched : List Lv) (I : ι) (hI : len [I] ≤ nb) :
    descendC nR childC nb sched I =
      sched.foldl (fun w L => w.flatMap (expandU nR childC nb L)) [I] := by
  unfold descendC
  rw [capC_eq hI]
  exact descendC_uncut_aux nR childC nb hpat hfit sched [I] hI

end PaddedDescent.F

#print axioms PaddedDescent.F.foldC_agree
#print axioms PaddedDescent.F.collectC_agree
#print axioms PaddedDescent.F.rngC_agree
#print axioms PaddedDescent.F.sumFC_agree
#print axioms PaddedDescent.F.prodC_agree
#print axioms PaddedDescent.F.capC_agree
#print axioms PaddedDescent.F.findC_agree
#print axioms PaddedDescent.F.termFCD_agree
#print axioms PaddedDescent.F.termFCD_eq
#print axioms PaddedDescent.F.expandC_agree
#print axioms PaddedDescent.F.descendC_agree
#print axioms PaddedDescent.F.descendC_agree_pad
#print axioms PaddedDescent.F.descendC_uncut
