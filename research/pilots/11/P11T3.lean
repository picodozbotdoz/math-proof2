/-
  Pilot 11, tranche T3 — the eth machine-model definitional slice, VERBATIM transcripts
  with their donor proofs, for milestone M2 (TM2 realization, dossier 11 Theorem B(ii)).

  Donor: anthropics_formal-math/eth (read-only; Lean v4.33-family original pinned to
  mathlib 0df444a360ea), transcribed for mathlib v4.36.0-rc2 (encore checkout ff2494ea).
  Per the corpus-wide port finding (FEASIBILITY-SUMMARY probes B/E: statement-port cost
  ≈ 0), definitions and statements are expected verbatim; the small proofs below are the
  donor's own (induction/simp/omega-level) and are ported verbatim too.

  Tranches (donor file → content):
    * proof/machines/ToTuring/TM/Tree.lean      Sym, V, code, mirror (whole file)
    * proof/machines/ToTuring/TM/Run.lean       Run, place, placeCfg, run_place (whole)
    * proof/machines/ToTuring/TM/Frag.lean      Frag, seq/branch/loop, Within (whole)
    * proof/machines/ToTuring/TM/Stacks.lean    Stk, Fr, st (whole)
    * proof/machines/ToTuring/Bound.lean        PB + closure proofs (whole)
    * proof/statements/StepMachineStatements.lean:24–88  HasSize, Stepped, Reaches, Runs
      (the Sat3-specific DecidesInSteps tail is NOT transcribed)
    * proof/machines/StepMachines/Prog/Stepped.lean      (whole file: next/run, mono,
      iterate, ofFun, mapIn/mapOut, bind, Orbit, foldWhile + runs lemmas)
    * proof/machines/StepMachines/Prog/Comb.lean         (whole file: branch/ite/const/
      optSel/optBind/both/map2/mul2 + runs lemmas)
    * proof/machines/ToTuring/Enc.lean          Enc, wd, len, Carried (whole)
    * proof/machines/ToTuring/EncLemmas.lean    len lemmas + Carried instances (whole)
    * proof/machines/ToTuring/PolyT.lean        PolyT, of/elim/congr/of_wd, Unary,
      IsPolyT (whole)

  Conventions (per P11T1's header): donor `module`/`public import` headers dropped
  (standalone elaboration); `public` prefixes and `@[expose]` sections dropped; the
  `@[fun_prop]` attribute on `PolyT` dropped (no `fun_prop`-tactic proofs live in this
  tranche); namespaces kept verbatim (`Groundwork`, `Groundwork.TM`,
  `Groundwork.Stepped`) so donor statements are character-identical. No `sorry`, no
  `native_decide`, no external CAS.

  v4.36 deviations from the donor text (each forced by elaborator drift, none touches
  a statement): (1) `mirror_mirror` re-proved with `List.map_map`/`map_id`/
  `reverse_reverse` (the donor's `Function.comp_def` simp-set no longer fires);
  (2) the `HasSize (List α)` instance drops the donor's unused `[HasSize β]` binder —
  v4.36 instance synthesis reports "cannot find synthesization order" for it.
-/
import Mathlib.Computability.TuringMachine.Computable
import Mathlib.Data.Nat.Bits
import Mathlib.Data.Nat.Size
import Mathlib.Tactic

namespace Groundwork

/-! ## ToTuring/TM/Tree.lean (verbatim) -/

namespace TM

/-- Bits and two brackets. -/
inductive Sym | bit (b : Bool) | L | R
  deriving DecidableEq

instance : Fintype Sym := ⟨{.bit false, .bit true, .L, .R}, fun x => by rcases x with (_ | _) | _ | _ <;> simp⟩

@[simp] theorem beq_RL : (Sym.R == Sym.L) = false := by decide
@[simp] theorem beq_LR : (Sym.L == Sym.R) = false := by decide
@[simp] theorem beq_bL (b : Bool) : (Sym.bit b == Sym.L) = false := by cases b <;> decide
@[simp] theorem beq_bR (b : Bool) : (Sym.bit b == Sym.R) = false := by cases b <;> decide

/-- Binary trees whose leaves are bits or empty. -/
inductive V | nil | bit (b : Bool) | cons (x y : V)

/-- The code of a tree: ⟨⟩ for nil, the bit for a bit, ⟨ code x, code y ⟩ for cons x y. -/
def code : V → List Sym
  | .nil => [.L, .R]
  | .bit b => [.bit b]
  | .cons x y => .L :: (code x ++ code y ++ [.R])

/-- The other bracket. -/
def Sym.flip : Sym → Sym
  | .L => .R
  | .R => .L
  | s => s

/-- A word read from the other end, its brackets exchanged. -/
def mirror (w : List Sym) : List Sym := (w.map Sym.flip).reverse

theorem mirror_mirror (w : List Sym) : mirror (mirror w) = w := by
  induction w with
  | nil => rfl
  | cons s w ih =>
    have hff : Sym.flip (Sym.flip s) = s := by cases s <;> rfl
    have e1 : mirror (s :: w) = (w.map Sym.flip).reverse ++ [Sym.flip s] := by
      show ((s :: w).map Sym.flip).reverse = _
      rw [List.map_cons, List.reverse_cons]
    have e2 : (List.map Sym.flip [Sym.flip s]).reverse = [s] := by
      show [Sym.flip (Sym.flip s)] = [s]
      rw [hff]
    show ((mirror (s :: w)).map Sym.flip).reverse = s :: w
    rw [e1, List.map_append, List.reverse_append, e2]
    exact congrArg (s :: ·) ih

@[simp] theorem length_mirror (w : List Sym) : (mirror w).length = w.length := by
  show ((w.map Sym.flip).reverse).length = w.length
  rw [List.length_reverse, List.length_map]

/-- The mirrored tree. -/
def V.mir : V → V
  | .nil => .nil
  | .bit b => .bit b
  | .cons x y => .cons y.mir x.mir

/-- The code of the mirrored tree is the mirrored code. -/
theorem code_mir (x : V) : code x.mir = mirror (code x) := by
  induction x with
  | nil => rfl
  | bit b => rfl
  | cons x y ihx ihy => simp [V.mir, code, ihx, ihy, mirror, Sym.flip]

/-! ## ToTuring/TM/Run.lean (verbatim) -/

open Turing

/-! ### Runs of exactly n steps -/

/-- n steps of f lead from a to b. -/
def Run {C : Type} (f : C → Option C) : C → ℕ → C → Prop
  | a, 0, b => a = b
  | a, n + 1, b => ∃ c, f a = some c ∧ Run f c n b

theorem Run.one {C : Type} {f : C → Option C} {a b : C} (h : f a = some b) : Run f a 1 b := ⟨b, h, rfl⟩

theorem Run.trans {C : Type} {f : C → Option C} : ∀ {m : ℕ} {a b c : C} {n : ℕ}, Run f a m b → Run f b n c → Run f a (m + n) c
  | 0, _, _, _, n, h, h' => by cases h; simpa using h'
  | m + 1, _, _, _, n, ⟨d, hd, h⟩, h' => by
    rw [Nat.add_right_comm]
    exact ⟨d, hd, h.trans h'⟩

/-- The same in Mathlib's form (`StateTransition.EvalsTo`): n iterations of `flip bind f` lead from
`some a` to `some b`. -/
theorem Run.iterate {C : Type} {f : C → Option C} : ∀ {n : ℕ} {a b : C}, Run f a n b → (flip bind f)^[n] (some a) = some b
  | 0, _, _, h => by cases h; rfl
  | n + 1, a, b, ⟨c, hc, h⟩ => by
    rw [Function.iterate_succ_apply]
    have : flip bind f (some a) = some c := hc
    rw [this]; exact h.iterate

variable {K : Type} [DecidableEq K] {Γ : K → Type} {σ : Type}

/-! ### A statement placed in a larger machine -/

section place

variable {Λ Λ' : Type} (ι : Λ → Λ') (e : Option Λ')

/-- Labels are carried along ι; where the statement would halt, the larger machine goes on at e (or
halts if e = none). -/
def place : TM2.Stmt Γ Λ σ → TM2.Stmt Γ Λ' σ
  | .push k f q => .push k f (place q)
  | .peek k f q => .peek k f (place q)
  | .pop k f q => .pop k f (place q)
  | .load f q => .load f (place q)
  | .branch p q₁ q₂ => .branch p (place q₁) (place q₂)
  | .goto l => .goto (ι ∘ l)
  | .halt => match e with
    | some e => .goto fun _ => e
    | none => .halt

/-- The same for configurations. -/
def placeCfg (c : TM2.Cfg Γ Λ σ) : TM2.Cfg Γ Λ' σ := ⟨c.l.elim e (some ∘ ι), c.var, c.stk⟩

theorem stepAux_place (q : TM2.Stmt Γ Λ σ) (v : σ) (S : ∀ k, List (Γ k)) :
    TM2.stepAux (place ι e q) v S = placeCfg ι e (TM2.stepAux q v S) := by
  induction q generalizing v S with
  | push _ _ _ ih | peek _ _ _ ih | pop _ _ _ ih | load _ _ ih => exact ih _ _
  | branch p _ _ ih₁ ih₂ => simp only [place, TM2.stepAux, ih₁, ih₂]; cases p v <;> rfl
  | goto => rfl
  | halt => cases e <;> rfl

/-- If the larger machine M' holds the placed statements of M, every run of M is a run of M' of the
same length. -/
theorem run_place {M : Λ → TM2.Stmt Γ Λ σ} {M' : Λ' → TM2.Stmt Γ Λ' σ} (hM : ∀ l, M' (ι l) = place ι e (M l)) :
    ∀ {n : ℕ} {a b : TM2.Cfg Γ Λ σ}, Run (TM2.step M) a n b → Run (TM2.step M') (placeCfg ι e a) n (placeCfg ι e b)
  | 0, _, _, h => by cases h; exact rfl
  | n + 1, ⟨none, v, S⟩, b, ⟨c, hc, _⟩ => by
    have hNone : TM2.step M ⟨none, v, S⟩ = none := rfl
    rw [hNone] at hc
    simp at hc
  | n + 1, ⟨some l, v, S⟩, b, ⟨c, hc, h⟩ => by
    refine ⟨placeCfg ι e c, ?_, run_place hM h⟩
    have hl : TM2.step M ⟨some l, v, S⟩ = some (TM2.stepAux (M l) v S) := rfl
    rw [hl, Option.some.injEq] at hc
    show TM2.step M' ⟨some (ι l), v, S⟩ = some (placeCfg ι e c)
    have hl' : TM2.step M' ⟨some (ι l), v, S⟩ = some (TM2.stepAux (M' (ι l)) v S) := rfl
    rw [hl', hM l, stepAux_place, hc]

end place

/-! ## ToTuring/TM/Frag.lean (verbatim) -/

/-- A fragment: a finite set of labels, a first label, a program. -/
structure Frag (Γ : K → Type) (σ : Type) where
  /-- the labels -/
  Λ : Type
  [fin : Fintype Λ]
  /-- the first label -/
  entry : Λ
  /-- the program -/
  m : Λ → TM2.Stmt Γ Λ σ

attribute [instance] Frag.fin

/-- From its first label, with local state v and stacks S, the fragment halts after exactly n steps
with local state v and stacks S'. -/
def Frag.Runs (P : Frag Γ σ) (v : σ) (S : ∀ k, List (Γ k)) (n : ℕ) (S' : ∀ k, List (Γ k)) : Prop :=
  Run (TM2.step P.m) ⟨some P.entry, v, S⟩ n ⟨none, v, S'⟩

/-- P, then Q. -/
def Frag.seq (P Q : Frag Γ σ) : Frag Γ σ where
  Λ := P.Λ ⊕ Q.Λ
  entry := .inl P.entry
  m
    | .inl l => place Sum.inl (some (.inr Q.entry)) (P.m l)
    | .inr l => place Sum.inr none (Q.m l)

/-- A run of P followed by a run of Q is a run of `P.seq Q`; the numbers of steps add up. -/
theorem Frag.seq_runs {P Q : Frag Γ σ} {v : σ} {S S' S'' : ∀ k, List (Γ k)} {n n' : ℕ} (hP : P.Runs v S n S')
    (hQ : Q.Runs v S' n' S'') : (P.seq Q).Runs v S (n + n') S'' :=
  (run_place (M' := (P.seq Q).m) Sum.inl (some (.inr Q.entry)) (fun _ => rfl) hP).trans
    (run_place (M' := (P.seq Q).m) Sum.inr none (fun _ => rfl) hQ)

/-- One step of a larger machine at a label that holds a placed statement. -/
theorem run_head {Λ Λ' : Type} {M' : Λ' → TM2.Stmt Γ Λ' σ} (ι : Λ → Λ') (e : Option Λ') {l' : Λ'} {q : TM2.Stmt Γ Λ σ}
    (hM : M' l' = place ι e q) {v : σ} {S : ∀ k, List (Γ k)} {c : TM2.Cfg Γ Λ σ} (h : TM2.stepAux q v S = c) :
    Run (TM2.step M') ⟨some l', v, S⟩ 1 (placeCfg ι e c) :=
  Run.one (by simp only [TM2.step, hM, stepAux_place, h])

/-- One statement without jumps. -/
def Frag.ofStmt (q : TM2.Stmt Γ Empty σ) : Frag Γ σ where
  Λ := Unit
  entry := ()
  m _ := place Empty.elim none q

/-- If the statement halts with the local state unchanged, the fragment runs in one step. -/
theorem Frag.ofStmt_runs {q : TM2.Stmt Γ Empty σ} {v : σ} {S S' : ∀ k, List (Γ k)}
    (h : TM2.stepAux q v S = ⟨none, v, S'⟩) : (Frag.ofStmt q).Runs v S 1 S' :=
  run_head (M' := (Frag.ofStmt q).m) (l' := ()) Empty.elim none rfl h

/-- A head statement that ends in `goto true`, `goto false` or `halt`; then P, or Q, or nothing. -/
def Frag.branch (q : TM2.Stmt Γ Bool σ) (P Q : Frag Γ σ) : Frag Γ σ where
  Λ := Unit ⊕ (P.Λ ⊕ Q.Λ)
  entry := .inl ()
  m
    | .inl _ => place (fun b : Bool => if b then .inr (.inl P.entry) else .inr (.inr Q.entry)) none q
    | .inr (.inl l) => place (fun l => .inr (.inl l)) none (P.m l)
    | .inr (.inr l) => place (fun l => .inr (.inr l)) none (Q.m l)

/-- If the head ends in `goto true`, the branch takes one step and then runs as P. -/
theorem Frag.branch_runs_true {q : TM2.Stmt Γ Bool σ} {P Q : Frag Γ σ} {v : σ} {S S₁ S' : ∀ k, List (Γ k)} {n : ℕ}
    (h : TM2.stepAux q v S = ⟨some true, v, S₁⟩) (hP : P.Runs v S₁ n S') : (Frag.branch q P Q).Runs v S (n + 1) S' := by
  rw [Nat.add_comm n 1]
  exact (run_head (M' := (Frag.branch q P Q).m) (l' := Sum.inl ()) _ none rfl h).trans
    (run_place (M' := (Frag.branch q P Q).m) (fun l => Sum.inr (Sum.inl l)) none (fun _ => rfl) hP)

/-- If the head ends in `goto false`, the branch takes one step and then runs as Q. -/
theorem Frag.branch_runs_false {q : TM2.Stmt Γ Bool σ} {P Q : Frag Γ σ} {v : σ} {S S₁ S' : ∀ k, List (Γ k)} {n : ℕ}
    (h : TM2.stepAux q v S = ⟨some false, v, S₁⟩) (hQ : Q.Runs v S₁ n S') : (Frag.branch q P Q).Runs v S (n + 1) S' := by
  rw [Nat.add_comm n 1]
  exact (run_head (M' := (Frag.branch q P Q).m) (l' := Sum.inl ()) _ none rfl h).trans
    (run_place (M' := (Frag.branch q P Q).m) (fun l => Sum.inr (Sum.inr l)) none (fun _ => rfl) hQ)

/-- A loop: the head statement ends in `halt` (leave the loop) or in `goto ()` (the body, then the
head again). -/
def Frag.loop (q : TM2.Stmt Γ Unit σ) (B : Frag Γ σ) : Frag Γ σ where
  Λ := Unit ⊕ B.Λ
  entry := .inl ()
  m
    | .inl _ => place (fun _ => .inr B.entry) none q
    | .inr l => place Sum.inr (some (.inl ())) (B.m l)

/-- If the head halts, the loop ends after one step. -/
theorem Frag.loop_runs_exit {q : TM2.Stmt Γ Unit σ} {B : Frag Γ σ} {v : σ} {S S' : ∀ k, List (Γ k)}
    (h : TM2.stepAux q v S = ⟨none, v, S'⟩) : (Frag.loop q B).Runs v S 1 S' :=
  run_head (M' := (Frag.loop q B).m) (l' := Sum.inl ()) _ none rfl h

/-- If the head ends in `goto ()`, the loop takes one step, runs the body, then runs as the loop
again. -/
theorem Frag.loop_runs_iter {q : TM2.Stmt Γ Unit σ} {B : Frag Γ σ} {v : σ} {S S₁ S₂ S' : ∀ k, List (Γ k)} {n m : ℕ}
    (h : TM2.stepAux q v S = ⟨some (), v, S₁⟩) (hB : B.Runs v S₁ n S₂) (hL : (Frag.loop q B).Runs v S₂ m S') :
    (Frag.loop q B).Runs v S (1 + n + m) S' :=
  ((run_head (M' := (Frag.loop q B).m) (l' := Sum.inl ()) _ none rfl h).trans
    (run_place (M' := (Frag.loop q B).m) Sum.inr (some (Sum.inl ())) (fun _ => rfl) hB)).trans hL

/-! ### Runs with an upper bound on the number of steps. The local state is an optional symbol, `none` before and after. -/

section within

variable {τ : Type}

/-- P leads from S to S' within t steps (local state none before and after). -/
def Frag.Within (P : Frag Γ (Option τ)) (S : ∀ k, List (Γ k)) (t : ℕ) (S' : ∀ k, List (Γ k)) : Prop :=
  ∃ n ≤ t, P.Runs none S n S'

theorem Frag.Within.mono {P : Frag Γ (Option τ)} {S S' : ∀ k, List (Γ k)} {t t' : ℕ} (h : P.Within S t S') (ht : t ≤ t') :
    P.Within S t' S' := by
  obtain ⟨n, hn, hr⟩ := h
  exact ⟨n, hn.trans ht, hr⟩

theorem Frag.Within.seq {P Q : Frag Γ (Option τ)} {S S' S'' : ∀ k, List (Γ k)} {t t' : ℕ} (h : P.Within S t S')
    (h' : Q.Within S' t' S'') : (P.seq Q).Within S (t + t') S'' := by
  obtain ⟨n, hn, hr⟩ := h
  obtain ⟨n', hn', hr'⟩ := h'
  exact ⟨n + n', Nat.add_le_add hn hn', Frag.seq_runs hr hr'⟩

theorem Frag.Within.of_runs {P : Frag Γ (Option τ)} {S S' : ∀ k, List (Γ k)} {n : ℕ} (h : P.Runs none S n S') :
    P.Within S n S' := ⟨n, le_rfl, h⟩

end within

/-! ## ToTuring/TM/Stacks.lean (verbatim) -/

/-- The work stacks: the main stack, two to park items on, and the counter of open brackets. -/
inductive Stk | main | a | b | cnt
  deriving DecidableEq

instance : Fintype Stk := ⟨{.main, .a, .b, .cnt}, fun x => by cases x <;> simp⟩

/-- Fragments over the work stacks. The local state is the symbol just popped; it is `none` between
fragments. -/
abbrev Fr := Frag (fun _ : Stk => Sym) (Option Sym)

/-- The contents of the four stacks. -/
def st (M A B N : List Sym) : Stk → List Sym
  | .main => M
  | .a => A
  | .b => B
  | .cnt => N

section
variable (M A B N W : List Sym)
@[simp] theorem st_main : st M A B N .main = M := rfl
@[simp] theorem st_a : st M A B N .a = A := rfl
@[simp] theorem st_b : st M A B N .b = B := rfl
@[simp] theorem st_cnt : st M A B N .cnt = N := rfl
@[simp] theorem upd_main : Function.update (st M A B N) .main W = st W A B N := by
  funext k; cases k <;> simp [Function.update, st]
@[simp] theorem upd_a : Function.update (st M A B N) .a W = st M W B N := by
  funext k; cases k <;> simp [Function.update, st]
@[simp] theorem upd_b : Function.update (st M A B N) .b W = st M A W N := by
  funext k; cases k <;> simp [Function.update, st]
end

end TM

/-! ## ToTuring/Bound.lean (verbatim) -/

/-- t is below a polynomial. -/
def PB (t : ℕ → ℕ) : Prop := ∃ c : ℕ, ∀ n, t n ≤ c * (n + 1) ^ c

namespace PB

variable {t s : ℕ → ℕ}

/-- The bound a·(n+1)^b grows with a and with b. -/
theorem bound_le {a b a' b' n : ℕ} (ha : a ≤ a') (hb : b ≤ b') : a * (n + 1) ^ b ≤ a' * (n + 1) ^ b' :=
  Nat.mul_le_mul ha (Nat.pow_le_pow_right (Nat.succ_pos n) hb)

/-- A bound of this form put into another one is again below a bound of this form. -/
theorem bound_comp (c c' n : ℕ) : c * (c' * (n + 1) ^ c' + 1) ^ c ≤ (c * (c' + 1) ^ c) * (n + 1) ^ (c' * c) := by
  have h1 : 1 ≤ (n + 1) ^ c' := Nat.one_le_pow _ _ (Nat.succ_pos n)
  have h2 : c' * (n + 1) ^ c' + 1 ≤ (c' + 1) * (n + 1) ^ c' := by
    rw [Nat.add_mul, Nat.one_mul]
    exact Nat.add_le_add_left h1 _
  calc c * (c' * (n + 1) ^ c' + 1) ^ c ≤ c * ((c' + 1) * (n + 1) ^ c') ^ c :=
        Nat.mul_le_mul_left _ (Nat.pow_le_pow_left h2 c)
    _ = (c * (c' + 1) ^ c) * (n + 1) ^ (c' * c) := by rw [Nat.mul_pow, ← pow_mul, Nat.mul_assoc]

theorem const (a : ℕ) : PB fun _ => a := by
  exact ⟨a, fun n => Nat.le_mul_of_pos_right _ (Nat.pow_pos (Nat.succ_pos n))⟩

theorem id' : PB fun n => n := by
  refine ⟨1, fun n => ?_⟩
  rw [pow_one, Nat.one_mul]
  exact Nat.le_succ n

theorem add (ht : PB t) (hs : PB s) : PB fun n => t n + s n := by
  obtain ⟨c, hc⟩ := ht
  obtain ⟨c', hc'⟩ := hs
  refine ⟨c + c', fun n => ?_⟩
  rw [Nat.add_mul]
  exact Nat.add_le_add ((hc n).trans (bound_le le_rfl (Nat.le_add_right _ _)))
    ((hc' n).trans (bound_le le_rfl (Nat.le_add_left _ _)))

theorem mul (ht : PB t) (hs : PB s) : PB fun n => t n * s n := by
  obtain ⟨c, hc⟩ := ht
  obtain ⟨c', hc'⟩ := hs
  refine ⟨c * c' + (c + c'), fun n => ?_⟩
  calc t n * s n ≤ c * (n + 1) ^ c * (c' * (n + 1) ^ c') := Nat.mul_le_mul (hc n) (hc' n)
    _ = c * c' * (n + 1) ^ (c + c') := by rw [pow_add]; ring
    _ ≤ _ := bound_le (Nat.le_add_right _ _) (Nat.le_add_left _ _)

theorem pow (ht : PB t) (k : ℕ) : PB fun n => t n ^ k := by
  induction k with
  | zero => simpa using const 1
  | succ k ih => simpa only [pow_succ] using ih.mul ht

theorem comp (ht : PB t) (hs : PB s) : PB fun n => t (s n) := by
  obtain ⟨c, hc⟩ := ht
  obtain ⟨c', hc'⟩ := hs
  refine ⟨c * (c' + 1) ^ c + c' * c, fun n => ?_⟩
  calc t (s n) ≤ c * (s n + 1) ^ c := hc _
    _ ≤ c * (c' * (n + 1) ^ c' + 1) ^ c :=
        Nat.mul_le_mul_left _ (Nat.pow_le_pow_left (Nat.succ_le_succ (hc' n)) c)
    _ ≤ (c * (c' + 1) ^ c) * (n + 1) ^ (c' * c) := bound_comp c c' n
    _ ≤ _ := bound_le (Nat.le_add_right _ _) (Nat.le_add_left _ _)

/-- The bound c·(n+1)^c is itself below a polynomial, and it is monotone in n. -/
theorem mono_bound (c : ℕ) : PB (fun n => c * (n + 1) ^ c) ∧ Monotone fun n => c * (n + 1) ^ c := by
  exact ⟨⟨c, fun _ => le_rfl⟩, fun _ _ h => Nat.mul_le_mul_left _ (Nat.pow_le_pow_left (Nat.succ_le_succ h) c)⟩

end PB

/-! ## statements/StepMachineStatements.lean:24–88 (verbatim; the Sat3 tail dropped) -/

/-- The size of a value: about the number of bits needed to write it down. -/
class HasSize (α : Type) where
  size : α → ℕ

export HasSize (size)

section sizes

variable {α β : Type}

instance : HasSize ℕ := ⟨fun n => n.size + 1⟩
instance : HasSize ℤ := ⟨fun z => z.natAbs.size + 1⟩
instance : HasSize Bool := ⟨fun _ => 1⟩
instance : HasSize Unit := ⟨fun _ => 1⟩
instance [HasSize α] [HasSize β] : HasSize (α × β) := ⟨fun p => size p.1 + size p.2⟩
instance [HasSize α] [HasSize β] : HasSize (α ⊕ β) :=
  ⟨fun x => match x with | .inl a => size a + 1 | .inr b => size b + 1⟩
instance [HasSize α] : HasSize (Option α) :=
  ⟨fun x => match x with | none => 1 | some a => size a + 1⟩
instance [HasSize α] : HasSize (List α) := ⟨fun l => (l.map fun x => size x + 1).sum + 1⟩

end sizes

/-- A computation cut into steps: a type `σ` of states with a measure of size (a part of the
machine), the state `init a` in which the input `a` is handed over, the function `step` from a state
to the next, and `out`, where `out s = some b` means: halted with result `b`. Nothing restricts
`init`, `step`, `out` or the measure of size: they are arbitrary functions. -/
structure Stepped (α β : Type) : Type 1 where
  σ : Type
  [sz : HasSize σ]
  init : α → σ
  step : σ → σ
  out : σ → Option β

attribute [instance] Stepped.sz

namespace Stepped

variable {α β : Type}

/-- From the state s: halts with b within t steps, all states of size ≤ S. -/
inductive Reaches (M : Stepped α β) (S : ℕ) (b : β) : M.σ → ℕ → Prop
  | halt {s : M.σ} {t : ℕ} : M.out s = some b → size s ≤ S → Reaches M S b s t
  | step {s : M.σ} {t : ℕ} : M.out s = none → size s ≤ S → Reaches M S b (M.step s) t →
      Reaches M S b s (t + 1)

/-- From init a: halts with b within t steps, all states of size ≤ S. -/
def Runs (M : Stepped α β) (a : α) (t S : ℕ) (b : β) : Prop := M.Reaches S b (M.init a) t

end Stepped

/-! ## StepMachines/Prog/Stepped.lean (verbatim) -/

section sizes

variable {α β : Type}

@[simp] theorem size_nat (n : ℕ) : size n = n.size + 1 := rfl
@[simp] theorem size_int (z : ℤ) : size z = z.natAbs.size + 1 := rfl
@[simp] theorem size_bool (b : Bool) : size b = 1 := rfl
@[simp] theorem size_unit (u : Unit) : size u = 1 := rfl
@[simp] theorem size_prod [HasSize α] [HasSize β] (p : α × β) : size p = size p.1 + size p.2 := rfl
@[simp] theorem size_inl [HasSize α] [HasSize β] (a : α) : size (Sum.inl a : α ⊕ β) = size a + 1 := rfl
@[simp] theorem size_inr [HasSize α] [HasSize β] (b : β) : size (Sum.inr b : α ⊕ β) = size b + 1 := rfl
@[simp] theorem size_none [HasSize α] : size (none : Option α) = 1 := rfl
@[simp] theorem size_some [HasSize α] (a : α) : size (some a) = size a + 1 := rfl
@[simp] theorem size_list [HasSize α] (l : List α) :
    size l = (l.map fun x => size x + 1).sum + 1 := rfl

end sizes

namespace Stepped

variable {α β γ τ : Type}

/-- One step of the iteration: a halted state stays as it is. -/
def next (M : Stepped α β) (s : M.σ) : M.σ :=
  match M.out s with
  | some _ => s
  | none => M.step s

/-- The state after exactly n steps of the iteration. -/
def run (M : Stepped α β) (a : α) (n : ℕ) : M.σ := M.next^[n] (M.init a)

theorem Reaches.mono {M : Stepped α β} {S S' t t' : ℕ} {b : β} {s : M.σ} (h : M.Reaches S b s t)
    (ht : t ≤ t') (hS : S ≤ S') : M.Reaches S' b s t' := by
  induction h generalizing t' with
  | halt ho hs => exact .halt ho (hs.trans hS)
  | step ho hs _ ih =>
    obtain ⟨t'', rfl⟩ : ∃ t'', t' = t'' + 1 := ⟨t' - 1, by omega⟩
    exact .step ho (hs.trans hS) (ih (by omega))

theorem Runs.mono {M : Stepped α β} {S S' t t' : ℕ} {a : α} {b : β} (h : M.Runs a t S b)
    (ht : t ≤ t') (hS : S ≤ S') : M.Runs a t' S' b := Reaches.mono h ht hS

theorem next_iterate_of_out {M : Stepped α β} {s : M.σ} {b : β} (h : M.out s = some b) (n : ℕ) :
    M.next^[n] s = s := by
  induction n with
  | zero => rfl
  | succ n ih => rw [Function.iterate_succ_apply', ih, next, h]

/-- What Reaches means for the iteration, run for a fixed number T ≥ t of steps. -/
theorem Reaches.iterate {M : Stepped α β} {S t : ℕ} {b : β} {s : M.σ} (h : M.Reaches S b s t) :
    (∀ T, t ≤ T → M.out (M.next^[T] s) = some b) ∧ ∀ n, size (M.next^[n] s) ≤ S := by
  induction h with
  | halt ho hs => exact ⟨fun T _ => by rw [next_iterate_of_out ho, ho], fun n => by rwa [next_iterate_of_out ho]⟩
  | @step s t ho hs _ ih =>
    have e : M.next s = M.step s := by rw [next, ho]
    refine ⟨fun T hT => ?_, fun n => ?_⟩
    · obtain ⟨T', rfl⟩ : ∃ T', T = T' + 1 := ⟨T - 1, by omega⟩
      rw [Function.iterate_succ_apply, e]
      exact ih.1 T' (by omega)
    · cases n with
      | zero => exact hs
      | succ n => rw [Function.iterate_succ_apply, e]; exact ih.2 n

/-- After exactly T ≥ t steps of the iteration the result is there. -/
theorem Runs.out_run {M : Stepped α β} {S t : ℕ} {a : α} {b : β} (h : M.Runs a t S b) {T : ℕ}
    (hT : t ≤ T) : M.out (M.run a T) = some b := (Reaches.iterate h).1 T hT

/-- The converse of `Reaches.iterate`: if the iteration has the result after t steps and all its
states have size ≤ S, then Runs holds. -/
theorem runs_of_run {M : Stepped α β} {S t : ℕ} {a : α} {b : β} (ho : M.out (M.run a t) = some b)
    (hs : ∀ n, size (M.run a n) ≤ S) : M.Runs a t S b := by
  unfold Runs run at *
  generalize M.init a = s at ho hs
  induction t generalizing s with
  | zero => exact .halt ho (hs 0)
  | succ t ih =>
    cases h : M.out s with
    | some b' =>
      rw [next_iterate_of_out h, h] at ho
      exact .halt (h.trans ho) (hs 0)
    | none =>
      have e : M.next s = M.step s := by rw [next, h]
      refine .step h (hs 0) (ih _ ?_ fun n => ?_)
      · rwa [Function.iterate_succ_apply, e] at ho
      · have := hs (n + 1)
        rwa [Function.iterate_succ_apply, e] at this

/-- The result is unique. -/
theorem Runs.unique {M : Stepped α β} {S S' t t' : ℕ} {a : α} {b b' : β} (h : M.Runs a t S b)
    (h' : M.Runs a t' S' b') : b = b' := by
  have h1 := h.out_run (le_max_left t t')
  have h2 := h'.out_run (le_max_right t t')
  exact Option.some.inj (h1.symm.trans h2)

/-! ### One step, pre- and post-composition -/

/-- f in one step. -/
def ofFun [HasSize α] [HasSize β] (f : α → β) : Stepped α β where
  σ := α ⊕ β
  init := .inl
  step s := match s with | .inl a => .inr (f a) | .inr b => .inr b
  out s := match s with | .inl _ => none | .inr b => some b

theorem ofFun_runs [HasSize α] [HasSize β] (f : α → β) (a : α) :
    (ofFun f).Runs a 1 (max (size a) (size (f a)) + 1) (f a) :=
  .step rfl (by change size a + 1 ≤ _; omega) (.halt rfl (by change size (f a) + 1 ≤ _; omega))

/-- M on f a. No further step. -/
def mapIn (f : α → β) (M : Stepped β γ) : Stepped α γ where
  σ := M.σ
  init a := M.init (f a)
  step := M.step
  out := M.out

theorem mapIn_reaches {f : α → β} {M : Stepped β γ} {s : M.σ} {t S : ℕ} {c : γ} (h : M.Reaches S c s t) :
    (mapIn f M).Reaches S c s t := by
  induction h with
  | halt ho hs => exact .halt ho hs
  | step ho hs _ ih => exact .step ho hs ih

theorem mapIn_runs {f : α → β} {M : Stepped β γ} {a : α} {t S : ℕ} {c : γ} (h : M.Runs (f a) t S c) :
    (mapIn f M).Runs a t S c := mapIn_reaches h

/-- f applied to the result of M. No further step. -/
def mapOut (M : Stepped α β) (f : β → γ) : Stepped α γ where
  σ := M.σ
  init := M.init
  step := M.step
  out s := (M.out s).map f

theorem mapOut_reaches {M : Stepped α β} {f : β → γ} {s : M.σ} {t S : ℕ} {b : β} (h : M.Reaches S b s t) :
    (mapOut M f).Reaches S (f b) s t := by
  induction h with
  | halt ho hs => exact .halt (by change (M.out _).map f = _; rw [ho]; rfl) hs
  | step ho hs _ ih => exact .step (by change (M.out _).map f = _; rw [ho]; rfl) hs ih

theorem mapOut_runs {M : Stepped α β} {f : β → γ} {a : α} {t S : ℕ} {b : β} (h : M.Runs a t S b) :
    (mapOut M f).Runs a t S (f b) := mapOut_reaches h

/-! ### Composition -/

/-- M, then N on the input together with the result of M. -/
def bind [HasSize α] (M : Stepped α β) (N : Stepped (α × β) γ) : Stepped α γ where
  σ := (α × M.σ) ⊕ N.σ
  init a := .inl (a, M.init a)
  step s := match s with
    | .inl p => match M.out p.2 with
      | some b => .inr (N.init (p.1, b))
      | none => .inl (p.1, M.step p.2)
    | .inr s => .inr (N.step s)
  out s := match s with | .inl _ => none | .inr s => N.out s

theorem bind_reaches_inr [HasSize α] {M : Stepped α β} {N : Stepped (α × β) γ} {S t : ℕ} {c : γ} {s : N.σ}
    (h : N.Reaches S c s t) : (bind M N).Reaches (S + 1) c (.inr s) t := by
  induction h with
  | halt ho hs => exact .halt ho (Nat.succ_le_succ hs)
  | step ho hs _ ih => exact .step ho (Nat.succ_le_succ hs) ih

theorem bind_runs [HasSize α] {M : Stepped α β} {N : Stepped (α × β) γ} {a : α} {t t' S S' : ℕ}
    {b : β} {c : γ} (h : M.Runs a t S b) (h' : N.Runs (a, b) t' S' c) :
    (bind M N).Runs a (t + 1 + t') (max (size a + S) S' + 1) c := by
  unfold Runs at *
  change (bind M N).Reaches _ c (.inl (a, M.init a)) _
  generalize M.init a = s at h
  induction h with
  | @halt s t ho hs =>
    have e : (bind M N).step (.inl (a, s)) = .inr (N.init (a, b)) := by
      change (match M.out s with | some b => _ | none => _) = _
      rw [ho]
    have : (bind M N).Reaches (max (size a + S) S' + 1) c (.inl (a, s)) (t' + 1) :=
      .step rfl (by change size a + size s + 1 ≤ _; omega)
        (e ▸ (bind_reaches_inr h').mono le_rfl (by omega))
    exact this.mono (by omega) le_rfl
  | @step s t ho hs _ ih =>
    have e : (bind M N).step (.inl (a, s)) = .inl (a, M.step s) := by
      change (match M.out s with | some b => _ | none => _) = _
      rw [ho]
    have : (bind M N).Reaches (max (size a + S) S' + 1) c (.inl (a, s)) (t + 1 + t' + 1) :=
      .step rfl (by change size a + size s + 1 ≤ _; omega) (e ▸ ih)
    exact this.mono (by omega) le_rfl

/-! ### The loop -/

/-- Orbit nxt o xs: xs is the list x, nxt x, nxt (nxt x), … from o = some x up to the point where
nxt gives none; xs = [] if o = none. -/
inductive Orbit (nxt : τ → Option τ) : Option τ → List τ → Prop
  | nil : Orbit nxt none []
  | cons {x : τ} {xs : List τ} : Orbit nxt (nxt x) xs → Orbit nxt (some x) (x :: xs)

/-- The loop's state with accumulator c and next point x: the body starts at x, or the loop halts
with c if x = none. -/
def foldGo (M : Stepped τ β) (c : γ) (x : Option τ) :
    (τ × γ × M.σ) ⊕ γ :=
  match x with
  | some x' => .inl (x', c, M.init x')
  | none => .inr c

/-- The loop: run M at x = start a, fold its result into the accumulator by g, go on to nxt x; halt
at none. -/
def foldWhile [HasSize τ] [HasSize γ] (start : α → Option τ) (nxt : τ → Option τ)
    (M : Stepped τ β) (g : γ → τ → β → γ) (c₀ : α → γ) : Stepped α γ where
  σ := (τ × γ × M.σ) ⊕ γ
  init a := foldGo M (c₀ a) (start a)
  step s := match s with
    | .inl p => match M.out p.2.2 with
      | some b => foldGo M (g p.2.1 p.1 b) (nxt p.1)
      | none => .inl (p.1, p.2.1, M.step p.2.2)
    | .inr c => .inr c
  out s := match s with | .inl _ => none | .inr c => some c

section foldWhile

variable [HasSize τ] [HasSize γ] {start : α → Option τ} {nxt : τ → Option τ} {M : Stepped τ β}
  {g : γ → τ → β → γ} {c₀ : α → γ}

/-- The body, run inside the loop. -/
theorem foldWhile_body {x : τ} {c r : γ} {b : β} {s : M.σ} {t T Sm S : ℕ} (h : M.Reaches Sm b s t)
    (hS : size x + (size c + Sm) + 1 ≤ S)
    (hr : (foldWhile start nxt M g c₀).Reaches S r (foldGo M (g c x b) (nxt x)) T) :
    (foldWhile start nxt M g c₀).Reaches S r (.inl (x, c, s)) (t + 1 + T) := by
  induction h with
  | @halt s t ho hs =>
    have e : (foldWhile start nxt M g c₀).step (.inl (x, c, s)) = foldGo M (g c x b) (nxt x) := by
      change (match M.out s with | some b => _ | none => _) = _
      rw [ho]
    have : (foldWhile start nxt M g c₀).Reaches S r (.inl (x, c, s)) (T + 1) :=
      .step rfl (by change size x + (size c + size s) + 1 ≤ _; omega) (e ▸ hr)
    exact this.mono (by omega) le_rfl
  | @step s t ho hs _ ih =>
    have e : (foldWhile start nxt M g c₀).step (.inl (x, c, s)) = .inl (x, c, M.step s) := by
      change (match M.out s with | some b => _ | none => _) = _
      rw [ho]
    have : (foldWhile start nxt M g c₀).Reaches S r (.inl (x, c, s)) (t + 1 + T + 1) :=
      .step rfl (by change size x + (size c + size s) + 1 ≤ _; omega) (e ▸ ih)
    exact this.mono (by omega) le_rfl

theorem foldWhile_reaches {xs : List τ} {o : Option τ} (ho : Orbit nxt o xs) (t : τ → ℕ) (v : τ → β)
    (Sx Sc Sm : ℕ) (c : γ) (hM : ∀ x ∈ xs, M.Runs x (t x) Sm (v x)) (hx : ∀ x ∈ xs, size x ≤ Sx)
    (hc : ∀ l, l <+: xs → size (l.foldl (fun c x => g c x (v x)) c) ≤ Sc) :
    (foldWhile start nxt M g c₀).Reaches (Sx + (Sc + Sm) + 1) (xs.foldl (fun c x => g c x (v x)) c)
      (foldGo M c o) (xs.map fun x => t x + 1).sum := by
  induction ho generalizing c with
  | nil =>
    have := hc [] (List.nil_prefix)
    exact .halt rfl (by change size c + 1 ≤ _; simp only [List.foldl_nil] at this; omega)
  | @cons x xs _ ih =>
    simp only [List.map_cons, List.sum_cons, List.foldl_cons]
    refine foldWhile_body (hM x List.mem_cons_self) ?_
      (ih (g c x (v x)) (fun y hy => hM y (List.mem_cons_of_mem _ hy))
        (fun y hy => hx y (List.mem_cons_of_mem _ hy))
        fun l hl => by simpa using hc (x :: l) ((List.prefix_cons_inj x).2 hl))
    have h1 := hx x List.mem_cons_self
    have h2 := hc [] List.nil_prefix
    simp only [List.foldl_nil] at h2
    omega

/-- The loop: steps = Σ over the orbit of (steps of the body + 1); result = the fold over the orbit. -/
theorem foldWhile_runs {a : α} {xs : List τ} (ho : Orbit nxt (start a) xs) (t : τ → ℕ) (v : τ → β)
    (Sx Sc Sm : ℕ) (hM : ∀ x ∈ xs, M.Runs x (t x) Sm (v x)) (hx : ∀ x ∈ xs, size x ≤ Sx)
    (hc : ∀ l, l <+: xs → size (l.foldl (fun c x => g c x (v x)) (c₀ a)) ≤ Sc) :
    (foldWhile start nxt M g c₀).Runs a (xs.map fun x => t x + 1).sum (Sx + (Sc + Sm) + 1)
      (xs.foldl (fun c x => g c x (v x)) (c₀ a)) :=
  foldWhile_reaches ho t v Sx Sc Sm (c₀ a) hM hx hc

end foldWhile

end Stepped

/-! ## StepMachines/Prog/Comb.lean (verbatim) -/

namespace Stepped

variable {α α₁ α₂ β γ δ ι : Type}

/-! ### Choice -/

/-- M₁ on x if sel a = inl x, M₂ on y if sel a = inr y. No further step. -/
def branch (sel : α → α₁ ⊕ α₂) (M₁ : Stepped α₁ β) (M₂ : Stepped α₂ β) : Stepped α β where
  σ := M₁.σ ⊕ M₂.σ
  init a := match sel a with | .inl x => .inl (M₁.init x) | .inr y => .inr (M₂.init y)
  step s := match s with | .inl s => .inl (M₁.step s) | .inr s => .inr (M₂.step s)
  out s := match s with | .inl s => M₁.out s | .inr s => M₂.out s

theorem branch_reaches_inl {sel : α → α₁ ⊕ α₂} {M₁ : Stepped α₁ β} {M₂ : Stepped α₂ β} {S t : ℕ} {b : β}
    {s : M₁.σ} (h : M₁.Reaches S b s t) : (branch sel M₁ M₂).Reaches (S + 1) b (.inl s) t := by
  induction h with
  | halt ho hs => exact .halt ho (Nat.succ_le_succ hs)
  | step ho hs _ ih => exact .step ho (Nat.succ_le_succ hs) ih

theorem branch_reaches_inr {sel : α → α₁ ⊕ α₂} {M₁ : Stepped α₁ β} {M₂ : Stepped α₂ β} {S t : ℕ} {b : β}
    {s : M₂.σ} (h : M₂.Reaches S b s t) : (branch sel M₁ M₂).Reaches (S + 1) b (.inr s) t := by
  induction h with
  | halt ho hs => exact .halt ho (Nat.succ_le_succ hs)
  | step ho hs _ ih => exact .step ho (Nat.succ_le_succ hs) ih

theorem branch_runs_inl {sel : α → α₁ ⊕ α₂} {M₁ : Stepped α₁ β} {M₂ : Stepped α₂ β} {a : α} {x : α₁}
    {S t : ℕ} {b : β} (hs : sel a = .inl x) (h : M₁.Runs x t S b) : (branch sel M₁ M₂).Runs a t (S + 1) b := by
  have e : (branch sel M₁ M₂).init a = .inl (M₁.init x) := by
    change (match sel a with | .inl x => _ | .inr y => _) = _
    rw [hs]
  unfold Runs
  rw [e]
  exact branch_reaches_inl h

theorem branch_runs_inr {sel : α → α₁ ⊕ α₂} {M₁ : Stepped α₁ β} {M₂ : Stepped α₂ β} {a : α} {y : α₂}
    {S t : ℕ} {b : β} (hs : sel a = .inr y) (h : M₂.Runs y t S b) : (branch sel M₁ M₂).Runs a t (S + 1) b := by
  have e : (branch sel M₁ M₂).init a = .inr (M₂.init y) := by
    change (match sel a with | .inl x => _ | .inr y => _) = _
    rw [hs]
  unfold Runs
  rw [e]
  exact branch_reaches_inr h

/-- Left if p a, else right. -/
def iteSel (p : α → Bool) (a : α) : α ⊕ α := if p a then .inl a else .inr a

/-- M if p a, else N, on the same input. No further step. -/
def ite (p : α → Bool) (M N : Stepped α β) : Stepped α β := branch (iteSel p) M N

theorem ite_runs_true {p : α → Bool} {M N : Stepped α β} {a : α} {S t : ℕ} {b : β} (hp : p a = true)
    (h : M.Runs a t S b) : (ite p M N).Runs a t (S + 1) b :=
  branch_runs_inl (by simp [iteSel, hp]) h

theorem ite_runs_false {p : α → Bool} {M N : Stepped α β} {a : α} {S t : ℕ} {b : β} (hp : p a = false)
    (h : N.Runs a t S b) : (ite p M N).Runs a t (S + 1) b :=
  branch_runs_inr (by simp [iteSel, hp]) h

/-- The result b, whatever the input; one step. -/
def const [HasSize α] [HasSize β] (b : β) : Stepped α β := ofFun (Function.const α b)

theorem const_runs [HasSize α] [HasSize β] (b : β) (a : α) :
    (const b : Stepped α β).Runs a 1 (max (size a) (size b) + 1) b := ofFun_runs _ a

/-- Left with (a, i) at (a, some i), right with a at (a, none). -/
def optSel (x : α × Option ι) : (α × ι) ⊕ α :=
  match x.2 with | some i => .inl (x.1, i) | none => .inr x.1

/-- M; if its result is some i, then N on (a, i); if none, then dflt a. -/
def optBind [HasSize α] [HasSize β] (M : Stepped α (Option ι)) (N : Stepped (α × ι) β)
    (dflt : α → β) : Stepped α β :=
  bind M (branch optSel N (ofFun dflt))

theorem optBind_runs_some [HasSize α] [HasSize β] {M : Stepped α (Option ι)} {N : Stepped (α × ι) β}
    {dflt : α → β} {a : α} {i : ι} {t t' S S' : ℕ} {b : β} (h : M.Runs a t S (some i))
    (h' : N.Runs (a, i) t' S' b) : (optBind M N dflt).Runs a (t + 1 + t') (max (size a + S) (S' + 1) + 1) b :=
  bind_runs h (branch_runs_inl rfl h')

/-! ### Two computations on one input -/

/-- M, then N, on the same input; both results. -/
def both [HasSize α] [HasSize β] (M : Stepped α β) (N : Stepped α γ) : Stepped α (β × γ) where
  σ := (α × M.σ) ⊕ (β × N.σ)
  init a := .inl (a, M.init a)
  step s := match s with
    | .inl p => match M.out p.2 with
      | some b => .inr (b, N.init p.1)
      | none => .inl (p.1, M.step p.2)
    | .inr p => .inr (p.1, N.step p.2)
  out s := match s with | .inl _ => none | .inr p => (N.out p.2).map fun c => (p.1, c)

theorem both_reaches_inr [HasSize α] [HasSize β] {M : Stepped α β} {N : Stepped α γ} {S t : ℕ} {b : β} {c : γ}
    {s : N.σ} (h : N.Reaches S c s t) : (both M N).Reaches (size b + S + 1) (b, c) (.inr (b, s)) t := by
  induction h with
  | @halt s t ho hs =>
    exact .halt (by change (N.out s).map _ = _; rw [ho]; rfl) (by change size b + size s + 1 ≤ _; omega)
  | @step s t ho hs _ ih =>
    exact .step (by change (N.out s).map _ = _; rw [ho]; rfl) (by change size b + size s + 1 ≤ _; omega) ih

theorem both_runs [HasSize α] [HasSize β] {M : Stepped α β} {N : Stepped α γ} {a : α} {t t' S S' : ℕ}
    {b : β} {c : γ} (h : M.Runs a t S b) (h' : N.Runs a t' S' c) :
    (both M N).Runs a (t + 1 + t') (max (size a + S) (size b + S') + 1) (b, c) := by
  unfold Runs at *
  change (both M N).Reaches _ (b, c) (.inl (a, M.init a)) _
  generalize M.init a = s at h
  induction h with
  | @halt s t ho hs =>
    have e : (both M N).step (.inl (a, s)) = .inr (b, N.init a) := by
      change (match M.out s with | some b => _ | none => _) = _
      rw [ho]
    have : (both M N).Reaches (max (size a + S) (size b + S') + 1) (b, c) (.inl (a, s)) (t' + 1) :=
      .step rfl (by change size a + size s + 1 ≤ _; omega)
        (e ▸ (both_reaches_inr h').mono le_rfl (by omega))
    exact this.mono (by omega) le_rfl
  | @step s t ho hs _ ih =>
    have e : (both M N).step (.inl (a, s)) = .inl (a, M.step s) := by
      change (match M.out s with | some b => _ | none => _) = _
      rw [ho]
    have : (both M N).Reaches (max (size a + S) (size b + S') + 1) (b, c) (.inl (a, s)) (t + 1 + t' + 1) :=
      .step rfl (by change size a + size s + 1 ≤ _; omega) (e ▸ ih)
    exact this.mono (by omega) le_rfl

/-- f of the results of M and N on the same input. -/
def map2 [HasSize α] [HasSize β] (f : β → γ → δ) (M : Stepped α β) (N : Stepped α γ) :
    Stepped α δ :=
  mapOut (both M N) (Function.uncurry f)

theorem map2_runs [HasSize α] [HasSize β] {f : β → γ → δ} {M : Stepped α β} {N : Stepped α γ} {a : α}
    {t t' S S' : ℕ} {b : β} {c : γ} (h : M.Runs a t S b) (h' : N.Runs a t' S' c) :
    (map2 f M N).Runs a (t + 1 + t') (max (size a + S) (size b + S') + 1) (f b c) :=
  mapOut_runs (both_runs h h')

/-- The product of the results of M and N on the same input. -/
def mul2 [HasSize α] (M N : Stepped α ℤ) : Stepped α ℤ := map2 Int.mul M N

theorem mul2_runs [HasSize α] {M N : Stepped α ℤ} {a : α} {t t' S S' : ℕ} {b c : ℤ}
    (h : M.Runs a t S b) (h' : N.Runs a t' S' c) :
    (mul2 M N).Runs a (t + 1 + t') (max (size a + S) (size b + S') + 1) (b * c) :=
  map2_runs h h'

end Stepped

/-! ## ToTuring/Enc.lean (verbatim) -/

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

/-- The word of a value is at most linear in its size (`HasSize`, the measure in which the states of
the algorithm are bounded): len x + 2 ≤ 7·size x. -/
class Carried (α : Type) [Enc α] [HasSize α] : Prop where
  le : ∀ x : α, len x + 2 ≤ 7 * size x

/-! ## ToTuring/EncLemmas.lean (verbatim) -/

variable {α β : Type} [Enc α] [Enc β]

theorem wd_pair (a : α) (b : β) : wd (a, b) = .L :: (wd a ++ wd b ++ [.R]) := rfl
theorem wd_nil : wd ([] : List α) = [.L, .R] := rfl
theorem wd_cons (a : α) (l : List α) : wd (a :: l) = .L :: (wd a ++ wd l ++ [.R]) := rfl
theorem wd_none : wd (none : Option α) = [.L, .R] := rfl
theorem wd_some (a : α) : wd (some a) = .L :: (wd a ++ [.L, .R] ++ [.R]) := rfl
theorem wd_inl (a : α) : wd (Sum.inl a : α ⊕ β) = .L :: ([.bit false] ++ wd a ++ [.R]) := rfl
theorem wd_inr (b : β) : wd (Sum.inr b : α ⊕ β) = .L :: ([.bit true] ++ wd b ++ [.R]) := rfl
theorem wd_bool (b : Bool) : wd b = [.bit b] := rfl
/-- An integer is written as the pair of its sign (`true` if negative) and its absolute value. -/
theorem wd_int (z : ℤ) : wd z = wd (decide (z < 0), z.natAbs) := rfl

theorem len_pair (a : α) (b : β) : len (a, b) = len a + len b + 2 := by
  simp only [len, wd_pair, List.length_cons, List.length_append, List.length_nil]
theorem len_nil : len ([] : List α) = 2 := rfl
theorem len_cons (a : α) (l : List α) : len (a :: l) = len a + len l + 2 := by
  simp only [len, wd_cons, List.length_cons, List.length_append, List.length_nil]
/-- The word of `none` is a pair of brackets. -/
theorem len_none : len (none : Option α) = 2 := rfl
/-- The word of `some a` adds four brackets to the word of `a`. -/
theorem len_some (a : α) : len (some a) = len a + 4 := by
  simp only [len, wd_some, List.length_cons, List.length_append, List.length_nil]
/-- The word of a left injection adds a tag bit and two brackets. -/
theorem len_inl (a : α) : len (Sum.inl a : α ⊕ β) = len a + 3 := by
  simp only [len, wd_inl, List.length_cons, List.length_append, List.length_nil]; omega
/-- The word of a right injection adds a tag bit and two brackets. -/
theorem len_inr (b : β) : len (Sum.inr b : α ⊕ β) = len b + 3 := by
  simp only [len, wd_inr, List.length_cons, List.length_append, List.length_nil]; omega
/-- The word of a list has the words of its entries, two brackets for each entry and two more at the
end. -/
theorem len_list (l : List α) : len l = (l.map fun a => len a + 2).sum + 2 := by
  induction l with
  | nil => rfl
  | cons a l ih => rw [len_cons, ih, List.map_cons, List.sum_cons]; omega
/-- The words of `l` and `l'` together have two symbols more than the word of `l ++ l'`. -/
theorem len_append (l l' : List α) : len (l ++ l') + 2 = len l + len l' := by
  induction l with
  | nil => rw [List.nil_append, len_nil]; omega
  | cons a l ih => rw [List.cons_append, len_cons, len_cons]; omega
/-- A list has at most as many entries as its word has symbols. -/
theorem length_le_len (l : List α) : l.length ≤ len l := by
  induction l with
  | nil => exact Nat.zero_le _
  | cons a l ih => rw [len_cons, List.length_cons]; omega
/-- The word of an entry is no longer than the word of the list. -/
theorem len_le_of_mem {a : α} {l : List α} (h : a ∈ l) : len a ≤ len l := by
  induction l with
  | nil => cases h
  | cons b l ih =>
    rw [len_cons]
    rcases List.mem_cons.1 h with rfl | h
    · omega
    · have := ih h; omega
/-- The word of a list has at least its two brackets. -/
theorem two_le_len_list (l : List α) : 2 ≤ len l := by
  rw [len_list]; omega
theorem len_drop_le (l : List α) (k : ℕ) : len (l.drop k) ≤ len l := by
  have h := len_append (l.take k) (l.drop k)
  rw [List.take_append_drop] at h
  have := two_le_len_list (l.take k)
  omega
/-- A truth value is one symbol. -/
theorem len_bool (b : Bool) : len b = 1 := rfl
/-- The one value of `Unit` is a pair of brackets. -/
theorem len_unit (u : Unit) : len u = 2 := rfl
/-- A list of truth values takes three symbols for each entry and two more at the end. -/
theorem len_bools (w : List Bool) : len w = 3 * w.length + 2 := by
  induction w with
  | nil => rfl
  | cons b w ih => rw [len_cons, ih, List.length_cons, len_bool]; omega
/-- A list over `Unit` takes four symbols for each entry and two more at the end. -/
theorem len_units (w : List Unit) : len w = 4 * w.length + 2 := by
  induction w with
  | nil => rfl
  | cons u w ih => rw [len_cons, ih, List.length_cons, len_unit]; omega
/-- A natural number takes three symbols for each binary digit and two more at the end. -/
theorem len_nat (n : ℕ) : len n = 3 * Nat.size n + 2 := by
  rw [← Nat.size_eq_bits_len, ← len_bools]; rfl
/-- An integer takes the word of its absolute value, a sign bit and two brackets. -/
theorem len_int (z : ℤ) : len z = 3 * Nat.size z.natAbs + 5 := by
  have h : len z = len (decide (z < 0), z.natAbs) := rfl
  rw [h, len_pair, len_bool, len_nat]; omega
/-- A larger natural number has a word at least as long. -/
theorem len_nat_mono {m n : ℕ} (h : m ≤ n) : len m ≤ len n := by
  rw [len_nat, len_nat]; have := Nat.size_le_size h; omega

instance : Carried Unit := ⟨fun u => by rw [len_unit, size_unit]; omega⟩
instance : Carried Bool := ⟨fun b => by rw [len_bool, size_bool]; omega⟩
instance : Carried ℕ := ⟨fun n => by rw [len_nat, size_nat]; omega⟩
instance : Carried ℤ := ⟨fun z => by rw [len_int, size_int]; omega⟩
instance [HasSize α] [HasSize β] [Carried α] [Carried β] : Carried (α × β) :=
  ⟨fun ⟨a, b⟩ => by
    have h₁ := Carried.le a
    have h₂ := Carried.le b
    rw [len_pair, size_prod]; dsimp only; omega⟩
instance [HasSize α] [HasSize β] [Carried α] [Carried β] : Carried (α ⊕ β) :=
  ⟨fun s => by
    rcases s with a | b
    · have := Carried.le a; rw [len_inl, size_inl]; omega
    · have := Carried.le b; rw [len_inr, size_inr]; omega⟩
instance [HasSize α] [Carried α] : Carried (Option α) :=
  ⟨fun o => by
    rcases o with _ | a
    · rw [len_none, size_none]; omega
    · have := Carried.le a; rw [len_some, size_some]; omega⟩
instance [HasSize α] [Carried α] : Carried (List α) :=
  ⟨fun l => by
    induction l with
    | nil => rw [len_nil]; simp
    | cons a l ih =>
      have := Carried.le a
      rw [size_list] at ih
      rw [len_cons, size_list, List.map_cons, List.sum_cons]; omega⟩

/-! ## ToTuring/PolyT.lean (verbatim; `@[fun_prop]` dropped) -/

open TM

/-- f is computed in polynomial time on top of the main stack: for some constant c, one fragment
turns the word of x, with any M beneath it on the main stack and any contents A, B, N of the other
three stacks, into the word of f x with the same M, A, B, N, in at most c·(len x + 1)^c steps; and
the word of f x has at most c·(len x + 1)^c symbols. The definition says nothing about words that
are not words of values. -/
def PolyT {α β : Type} [Enc α] [Enc β] (f : α → β) : Prop :=
  ∃ (P : Fr) (c : ℕ),
    (∀ (x : α) (M A B N : List Sym), ∃ n ≤ c * (len x + 1) ^ c,
      P.Runs none (st (wd x ++ M) A B N) n (st (wd (f x) ++ M) A B N)) ∧
    ∀ x, len (f x) ≤ c * (len x + 1) ^ c

/-- How to prove PolyT: a fragment, a polynomial bound on its steps, a polynomial bound on the
length of the result. -/
theorem PolyT.of {α β : Type} [Enc α] [Enc β] {f : α → β} (P : Fr) {t s : ℕ → ℕ} (ht : PB t) (hs : PB s)
    (h : ∀ (x : α) (M A B N : List Sym), P.Within (st (wd x ++ M) A B N) (t (len x)) (st (wd (f x) ++ M) A B N))
    (hl : ∀ x, len (f x) ≤ s (len x)) : PolyT f := by
  obtain ⟨c, hc⟩ := ht
  obtain ⟨c', hc'⟩ := hs
  refine ⟨P, c + c', fun x M A B N => ?_, fun x => ?_⟩
  · obtain ⟨n, hn, hr⟩ := h x M A B N
    exact ⟨n, (hn.trans (hc _)).trans (PB.bound_le (Nat.le_add_right _ _) (Nat.le_add_right _ _)), hr⟩
  · exact ((hl x).trans (hc' _)).trans (PB.bound_le (Nat.le_add_left _ _) (Nat.le_add_left _ _))

/-- How to use PolyT: one monotone polynomial bound for the steps and for the length of the result. -/
theorem PolyT.elim {α β : Type} [Enc α] [Enc β] {f : α → β} (h : PolyT f) : ∃ (P : Fr) (t : ℕ → ℕ), PB t ∧ Monotone t ∧
    (∀ (x : α) (M A B N : List Sym), P.Within (st (wd x ++ M) A B N) (t (len x)) (st (wd (f x) ++ M) A B N)) ∧
    ∀ x, len (f x) ≤ t (len x) := by
  obtain ⟨P, c, h1, h2⟩ := h
  exact ⟨P, fun n => c * (n + 1) ^ c, (PB.mono_bound c).1, (PB.mono_bound c).2, h1, h2⟩

/-- PolyT passes to a function with the same values. -/
theorem PolyT.congr {α β : Type} [Enc α] [Enc β] {f g : α → β} (h : PolyT f) (e : ∀ x, f x = g x) : PolyT g := by
  obtain rfl : f = g := funext e
  exact h

/-- Only words matter: if φ keeps the words of the inputs, and the words of g's values are those of
f ∘ φ, then g is polynomial-time, computed by the same fragment as f. The types may differ. -/
theorem PolyT.of_wd {α β α' β' : Type} [Enc α] [Enc β] [Enc α'] [Enc β'] {f : α → β} (hf : PolyT f) {g : α' → β'}
    (φ : α' → α) (hφ : ∀ x, wd (φ x) = wd x) (hg : ∀ x, wd (g x) = wd (f (φ x))) : PolyT g := by
  obtain ⟨P, c, h1, h2⟩ := hf
  refine ⟨P, c, fun x M A B N => ?_, fun x => ?_⟩
  · have := h1 (φ x) M A B N
    simpa only [len, hφ, hg] using this
  · have := h2 (φ x)
    simpa only [len, hφ, hg] using this

/-- The number f x is computed in polynomial time in unary: as a list of that length. -/
def Unary {α : Type} [Enc α] (f : α → ℕ) : Prop := PolyT fun x => List.replicate (f x) ()

/-- Every part of the stepped computation M is polynomial-time, and the words of its states are at
most linear in their size. This does not bound the number of steps that M takes; that bound comes
from the files of proof/machines/StepMachines/. The class holds data, the encoding of the states; so
theorems that assert it say `Nonempty (IsPolyT M)`. -/
class IsPolyT {α β : Type} [Enc α] [Enc β] (M : Stepped α β) where
  [enc : Enc M.σ]
  [carried : Carried M.σ]
  init : PolyT M.init
  step : PolyT M.step
  out : PolyT M.out

instance {α β : Type} [Enc α] [Enc β] (M : Stepped α β) [h : IsPolyT M] : Enc M.σ := h.enc
instance {α β : Type} [Enc α] [Enc β] (M : Stepped α β) [h : IsPolyT M] : Carried M.σ := h.carried

end Groundwork
