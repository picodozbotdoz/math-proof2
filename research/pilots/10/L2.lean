/-
Pilot 10-L2 — the space-certified countdown loop and `PolyTVal` (lemma L2 of
`research/pilots/10-prework.md` §5, milestone M3 of `research/pilots/10-blueprint.md`),
pilot-10 lane (Cycle 2), 2026-11-13. Everything from the header marker «M1 verbatim» down to
the four `#print axioms` of `exists_tm_space` and its corollaries is the GREEN M1 artifact
(`research/pilots/10/M1.lean`, sha256 8822167f8c18…), copied verbatim — the runner elaborates
each file independently, so L2 carries its own donor layer; the new mathematics is Part D at
the end.

Target: mathlib `ff2494ea` (toolchain leanprover/lean4:v4.36.0-rc2), kernel-only.
No `sorry`, no `native_decide`, no external CAS, no hypothesis binders: everything below is
proved, the donor layer included.

## Part D (new, this milestone) — the per-iteration clock

Prework §3: «`ct : ℕ` — a loop countdown … every `rng pad q`-fold and `sumF N pad f`-fold
becomes `loopC nb q f` … each iteration costs poly(log nb) fragment steps (increment/decrement
on a ⌈log₂ nb⌉-bit counter)». Part D builds that countdown as a fragment on Part A's calculus
and proves the machine lemma the blueprint asks of L2 — the counter-based fragments run on
poly-size words while the loop runs a value-bounded number of rounds:

  `cw`                     the counter's machine word: the bits of n, lowest first, between two
                           brackets (flat ⌈log₂⌉-form; length n.size + 2 — the word of n)
  `cdM`/`cdFrag`, `headQ`/`cdLoop`   the decrement walk (trailing zeros flipped on stack b, the
                           first one zeroed or dropped when leading, b wound back) and the loop
                           head (halt on cw 0 = [L, R]), one round = decrement, then the body
  `cdFrag_runs`            the decrement: cw n ++ A → cw (n−1) ++ A, stack b restored, in
                           ≤ 3·|bits n| + 3 steps
  **`cdLoop_runsB`**       the per-iteration clock: n rounds in ≤ n·(3·|bits n| + 5 + tb) + 1
                           steps — polynomial in the VALUE n — with every configuration of the
                           run (RunsB: the per-prefix discipline of M1's space layer) below
                           start + growth·(3·|bits n| + 3 + tb) symbols — a ceiling that counts
                           only the WORD ⌈log₂ n⌉ + 1 of the counter, not the number of rounds
  `PolyTVal`               the discipline of prework §5 L2: value-time (PB in len x + nb),
                           word-space (PB in len x + nb.size, per-prefix), one fragment
  **`polyTVal_id`**        a first certificate: identity through the clock (the trivial body),
                           16·(len x + nb + 1)^16 vs (4g+16)·(len x + nb.size + 1)^(4g+16)
  `countdown_cut`          the loop started from cw (min q nb) runs exactly min q nb rounds —
                           L1's cut (loopC's 0, …, min q nb − 1) is the round count

What L2 still needs for the full assembly (next tranche, eth-Lib-grade plumbing rather than new
mathematics): the relabeling walk between `wd`-inputs and `cw`-counters, and the Stepped-level
counter-`padM'` + `exists_tm_padded_space` (which needs eth's Closure layer for the phase
dispatch's PolyT proofs). No wall: the value-time/word-space separation above is exactly the
content `exists_tm_space`'s hypothesis S ≤ (|x|+2)^d consumes.

---

# M1 verbatim (space-annotated `exists_tm`, lemma L3 of `research/pilots/10-prework.md` §5),
pilot-10 lane, 2026-11-09/10.

Target: mathlib `ff2494ea` (toolchain leanprover/lean4:v4.36.0-rc2), kernel-only.
No `sorry`, no `native_decide`, no external CAS, no hypothesis binders: everything below is
proved, the donor layer included.

Dossier: `research/candidates/10-z3-uniform-poly-space-eth-refutation.md` (statement of
`SpaceWithin`, proof-strategy steps 3–5). Prework / G1 audit: `research/pilots/10-prework.md`
(§4 "the certificate is a stack-length invariant threaded through the existing step-induction",
§5 L3; §9 CASE A ⇒ GO, L3 first).

## Part A — eth's machine-fragment calculus, transcribed (read-only sibling
`anthropics_formal-math/eth/proof/`, Lean v4.33.1; statements and proofs copied verbatim except
where marked; the Lean-module syntax `module`/`public import`/`@[expose] public section` is
dropped, and each eth `section … end` becomes a reopened `namespace … end` so that
`research/feasibility/probe/make_axcheck.py`'s namespace tracker stays exact):

  machines/ToTuring/TM/Run.lean      (all)            Run, place, placeCfg, run_place
  machines/ToTuring/TM/Frag.lean     (all)            Frag, seq, branch, loop, Within
  machines/ToTuring/TM/Tree.lean     (all)            Sym, V, code, mirror
  machines/ToTuring/TM/Stacks.lean   (all)            Stk, Fr, st
  machines/ToTuring/TM/Rename.lean   (all)            renK, Frag.ren, ren_runs
  machines/ToTuring/TM/Move.lean     (all)            mvB, mv, mv2, drp + runs lemmas
  machines/ToTuring/TM/Ops.lean      :23–37,54–107    pushW, dropF, dupF + within lemmas
                                                      (swap/cons/uncons/pop1: not needed)
  machines/ToTuring/Machine/Lift.lean (all)           Γio, liftIO, Frag.io, withIO
  statements/StepMachineStatements.lean :29–77        HasSize, Stepped, Reaches, Runs
  machines/ToTuring/Enc.lean         (all)            Enc, wd, len, Carried
  machines/ToTuring/EncLemmas.lean   :22–90 (subset)  wd_*/len_* used by the host
  machines/ToTuring/Bound.lean       (all)            PB and its closure
  machines/ToTuring/PolyT.lean       :54–58,73–77,104–112  PolyT, PolyT.elim, IsPolyT
                                                      (`@[fun_prop]` attribute dropped)
  machines/ToTuring/Machine/Host.lean :47–297 (all but exists_tm)
                                                      the host machine `tmOf (prog Pi Ps Po)`

eth's `exists_tm` (Host.lean:305–309) is NOT transcribed with its proof: it is recovered below,
statement verbatim, as a two-line corollary of the new `exists_tm_space`.

## Part B — new (this pilot): the space layer

  `stkLen`, `pushes`, `stkLen_stepAux`        one TM2 step pushes at most `pushes q` symbols
  `Frag.growth`, `Frag.step_growth`           … so a fragment's step grows the stacks by ≤ growth
  `RunIn` (+ run/trans/mono/of_run/iterate)   runs all of whose configurations satisfy p
  `Frag.RunsB`, `Frag.WithinB` (+ seq, loop)  fragment runs with a stack-size ceiling B
  `mainLoop_withinB`                          eth's `mainLoop_within` + the ceiling
  `SpaceWithinTM`, `SpaceWithin`              dossier 10's definition (per-prefix stack content)
  **`exists_tm_space`**                       eth's `exists_tm` ∧ ∀ t, SpaceWithin … (c·(|x|+1)^c)
  `exists_tm`                                 eth's statement, verbatim, as a corollary

## Part C — openai-math's monitor form (read-only sibling `openai-math/lean/`)

  `Trace`                 OAI/Algorithms/SubexponentialSAT/Computation.lean:20–23, transcribed
  `Trace.iterate`, `of_iterate`   ibid. :29–57 (re-proved for `flip bind`)
  `LocatedCfg`, `locatedInit`, `LocatedCfg.monitor`, `locatedStep`, `visitedStacks`
      the stack analogue of ComparatorChallenges/SubexponentialSAT.lean:149–189
      (`LocatedCfg`/`monitor`/`visitedSpace`): per stack, the high-water mark of its length
      (the cells it has ever occupied), updated at every step
  `visitedStacks_le`      SpaceWithin ⇒ every located prefix trace has visited ≤ |K|·S
  **`exists_tm_space_monitor`**   the headline in openai's per-prefix monitor form
      (shape of SqrtLogSpace/Final.lean:122–128: ∀ prefixSteps ≤ time, ∀ intermediate,
      Trace … → visited intermediate ≤ bound)

Not claimed here: anything about pads, `exists_tm_padded`, or the ETH refutation itself
(milestones L1/L2 of the prework). This file is the L3 tranche: a polynomial-time `Stepped`
machine with polynomial-size states runs on a TM2 machine in eth's time bound AND in space
polynomial in the input length, independent of the number of steps T.
-/

import Mathlib

/-! # Part A — eth's machine-fragment calculus (transcribed) -/

/-! ## TM/Run.lean -/

namespace Groundwork.TM

open Turing

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

end Groundwork.TM

namespace Groundwork.TM

open Turing

variable {K : Type} [DecidableEq K] {Γ : K → Type} {σ : Type}

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
  | n + 1, ⟨none, v, S⟩, b, ⟨c, hc, _⟩ => by simp [TM2.step] at hc
  | n + 1, ⟨some l, v, S⟩, b, ⟨c, hc, h⟩ => by
    refine ⟨placeCfg ι e c, ?_, run_place hM h⟩
    simp only [TM2.step, Option.some.injEq] at hc
    simp only [placeCfg, Option.elim, Function.comp, TM2.step, hM, stepAux_place, hc]

end Groundwork.TM

/-! ## TM/Frag.lean -/

namespace Groundwork.TM

open Turing

variable {K : Type} [DecidableEq K] {Γ : K → Type} {σ : Type}

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

end Groundwork.TM

namespace Groundwork.TM

open Turing

variable {K : Type} [DecidableEq K] {Γ : K → Type} {τ : Type}

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

end Groundwork.TM

/-! ## TM/Tree.lean -/

namespace Groundwork.TM

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
  have h : ∀ s : Sym, s.flip.flip = s := fun s => by cases s <;> rfl
  simp [mirror, List.map_reverse, Function.comp_def, h]

@[simp] theorem length_mirror (w : List Sym) : (mirror w).length = w.length := by simp [mirror]

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

end Groundwork.TM

/-! ## TM/Stacks.lean -/

namespace Groundwork.TM

open Turing

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

end Groundwork.TM

namespace Groundwork.TM

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

end Groundwork.TM

/-! ## TM/Rename.lean -/

namespace Groundwork.TM

open Turing

variable {K₁ K₂ : Type} [DecidableEq K₁] [DecidableEq K₂] {A Λ σ : Type} (φ : K₁ → K₂)

/-- The statement on the renamed stacks. -/
def renK : TM2.Stmt (fun _ : K₁ => A) Λ σ → TM2.Stmt (fun _ : K₂ => A) Λ σ
  | .push k f q => .push (φ k) f (renK q)
  | .peek k f q => .peek (φ k) f (renK q)
  | .pop k f q => .pop (φ k) f (renK q)
  | .load f q => .load f (renK q)
  | .branch p q₁ q₂ => .branch p (renK q₁) (renK q₂)
  | .goto l => .goto l
  | .halt => .halt

/-- The fragment on the renamed stacks. -/
def Frag.ren (P : Frag (fun _ : K₁ => A) σ) : Frag (fun _ : K₂ => A) σ where
  Λ := P.Λ
  entry := P.entry
  m l := renK φ (P.m l)

variable {φ} in
/-- Stacks that agree along φ still agree after the same stack was overwritten on both sides. -/
private theorem agree_update (hφ : Function.Injective φ) {T : K₁ → List A} {S : K₂ → List A} (hS : ∀ k, S (φ k) = T k) (k : K₁)
    (w : List A) (k' : K₁) : Function.update S (φ k) w (φ k') = Function.update T k w k' := by
  by_cases h : k' = k
  · subst h; simp
  · rw [Function.update_of_ne h, Function.update_of_ne (hφ.ne h), hS]

variable {φ} in
/-- One statement: on stacks that agree along φ, the renamed statement ends at the same label with
the same local state, on stacks that agree along φ, and it leaves the stacks outside the image of φ
alone. -/
theorem stepAux_renK (hφ : Function.Injective φ) (q : TM2.Stmt (fun _ : K₁ => A) Λ σ) (v : σ) (T : K₁ → List A)
    (S : K₂ → List A) (hS : ∀ k, S (φ k) = T k) :
    (TM2.stepAux (renK φ q) v S).l = (TM2.stepAux q v T).l ∧ (TM2.stepAux (renK φ q) v S).var = (TM2.stepAux q v T).var ∧
      (∀ k, (TM2.stepAux (renK φ q) v S).stk (φ k) = (TM2.stepAux q v T).stk k) ∧
      ∀ k, (∀ a, φ a ≠ k) → (TM2.stepAux (renK φ q) v S).stk k = S k := by
  induction q generalizing v T S with
  | push k f q ih =>
    obtain ⟨h1, h2, h3, h4⟩ := ih v _ _ (agree_update hφ hS k (f v :: T k))
    simp only [renK, TM2.stepAux, hS]
    exact ⟨h1, h2, h3, fun k' hk' => (h4 k' hk').trans (Function.update_of_ne (hk' k).symm _ _)⟩
  | peek k f q ih =>
    simp only [renK, TM2.stepAux, hS]
    exact ih _ _ _ hS
  | pop k f q ih =>
    obtain ⟨h1, h2, h3, h4⟩ := ih (f v (T k).head?) _ _ (agree_update hφ hS k (T k).tail)
    simp only [renK, TM2.stepAux, hS]
    exact ⟨h1, h2, h3, fun k' hk' => (h4 k' hk').trans (Function.update_of_ne (hk' k).symm _ _)⟩
  | load f q ih => exact ih _ _ _ hS
  | branch p q₁ q₂ ih₁ ih₂ =>
    simp only [renK, TM2.stepAux]
    cases p v
    · exact ih₂ _ _ _ hS
    · exact ih₁ _ _ _ hS
  | goto l => exact ⟨rfl, rfl, hS, fun _ _ => rfl⟩
  | halt => exact ⟨rfl, rfl, hS, fun _ _ => rfl⟩

variable {φ} in
/-- Runs of a machine become runs of the renamed machine. -/
theorem run_renK (hφ : Function.Injective φ) {M : Λ → TM2.Stmt (fun _ : K₁ => A) Λ σ} :
    ∀ {n : ℕ} {l l' : Option Λ} {v v' : σ} {T T' : K₁ → List A}, Run (TM2.step M) ⟨l, v, T⟩ n ⟨l', v', T'⟩ →
      ∀ {S S' : K₂ → List A}, (∀ k, S (φ k) = T k) → (∀ k, S' (φ k) = T' k) → (∀ k, (∀ a, φ a ≠ k) → S' k = S k) →
        Run (TM2.step fun l => renK φ (M l)) ⟨l, v, S⟩ n ⟨l', v', S'⟩
  | 0, _, _, _, _, _, _, h, S, S', hS, hS', ho => by
    cases h
    have : S = S' := by
      funext k
      by_cases hk : ∃ a, φ a = k
      · obtain ⟨a, rfl⟩ := hk; rw [hS, hS']
      · exact (ho k fun a ha => hk ⟨a, ha⟩).symm
    subst this; exact rfl
  | n + 1, none, _, _, _, _, _, ⟨c, hc, _⟩, _, _, _, _, _ => by simp [TM2.step] at hc
  | n + 1, some l, l', v, v', T, T', ⟨c, hc, h⟩, S, S', hS, hS', ho => by
    simp only [TM2.step, Option.some.injEq] at hc
    subst hc
    obtain ⟨h1, h2, h3, h4⟩ := stepAux_renK hφ (M l) v T S hS
    refine ⟨TM2.stepAux (renK φ (M l)) v S, rfl, ?_⟩
    have := run_renK hφ (S := (TM2.stepAux (renK φ (M l)) v S).stk) (S' := S') h h3 hS'
      fun k hk => (ho k hk).trans (h4 k hk).symm
    rw [← h1, ← h2] at this
    exact this

/-- If S and S' agree with T and T' along φ and with each other outside the image of φ, a run of P
from T to T' becomes a run of `P.ren φ` from S to S' with the same number of steps. -/
theorem Frag.ren_runs (hφ : Function.Injective φ) {P : Frag (fun _ : K₁ => A) σ} {v : σ} {T T' : K₁ → List A} {n : ℕ}
    (h : P.Runs v T n T') {S S' : K₂ → List A} (hS : ∀ k, S (φ k) = T k) (hS' : ∀ k, S' (φ k) = T' k)
    (ho : ∀ k, (∀ a, φ a ≠ k) → S' k = S k) : (P.ren φ).Runs v S n S' :=
  run_renK hφ h hS hS' ho

end Groundwork.TM

/-! ## TM/Move.lean -/

namespace Groundwork.TM

open Turing

/-- Source, two targets, counter. -/
inductive S4 | src | t1 | t2 | cnt
  deriving DecidableEq

/-- The labels of the loop. -/
inductive MvL | start | loop
  deriving DecidableEq

instance : Fintype MvL := ⟨{.start, .loop}, fun x => by cases x <;> simp⟩

/-- Statements of the loop. -/
abbrev St4 := TM2.Stmt (fun _ : S4 => Sym) MvL (Option Sym)

/-- Push on k if p. -/
def pushIf (p : Bool) (k : S4) (f : Option Sym → Sym) (q : St4) : St4 := if p then .push k f q else q

/-- Is the count back at the sentinel? Then remove it and halt; else go on. -/
def mvChk : St4 :=
  .peek .cnt (fun _ o => o) <|
    .branch (fun s => s == some .L) (.pop .cnt (fun _ _ => none) .halt) (.load (fun _ => none) <| .goto fun _ => .loop)

/-- The program: a sentinel on the counter; then pop a symbol, push its mirror image (on t1 if p₁,
on t2 if p₂), count. -/
def mvM (p₁ p₂ : Bool) : MvL → St4
  | .start => .push .cnt (fun _ => .L) <| .goto fun _ => .loop
  | .loop => .pop .src (fun _ o => o) <|
      .branch (fun s => s == some .L)
        (pushIf p₁ .t1 (fun _ => .R) <| pushIf p₂ .t2 (fun _ => .R) <| .push .cnt (fun _ => .R) <|
          .load (fun _ => none) <| .goto fun _ => .loop)
        (.branch (fun s => s == some .R)
          (pushIf p₁ .t1 (fun _ => .L) <| pushIf p₂ .t2 (fun _ => .L) <| .pop .cnt (fun s _ => s) mvChk)
          (pushIf p₁ .t1 (fun s => s.getD .L) <| pushIf p₂ .t2 (fun s => s.getD .L) mvChk))

/-- The loop as a fragment on four stacks. -/
def mvB (p₁ p₂ : Bool) : Frag (fun _ : S4 => Sym) (Option Sym) := ⟨MvL, .start, mvM p₁ p₂⟩

/-- The four stacks of the loop as work stacks. -/
def toStk (i j k : Stk) : S4 → Stk
  | .src => i
  | .t1 => j
  | .t2 => k
  | .cnt => .cnt

/-- A work stack other than i, j and the counter; it fills a target slot of the loop that is not
used. -/
def other (i j : Stk) : Stk :=
  if i ≠ .main ∧ j ≠ .main then .main else if i ≠ .a ∧ j ≠ .a then .a else .b

/-- Move one item from stack i to stack j, mirrored. -/
def mv (i j : Stk) : Fr := (mvB true false).ren (toStk i j (other i j))

/-- Move one item from stack i to the stacks j and k, mirrored. -/
def mv2 (i j k : Stk) : Fr := (mvB true true).ren (toStk i j k)

/-- Pop one item off stack i. -/
def drp (i : Stk) : Fr := (mvB false false).ren (toStk i (other i i) (other i (other i i)))

/-- The contents of the four stacks. -/
def st4 (A B₁ B₂ C : List Sym) : S4 → List Sym
  | .src => A
  | .t1 => B₁
  | .t2 => B₂
  | .cnt => C

/-- The word w on top of B if p, else B. -/
def putIf (p : Bool) (w B : List Sym) : List Sym := if p then w ++ B else B

end Groundwork.TM

namespace Groundwork.TM

variable (A B₁ B₂ C W : List Sym)
@[simp] theorem st4_src : st4 A B₁ B₂ C .src = A := rfl
@[simp] theorem st4_t1 : st4 A B₁ B₂ C .t1 = B₁ := rfl
@[simp] theorem st4_t2 : st4 A B₁ B₂ C .t2 = B₂ := rfl
@[simp] theorem st4_cnt : st4 A B₁ B₂ C .cnt = C := rfl
@[simp] theorem upd4_src : Function.update (st4 A B₁ B₂ C) .src W = st4 W B₁ B₂ C := by
  funext k; cases k <;> simp [Function.update, st4]
@[simp] theorem upd4_t1 : Function.update (st4 A B₁ B₂ C) .t1 W = st4 A W B₂ C := by
  funext k; cases k <;> simp [Function.update, st4]
@[simp] theorem upd4_t2 : Function.update (st4 A B₁ B₂ C) .t2 W = st4 A B₁ W C := by
  funext k; cases k <;> simp [Function.update, st4]
@[simp] theorem upd4_cnt : Function.update (st4 A B₁ B₂ C) .cnt W = st4 A B₁ B₂ W := by
  funext k; cases k <;> simp [Function.update, st4]

end Groundwork.TM

namespace Groundwork.TM

open Turing

variable (p₁ p₂ : Bool) (A B₁ B₂ C : List Sym)

private theorem step_start : TM2.step (mvM p₁ p₂) ⟨some .start, none, st4 A B₁ B₂ C⟩ =
    some ⟨some .loop, none, st4 A B₁ B₂ (.L :: C)⟩ := by
  simp [TM2.step, mvM, TM2.stepAux]

private theorem step_open : TM2.step (mvM p₁ p₂) ⟨some .loop, none, st4 (.L :: A) B₁ B₂ C⟩ =
    some ⟨some .loop, none, st4 A (putIf p₁ [.R] B₁) (putIf p₂ [.R] B₂) (.R :: C)⟩ := by
  cases p₁ <;> cases p₂ <;> simp [TM2.step, mvM, pushIf, putIf, TM2.stepAux]

private theorem step_bit_in (b : Bool) : TM2.step (mvM p₁ p₂) ⟨some .loop, none, st4 (.bit b :: A) B₁ B₂ (.R :: C)⟩ =
    some ⟨some .loop, none, st4 A (putIf p₁ [.bit b] B₁) (putIf p₂ [.bit b] B₂) (.R :: C)⟩ := by
  cases p₁ <;> cases p₂ <;> simp [TM2.step, mvM, mvChk, pushIf, putIf, TM2.stepAux]

private theorem step_close_in : TM2.step (mvM p₁ p₂) ⟨some .loop, none, st4 (.R :: A) B₁ B₂ (.R :: .R :: C)⟩ =
    some ⟨some .loop, none, st4 A (putIf p₁ [.L] B₁) (putIf p₂ [.L] B₂) (.R :: C)⟩ := by
  cases p₁ <;> cases p₂ <;> simp [TM2.step, mvM, mvChk, pushIf, putIf, TM2.stepAux]

private theorem step_bit_out (b : Bool) : TM2.step (mvM p₁ p₂) ⟨some .loop, none, st4 (.bit b :: A) B₁ B₂ (.L :: C)⟩ =
    some ⟨none, none, st4 A (putIf p₁ [.bit b] B₁) (putIf p₂ [.bit b] B₂) C⟩ := by
  cases p₁ <;> cases p₂ <;> simp [TM2.step, mvM, mvChk, pushIf, putIf, TM2.stepAux]

private theorem step_close_out : TM2.step (mvM p₁ p₂) ⟨some .loop, none, st4 (.R :: A) B₁ B₂ (.R :: .L :: C)⟩ =
    some ⟨none, none, st4 A (putIf p₁ [.L] B₁) (putIf p₂ [.L] B₂) C⟩ := by
  cases p₁ <;> cases p₂ <;> simp [TM2.step, mvM, mvChk, pushIf, putIf, TM2.stepAux]

end Groundwork.TM

namespace Groundwork.TM

open Turing

private theorem putIf_nil (p : Bool) (B : List Sym) : putIf p (mirror (code .nil)) B = putIf p [.L] (putIf p [.R] B) := by
  cases p <;> simp [putIf, code, mirror, Sym.flip]

private theorem putIf_cons (p : Bool) (x y : V) (B : List Sym) : putIf p (mirror (code (.cons x y))) B =
    putIf p [.L] (putIf p (mirror (code y)) (putIf p (mirror (code x)) (putIf p [.R] B))) := by
  cases p <;> simp [putIf, code, mirror, Sym.flip]

private theorem code_cons_append (x y : V) (A : List Sym) : code (.cons x y) ++ A = .L :: (code x ++ (code y ++ (.R :: A))) := by
  simp [code]

private theorem length_code_cons (x y : V) : (code (.cons x y)).length = 1 + (code x).length + (code y).length + 1 := by
  simp [code]; omega

/-- Inside at least one open bracket, an item is moved and the loop goes on, the count as before. -/
theorem run_inside (p₁ p₂ : Bool) : ∀ (x : V) (A B₁ B₂ C : List Sym),
    Run (TM2.step (mvM p₁ p₂)) ⟨some .loop, none, st4 (code x ++ A) B₁ B₂ (.R :: C)⟩ (code x).length
      ⟨some .loop, none, st4 A (putIf p₁ (mirror (code x)) B₁) (putIf p₂ (mirror (code x)) B₂) (.R :: C)⟩
  | .bit b, A, B₁, B₂, C => Run.one (step_bit_in p₁ p₂ A B₁ B₂ C b)
  | .nil, A, B₁, B₂, C => by
    rw [putIf_nil, putIf_nil]
    exact (Run.one (step_open p₁ p₂ (.R :: A) B₁ B₂ (.R :: C))).trans (Run.one (step_close_in p₁ p₂ A _ _ C))
  | .cons x y, A, B₁, B₂, C => by
    have h1 := Run.one (step_open p₁ p₂ (code x ++ (code y ++ (.R :: A))) B₁ B₂ (.R :: C))
    have h2 := run_inside p₁ p₂ x (code y ++ (.R :: A)) (putIf p₁ [.R] B₁) (putIf p₂ [.R] B₂) (.R :: C)
    have h3 := run_inside p₁ p₂ y (.R :: A) (putIf p₁ (mirror (code x)) (putIf p₁ [.R] B₁))
      (putIf p₂ (mirror (code x)) (putIf p₂ [.R] B₂)) (.R :: C)
    have h4 := Run.one (step_close_in p₁ p₂ A (putIf p₁ (mirror (code y)) (putIf p₁ (mirror (code x)) (putIf p₁ [.R] B₁)))
      (putIf p₂ (mirror (code y)) (putIf p₂ (mirror (code x)) (putIf p₂ [.R] B₂))) C)
    rw [code_cons_append, putIf_cons, putIf_cons, length_code_cons]
    exact ((h1.trans h2).trans h3).trans h4

/-- The loop on its four stacks: one item leaves the source and its mirror image arrives on the
chosen targets, in |code| + 1 steps; what lies beneath is not touched. -/
theorem mvB_runs (p₁ p₂ : Bool) (x : V) (A B₁ B₂ C : List Sym) :
    (mvB p₁ p₂).Runs none (st4 (code x ++ A) B₁ B₂ C) ((code x).length + 1)
      (st4 A (putIf p₁ (mirror (code x)) B₁) (putIf p₂ (mirror (code x)) B₂) C) := by
  have h0 := Run.one (step_start p₁ p₂ (code x ++ A) B₁ B₂ C)
  have key : Run (TM2.step (mvM p₁ p₂)) ⟨some .loop, none, st4 (code x ++ A) B₁ B₂ (.L :: C)⟩ (code x).length
      ⟨none, none, st4 A (putIf p₁ (mirror (code x)) B₁) (putIf p₂ (mirror (code x)) B₂) C⟩ := by
    cases x with
    | bit b => exact Run.one (step_bit_out p₁ p₂ A B₁ B₂ C b)
    | nil =>
      rw [putIf_nil, putIf_nil]
      exact (Run.one (step_open p₁ p₂ (.R :: A) B₁ B₂ (.L :: C))).trans (Run.one (step_close_out p₁ p₂ A _ _ C))
    | cons x y =>
      have h1 := Run.one (step_open p₁ p₂ (code x ++ (code y ++ (.R :: A))) B₁ B₂ (.L :: C))
      have h2 := run_inside p₁ p₂ x (code y ++ (.R :: A)) (putIf p₁ [.R] B₁) (putIf p₂ [.R] B₂) (.L :: C)
      have h3 := run_inside p₁ p₂ y (.R :: A) (putIf p₁ (mirror (code x)) (putIf p₁ [.R] B₁))
        (putIf p₂ (mirror (code x)) (putIf p₂ [.R] B₂)) (.L :: C)
      have h4 := Run.one (step_close_out p₁ p₂ A
        (putIf p₁ (mirror (code y)) (putIf p₁ (mirror (code x)) (putIf p₁ [.R] B₁)))
        (putIf p₂ (mirror (code y)) (putIf p₂ (mirror (code x)) (putIf p₂ [.R] B₂))) C)
      rw [code_cons_append, putIf_cons, putIf_cons, length_code_cons]
      exact ((h1.trans h2).trans h3).trans h4
  have h := h0.trans key
  rw [Nat.add_comm] at h
  exact h

theorem toStk_injective {i j k : Stk} (hij : i ≠ j) (hik : i ≠ k) (hjk : j ≠ k) (hi : i ≠ .cnt) (hj : j ≠ .cnt)
    (hk : k ≠ .cnt) : Function.Injective (toStk i j k) := by
  intro a b h
  cases a <;> cases b <;>
    first
    | rfl
    | (simp only [toStk] at h
       first
       | exact absurd h (by assumption)
       | exact absurd h.symm (by assumption))

/-- The loop on the work stacks: source i, targets j and k, all different, and the counter. -/
theorem mvB_ren_runs (p₁ p₂ : Bool) {i j k : Stk} (hij : i ≠ j) (hik : i ≠ k) (hjk : j ≠ k) (hi : i ≠ .cnt)
    (hj : j ≠ .cnt) (hk : k ≠ .cnt) (x : V) {S : Stk → List Sym} {W : List Sym} (h : S i = code x ++ W) :
    ((mvB p₁ p₂).ren (toStk i j k)).Runs none S ((code x).length + 1)
      (Function.update (Function.update (Function.update S i W) j (putIf p₁ (mirror (code x)) (S j))) k
        (putIf p₂ (mirror (code x)) (S k))) := by
  refine Frag.ren_runs (toStk i j k) (toStk_injective hij hik hjk hi hj hk)
    (mvB_runs p₁ p₂ x W (S j) (S k) (S .cnt)) ?_ ?_ ?_
  · intro q
    cases q <;> simp [toStk, h]
  · intro q
    cases q <;> simp [toStk, hij, hik, hjk, hi.symm, hj.symm, hk.symm]
  · intro q hq
    have h1 : q ≠ i := fun e => hq .src e.symm
    have h2 : q ≠ j := fun e => hq .t1 e.symm
    have h3 : q ≠ k := fun e => hq .t2 e.symm
    simp [h1, h2, h3]

theorem other_ne (i j : Stk) : other i j ≠ i ∧ other i j ≠ j ∧ other i j ≠ .cnt := by
  cases i <;> cases j <;> simp [other]

/-- `mv i j` takes the item x off stack i and puts its mirror image on stack j, in |code x| + 1
steps; nothing else changes. -/
theorem mv_runs {i j : Stk} (hij : i ≠ j) (hi : i ≠ .cnt) (hj : j ≠ .cnt) (x : V) {S : Stk → List Sym} {W : List Sym}
    (h : S i = code x ++ W) :
    (mv i j).Runs none S ((code x).length + 1) (Function.update (Function.update S i W) j (mirror (code x) ++ S j)) := by
  obtain ⟨h1, h2, h3⟩ := other_ne i j
  have r := mvB_ren_runs true false hij h1.symm h2.symm hi hj h3 x h
  have e : Function.update (Function.update (Function.update S i W) j (putIf true (mirror (code x)) (S j))) (other i j)
      (putIf false (mirror (code x)) (S (other i j))) =
      Function.update (Function.update S i W) j (mirror (code x) ++ S j) := by
    funext q
    by_cases hq : q = other i j
    · subst hq; simp [putIf, h1, h2]
    · simp [Function.update_apply, putIf, hq]
  rw [e] at r
  exact r

/-- The way back: a mirrored item becomes the item. -/
theorem mv_runs' {i j : Stk} (hij : i ≠ j) (hi : i ≠ .cnt) (hj : j ≠ .cnt) (x : V) {S : Stk → List Sym} {W : List Sym}
    (h : S i = mirror (code x) ++ W) :
    (mv i j).Runs none S ((code x).length + 1) (Function.update (Function.update S i W) j (code x ++ S j)) := by
  have r := mv_runs hij hi hj x.mir (S := S) (W := W) (by rw [code_mir]; exact h)
  rw [code_mir, mirror_mirror, length_mirror] at r
  exact r

/-- `mv2 i j k` takes the item x off stack i and puts its mirror image on both stacks j and k, in
|code x| + 1 steps. -/
theorem mv2_runs {i j k : Stk} (hij : i ≠ j) (hik : i ≠ k) (hjk : j ≠ k) (hi : i ≠ .cnt) (hj : j ≠ .cnt) (hk : k ≠ .cnt)
    (x : V) {S : Stk → List Sym} {W : List Sym} (h : S i = code x ++ W) :
    (mv2 i j k).Runs none S ((code x).length + 1)
      (Function.update (Function.update (Function.update S i W) j (mirror (code x) ++ S j)) k (mirror (code x) ++ S k)) :=
  mvB_ren_runs true true hij hik hjk hi hj hk x h

/-- `drp i` removes the item x from stack i in |code x| + 1 steps; nothing else changes. -/
theorem drp_runs {i : Stk} (hi : i ≠ .cnt) (x : V) {S : Stk → List Sym} {W : List Sym} (h : S i = code x ++ W) :
    (drp i).Runs none S ((code x).length + 1) (Function.update S i W) := by
  obtain ⟨h1, -, h3⟩ := other_ne i i
  obtain ⟨k1, k2, k3⟩ := other_ne i (other i i)
  have r := mvB_ren_runs false false h1.symm k1.symm k2.symm hi h3 k3 x h
  have e : Function.update (Function.update (Function.update S i W) (other i i)
      (putIf false (mirror (code x)) (S (other i i)))) (other i (other i i))
      (putIf false (mirror (code x)) (S (other i (other i i)))) = Function.update S i W := by
    funext q
    by_cases hq : q = other i (other i i)
    · subst hq; simp [putIf, k1]
    · by_cases hq' : q = other i i
      · subst hq'; simp [putIf, h1, hq]
      · simp [Function.update_apply, putIf, hq, hq']
  rw [e] at r
  exact r

end Groundwork.TM

/-! ## TM/Ops.lean (the part the host uses) -/

namespace Groundwork.TM

open Turing

/-- Push the symbols of a word on the main stack, one after the other. -/
def pushSeq : List Sym → TM2.Stmt (fun _ : Stk => Sym) Empty (Option Sym)
  | [] => .halt
  | s :: w => .push .main (fun _ => s) (pushSeq w)

/-- Push a fixed word: afterwards it lies on top of the main stack, its first symbol on top. -/
def pushW (w : List Sym) : Fr := Frag.ofStmt (pushSeq w.reverse)

/-- Drop the item on top. -/
def dropF : Fr := drp .main

/-- Duplicate the item on top. -/
def dupF : Fr := ((mv2 .main .a .b).seq (mv .a .main)).seq (mv .b .main)

end Groundwork.TM

namespace Groundwork.TM

open Turing

variable (x y : V) (M A B N : List Sym)

/-- What the pushing statement does: the word arrives reversed. -/
private theorem stepAux_pushSeq (w : List Sym) (v : Option Sym) :
    TM2.stepAux (pushSeq w) v (st M A B N) = ⟨none, v, st (w.reverse ++ M) A B N⟩ := by
  induction w generalizing M with
  | nil => rfl
  | cons s w ih => simp [pushSeq, TM2.stepAux, ih]

theorem pushW_within (w : List Sym) : (pushW w).Within (st M A B N) 1 (st (w ++ M) A B N) := by
  refine Frag.Within.of_runs (Frag.ofStmt_runs ?_)
  rw [stepAux_pushSeq, List.reverse_reverse]

theorem dropF_within : dropF.Within (st (code x ++ M) A B N) ((code x).length + 1) (st M A B N) := by
  simpa [dropF] using Frag.Within.of_runs
    (drp_runs (i := .main) (by decide) x (S := st (code x ++ M) A B N) (W := M) rfl)

/-- Fetch an item back from stack a. -/
theorem fromA_within : (mv .a .main).Within (st M (mirror (code x) ++ A) B N) ((code x).length + 1)
    (st (code x ++ M) A B N) := by
  simpa using Frag.Within.of_runs
    (mv_runs' (i := .a) (j := .main) (by decide) (by decide) (by decide) x
      (S := st M (mirror (code x) ++ A) B N) (W := A) rfl)

/-- Fetch an item back from stack b. -/
theorem fromB_within : (mv .b .main).Within (st M A (mirror (code x) ++ B) N) ((code x).length + 1)
    (st (code x ++ M) A B N) := by
  simpa using Frag.Within.of_runs
    (mv_runs' (i := .b) (j := .main) (by decide) (by decide) (by decide) x
      (S := st M A (mirror (code x) ++ B) N) (W := B) rfl)

theorem dupF_within :
    dupF.Within (st (code x ++ M) A B N) (3 * (code x).length + 3) (st (code x ++ (code x ++ M)) A B N) := by
  have h1 : (mv2 .main .a .b).Within (st (code x ++ M) A B N) ((code x).length + 1)
      (st M (mirror (code x) ++ A) (mirror (code x) ++ B) N) := by
    simpa using Frag.Within.of_runs
      (mv2_runs (i := .main) (j := .a) (k := .b) (by decide) (by decide) (by decide) (by decide) (by decide) (by decide) x
        (S := st (code x ++ M) A B N) (W := M) rfl)
  have h2 := fromA_within x M A (mirror (code x) ++ B) N
  have h3 := fromB_within x (code x ++ M) A B N
  exact ((h1.seq h2).seq h3).mono (by omega)

end Groundwork.TM

/-! ## Machine/Lift.lean -/

namespace Groundwork.TM

open Turing

/-- The alphabets of the final machine: bits on `none`, Sym on the work stacks. -/
abbrev Γio : Option Stk → Type
  | none => Bool
  | some _ => Sym

/-- A statement over the work stacks, in the final machine. -/
def liftIO {Λ σ : Type} : TM2.Stmt (fun _ : Stk => Sym) Λ σ → TM2.Stmt Γio Λ σ
  | .push k f q => .push (some k) f (liftIO q)
  | .peek k f q => .peek (some k) f (liftIO q)
  | .pop k f q => .pop (some k) f (liftIO q)
  | .load f q => .load f (liftIO q)
  | .branch p q₁ q₂ => .branch p (liftIO q₁) (liftIO q₂)
  | .goto l => .goto l
  | .halt => .halt

/-- A fragment over the work stacks, in the final machine. -/
def Frag.io (P : Fr) : Frag Γio (Option Sym) where
  Λ := P.Λ
  entry := P.entry
  m l := liftIO (P.m l)

/-- The contents of the five stacks: the bits W, and S on the work stacks. -/
def withIO (W : List Bool) (S : Stk → List Sym) : ∀ k, List (Γio k)
  | none => W
  | some k => S k

/-- Overwriting a work stack commutes with adding the stack of bits. -/
@[simp] theorem update_withIO (W : List Bool) (S : Stk → List Sym) (k : Stk) (w : List Sym) :
    Function.update (withIO W S) (some k) w = withIO W (Function.update S k w) := by
  funext k'
  rcases k' with _ | k'
  · rfl
  · by_cases h : k' = k
    · subst h; simp [withIO]
    · rw [Function.update_of_ne (by simpa using h)]; simp [withIO, Function.update_of_ne h]

/-- A configuration over the work stacks, in the final machine with the bits W. -/
def liftCfg {Λ σ : Type} (W : List Bool) (c : TM2.Cfg (fun _ : Stk => Sym) Λ σ) : TM2.Cfg Γio Λ σ := ⟨c.l, c.var, withIO W c.stk⟩

/-- A statement, lifted to the final machine, does what it does over the work stacks alone, and does
not touch the bits. -/
theorem stepAux_liftIO {Λ σ : Type} (W : List Bool) (q : TM2.Stmt (fun _ : Stk => Sym) Λ σ) (v : σ) (S : Stk → List Sym) :
    TM2.stepAux (liftIO q) v (withIO W S) = liftCfg W (TM2.stepAux q v S) := by
  induction q generalizing v S with
  | push k f q ih => simp only [liftIO, TM2.stepAux, update_withIO]; exact ih _ _
  | peek k f q ih => exact ih _ _
  | pop k f q ih => simp only [liftIO, TM2.stepAux, update_withIO]; exact ih _ _
  | load f q ih => exact ih _ _
  | branch p q₁ q₂ ih₁ ih₂ => simp only [liftIO, TM2.stepAux, ih₁, ih₂]; cases p v <;> rfl
  | goto l => rfl
  | halt => rfl

/-- Runs over the work stacks are runs of the final machine. -/
theorem run_liftIO {Λ σ : Type} (W : List Bool) {M : Λ → TM2.Stmt (fun _ : Stk => Sym) Λ σ} :
    ∀ {n : ℕ} {a b : TM2.Cfg (fun _ : Stk => Sym) Λ σ}, Run (TM2.step M) a n b →
      Run (TM2.step fun l => liftIO (M l)) (liftCfg W a) n (liftCfg W b)
  | 0, _, _, h => by cases h; exact rfl
  | n + 1, ⟨none, v, S⟩, b, ⟨c, hc, _⟩ => by simp [TM2.step] at hc
  | n + 1, ⟨some l, v, S⟩, b, ⟨c, hc, h⟩ => by
    refine ⟨liftCfg W c, ?_, run_liftIO W h⟩
    simp only [TM2.step, Option.some.injEq] at hc
    simp only [liftCfg, TM2.step, stepAux_liftIO, hc]

/-- A run of a fragment over the work stacks is a run of the same length of `P.io`, and leaves the
bits W as they were. -/
theorem Frag.io_runs {P : Fr} {v : Option Sym} {S S' : Stk → List Sym} {n : ℕ} (h : P.Runs v S n S') (W : List Bool) :
    P.io.Runs v (withIO W S) n (withIO W S') :=
  run_liftIO W h

end Groundwork.TM

/-! ## statements/StepMachineStatements.lean:29–77 — step machines -/

namespace Groundwork

/-- The size of a value: about the number of bits needed to write it down. -/
class HasSize (α : Type) where
  size : α → ℕ

export HasSize (size)

end Groundwork

namespace Groundwork

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

end Groundwork

namespace Groundwork

/-- A computation cut into steps: a type `σ` of states with a measure of size (a part of the
machine), the state `init a` in which the input `a` is handed over, the function `step` from a state
to the next, and `out`, where `out s = some b` means: halted with result `b`. -/
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

end Groundwork

/-! ## Enc.lean and the part of EncLemmas.lean the host uses -/

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

/-- The word of a value is at most linear in its size: len x + 2 ≤ 7·size x. -/
class Carried (α : Type) [Enc α] [HasSize α] : Prop where
  le : ∀ x : α, len x + 2 ≤ 7 * size x

end Groundwork

namespace Groundwork

open TM Enc

variable {α β : Type} [Enc α] [Enc β]

theorem wd_pair (a : α) (b : β) : wd (a, b) = .L :: (wd a ++ wd b ++ [.R]) := rfl
theorem wd_nil : wd ([] : List α) = [.L, .R] := rfl
theorem wd_cons (a : α) (l : List α) : wd (a :: l) = .L :: (wd a ++ wd l ++ [.R]) := rfl
theorem wd_none : wd (none : Option α) = [.L, .R] := rfl
theorem wd_some (a : α) : wd (some a) = .L :: (wd a ++ [.L, .R] ++ [.R]) := rfl
theorem wd_bool (b : Bool) : wd b = [.bit b] := rfl

theorem len_cons (a : α) (l : List α) : len (a :: l) = len a + len l + 2 := by
  simp only [len, wd_cons, List.length_cons, List.length_append, List.length_nil]
/-- A truth value is one symbol. -/
theorem len_bool (b : Bool) : len b = 1 := rfl
/-- A list of truth values takes three symbols for each entry and two more at the end. -/
theorem len_bools (w : List Bool) : len w = 3 * w.length + 2 := by
  induction w with
  | nil => rfl
  | cons b w ih => rw [len_cons, ih, List.length_cons, len_bool]; omega

end Groundwork

/-! ## Bound.lean -/

namespace Groundwork

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

end Groundwork

/-! ## PolyT.lean:54–58, 73–77, 104–112 -/

namespace Groundwork

open TM

/-- f is computed in polynomial time on top of the main stack: for some constant c, one fragment
turns the word of x, with any M beneath it on the main stack and any contents A, B, N of the other
three stacks, into the word of f x with the same M, A, B, N, in at most c·(len x + 1)^c steps; and
the word of f x has at most c·(len x + 1)^c symbols. -/
def PolyT {α β : Type} [Enc α] [Enc β] (f : α → β) : Prop :=
  ∃ (P : Fr) (c : ℕ),
    (∀ (x : α) (M A B N : List Sym), ∃ n ≤ c * (len x + 1) ^ c,
      P.Runs none (st (wd x ++ M) A B N) n (st (wd (f x) ++ M) A B N)) ∧
    ∀ x, len (f x) ≤ c * (len x + 1) ^ c

/-- How to use PolyT: one monotone polynomial bound for the steps and for the length of the result. -/
theorem PolyT.elim {α β : Type} [Enc α] [Enc β] {f : α → β} (h : PolyT f) : ∃ (P : Fr) (t : ℕ → ℕ), PB t ∧ Monotone t ∧
    (∀ (x : α) (M A B N : List Sym), P.Within (st (wd x ++ M) A B N) (t (len x)) (st (wd (f x) ++ M) A B N)) ∧
    ∀ x, len (f x) ≤ t (len x) := by
  obtain ⟨P, c, h1, h2⟩ := h
  exact ⟨P, fun n => c * (n + 1) ^ c, (PB.mono_bound c).1, (PB.mono_bound c).2, h1, h2⟩

/-- Every part of the stepped computation M is polynomial-time, and the words of its states are at
most linear in their size. -/
class IsPolyT {α β : Type} [Enc α] [Enc β] (M : Stepped α β) where
  [enc : Enc M.σ]
  [carried : Carried M.σ]
  init : PolyT M.init
  step : PolyT M.step
  out : PolyT M.out

instance {α β : Type} [Enc α] [Enc β] (M : Stepped α β) [h : IsPolyT M] : Enc M.σ := h.enc
instance {α β : Type} [Enc α] [Enc β] (M : Stepped α β) [h : IsPolyT M] : Carried M.σ := h.carried

end Groundwork

/-! # Part B — the space layer (new) -/

namespace Groundwork.TM

open Turing

/-- The number of symbols on all stacks together. -/
def stkLen {K : Type} [Fintype K] {Γ : K → Type} (S : ∀ k, List (Γ k)) : ℕ := ∑ k, (S k).length

/-- One stack is no longer than all of them. -/
theorem length_le_stkLen {K : Type} [Fintype K] {Γ : K → Type} (S : ∀ k, List (Γ k)) (k : K) :
    (S k).length ≤ stkLen S :=
  Finset.single_le_sum (f := fun k => (S k).length) (fun _ _ => Nat.zero_le _) (Finset.mem_univ k)

/-- Overwriting one stack changes the total by the difference of the lengths. -/
theorem stkLen_update {K : Type} [Fintype K] [DecidableEq K] {Γ : K → Type} (S : ∀ k, List (Γ k)) (k : K)
    (w : List (Γ k)) : stkLen (Function.update S k w) + (S k).length = stkLen S + w.length := by
  have h1 : (Function.update S k w k).length + ∑ j ∈ Finset.univ.erase k, (Function.update S k w j).length =
      ∑ j, (Function.update S k w j).length :=
    Finset.add_sum_erase Finset.univ (fun j => (Function.update S k w j).length) (Finset.mem_univ k)
  have h2 : (S k).length + ∑ j ∈ Finset.univ.erase k, (S j).length = ∑ j, (S j).length :=
    Finset.add_sum_erase Finset.univ (fun j => (S j).length) (Finset.mem_univ k)
  have h3 : ∑ j ∈ Finset.univ.erase k, (Function.update S k w j).length = ∑ j ∈ Finset.univ.erase k, (S j).length :=
    Finset.sum_congr rfl fun j hj => by rw [Function.update_of_ne (Finset.ne_of_mem_erase hj)]
  rw [Function.update_self] at h1
  unfold stkLen
  omega

/-- The total of the four work stacks. -/
theorem sum_stk (f : Stk → ℕ) : ∑ k, f k = f .main + f .a + f .b + f .cnt := by
  rw [show (Finset.univ : Finset Stk) = {.main, .a, .b, .cnt} from rfl]
  rw [Finset.sum_insert, Finset.sum_insert, Finset.sum_insert, Finset.sum_singleton]
  · ring
  all_goals simp

/-- The number of pushes on the longest path through a statement. -/
def pushes {K : Type} {Γ : K → Type} {Λ σ : Type} : TM2.Stmt Γ Λ σ → ℕ
  | .push _ _ q => pushes q + 1
  | .peek _ _ q => pushes q
  | .pop _ _ q => pushes q
  | .load _ q => pushes q
  | .branch _ q₁ q₂ => max (pushes q₁) (pushes q₂)
  | .goto _ => 0
  | .halt => 0

/-- **One TM2 step grows the stacks by at most the number of pushes of the statement.** -/
theorem stkLen_stepAux {K : Type} [Fintype K] [DecidableEq K] {Γ : K → Type} {Λ σ : Type} (q : TM2.Stmt Γ Λ σ) :
    ∀ (v : σ) (S : ∀ k, List (Γ k)), stkLen (TM2.stepAux q v S).stk ≤ stkLen S + pushes q := by
  induction q with
  | push k f q ih =>
    intro v S
    have h1 := ih v (Function.update S k (f v :: S k))
    have h2 := stkLen_update S k (f v :: S k)
    simp only [List.length_cons] at h2
    simp only [TM2.stepAux, pushes]
    omega
  | peek k f q ih =>
    intro v S
    simpa only [TM2.stepAux, pushes] using ih (f v (S k).head?) S
  | pop k f q ih =>
    intro v S
    have h1 := ih (f v (S k).head?) (Function.update S k (S k).tail)
    have h2 := stkLen_update S k (S k).tail
    have h3 : (S k).tail.length ≤ (S k).length := by simp
    simp only [TM2.stepAux, pushes]
    omega
  | load f q ih =>
    intro v S
    simpa only [TM2.stepAux, pushes] using ih (f v) S
  | branch p q₁ q₂ ih₁ ih₂ =>
    intro v S
    have h₁ := ih₁ v S
    have h₂ := ih₂ v S
    simp only [TM2.stepAux, pushes]
    cases p v
    · exact h₂.trans (Nat.add_le_add_left (le_max_right _ _) _)
    · exact h₁.trans (Nat.add_le_add_left (le_max_left _ _) _)
  | goto l => intro v S; simp [TM2.stepAux]
  | halt => intro v S; simp [TM2.stepAux]

end Groundwork.TM

namespace Groundwork.TM

open Turing

variable {K : Type} [DecidableEq K] {Γ : K → Type} {σ : Type}

/-- The largest number of pushes of a statement of the fragment. -/
def Frag.growth (P : Frag Γ σ) : ℕ := Finset.univ.sup fun l => pushes (P.m l)

/-- A step of a fragment grows the stacks by at most its growth. -/
theorem Frag.step_growth [Fintype K] (P : Frag Γ σ) {a b : TM2.Cfg Γ P.Λ σ} (h : TM2.step P.m a = some b) :
    stkLen b.stk ≤ stkLen a.stk + P.growth := by
  obtain ⟨_ | l, v, S⟩ := a
  · simp [TM2.step] at h
  · simp only [TM2.step, Option.some.injEq] at h
    subst h
    exact (stkLen_stepAux (P.m l) v S).trans
      (Nat.add_le_add_left (Finset.le_sup (f := fun l => pushes (P.m l)) (Finset.mem_univ l)) _)

end Groundwork.TM

namespace Groundwork.TM

/-- n steps of f lead from a to b, and every configuration on the way (both ends included)
satisfies p. -/
def RunIn {C : Type} (f : C → Option C) (p : C → Prop) : C → ℕ → C → Prop
  | a, 0, b => a = b ∧ p a
  | a, n + 1, b => p a ∧ ∃ c, f a = some c ∧ RunIn f p c n b

theorem RunIn.run {C : Type} {f : C → Option C} {p : C → Prop} : ∀ {n : ℕ} {a b : C}, RunIn f p a n b → Run f a n b
  | 0, _, _, h => h.1
  | _ + 1, _, _, ⟨_, c, hc, h⟩ => ⟨c, hc, RunIn.run h⟩

theorem RunIn.start {C : Type} {f : C → Option C} {p : C → Prop} : ∀ {n : ℕ} {a b : C}, RunIn f p a n b → p a
  | 0, _, _, h => h.2
  | _ + 1, _, _, h => h.1

theorem RunIn.mono {C : Type} {f : C → Option C} {p q : C → Prop} (hpq : ∀ c, p c → q c) :
    ∀ {n : ℕ} {a b : C}, RunIn f p a n b → RunIn f q a n b
  | 0, _, _, h => ⟨h.1, hpq _ h.2⟩
  | _ + 1, _, _, ⟨ha, c, hc, h⟩ => ⟨hpq _ ha, c, hc, RunIn.mono hpq h⟩

theorem RunIn.trans {C : Type} {f : C → Option C} {p : C → Prop} :
    ∀ {m : ℕ} {a b c : C} {n : ℕ}, RunIn f p a m b → RunIn f p b n c → RunIn f p a (m + n) c
  | 0, _, _, _, n, h, h' => by
    obtain ⟨rfl, -⟩ := h
    simpa using h'
  | m + 1, _, _, _, n, ⟨ha, d, hd, h⟩, h' => by
    rw [Nat.add_right_comm]
    exact ⟨ha, d, hd, RunIn.trans h h'⟩

/-- If each step grows the measure by at most g, a run of n steps stays below its start plus g·n. -/
theorem RunIn.of_run {C : Type} {f : C → Option C} (sz : C → ℕ) {g : ℕ} (hg : ∀ a b, f a = some b → sz b ≤ sz a + g) :
    ∀ {n : ℕ} {a b : C}, Run f a n b → RunIn f (fun c => sz c ≤ sz a + g * n) a n b
  | 0, _, _, h => ⟨h, by simp⟩
  | n + 1, a, b, ⟨c, hc, h⟩ => by
    have hca := hg a c hc
    refine ⟨by simp, c, hc, RunIn.mono (fun d hd => ?_) (RunIn.of_run sz hg h)⟩
    have hd' : sz d ≤ sz c + g * n := hd
    show sz d ≤ sz a + g * (n + 1)
    rw [Nat.mul_succ]
    omega

theorem iterate_none {C : Type} (f : C → Option C) : ∀ s : ℕ, (flip bind f)^[s] (none : Option C) = none
  | 0 => rfl
  | s + 1 => by rw [Function.iterate_succ_apply]; exact iterate_none f s

/-- If the run ends where f stops, every configuration that the iteration ever reaches is one of the
run, and so satisfies p. -/
theorem RunIn.iterate {C : Type} {f : C → Option C} {p : C → Prop} :
    ∀ {n : ℕ} {a b : C}, RunIn f p a n b → f b = none → ∀ (s : ℕ) (c : C), (flip bind f)^[s] (some a) = some c → p c
  | 0, a, b, ⟨hab, ha⟩, hb, s, c, hs => by
    subst hab
    cases s with
    | zero =>
      have e : some a = some c := hs
      cases e
      exact ha
    | succ s =>
      rw [Function.iterate_succ_apply] at hs
      have e : flip bind f (some a) = none := hb
      rw [e, iterate_none] at hs
      cases hs
  | n + 1, a, b, ⟨ha, d, hd, h⟩, hb, s, c, hs => by
    cases s with
    | zero =>
      have e : some a = some c := hs
      cases e
      exact ha
    | succ s =>
      rw [Function.iterate_succ_apply] at hs
      have e : flip bind f (some a) = some d := hd
      rw [e] at hs
      exact RunIn.iterate h hb s c hs

end Groundwork.TM

namespace Groundwork.TM

open Turing

variable {K : Type} [DecidableEq K] [Fintype K] {Γ : K → Type} {σ : Type}

/-- A run of the fragment in which the stacks never hold more than B symbols together. -/
def Frag.RunsB (P : Frag Γ σ) (v : σ) (S : ∀ k, List (Γ k)) (n : ℕ) (S' : ∀ k, List (Γ k)) (B : ℕ) : Prop :=
  RunIn (TM2.step P.m) (fun c => stkLen c.stk ≤ B) ⟨some P.entry, v, S⟩ n ⟨none, v, S'⟩

theorem Frag.RunsB.runs {P : Frag Γ σ} {v : σ} {S S' : ∀ k, List (Γ k)} {n B : ℕ} (h : P.RunsB v S n S' B) :
    P.Runs v S n S' := RunIn.run h

theorem Frag.RunsB.mono {P : Frag Γ σ} {v : σ} {S S' : ∀ k, List (Γ k)} {n B B' : ℕ} (h : P.RunsB v S n S' B)
    (hB : B ≤ B') : P.RunsB v S n S' B' := RunIn.mono (fun _ hc => hc.trans hB) h

/-- **Every run of a fragment is a run with a ceiling**: the stacks at the start plus growth · steps. -/
theorem Frag.Runs.toB {P : Frag Γ σ} {v : σ} {S S' : ∀ k, List (Γ k)} {n : ℕ} (h : P.Runs v S n S') :
    P.RunsB v S n S' (stkLen S + P.growth * n) := by
  have h' : Run (TM2.step P.m) ⟨some P.entry, v, S⟩ n ⟨none, v, S'⟩ := h
  exact RunIn.of_run (f := TM2.step P.m) (fun c : TM2.Cfg Γ P.Λ σ => stkLen c.stk) (g := P.growth)
    (fun _ _ hab => P.step_growth hab) h'

/-- Placing a machine in a larger one does not touch the stacks, so it keeps the ceiling. -/
theorem runIn_place {Λ Λ' : Type} (ι : Λ → Λ') (e : Option Λ') {M : Λ → TM2.Stmt Γ Λ σ} {M' : Λ' → TM2.Stmt Γ Λ' σ}
    (hM : ∀ l, M' (ι l) = place ι e (M l)) {B : ℕ} :
    ∀ {n : ℕ} {a b : TM2.Cfg Γ Λ σ}, RunIn (TM2.step M) (fun c => stkLen c.stk ≤ B) a n b →
      RunIn (TM2.step M') (fun c => stkLen c.stk ≤ B) (placeCfg ι e a) n (placeCfg ι e b)
  | 0, _, _, ⟨h, hB⟩ => by subst h; exact ⟨rfl, hB⟩
  | n + 1, ⟨none, v, S⟩, b, ⟨_, c, hc, _⟩ => by simp [TM2.step] at hc
  | n + 1, ⟨some l, v, S⟩, b, ⟨hB, c, hc, h⟩ => by
    refine ⟨hB, placeCfg ι e c, ?_, runIn_place ι e hM h⟩
    simp only [TM2.step, Option.some.injEq] at hc
    simp only [placeCfg, Option.elim, Function.comp, TM2.step, hM, stepAux_place, hc]

/-- One step at a placed statement, both ends below the ceiling. -/
theorem run_headB {Λ Λ' : Type} {M' : Λ' → TM2.Stmt Γ Λ' σ} (ι : Λ → Λ') (e : Option Λ') {l' : Λ'} {q : TM2.Stmt Γ Λ σ}
    (hM : M' l' = place ι e q) {v : σ} {S : ∀ k, List (Γ k)} {c : TM2.Cfg Γ Λ σ} (h : TM2.stepAux q v S = c) {B : ℕ}
    (hS : stkLen S ≤ B) (hc : stkLen c.stk ≤ B) :
    RunIn (TM2.step M') (fun c => stkLen c.stk ≤ B) ⟨some l', v, S⟩ 1 (placeCfg ι e c) :=
  ⟨hS, placeCfg ι e c, by simp only [TM2.step, hM, stepAux_place, h], rfl, hc⟩

theorem Frag.seq_runsB {P Q : Frag Γ σ} {v : σ} {S S' S'' : ∀ k, List (Γ k)} {n n' B : ℕ} (hP : P.RunsB v S n S' B)
    (hQ : Q.RunsB v S' n' S'' B) : (P.seq Q).RunsB v S (n + n') S'' B :=
  (runIn_place (M' := (P.seq Q).m) Sum.inl (some (.inr Q.entry)) (fun _ => rfl) hP).trans
    (runIn_place (M' := (P.seq Q).m) Sum.inr none (fun _ => rfl) hQ)

theorem Frag.loop_runs_exitB {q : TM2.Stmt Γ Unit σ} {Bd : Frag Γ σ} {v : σ} {S S' : ∀ k, List (Γ k)} {B : ℕ}
    (h : TM2.stepAux q v S = ⟨none, v, S'⟩) (hS : stkLen S ≤ B) (hS' : stkLen S' ≤ B) :
    (Frag.loop q Bd).RunsB v S 1 S' B :=
  run_headB (M' := (Frag.loop q Bd).m) (l' := Sum.inl ()) _ none rfl h hS hS'

theorem Frag.loop_runs_iterB {q : TM2.Stmt Γ Unit σ} {Bd : Frag Γ σ} {v : σ} {S S₁ S₂ S' : ∀ k, List (Γ k)}
    {n m B : ℕ} (h : TM2.stepAux q v S = ⟨some (), v, S₁⟩) (hS : stkLen S ≤ B) (hB : Bd.RunsB v S₁ n S₂ B)
    (hL : (Frag.loop q Bd).RunsB v S₂ m S' B) : (Frag.loop q Bd).RunsB v S (1 + n + m) S' B := by
  have hB' : RunIn (TM2.step Bd.m) (fun c => stkLen c.stk ≤ B) ⟨some Bd.entry, v, S₁⟩ n ⟨none, v, S₂⟩ := hB
  exact ((run_headB (M' := (Frag.loop q Bd).m) (l' := Sum.inl ()) _ none rfl h hS hB'.start).trans
    (runIn_place (M' := (Frag.loop q Bd).m) Sum.inr (some (Sum.inl ())) (fun _ => rfl) hB')).trans hL

end Groundwork.TM

namespace Groundwork.TM

open Turing

variable {K : Type} [DecidableEq K] [Fintype K] {Γ : K → Type} {τ : Type}

/-- P leads from S to S' within t steps, the stacks never holding more than B symbols. -/
def Frag.WithinB (P : Frag Γ (Option τ)) (S : ∀ k, List (Γ k)) (t : ℕ) (S' : ∀ k, List (Γ k)) (B : ℕ) : Prop :=
  ∃ n ≤ t, P.RunsB none S n S' B

theorem Frag.WithinB.within {P : Frag Γ (Option τ)} {S S' : ∀ k, List (Γ k)} {t B : ℕ} (h : P.WithinB S t S' B) :
    P.Within S t S' := by
  obtain ⟨n, hn, hr⟩ := h
  exact ⟨n, hn, hr.runs⟩

theorem Frag.WithinB.mono {P : Frag Γ (Option τ)} {S S' : ∀ k, List (Γ k)} {t t' B B' : ℕ} (h : P.WithinB S t S' B)
    (ht : t ≤ t') (hB : B ≤ B') : P.WithinB S t' S' B' := by
  obtain ⟨n, hn, hr⟩ := h
  exact ⟨n, hn.trans ht, hr.mono hB⟩

theorem Frag.WithinB.seq {P Q : Frag Γ (Option τ)} {S S' S'' : ∀ k, List (Γ k)} {t t' B : ℕ} (h : P.WithinB S t S' B)
    (h' : Q.WithinB S' t' S'' B) : (P.seq Q).WithinB S (t + t') S'' B := by
  obtain ⟨n, hn, hr⟩ := h
  obtain ⟨n', hn', hr'⟩ := h'
  exact ⟨n + n', Nat.add_le_add hn hn', Frag.seq_runsB hr hr'⟩

/-- A run within t steps never holds more than the start plus growth · t symbols. -/
theorem Frag.Within.toB {P : Frag Γ (Option τ)} {S S' : ∀ k, List (Γ k)} {t : ℕ} (h : P.Within S t S') :
    P.WithinB S t S' (stkLen S + P.growth * t) := by
  obtain ⟨n, hn, hr⟩ := h
  exact ⟨n, hn, hr.toB.mono (Nat.add_le_add_left (Nat.mul_le_mul_left _ hn) _)⟩

end Groundwork.TM

/-! ## The space predicate (dossier 10, "Space (new, bridged definition)") -/

namespace Groundwork

open Turing

/-- `tm`, started on `l`, never holds more than `S` symbols on its stacks together at any of its
first `t` steps: every configuration reached in `s ≤ t` steps has total stack content ≤ S. -/
def SpaceWithinTM (tm : FinTM2) (l : List (tm.Γ tm.k₀)) (t S : ℕ) : Prop :=
  ∀ s ≤ t, ∀ c : TM2.Cfg tm.Γ tm.Λ tm.σ, (flip bind tm.step)^[s] (some (initList tm l)) = some c →
    @TM.stkLen tm.K tm.kFin tm.Γ c.stk ≤ S

/-- Dossier 10's `SpaceWithin M x t S`, for a machine on an input word x over its input alphabet:
the per-prefix stack analogue of openai-math's `visitedSpace` bound. -/
def SpaceWithin {α β : Type} (M : TM2ComputableAux α β) (x : List α) (t S : ℕ) : Prop :=
  SpaceWithinTM M.tm (x.map M.inputAlphabet.invFun) t S

end Groundwork

/-! ## Machine/Host.lean:47–297 (transcribed) -/

namespace Groundwork.Host

open TM Turing

/-- Fragments of the final machine, over the four work stacks and the stack of bits. -/
abbrev FrIO := Frag Γio (Option Sym)

/-- A fragment over the work stacks keeps its bound in the final machine. -/
theorem within_io {P : Fr} {S S' : Stk → List Sym} {t : ℕ} (h : P.Within S t S') (W : List Bool) :
    P.io.Within (withIO W S) t (withIO W S') := by
  obtain ⟨n, hn, hr⟩ := h
  exact ⟨n, hn, Frag.io_runs hr W⟩

@[simp] theorem withIO_none (W : List Bool) (S : Stk → List Sym) : withIO W S none = W := rfl
@[simp] theorem withIO_some (W : List Bool) (S : Stk → List Sym) (k : Stk) : withIO W S (some k) = S k := rfl

@[simp] theorem upd_none (W W' : List Bool) (S : Stk → List Sym) : Function.update (withIO W S) none W' = withIO W' S := by
  funext k; cases k <;> simp [Function.update, withIO]

/-- The fragment that does nothing, in one step. -/
def skip : FrIO := Frag.ofStmt .halt

theorem skip_runs (S : ∀ k, List (Γio k)) : skip.Runs none S 1 S := Frag.ofStmt_runs rfl

/-- Pop a bit off the stack of bits; push it on stack a, and a closing bracket on the main stack. -/
def pourQ : TM2.Stmt Γio Unit (Option Sym) :=
  .pop none (fun _ o => o.map Sym.bit) <|
    .branch (fun s => s.isSome)
      (.push (some .a) (fun s => s.getD .L) <| .push (some .main) (fun _ => .R) <| .load (fun _ => none) <|
        .goto fun _ => ())
      .halt

/-- The first loop of the prologue. -/
def pour : FrIO := Frag.loop pourQ skip

/-- Pop a symbol off stack a; push it, and then an opening bracket, on the main stack. -/
def buildQ : TM2.Stmt Γio Unit (Option Sym) :=
  .pop (some .a) (fun _ o => o) <|
    .branch (fun s => s.isSome)
      (.push (some .main) (fun s => s.getD .L) <| .push (some .main) (fun _ => .L) <| .load (fun _ => none) <|
        .goto fun _ => ())
      .halt

/-- The second loop of the prologue. -/
def build : FrIO := Frag.loop buildQ skip

end Groundwork.Host

namespace Groundwork.Host

open TM Turing

variable (W : List Bool) (M A B N : List Sym)

theorem pourQ_nil : TM2.stepAux pourQ none (withIO [] (st M A B N)) = ⟨none, none, withIO [] (st M A B N)⟩ := by
  simp [pourQ, TM2.stepAux]

theorem pourQ_cons (b : Bool) : TM2.stepAux pourQ none (withIO (b :: W) (st M A B N)) =
    ⟨some (), none, withIO W (st (.R :: M) (.bit b :: A) B N)⟩ := by
  simp [pourQ, TM2.stepAux]

theorem buildQ_nil : TM2.stepAux buildQ none (withIO W (st M [] B N)) = ⟨none, none, withIO W (st M [] B N)⟩ := by
  simp [buildQ, TM2.stepAux]

theorem buildQ_cons (s : Sym) : TM2.stepAux buildQ none (withIO W (st M (s :: A) B N)) =
    ⟨some (), none, withIO W (st (.L :: s :: M) A B N)⟩ := by
  simp [buildQ, TM2.stepAux]

end Groundwork.Host

namespace Groundwork.Host

open TM Turing

theorem pour_runs (B N : List Sym) : ∀ (x : List Bool) (M A : List Sym),
    pour.Runs none (withIO x (st M A B N)) (2 * x.length + 1)
      (withIO [] (st (List.replicate x.length .R ++ M) ((x.map Sym.bit).reverse ++ A) B N))
  | [], M, A => Frag.loop_runs_exit (pourQ_nil M A B N)
  | b :: x, M, A => by
    have h := Frag.loop_runs_iter (pourQ_cons x M A B N b) (skip_runs _) (pour_runs B N x (.R :: M) (.bit b :: A))
    have e1 : List.replicate x.length Sym.R ++ Sym.R :: M = List.replicate (b :: x).length Sym.R ++ M := by
      simp [List.replicate_succ']
    have e2 : (x.map Sym.bit).reverse ++ Sym.bit b :: A = ((b :: x).map Sym.bit).reverse ++ A := by simp
    have e3 : 1 + 1 + (2 * x.length + 1) = 2 * (b :: x).length + 1 := by simp only [List.length_cons]; omega
    rw [e1, e2, e3] at h
    exact h

theorem build_runs (W : List Bool) (B N : List Sym) : ∀ (l suf : List Bool),
    build.Runs none (withIO W (st (wd suf ++ List.replicate l.length .R) (l.map Sym.bit) B N)) (2 * l.length + 1)
      (withIO W (st (wd (l.reverse ++ suf)) [] B N))
  | [], suf => by
    have h : build.Runs none _ 1 _ := Frag.loop_runs_exit (buildQ_nil W (wd suf) B N)
    simpa using h
  | b :: l, suf => by
    have h := Frag.loop_runs_iter (buildQ_cons W (wd suf ++ List.replicate (b :: l).length .R) (l.map Sym.bit) B N (.bit b))
      (skip_runs _)
      (by
        have := build_runs W B N l (b :: suf)
        have e : wd (b :: suf) ++ List.replicate l.length Sym.R =
            Sym.L :: Sym.bit b :: (wd suf ++ List.replicate (b :: l).length Sym.R) := by
          simp [wd_cons, wd_bool, List.replicate_succ]
        rw [e] at this
        exact this)
    have e2 : l.reverse ++ b :: suf = (b :: l).reverse ++ suf := by simp
    have e3 : 1 + 1 + (2 * l.length + 1) = 2 * (b :: l).length + 1 := by simp only [List.length_cons]; omega
    rw [e2, e3] at h
    exact h

/-- The prologue: from the bits of the input to the word of the list of these bits. -/
def prologue : FrIO := (pour.seq (pushW [.L, .R]).io).seq build

theorem prologue_within (x : List Bool) :
    Frag.Within prologue (withIO x (st [] [] [] [])) (4 * x.length + 3) (withIO [] (st (wd x) [] [] [])) := by
  have h1 : Frag.Within pour _ _ _ := ⟨_, le_rfl, pour_runs [] [] x [] []⟩
  have h2 := within_io (pushW_within (List.replicate x.length .R ++ []) ((x.map Sym.bit).reverse ++ []) [] [] [.L, .R]) []
  have h3 : Frag.Within build _ _ _ := ⟨_, le_rfl, build_runs [] [] [] x.reverse []⟩
  have e : st ([Sym.L, Sym.R] ++ (List.replicate x.length Sym.R ++ [])) ((x.map Sym.bit).reverse ++ []) [] [] =
      st (wd ([] : List Bool) ++ List.replicate x.reverse.length Sym.R) (x.reverse.map Sym.bit) [] [] := by
    simp [wd_nil]
  rw [e] at h2
  have h := (h1.seq h2).seq h3
  simp only [List.reverse_reverse, List.append_nil, List.length_reverse] at h
  exact h.mono (by omega)

/-- The bit held in the local state, false if it holds none. -/
def bitOf : Option Sym → Bool
  | some (.bit b) => b
  | _ => false

/-- The head of the loop looks at the word of an optional bit on top of the main stack and removes
it. At `none` it goes on with the body; at `some b` it pushes b on the stack of bits and leaves the
loop. -/
def chkQ : TM2.Stmt Γio Unit (Option Sym) :=
  .pop (some .main) (fun _ _ => none) <| .pop (some .main) (fun _ o => o) <|
    .branch (fun s => s == some .R)
      (.load (fun _ => none) <| .goto fun _ => ())
      (.push none bitOf <| .pop (some .main) (fun _ _ => none) <| .pop (some .main) (fun _ _ => none) <|
        .pop (some .main) (fun _ _ => none) .halt)

end Groundwork.Host

namespace Groundwork.Host

open TM Turing

variable (W : List Bool) (M A B N : List Sym)

theorem chkQ_none : TM2.stepAux chkQ none (withIO W (st (wd (none : Option Bool) ++ M) A B N)) =
    ⟨some (), none, withIO W (st M A B N)⟩ := by
  simp [chkQ, TM2.stepAux, wd_none]

theorem chkQ_some (b : Bool) : TM2.stepAux chkQ none (withIO W (st (wd (some b) ++ M) A B N)) =
    ⟨none, none, withIO (b :: W) (st M A B N)⟩ := by
  simp [chkQ, TM2.stepAux, wd_some, wd_bool, bitOf]

end Groundwork.Host

namespace Groundwork.Host

open TM Turing

variable {M : Stepped (List Bool) Bool}

theorem size_le_of_reaches {S t : ℕ} {b : Bool} {s : M.σ} (h : M.Reaches S b s t) : size s ≤ S := by
  cases h with
  | halt _ hs => exact hs
  | step _ hs _ => exact hs

end Groundwork.Host

namespace Groundwork.Host

open TM Turing

/-- Duplicate the word of the state and turn the copy on top into the word of its output. -/
def look (Po : Fr) : Fr := dupF.seq Po

/-- The body of the loop: one step of the computation, then the output of the new state. -/
def body (Ps Po : Fr) : FrIO := (Ps.seq (look Po)).io

/-- The loop. At its head the word of the output of the state lies on the word of the state. -/
def mainLoop (Ps Po : Fr) : FrIO := Frag.loop chkQ (body Ps Po)

end Groundwork.Host

namespace Groundwork.Host

open TM Turing

variable {M : Stepped (List Bool) Bool} [Enc M.σ]

variable {Ps Po : Fr} {tS tO : ℕ → ℕ}
  (hS : ∀ (s : M.σ) (M' A B N : List Sym),
    Ps.Within (st (wd s ++ M') A B N) (tS (len s)) (st (wd (M.step s) ++ M') A B N))
  (hO : ∀ (s : M.σ) (M' A B N : List Sym),
    Po.Within (st (wd s ++ M') A B N) (tO (len s)) (st (wd (M.out s) ++ M') A B N))

include hO in
theorem look_within (s : M.σ) (M' A B N : List Sym) : (look Po).Within (st (wd s ++ M') A B N)
    (3 * len s + 3 + tO (len s)) (st (wd (M.out s) ++ (wd s ++ M')) A B N) :=
  (dupF_within (Enc.toV s) M' A B N).seq (hO s _ A B N)

include hS hO in
/-- The loop, from a state that reaches the result b within t steps: at most t rounds, and the last
state is left on the main stack. (eth, Host.lean:225; kept verbatim for reference.) -/
theorem mainLoop_within (mS : Monotone tS) (mO : Monotone tO) {S L : ℕ} (hL : ∀ s : M.σ, size s ≤ S → len s ≤ L) {b : Bool}
    {s : M.σ} {t : ℕ} (h : M.Reaches S b s t) :
    ∃ s' : M.σ, size s' ≤ S ∧ Frag.Within (mainLoop Ps Po) (withIO [] (st (wd (M.out s) ++ (wd s ++ [])) [] [] []))
      (t * (1 + (tS L + (3 * L + 3 + tO L))) + 1) (withIO [b] (st (wd s' ++ []) [] [] [])) := by
  induction h with
  | @halt s t ho hs =>
    refine ⟨s, hs, 1, by omega, ?_⟩
    rw [ho]
    exact Frag.loop_runs_exit (chkQ_some _ _ _ _ _ b)
  | @step s t ho hs hr ih =>
    obtain ⟨s', hs', n, hn, hrun⟩ := ih
    obtain ⟨m, hm, hb⟩ := within_io ((hS s [] [] [] []).seq (look_within hO (M.step s) [] [] [] [])) []
    refine ⟨s', hs', 1 + m + n, ?_, ?_⟩
    · have h1 := mS (hL s hs)
      have h2 := hL _ (size_le_of_reaches hr)
      have h3 := mO h2
      have e : (t + 1) * (1 + (tS L + (3 * L + 3 + tO L))) =
          t * (1 + (tS L + (3 * L + 3 + tO L))) + (1 + (tS L + (3 * L + 3 + tO L))) := Nat.succ_mul _ _
      omega
    · rw [ho]
      exact Frag.loop_runs_iter (chkQ_none _ _ _ _ _) hb hrun

end Groundwork.Host

namespace Groundwork.Host

open TM Turing

/-- The whole program: prologue, init and the first output, the loop, and the last state dropped. -/
def prog (Pi Ps Po : Fr) : FrIO := ((prologue.seq (Pi.seq (look Po)).io).seq (mainLoop Ps Po)).seq dropF.io

/-- A fragment on the five stacks as one of Mathlib's bundled machines; input and output on the
stack of bits. -/
def tmOf (H : FrIO) : FinTM2 where
  K := Option Stk
  k₀ := none
  k₁ := none
  Γ := Γio
  Λ := H.Λ
  main := H.entry
  σ := Option Sym
  initialState := none
  Γk₀Fin := inferInstanceAs (Fintype Bool)
  m := H.m

theorem initList_tmOf (H : FrIO) (x : List Bool) :
    @Eq (TM2.Cfg Γio H.Λ (Option Sym)) (initList (tmOf H) x) ⟨some H.entry, none, withIO x (st [] [] [] [])⟩ := by
  unfold initList
  congr 1
  funext k
  rcases k with _ | k
  · rfl
  · cases k <;> rfl

theorem haltList_tmOf (H : FrIO) (x : List Bool) :
    @Eq (TM2.Cfg Γio H.Λ (Option Sym)) (haltList (tmOf H) x) ⟨none, none, withIO x (st [] [] [] [])⟩ := by
  unfold haltList
  congr 1
  funext k
  rcases k with _ | k
  · rfl
  · cases k <;> rfl

/-- A run of the fragment is a run of the bundled machine, in Mathlib's terms. -/
theorem outputs_of_within {H : FrIO} {x y : List Bool} {t : ℕ}
    (h : Frag.Within H (withIO x (st [] [] [] [])) t (withIO y (st [] [] [] []))) {x' y' : List Bool} (hx : x' = x)
    (hy : y' = y) : Nonempty (TM2OutputsInTime (tmOf H) x' (some y') t) := by
  subst hx hy
  obtain ⟨n, hn, hr⟩ := h
  refine ⟨⟨⟨n, ?_⟩, hn⟩⟩
  have e := hr.iterate
  rw [← initList_tmOf H x', ← haltList_tmOf H y'] at e
  exact e

end Groundwork.Host

/-! # Part B, continued — the space-annotated host (new) -/

namespace Groundwork.Host

open TM Turing

/-- The five stacks hold the bits and the four work stacks. -/
theorem stkLen_withIO_st (W : List Bool) (M A B N : List Sym) :
    stkLen (withIO W (st M A B N)) = W.length + (M.length + A.length + B.length + N.length) := by
  have h1 : stkLen (withIO W (st M A B N)) = W.length + ∑ k : Stk, (withIO W (st M A B N) (some k)).length :=
    Fintype.sum_option (fun o => (withIO W (st M A B N) o).length)
  have h2 : ∑ k : Stk, (withIO W (st M A B N) (some k)).length = M.length + A.length + B.length + N.length :=
    sum_stk (fun k => (withIO W (st M A B N) (some k)).length)
  rw [h1, h2]

theorem stkLen_main (W : List Bool) (w : List Sym) : stkLen (withIO W (st w [] [] [])) = W.length + w.length := by
  rw [stkLen_withIO_st]; simp

/-- At the head of the loop: the word of an optional bit (at most five symbols) on w. -/
theorem stkLen_head (o : Option Bool) (w : List Sym) : stkLen (withIO [] (st (wd o ++ w) [] [] [])) ≤ w.length + 5 := by
  rw [stkLen_main]
  cases o <;> simp [wd_none, wd_some, wd_bool]

/-- A run of the host's fragment, with a ceiling, is a bound on the space of the bundled machine
at every prefix of its run, in Mathlib's terms. -/
theorem spaceWithinTM_of_withinB {H : FrIO} {x y : List Bool} {t B : ℕ}
    (h : Frag.WithinB H (withIO x (st [] [] [] [])) t (withIO y (st [] [] [] [])) B) {x' : List Bool} (hx : x' = x)
    (t' : ℕ) : SpaceWithinTM (tmOf H) x' t' B := by
  subst hx
  obtain ⟨n, -, hr⟩ := h
  intro s _ c hc
  rw [initList_tmOf] at hc
  exact RunIn.iterate hr rfl s c hc

end Groundwork.Host

namespace Groundwork.Host

open TM Turing

variable {M : Stepped (List Bool) Bool} [Enc M.σ]

variable {Ps Po : Fr} {tS tO : ℕ → ℕ}
  (hS : ∀ (s : M.σ) (M' A B N : List Sym),
    Ps.Within (st (wd s ++ M') A B N) (tS (len s)) (st (wd (M.step s) ++ M') A B N))
  (hO : ∀ (s : M.σ) (M' A B N : List Sym),
    Po.Within (st (wd s ++ M') A B N) (tO (len s)) (st (wd (M.out s) ++ M') A B N))

include hS hO in
/-- **The loop with a ceiling.** eth's `mainLoop_within`, plus: the stacks never hold more than
L + 5 + growth(body) · (tS L + 3L + 3 + tO L) symbols — a bound that does not depend on the number
t of rounds. At the head of each round the stacks hold one state and one optional bit; a round is
one step of the head and one run of the body, whose length is polynomial in L. -/
theorem mainLoop_withinB (mS : Monotone tS) (mO : Monotone tO) {S L : ℕ} (hL : ∀ s : M.σ, size s ≤ S → len s ≤ L)
    {b : Bool} {s : M.σ} {t : ℕ} (h : M.Reaches S b s t) :
    ∃ s' : M.σ, size s' ≤ S ∧ Frag.WithinB (mainLoop Ps Po) (withIO [] (st (wd (M.out s) ++ (wd s ++ [])) [] [] []))
      (t * (1 + (tS L + (3 * L + 3 + tO L))) + 1) (withIO [b] (st (wd s' ++ []) [] [] []))
      (L + 5 + (body Ps Po).growth * (tS L + (3 * L + 3 + tO L))) := by
  induction h with
  | @halt s t ho hs =>
    have g : (wd s).length ≤ L := hL s hs
    refine ⟨s, hs, 1, by omega, ?_⟩
    rw [ho]
    refine Frag.loop_runs_exitB (chkQ_some _ _ _ _ _ b) ((stkLen_head _ _).trans ?_) ?_
    · simp only [List.append_nil]; omega
    · rw [stkLen_main]
      simp only [List.append_nil, List.length_cons, List.length_nil]
      omega
  | @step s t ho hs hr ih =>
    obtain ⟨s', hs', n, hn, hrun⟩ := ih
    have g1 : (wd s).length ≤ L := hL s hs
    have g2 : len (M.step s) ≤ L := hL _ (size_le_of_reaches hr)
    have g3 := mS (hL s hs)
    have g4 := mO g2
    have hw : (body Ps Po).Within (withIO [] (st (wd s ++ []) [] [] [])) (tS L + (3 * L + 3 + tO L))
        (withIO [] (st (wd (M.out (M.step s)) ++ (wd (M.step s) ++ [])) [] [] [])) :=
      (within_io ((hS s [] [] [] []).seq (look_within hO (M.step s) [] [] [] [])) []).mono (by omega)
    obtain ⟨m, hm, hb⟩ := hw.toB
    refine ⟨s', hs', 1 + m + n, ?_, ?_⟩
    · have e : (t + 1) * (1 + (tS L + (3 * L + 3 + tO L))) =
          t * (1 + (tS L + (3 * L + 3 + tO L))) + (1 + (tS L + (3 * L + 3 + tO L))) := Nat.succ_mul _ _
      omega
    · rw [ho]
      refine Frag.loop_runs_iterB (chkQ_none _ _ _ _ _) ((stkLen_head _ _).trans ?_) (hb.mono ?_) hrun
      · simp only [List.append_nil]; omega
      · rw [stkLen_main]
        simp only [List.append_nil, List.length_nil]
        omega

end Groundwork.Host

namespace Groundwork

open TM Turing

open Host in
/-- **L3 — the space-annotated `exists_tm`.** A stepped computation on bit strings with
polynomial-time init, step and out runs on one of Mathlib's multi-stack machines with finite
alphabets. If it ends on x within T steps with states of size at most (|x| + 2)^d, the machine takes
at most c · (T + 1) · (|x| + 1)^c steps (eth's `exists_tm`, same machine `tmOf (prog Pi Ps Po)`),
**and at every step of its run its stacks hold at most c · (|x| + 1)^c symbols together** — a
polynomial in |x| alone, whatever T is. c depends on the computation and d only. -/
theorem exists_tm_space (M : Stepped (List Bool) Bool) [IsPolyT M] (d : ℕ) :
    ∃ (N : TM2ComputableAux Bool Bool) (c : ℕ), (∀ k, Finite (N.tm.Γ k)) ∧
      ∀ (x : List Bool) (T S : ℕ) (b : Bool), M.Runs x T S b → S ≤ (x.length + 2) ^ d →
        Nonempty (TM2OutputsInTime N.tm (x.map N.inputAlphabet.invFun) (some ([b].map N.outputAlphabet.invFun))
          (c * (T + 1) * (x.length + 1) ^ c)) ∧
        ∀ t, SpaceWithin N x t (c * (x.length + 1) ^ c) := by
  obtain ⟨Pi, tI, pI, -, hI, -⟩ := (IsPolyT.init (M := M)).elim
  obtain ⟨Ps, tS, pS, mS, hS, -⟩ := (IsPolyT.step (M := M)).elim
  obtain ⟨Po, tO, pO, mO, hO, -⟩ := (IsPolyT.out (M := M)).elim
  have pL : PB fun n => 7 * (n + 2) ^ d := (PB.const 7).mul ((PB.id'.add (PB.const 2)).pow d)
  have pK : PB fun n => 3 * (7 * (n + 2) ^ d) + 3 + tO (7 * (n + 2) ^ d) :=
    (((PB.const 3).mul pL).add (PB.const 3)).add (pO.comp pL)
  have pG : PB fun n => 1 + (tS (7 * (n + 2) ^ d) + (3 * (7 * (n + 2) ^ d) + 3 + tO (7 * (n + 2) ^ d))) :=
    (PB.const 1).add ((pS.comp pL).add pK)
  -- time: eth's polynomial
  have pQ : PB fun n => (4 * n + 3 + (tI (3 * n + 2) + (3 * (7 * (n + 2) ^ d) + 3 + tO (7 * (n + 2) ^ d))) + 1 +
      (7 * (n + 2) ^ d + 1)) + (1 + (tS (7 * (n + 2) ^ d) + (3 * (7 * (n + 2) ^ d) + 3 + tO (7 * (n + 2) ^ d)))) :=
    ((((((PB.const 4).mul PB.id').add (PB.const 3)).add
      ((pI.comp (((PB.const 3).mul PB.id').add (PB.const 2))).add pK)).add (PB.const 1)).add
      (pL.add (PB.const 1))).add pG
  -- space: one ceiling for each of the four phases (prologue, init + first output, loop, drop)
  have pW : PB fun n => (n + prologue.growth * (4 * n + 3)) +
      ((3 * n + 2) + (Pi.seq (look Po)).io.growth *
        (tI (3 * n + 2) + (3 * (7 * (n + 2) ^ d) + 3 + tO (7 * (n + 2) ^ d)))) +
      (7 * (n + 2) ^ d + 5 + (body Ps Po).growth *
        (tS (7 * (n + 2) ^ d) + (3 * (7 * (n + 2) ^ d) + 3 + tO (7 * (n + 2) ^ d)))) +
      (1 + 7 * (n + 2) ^ d + dropF.io.growth * (7 * (n + 2) ^ d + 1)) :=
    (((PB.id'.add ((PB.const prologue.growth).mul (((PB.const 4).mul PB.id').add (PB.const 3)))).add
      ((((PB.const 3).mul PB.id').add (PB.const 2)).add
        ((PB.const (Pi.seq (look Po)).io.growth).mul
          ((pI.comp (((PB.const 3).mul PB.id').add (PB.const 2))).add pK)))).add
      ((pL.add (PB.const 5)).add ((PB.const (body Ps Po).growth).mul ((pS.comp pL).add pK)))).add
      (((PB.const 1).add pL).add ((PB.const dropF.io.growth).mul (pL.add (PB.const 1))))
  obtain ⟨c, hc⟩ := pQ
  obtain ⟨c', hc'⟩ := pW
  refine ⟨⟨tmOf (prog Pi Ps Po), Equiv.refl _, Equiv.refl _⟩, c + c', fun k => ?_, fun x T S b hr hSd => ?_⟩
  · rcases k with _ | k
    · exact inferInstanceAs (Finite Bool)
    · exact inferInstanceAs (Finite Sym)
  · obtain ⟨L, hLdef⟩ : ∃ L, L = 7 * (x.length + 2) ^ d := ⟨_, rfl⟩
    have hL : ∀ s : M.σ, size s ≤ S → len s ≤ L := fun s hs => by
      have h1 := Carried.le s
      have h2 := hs.trans hSd
      omega
    obtain ⟨s', hs', h3⟩ := mainLoop_withinB hS hO mS mO hL hr
    have g1 := hL _ (size_le_of_reaches hr)
    have g2 := mO g1
    have g3 : (code (Enc.toV s')).length ≤ L := hL s' hs'
    have g4 : len x = 3 * x.length + 2 := len_bools x
    have g4' : (wd x).length = 3 * x.length + 2 := g4
    have h1 := (prologue_within x).toB
    have h2 := within_io ((hI x [] [] [] []).seq (look_within hO (M.init x) [] [] [] [])) []
    rw [List.append_nil] at h2
    have h2' : (Pi.seq (look Po)).io.Within (withIO [] (st (wd x) [] [] []))
        (tI (3 * x.length + 2) + (3 * L + 3 + tO L))
        (withIO [] (st (wd (M.out (M.init x)) ++ (wd (M.init x) ++ [])) [] [] [])) :=
      h2.mono (by rw [g4]; omega)
    have h4 := ((within_io (dropF_within (Enc.toV s') [] [] [] []) [b]).mono (show _ ≤ L + 1 by omega)).toB
    -- the common ceiling W
    have hw := hc' x.length
    dsimp only at hw
    rw [← hLdef] at hw
    obtain ⟨W, hW⟩ : ∃ W, W = c' * (x.length + 1) ^ c' := ⟨_, rfl⟩
    rw [← hW] at hw
    have k1 : prologue.WithinB _ _ _ W := h1.mono le_rfl (by rw [stkLen_main]; simp only [List.length_nil]; omega)
    have k2 : (Pi.seq (look Po)).io.WithinB _ _ _ W :=
      h2'.toB.mono le_rfl (by rw [stkLen_main]; simp only [List.length_nil]; omega)
    have k3 : (mainLoop Ps Po).WithinB _ _ _ W := h3.mono le_rfl (by omega)
    have k4 : dropF.io.WithinB _ _ _ W := h4.mono le_rfl (by
      rw [stkLen_main]
      simp only [List.append_nil, List.length_cons, List.length_nil]
      omega)
    have hB := ((k1.seq k2).seq k3).seq k4
    have hcx := hc x.length
    dsimp only at hcx
    rw [← hLdef] at hcx
    refine ⟨outputs_of_within (hB.within.mono ?_) (List.map_id x) (List.map_id [b]), fun t => ?_⟩
    · obtain ⟨G, hG⟩ : ∃ G, G = 1 + (tS L + (3 * L + 3 + tO L)) := ⟨_, rfl⟩
      rw [← hG] at hcx ⊢
      obtain ⟨Y, hY⟩ : ∃ Y, Y = c * (x.length + 1) ^ c := ⟨_, rfl⟩
      rw [← hY] at hcx
      obtain ⟨Z, hZ⟩ : ∃ Z, Z = (c + c') * (x.length + 1) ^ (c + c') := ⟨_, rfl⟩
      have hYZ : Y ≤ Z := by rw [hY, hZ]; exact PB.bound_le (Nat.le_add_right _ _) (Nat.le_add_right _ _)
      have e : (c + c') * (T + 1) * (x.length + 1) ^ (c + c') = T * Z + Z := by rw [hZ]; ring
      rw [e]
      have g5 : T * G ≤ T * Z := Nat.mul_le_mul_left _ (by omega)
      omega
    · have hWle : W ≤ (c + c') * (x.length + 1) ^ (c + c') := by
        rw [hW]; exact PB.bound_le (Nat.le_add_left _ _) (Nat.le_add_left _ _)
      exact spaceWithinTM_of_withinB (hB.mono le_rfl hWle) (List.map_id x) t

/-- eth's `exists_tm` (Host.lean:305–309), statement verbatim: the time half of `exists_tm_space`. -/
theorem exists_tm (M : Stepped (List Bool) Bool) [IsPolyT M] (d : ℕ) :
    ∃ (N : TM2ComputableAux Bool Bool) (c : ℕ), (∀ k, Finite (N.tm.Γ k)) ∧
      ∀ (x : List Bool) (T S : ℕ) (b : Bool), M.Runs x T S b → S ≤ (x.length + 2) ^ d →
        Nonempty (TM2OutputsInTime N.tm (x.map N.inputAlphabet.invFun) (some ([b].map N.outputAlphabet.invFun))
          (c * (T + 1) * (x.length + 1) ^ c)) := by
  obtain ⟨N, c, hfin, h⟩ := exists_tm_space M d
  exact ⟨N, c, hfin, fun x T S b hr hS => (h x T S b hr hS).1⟩

/-- The dossier's exact shape: the space bound at the time bound. -/
theorem exists_tm_space_at_time (M : Stepped (List Bool) Bool) [IsPolyT M] (d : ℕ) :
    ∃ (N : TM2ComputableAux Bool Bool) (c : ℕ), (∀ k, Finite (N.tm.Γ k)) ∧
      ∀ (x : List Bool) (T S : ℕ) (b : Bool), M.Runs x T S b → S ≤ (x.length + 2) ^ d →
        Nonempty (TM2OutputsInTime N.tm (x.map N.inputAlphabet.invFun) (some ([b].map N.outputAlphabet.invFun))
          (c * (T + 1) * (x.length + 1) ^ c)) ∧
        SpaceWithin N x (c * (T + 1) * (x.length + 1) ^ c) (c * (x.length + 1) ^ c) := by
  obtain ⟨N, c, hfin, h⟩ := exists_tm_space M d
  exact ⟨N, c, hfin, fun x T S b hr hS => ⟨(h x T S b hr hS).1, (h x T S b hr hS).2 _⟩⟩

end Groundwork

/-! # Part C — openai-math's per-prefix monitor form -/

namespace Groundwork

open TM Turing

/-- An explicit finite trace of successful transitions (openai-math
`OAI/Algorithms/SubexponentialSAT/Computation.lean:20–23`, transcribed). -/
inductive Trace {α : Type} (step : α → Option α) : ℕ → α → α → Prop
  | refl (a : α) : Trace step 0 a a
  | cons {n : ℕ} {a b c : α} : step a = some b → Trace step n b c → Trace step (n + 1) a c

theorem Trace.iterate {α : Type} {step : α → Option α} {n : ℕ} {a b : α} (h : Trace step n a b) :
    (flip bind step)^[n] (some a) = some b := by
  induction h with
  | refl => rfl
  | @cons n a b c hs _ ih =>
    rw [Function.iterate_succ_apply]
    have e : flip bind step (some a) = some b := hs
    rw [e]; exact ih

theorem Trace.of_iterate {α : Type} {step : α → Option α} :
    ∀ {n : ℕ} {a b : α}, (flip bind step)^[n] (some a) = some b → Trace step n a b
  | 0, a, b, h => by
    have e : some a = some b := h
    cases e
    exact .refl a
  | n + 1, a, b, h => by
    rw [Function.iterate_succ_apply] at h
    cases hs : step a with
    | none =>
      have e : flip bind step (some a) = none := hs
      rw [e, iterate_none] at h
      cases h
    | some a' =>
      have e : flip bind step (some a) = some a' := hs
      rw [e] at h
      exact .cons hs (Trace.of_iterate h)

/-- `SpaceWithinTM` in openai's per-prefix form: every intermediate configuration of every trace of
at most t steps from the start. -/
theorem spaceWithinTM_iff_trace (tm : FinTM2) (l : List (tm.Γ tm.k₀)) (t S : ℕ) :
    SpaceWithinTM tm l t S ↔ ∀ (prefixSteps : ℕ) (intermediate : TM2.Cfg tm.Γ tm.Λ tm.σ), prefixSteps ≤ t →
      Trace tm.step prefixSteps (initList tm l) intermediate → @stkLen tm.K tm.kFin tm.Γ intermediate.stk ≤ S :=
  ⟨fun h p c hp htr => h p hp c htr.iterate, fun h s hs c hc => h s c hs (Trace.of_iterate hc)⟩

/-- openai's `LocatedCfg` (ComparatorChallenges/SubexponentialSAT.lean:149–153), for stacks: the
configuration and, for every stack, the greatest length it has had so far — the cells it has ever
occupied, the stack analogue of the visited interval [lower, upper] of a tape. -/
structure LocatedCfg (tm : FinTM2) where
  config : TM2.Cfg tm.Γ tm.Λ tm.σ
  high : tm.K → ℕ

/-- openai's `locatedInit` (ibid. :155–159). -/
def locatedInit (tm : FinTM2) (l : List (tm.Γ tm.k₀)) : LocatedCfg tm :=
  ⟨initList tm l, fun k => ((initList tm l).stk k).length⟩

/-- openai's `LocatedCfg.monitor` (ibid. :166–183): record the new configuration and raise each
high-water mark to the new length. -/
def LocatedCfg.monitor {tm : FinTM2} (c : LocatedCfg tm) (config : TM2.Cfg tm.Γ tm.Λ tm.σ) : LocatedCfg tm :=
  ⟨config, fun k => max (c.high k) (config.stk k).length⟩

/-- openai's `locatedStep` (ibid. :184–186). -/
def locatedStep (tm : FinTM2) (c : LocatedCfg tm) : Option (LocatedCfg tm) :=
  (tm.step c.config).map c.monitor

/-- openai's `visitedSpace` (ibid. :188–189), for stacks: the cells visited on all stacks. -/
def visitedStacks {tm : FinTM2} (c : LocatedCfg tm) : ℕ := @Finset.sum tm.K ℕ _ (@Finset.univ tm.K tm.kFin) c.high

/-- Along a located trace that starts at a configuration of the run, every high-water mark stays at
most S, as long as the run has space S. -/
theorem located_high_le {tm : FinTM2} {l : List (tm.Γ tm.k₀)} {t S : ℕ} (h : SpaceWithinTM tm l t S) :
    ∀ {n : ℕ} {a b : LocatedCfg tm}, Trace (locatedStep tm) n a b → ∀ s₀ : ℕ, s₀ + n ≤ t →
      (flip bind tm.step)^[s₀] (some (initList tm l)) = some a.config → (∀ k, a.high k ≤ S) →
        ∀ k, b.high k ≤ S := by
  let _inst : Fintype tm.K := tm.kFin
  intro n a b hab
  induction hab with
  | refl a => intro _ _ _ ha; exact ha
  | @cons n a b c hs _ ih =>
    intro s₀ hs₀ hreach ha
    unfold locatedStep at hs
    cases hstep : tm.step a.config with
    | none => rw [hstep] at hs; cases hs
    | some cfg =>
      rw [hstep] at hs
      have e : some (a.monitor cfg) = some b := hs
      cases e
      have hreach' : (flip bind tm.step)^[s₀ + 1] (some (initList tm l)) = some cfg := by
        rw [Function.iterate_succ_apply', hreach]
        exact hstep
      have hsp := h (s₀ + 1) (by omega) cfg hreach'
      exact ih (s₀ + 1) (by omega) hreach' fun k => max_le (ha k) ((length_le_stkLen cfg.stk k).trans hsp)

/-- **Monitor form.** If the run has space S at every prefix of t steps, then every located trace
of at most t steps has visited at most |K| · S stack cells. -/
theorem visitedStacks_le {tm : FinTM2} {l : List (tm.Γ tm.k₀)} {t S : ℕ} (h : SpaceWithinTM tm l t S)
    (prefixSteps : ℕ) (intermediate : LocatedCfg tm) (hp : prefixSteps ≤ t)
    (htr : Trace (locatedStep tm) prefixSteps (locatedInit tm l) intermediate) :
    visitedStacks intermediate ≤ @Fintype.card tm.K tm.kFin * S := by
  let _inst : Fintype tm.K := tm.kFin
  have h0 : stkLen (initList tm l).stk ≤ S := h 0 (Nat.zero_le _) _ rfl
  have hk := located_high_le h htr 0 (by omega) rfl fun k => (length_le_stkLen (initList tm l).stk k).trans h0
  calc visitedStacks intermediate = ∑ k, intermediate.high k := rfl
    _ ≤ ∑ _k : tm.K, S := Finset.sum_le_sum fun k _ => hk k
    _ = Fintype.card tm.K * S := by rw [Finset.sum_const, smul_eq_mul, Finset.card_univ]

/-- **L3 in openai's monitor form** (shape of `SqrtLogSpace/Final.lean:122–128`): the machine of
`exists_tm_space`, every located prefix trace of it has visited polynomially many stack cells. -/
theorem exists_tm_space_monitor (M : Stepped (List Bool) Bool) [IsPolyT M] (d : ℕ) :
    ∃ (N : TM2ComputableAux Bool Bool) (c : ℕ), (∀ k, Finite (N.tm.Γ k)) ∧
      ∀ (x : List Bool) (T S : ℕ) (b : Bool), M.Runs x T S b → S ≤ (x.length + 2) ^ d →
        Nonempty (TM2OutputsInTime N.tm (x.map N.inputAlphabet.invFun) (some ([b].map N.outputAlphabet.invFun))
          (c * (T + 1) * (x.length + 1) ^ c)) ∧
        ∀ (prefixSteps : ℕ) (intermediate : LocatedCfg N.tm), prefixSteps ≤ c * (T + 1) * (x.length + 1) ^ c →
          Trace (locatedStep N.tm) prefixSteps (locatedInit N.tm (x.map N.inputAlphabet.invFun)) intermediate →
            visitedStacks intermediate ≤ c * (x.length + 1) ^ c := by
  obtain ⟨N, c, hfin, h⟩ := exists_tm_space M d
  refine ⟨N, @Fintype.card N.tm.K N.tm.kFin * c + c, hfin, fun x T S b hr hS => ?_⟩
  obtain ⟨⟨ev⟩, hsp⟩ := h x T S b hr hS
  refine ⟨⟨⟨ev.toEvalsTo, ev.steps_le_m.trans ?_⟩⟩, fun p i _ htr => ?_⟩
  · exact Nat.mul_le_mul (Nat.mul_le_mul_right _ (Nat.le_add_left _ _))
      (Nat.pow_le_pow_right (Nat.succ_pos _) (Nat.le_add_left _ _))
  · have hv := visitedStacks_le (hsp p) p i le_rfl htr
    refine hv.trans ?_
    rw [← Nat.mul_assoc]
    exact PB.bound_le (Nat.le_add_right _ _) (Nat.le_add_left _ _)

end Groundwork

#print axioms Groundwork.exists_tm_space
#print axioms Groundwork.exists_tm
#print axioms Groundwork.exists_tm_space_at_time
#print axioms Groundwork.exists_tm_space_monitor

/-! # Part D — milestone L2 (new): the space-certified countdown loop and `PolyTVal`

Prework §3: «`ct : ℕ` — a loop countdown … every `rng pad q`-fold and `sumF N pad f`-fold becomes
`loopC nb q f` … each iteration costs poly(log nb) fragment steps (increment/decrement on a
⌈log₂ nb⌉-bit counter)». This part builds that countdown as a fragment on Part A's calculus and
proves the machine lemma the blueprint asks of L2: the counter-based loops run a value-bounded
number of rounds on word-bounded space — the separation `exists_tm_space`'s hypothesis
S ≤ (|x|+2)^d consumes. The counter's machine coding is the flat bit-run `cw` (lowest first,
between two brackets — length n.size + 2, the word of n), not the bracket-per-cons `wd` word of
a ℕ; nothing but this ⌈log₂⌉-symbol word is ever materialized. The relabeling walk between
`wd`-inputs and `cw`-counters, and the Stepped-level counter-`padM'` +
`exists_tm_padded_space` (which needs eth's Closure layer for the phase dispatch's `PolyT`
proofs), are the next tranche — eth-Lib-grade plumbing, not new mathematics.
-/

namespace Groundwork.Counted

open TM Turing

@[simp] theorem beq_bit_bit (b c : Bool) : (Sym.bit b == Sym.bit c) = (b == c) := by
  cases b <;> cases c <;> rfl

/-- The counter's machine word: the bits of n, lowest first, between two brackets. -/
def cw (n : ℕ) : List Sym := .L :: (Nat.bits n).map Sym.bit ++ [.R]

theorem cw_zero : cw 0 = [.L, .R] := by simp [cw]

theorem cw_length (n : ℕ) : (cw n).length = Nat.size n + 2 := by
  simp [cw, Nat.size_eq_bits_len]

theorem cw_length_mono {m n : ℕ} (h : m ≤ n) : (cw m).length ≤ (cw n).length := by
  rw [cw_length, cw_length]
  exact Nat.add_le_add_right (Nat.succ_le_succ (Nat.size_le_size h)) 1

theorem bits_len_le (n : ℕ) : (Nat.bits n).length ≤ n := by
  rw [Nat.size_eq_bits_len]
  exact Nat.size_le.2 (Nat.lt_two_pow_self n)

theorem bits_pow_sub_one (j : ℕ) : Nat.bits (2 ^ j - 1) = List.replicate j true := by
  induction j with
  | zero => simp
  | succ j ih =>
    have h1 : 0 < 2 ^ j := by positivity
    have e : 2 ^ (j + 1) - 1 = 2 * (2 ^ j - 1) + 1 := by
      have h2 : 2 ^ (j + 1) = 2 * 2 ^ j := by rw [Nat.pow_succ]; ring
      omega
    rw [e, Nat.bit1_bits, ih]

/-- The bits of one odd decrement step: with j flipped bits below, k ≥ 1 above. -/
theorem bits_odd_dec (j k : ℕ) (hk : 0 < k) :
    Nat.bits (2 ^ (j + 1) * k + (2 ^ j - 1)) = List.replicate j true ++ false :: Nat.bits k := by
  induction j with
  | zero =>
    have h1 : 0 < 2 ^ 1 := by positivity
    have e : 2 ^ 1 * k + (2 ^ 0 - 1) = 2 * k := by omega
    rw [e, Nat.bit0_bits (by omega : k ≠ 0)]
    simp
  | succ j ih =>
    have h1 : 0 < 2 ^ j := by positivity
    have h2 : 2 ^ (j + 2) = 2 * 2 ^ (j + 1) := by rw [Nat.pow_succ]; ring
    have e : 2 ^ (j + 2) * k + (2 ^ (j + 1) - 1) = 2 * (2 ^ (j + 1) * k + (2 ^ j - 1)) + 1 := by
      have h3 : 2 ^ (j + 1) = 2 * 2 ^ j := by rw [Nat.pow_succ]; ring
      omega
    rw [e, Nat.bit1_bits, ih, List.replicate_succ]

theorem stkLen_st (M A B N : List Sym) :
    stkLen (st M A B N) = M.length + A.length + B.length + N.length := by
  simp only [stkLen, sum_stk, st_main, st_a, st_b, st_cnt]

/-- The labels of the decrement walk. -/
inductive Cdl | start | walk | unwind

instance : Fintype Cdl := ⟨{.start, .walk, .unwind}, fun x => by cases x <;> simp⟩

abbrev StC := TM2.Stmt (fun _ : Stk => Sym) Cdl (Option Sym)

/-- One decrement of the counter on stack a, stack b as scratch: pop the bracket and the bits,
flipping the trailing zeros into ones on b, until the first one — it becomes zero (dropped when
leading), and b is wound back onto a. -/
def cdM : Cdl → StC
  | .start => .pop .a (fun _ o => o) <|
      .branch (fun s => s == some .L)
        (.push .b (fun _ => .L) <| .load (fun _ => none) <| .goto fun _ => .walk)
        .halt
  | .walk => .pop .a (fun _ o => o) <|
      .branch (fun s => s == some (.bit false))
        (.push .b (fun _ => .bit true) <| .load (fun _ => none) <| .goto fun _ => .walk)
        (.peek .a (fun _ o => o) <|
          .branch (fun s => s == some .R)
            (.load (fun _ => none) <| .goto fun _ => .unwind)
            (.push .b (fun _ => .bit false) <| .load (fun _ => none) <| .goto fun _ => .unwind))
  | .unwind => .pop .b (fun _ o => o) <|
      .branch (fun s => s == some .L)
        (.push .a (fun _ => .L) <| .load (fun _ => none) <| .halt)
        (.push .a (fun s => s.getD .L) <| .load (fun _ => none) <| .goto fun _ => .unwind)

/-- The decrement as a fragment: from `cw n ++ A` on stack a (n > 0) to `cw (n−1) ++ A`, with
stack b back where it was. -/
def cdFrag : Fr := ⟨Cdl, .start, cdM⟩

/-- The loop head: if the counter is `[L, R]` (n = 0), restore it and halt; else restore the
bracket and run one round. -/
def headQ : TM2.Stmt (fun _ : Stk => Sym) Unit (Option Sym) :=
  .pop .a (fun _ o => o) <|
    .peek .a (fun _ o => o) <|
    .branch (fun s => s == some .R)
      (.push .a (fun _ => .L) <| .load (fun _ => none) <| .halt)
      (.push .a (fun _ => .L) <| .load (fun _ => none) <| .goto fun _ => ())

/-- The countdown loop: one round = the decrement, then the body. -/
def cdLoop (body : Fr) : Fr := Frag.loop headQ (cdFrag.seq body)

section Steps

private theorem cd_start (M A B N : List Sym) :
    TM2.step cdM ⟨some .start, none, st M (Sym.L :: A) B N⟩
      = some ⟨some .walk, none, st M A (Sym.L :: B) N⟩ := by
  simp [cdM, TM2.step, TM2.stepAux]

private theorem cd_walk_false (M A B N : List Sym) :
    TM2.step cdM ⟨some .walk, none, st M (Sym.bit false :: A) B N⟩
      = some ⟨some .walk, none, st M A (Sym.bit true :: B) N⟩ := by
  simp [cdM, TM2.step, TM2.stepAux]

private theorem cd_walk_true_R (M A B N : List Sym) :
    TM2.step cdM ⟨some .walk, none, st M (Sym.bit true :: Sym.R :: A) B N⟩
      = some ⟨some .unwind, none, st M (Sym.R :: A) B N⟩ := by
  simp [cdM, TM2.step, TM2.stepAux]

private theorem cd_walk_true_bit (c : Bool) (M A B N : List Sym) :
    TM2.step cdM ⟨some .walk, none, st M (Sym.bit true :: Sym.bit c :: A) B N⟩
      = some ⟨some .unwind, none, st M (Sym.bit c :: A) (Sym.bit false :: B) N⟩ := by
  simp [cdM, TM2.step, TM2.stepAux]

private theorem cd_unwind_bit (c : Bool) (M A B N : List Sym) :
    TM2.step cdM ⟨some .unwind, none, st M A (Sym.bit c :: B) N⟩
      = some ⟨some .unwind, none, st M (Sym.bit c :: A) B N⟩ := by
  simp [cdM, TM2.step, TM2.stepAux]

private theorem cd_unwind_sent (M A B N : List Sym) :
    TM2.step cdM ⟨some .unwind, none, st M A (Sym.L :: B) N⟩
      = some ⟨none, none, st M (Sym.L :: A) B N⟩ := by
  simp [cdM, TM2.step, TM2.stepAux]

private theorem headQ_zero (M A B N : List Sym) :
    TM2.stepAux headQ none (st M (Sym.L :: Sym.R :: A) B N)
      = ⟨none, none, st M (Sym.L :: Sym.R :: A) B N⟩ := by
  simp [headQ, TM2.stepAux]

private theorem headQ_step (b : Bool) (M A B N : List Sym) :
    TM2.stepAux headQ none (st M (Sym.L :: Sym.bit b :: A) B N)
      = ⟨some (), none, st M (Sym.L :: Sym.bit b :: A) B N⟩ := by
  simp [headQ, TM2.stepAux]

end Steps

/-- Winding b back onto a: the flipped bits, then the closing bracket. -/
private theorem unwind_run : ∀ (j : ℕ) (M A B N : List Sym),
    Run (TM2.step cdM) ⟨some .unwind, none, st M A (List.replicate j (Sym.bit true) ++ .L :: B) N⟩
      (1 + j) ⟨none, none, st M (.L :: List.replicate j (Sym.bit true) ++ A) B N⟩
  | 0, M, A, B, N => Run.one (cd_unwind_sent M A B N)
  | j + 1, M, A, B, N => by
    have h1 : Run (TM2.step cdM)
        ⟨some .unwind, none, st M A
          (Sym.bit true :: (List.replicate j (Sym.bit true) ++ .L :: B)) N⟩ 1
        ⟨some .unwind, none, st M (Sym.bit true :: A) (List.replicate j (Sym.bit true) ++ .L :: B) N⟩ :=
      Run.one (cd_unwind_bit true M A _ _)
    have h2 := unwind_run j M (Sym.bit true :: A) B N
    exact h1.trans h2

/-- The walk: from the remaining bits of n (the bracket and j flipped bits already consumed)
to the word of `2 ^ j * n − 1` — the original number minus one, with b restored. -/
private theorem walk_run : ∀ (n : ℕ) (M A B N : List Sym), 0 < n → ∀ (j : ℕ),
    ∃ m ≤ 3 * (Nat.bits n).length + 2 * j + 2,
      Run (TM2.step cdM) ⟨some .walk, none,
        st M ((Nat.bits n).map Sym.bit ++ .R :: A) (List.replicate j (Sym.bit true) ++ .L :: B) N⟩ m
        ⟨none, none, st M (cw (2 ^ j * n - 1) ++ A) B N⟩ := by
  intro n
  induction n using Nat.strongRecOn with
  | ind n ih =>
    intro M A B N hn j
    by_cases hev : n % 2 = 0
    · obtain ⟨k, hk⟩ : ∃ k, n = 2 * k := ⟨n / 2, by omega⟩
      have hk1 : 0 < k := by omega
      have hbits : Nat.bits n = false :: Nat.bits k := by
        rw [hk, Nat.bit0_bits (by omega : k ≠ 0)]
      have hrep : List.replicate (j + 1) (Sym.bit true) = Sym.bit true :: List.replicate j (Sym.bit true) :=
        List.replicate_succ _ _
      have hstep : TM2.step cdM ⟨some .walk, none,
          st M ((Nat.bits n).map Sym.bit ++ .R :: A) (List.replicate j (Sym.bit true) ++ .L :: B) N⟩
          = some ⟨some .walk, none, st M ((Nat.bits k).map Sym.bit ++ .R :: A)
            (List.replicate (j + 1) (Sym.bit true) ++ .L :: B) N⟩ := by
        rw [hbits]
        simp [cdM, TM2.step, TM2.stepAux, ← hrep]
      obtain ⟨m, hm, hr⟩ := ih k (by omega) M A B N hk1 (j + 1)
      have hval : 2 ^ j * n = 2 ^ (j + 1) * k := by rw [hk, Nat.pow_succ]; ring
      rw [hval] at hr ⊢
      refine ⟨1 + m, ?_, (Run.one hstep).trans hr⟩
      have hlen : (Nat.bits n).length = (Nat.bits k).length + 1 := by rw [hbits]; simp
      omega
    · obtain ⟨k, hk⟩ : ∃ k, n = 2 * k + 1 := ⟨n / 2, by omega⟩
      have hbits : Nat.bits n = true :: Nat.bits k := by rw [hk, Nat.bit1_bits]
      by_cases hk0 : k = 0
      · subst hk0
        have hn1 : n = 1 := by omega
        have hp : 0 < 2 ^ j := by positivity
        have hstep : TM2.step cdM ⟨some .walk, none,
            st M ((Nat.bits n).map Sym.bit ++ .R :: A) (List.replicate j (Sym.bit true) ++ .L :: B) N⟩
            = some ⟨some .unwind, none,
              st M (Sym.R :: A) (List.replicate j (Sym.bit true) ++ .L :: B) N⟩ := by
          rw [hn1]
          simp [cdM, TM2.step, TM2.stepAux]
        have hrun := unwind_run j M (Sym.R :: A) B N
        rw [hn1, show 2 ^ j * 1 - 1 = 2 ^ j - 1 from by omega, cw, bits_pow_sub_one]
        simp only [List.map_replicate, List.singleton_append, List.append_assoc]
        refine ⟨2 + j, ?_, (Run.one hstep).trans hrun⟩
        have hlen : (Nat.bits n).length = 1 := by rw [hn1]; simp
        omega
      · obtain ⟨c, rest, hck⟩ : ∃ c rest, Nat.bits k = c :: rest := by
          cases hbk : Nat.bits k with
          | nil =>
            exfalso
            have hs : (Nat.bits k).length = Nat.size k := Nat.size_eq_bits_len _
            rw [hbk] at hs
            simp only [List.length_nil] at hs
            have := Nat.size_eq_zero.1 hs
            omega
          | cons c rest => exact ⟨c, rest, rfl⟩
        have hstep : TM2.step cdM ⟨some .walk, none,
            st M ((Nat.bits n).map Sym.bit ++ .R :: A) (List.replicate j (Sym.bit true) ++ .L :: B) N⟩
            = some ⟨some .unwind, none, st M ((Nat.bits k).map Sym.bit ++ .R :: A)
              (Sym.bit false :: List.replicate j (Sym.bit true) ++ .L :: B) N⟩ := by
          rw [hbits, hck]
          simp [cdM, TM2.step, TM2.stepAux]
        have hstep2 : TM2.step cdM ⟨some .unwind, none,
            st M ((Nat.bits k).map Sym.bit ++ .R :: A)
            (Sym.bit false :: List.replicate j (Sym.bit true) ++ .L :: B) N⟩
            = some ⟨some .unwind, none,
              st M (Sym.bit false :: (Nat.bits k).map Sym.bit ++ .R :: A)
                (List.replicate j (Sym.bit true) ++ .L :: B) N⟩ :=
          cd_unwind_bit false M _ _ _
        have hrun := unwind_run j M (Sym.bit false :: (Nat.bits k).map Sym.bit ++ .R :: A) B N
        have hval : 2 ^ j * n - 1 = 2 ^ (j + 1) * k + (2 ^ j - 1) := by
          have h1 : 0 < 2 ^ j := by positivity
          have h2 : 2 ^ (j + 1) = 2 * 2 ^ j := by rw [Nat.pow_succ]; ring
          omega
        rw [hval] at hrun ⊢
        refine ⟨2 + (1 + j), ?_, ((Run.one hstep).trans (Run.one hstep2)).trans hrun⟩
        have hlen : 1 ≤ (Nat.bits n).length := by rw [hbits]; simp
        omega

/-- **The decrement**: `cw n ++ A → cw (n−1) ++ A` on stack a, stack b restored, in at most
3·|bits n| + 3 steps — linear in the WORD of the counter. -/
theorem cdFrag_runs (n : ℕ) (M A B N : List Sym) (h : 0 < n) :
    ∃ m ≤ 3 * (Nat.bits n).length + 3,
      cdFrag.Runs none (st M (cw n ++ A) B N) m (st M (cw (n - 1) ++ A) B N) := by
  have hstep : TM2.step cdM ⟨some .start, none, st M (cw n ++ A) B N⟩
      = some ⟨some .walk, none, st M ((Nat.bits n).map Sym.bit ++ .R :: A) (Sym.L :: B) N⟩ := by
    simp [cdM, TM2.step, TM2.stepAux, cw]
  obtain ⟨m, hm, hr⟩ := walk_run n M A B N h 0
  have e : 2 ^ 0 * n - 1 = n - 1 := by omega
  rw [e] at hr
  refine ⟨1 + m, ?_, Run.one hstep |>.trans hr⟩
  omega

theorem pushes_place {K : Type} {Γ : K → Type} {Λ Λ' σ : Type} (ι : Λ → Λ') (e : Option Λ')
    (q : TM2.Stmt Γ Λ σ) : pushes (place ι e q) = pushes q := by
  induction q with
  | push k f q ih => simp [place, pushes, ih]
  | peek k f q ih => simp [place, pushes, ih]
  | pop k f q ih => simp [place, pushes, ih]
  | load f q ih => simp [place, pushes, ih]
  | branch p q₁ q₂ ih₁ ih₂ => simp [place, pushes, ih₁, ih₂]
  | goto l => simp [place, pushes]
  | halt => cases e <;> simp [place, pushes]

theorem loop_growth_le {q : TM2.Stmt (fun _ : Stk => Sym) Unit (Option Sym)} {Bd : Fr} :
    Bd.growth ≤ (Frag.loop q Bd).growth := by
  unfold Frag.growth
  refine Finset.sup_le fun l _ => ?_
  exact (Finset.le_sup (f := fun l => pushes ((Frag.loop q Bd).m l))
    (show Sum.inr l ∈ Finset.univ by simp)).trans_eq
      (pushes_place Sum.inr (some (Sum.inl ())) (Bd.m l)).symm

private theorem iter_len_le (fbody : List Sym → List Sym) (hl : ∀ M, (fbody M).length ≤ M.length) :
    ∀ (i : ℕ) (X : List Sym), ((fbody^[i]) X).length ≤ X.length := by
  intro i
  induction i with
  | zero => intro X; simp
  | succ i ih =>
    intro X
    rw [Function.iterate_succ_apply]
    exact (hl _).trans (ih X)

private theorem id_iterate (i : ℕ) (X : List Sym) : (Function.id^[i]) X = X := by
  induction i with
  | zero => rfl
  | succ i ih => rw [Function.iterate_succ_apply]; exact ih

/-- **The per-iteration clock.** From any word X on the main stack, the flat counter cw n on
stack a and B0, N0 on the others: n rounds of the body (one per countdown step; the body may
change the main stack, a, b, cnt it leaves alone, never above its own start), the counter
ending at cw 0, in at most n·(3·|bits n| + 5 + tb) + 1 steps — polynomial in the VALUE n —
while every configuration of the run holds at most start + growth·(3·|bits n| + 3 + tb)
symbols — a ceiling that counts only the WORD ⌈log₂ n⌉ + 1 of the counter (plus the frame),
not the number of rounds. -/
theorem cdLoop_runsB (body : Fr) (fbody : List Sym → List Sym) {tb : ℕ}
    (hl : ∀ M, (fbody M).length ≤ M.length)
    (hb : ∀ M A B N, ∃ m ≤ tb, body.RunsB none (st M A B N) m (st (fbody M) A B N)
      (stkLen (st M A B N))) :
    ∀ (n : ℕ) (X B0 N0 : List Sym),
      ∃ m ≤ n * (3 * (Nat.bits n).length + 5 + tb) + 1,
        (cdLoop body).RunsB none (st X (cw n) B0 N0) m (st ((fbody^[n]) X) (cw 0) B0 N0)
          (stkLen (st X (cw n) B0 N0) + (cdFrag.seq body).growth * (3 * (Nat.bits n).length + 3 + tb)) := by
  intro n
  induction n with
  | zero =>
    intro X B0 N0
    have hb0 : (Nat.bits 0).length = 0 := by simp
    refine ⟨1, by omega, ?_⟩
    rw [cw_zero]
    exact Frag.loop_runs_exitB (headQ_zero X [] B0 N0) (by omega) (by omega)
  | succ n ih =>
    intro X B0 N0
    obtain ⟨b, rest, hbrest⟩ : ∃ b rest, Nat.bits (n + 1) = b :: rest := by
      cases hb1 : Nat.bits (n + 1) with
      | nil =>
        exfalso
        have hs : (Nat.bits (n + 1)).length = Nat.size (n + 1) := Nat.size_eq_bits_len _
        rw [hb1] at hs
        simp only [List.length_nil] at hs
        have := Nat.size_eq_zero.1 hs
        omega
      | cons b rest => exact ⟨b, rest, rfl⟩
    have hnpos : 0 < n + 1 := by omega
    have hcw : cw (n + 1) = .L :: Sym.bit b :: (rest.map Sym.bit ++ [.R]) := by
      rw [cw, hbrest]; simp
    have hh : TM2.stepAux headQ none (st X (cw (n + 1)) B0 N0)
        = ⟨some (), none, st X (cw (n + 1)) B0 N0⟩ := by
      rw [hcw]
      exact headQ_step b X (rest.map Sym.bit ++ [.R]) B0 N0
    obtain ⟨mc, hmc, hrcd⟩ := cdFrag_runs (n + 1) X [] B0 N0 hnpos
    rw [List.append_nil, Nat.add_sub_cancel] at hrcd
    obtain ⟨mb, hmb, hrbB⟩ := hb X (cw n) B0 N0
    have hrb := hrbB.runs
    have hseq := (Frag.seq_runs hrcd hrb).toB
    have hbl : (Nat.bits n).length ≤ (Nat.bits (n + 1)).length := by
      rw [Nat.size_eq_bits_len, Nat.size_eq_bits_len]
      exact Nat.size_le_size (by omega)
    have hsz : Nat.size n ≤ Nat.size (n + 1) := Nat.size_le_size (by omega)
    have hseqB := hseq.mono (by omega)
    obtain ⟨mi, hmi, hri⟩ := ih (fbody X) B0 N0
    rw [Function.iterate_succ_apply']
    have hceil : stkLen (st (fbody X) (cw n) B0 N0)
          + (cdFrag.seq body).growth * (3 * (Nat.bits n).length + 3 + tb)
        ≤ stkLen (st X (cw (n + 1)) B0 N0)
          + (cdFrag.seq body).growth * (3 * (Nat.bits (n + 1)).length + 3 + tb) := by
      rw [stkLen_st, stkLen_st, cw_length, cw_length]
      have hX := hl X
      have hcl := cw_length_mono (by omega : n ≤ n + 1)
      omega
    have hri' := hri.mono hceil
    refine ⟨1 + (mc + mb) + mi, ?_, Frag.loop_runs_iterB hh (by omega) hseqB hri'⟩
    have hmul : n * (3 * (Nat.bits n).length + 5 + tb)
        ≤ n * (3 * (Nat.bits (n + 1)).length + 5 + tb) := Nat.mul_le_mul_left _ (by omega)
    omega

/-- The value-time / word-space discipline (prework §5, L2): one fragment computes f from the
word of x on the main stack and the flat counter cw nb on stack a (b and cnt empty), in at most
ct (len x + nb) steps — the bound counts the VALUE nb — while every configuration of the run
holds at most cs (len x + nb.size) symbols — the bound counts the WORD of nb — and the word of
the result is at most cs (len x + nb.size) symbols. -/
def PolyTVal {α β : Type} [Enc α] [Enc β] (f : α → ℕ → β) : Prop :=
  ∃ (P : Fr) (ct cs : ℕ → ℕ), PB ct ∧ PB cs ∧
    (∀ (x : α) (nb : ℕ),
      ∃ m ≤ ct (len x + nb),
        P.RunsB none (st (wd x) (cw nb) [] []) m (st (wd (f x nb)) (cw 0) [] [])
          (cs (len x + Nat.size nb))) ∧
    ∀ x nb, len (f x nb) ≤ cs (len x + Nat.size nb)

private theorem bound16 (l nb : ℕ) : nb * (3 * nb + 6) + 1 ≤ 16 * (l + nb + 1) ^ 16 := by
  have h0 : (nb + 1) ^ 2 ≤ (l + nb + 1) ^ 2 := Nat.pow_le_pow_left (by omega) 2
  have h1 : 5 * (nb + 1) ^ 2 ≤ 5 * (l + nb + 1) ^ 2 := Nat.mul_le_mul_left _ h0
  have h2 : 5 * (l + nb + 1) ^ 2 ≤ 16 * (l + nb + 1) ^ 16 := by
    have hp : (l + nb + 1) ^ 2 ≤ (l + nb + 1) ^ 16 :=
      Nat.pow_le_pow_right (by omega) (by omega)
    calc 5 * (l + nb + 1) ^ 2 ≤ 16 * (l + nb + 1) ^ 2 :=
          Nat.mul_le_mul_right _ (by omega)
    _ ≤ 16 * (l + nb + 1) ^ 16 := Nat.mul_le_mul_left _ hp
  have h3 : nb * (3 * nb + 6) + 1 ≤ 5 * (nb + 1) ^ 2 := by
    have e : 5 * (nb + 1) ^ 2 = nb * (3 * nb + 6) + (2 * nb * nb + 4 * nb + 4) := by ring
    have h4 : 0 ≤ 2 * nb * nb + 4 * nb + 4 := Nat.zero_le _
    omega
  omega

private theorem boundW (g l s : ℕ) :
    l + s + 2 + g * (3 * s + 4) ≤ (4 * g + 16) * (l + s + 1) ^ (4 * g + 16) := by
  have hp : (l + s + 1) ^ 2 ≤ (l + s + 1) ^ (4 * g + 16) :=
    Nat.pow_le_pow_right (by omega) (by omega)
  have h1 : l + s + 1 ≤ (l + s + 1) ^ 2 := by
    have h11 : (l + s + 1) ^ 1 = l + s + 1 := Nat.pow_one _
    have h12 : (l + s + 1) ^ 1 ≤ (l + s + 1) ^ 2 := Nat.pow_le_pow_right (by omega) (by omega)
    omega
  have key : l + s + 2 + g * (3 * s + 4) ≤ (4 * g + 16) * (l + s + 1) ^ 2 := by
    have e0 : g * (3 * s + 4) ≤ g * (3 * (l + s) + 4) := Nat.mul_le_mul_left _ (by omega)
    have e1 : g * (3 * (l + s) + 4) = 3 * (g * (l + s)) + 4 * g := by ring
    have e2 : (4 * g + 16) * (l + s + 1)
        = 4 * (g * (l + s)) + 16 * (l + s) + (4 * g + 16) := by ring
    have hle : l + s + 2 + (3 * (g * (l + s)) + 4 * g)
        ≤ (4 * g + 16) * (l + s + 1) := by
      rw [e2]
      omega
    have hbase : (4 * g + 16) * (l + s + 1) ≤ (4 * g + 16) * (l + s + 1) ^ 2 :=
      Nat.mul_le_mul_left _ h1
    calc l + s + 2 + g * (3 * s + 4) ≤ l + s + 2 + (3 * (g * (l + s)) + 4 * g) := by
          rw [← e1]; exact Nat.add_le_add_left e0 _
    _ ≤ (4 * g + 16) * (l + s + 1) := hle
    _ ≤ (4 * g + 16) * (l + s + 1) ^ 2 := hbase
  calc l + s + 2 + g * (3 * s + 4) ≤ (4 * g + 16) * (l + s + 1) ^ 2 := key
  _ ≤ (4 * g + 16) * (l + s + 1) ^ (4 * g + 16) := Nat.mul_le_mul_left _ hp

/-- The trivial body: one step, everything unchanged. -/
def skipF : Fr := Frag.ofStmt .halt

theorem skipF_runs (M A B N : List Sym) : skipF.Runs none (st M A B N) 1 (st M A B N) :=
  Frag.ofStmt_runs rfl

theorem skipF_runsB (M A B N : List Sym) :
    skipF.RunsB none (st M A B N) 1 (st M A B N) (stkLen (st M A B N)) := by
  have hstep : TM2.step skipF.m ⟨some (), none, st M A B N⟩
      = some ⟨none, none, st M A B N⟩ := by
    simp [skipF, Frag.ofStmt, place, TM2.step, TM2.stepAux]
  exact ⟨le_rfl, _, hstep, rfl, le_rfl⟩

/-- **A first PolyTVal certificate: identity through the clock.** The countdown loop with the
trivial body consumes the counter (cw 0 = [L, R] remains) and returns the word of x unchanged,
in at most 16·(len x + nb + 1)^16 steps — polynomial in the VALUE nb — while never holding
more than (4g+16)·(len x + nb.size + 1)^(4g+16) symbols, g the loop's growth — polynomial in
the WORD of nb. Every PolyTVal certificate over the counter combinators has this shape: the
countdown supplies the value-bounded loop, the body the round's work. -/
theorem polyTVal_id {α : Type} [Enc α] : PolyTVal (fun (x : α) (_ : ℕ) => x) := by
  refine ⟨cdLoop skipF, fun s => 16 * (s + 1) ^ 16,
    fun s => (4 * (cdLoop skipF).growth + 16) * (s + 1) ^ (4 * (cdLoop skipF).growth + 16),
    (PB.const 16).mul ((PB.id'.add (PB.const 1)).pow 16), ?_, ?_, ?_⟩
  · exact (PB.const (4 * (cdLoop skipF).growth + 16)).mul
      ((PB.id'.add (PB.const 1)).pow (4 * (cdLoop skipF).growth + 16))
  · intro x nb
    obtain ⟨m, hm, hrun⟩ := cdLoop_runsB skipF id (fun M : List Sym => le_rfl)
      (fun M A B N => ⟨1, le_rfl, skipF_runsB M A B N⟩) nb (wd x) [] []
    rw [show 3 * (Nat.bits nb).length + 5 + 1 = 3 * (Nat.bits nb).length + 6 from by omega,
      show 3 * (Nat.bits nb).length + 3 + 1 = 3 * (Nat.bits nb).length + 4 from by omega,
      id_iterate] at hrun
    refine ⟨m, ?_, hrun.mono ?_⟩
    · have hbl : (Nat.bits nb).length ≤ nb := bits_len_le nb
      have h1 : m ≤ nb * (3 * (Nat.bits nb).length + 6) + 1 := by omega
      have h2 : nb * (3 * (Nat.bits nb).length + 6) + 1 ≤ nb * (3 * nb + 6) + 1 :=
        Nat.mul_le_mul_left _ (by omega)
      exact (h1.trans h2).trans (bound16 (len x) nb)
    · have hg : (cdFrag.seq skipF).growth ≤ (cdLoop skipF).growth := loop_growth_le
      have hce : stkLen (st (wd x) (cw nb) [] [])
          + (cdLoop skipF).growth * (3 * (Nat.bits nb).length + 4)
          ≤ (4 * (cdLoop skipF).growth + 16) * (len x + Nat.size nb + 1)
            ^ (4 * (cdLoop skipF).growth + 16) := by
        rw [stkLen_st, cw_length, Nat.size_eq_bits_len]
        rw [show (wd x).length = len x from rfl]
        have e2 := boundW (cdLoop skipF).growth (len x) (Nat.size nb)
        omega
      have hce' : stkLen (st (wd x) (cw nb) [] [])
          + (cdFrag.seq skipF).growth * (3 * (Nat.bits nb).length + 4) ≤
          stkLen (st (wd x) (cw nb) [] [])
          + (cdLoop skipF).growth * (3 * (Nat.bits nb).length + 4) :=
        Nat.add_le_add_left (Nat.mul_le_mul_right _ hg) _
      exact hce'.trans hce
  · intro x nb
    have h1 : 0 < 4 * (cdLoop skipF).growth + 16 := by omega
    have h2 : len x + Nat.size nb + 1
        ≤ (len x + Nat.size nb + 1) ^ (4 * (cdLoop skipF).growth + 16) := by
      calc len x + Nat.size nb + 1 = (len x + Nat.size nb + 1) ^ 1 := rfl
      _ ≤ (len x + Nat.size nb + 1) ^ (4 * (cdLoop skipF).growth + 16) :=
          Nat.pow_le_pow_right (by omega) (by omega)
    have h3 : len x + Nat.size nb + 1
        ≤ (4 * (cdLoop skipF).growth + 16) * (len x + Nat.size nb + 1)
            ^ (4 * (cdLoop skipF).growth + 16) :=
      h2.trans (Nat.le_mul_of_pos_right _ (Nat.pow_pos (by omega)))
    omega

/-- The countdown's round count is L1's cut: started from `cw (min q nb)` the loop runs exactly
`min q nb` rounds — the `loopC` discipline of the prework (§3): the enumeration
0, …, min q nb − 1, value-bounded in time, word-bounded in space, nothing built. -/
theorem countdown_cut (q nb : ℕ) (X : List Sym) :
    ∃ m ≤ min q nb * (3 * (Nat.bits (min q nb)).length + 6) + 1,
      (cdLoop skipF).Runs none (st X (cw (min q nb)) [] []) m (st X (cw 0) [] []) := by
  obtain ⟨m, hm, hrun⟩ := cdLoop_runsB skipF id (fun M : List Sym => le_rfl)
    (fun M A B N => ⟨1, le_rfl, skipF_runsB M A B N⟩) (min q nb) X [] []
  rw [id_iterate] at hrun
  exact ⟨m, by omega, hrun.runs⟩

end Groundwork.Counted

#print axioms Groundwork.Counted.cdFrag_runs
#print axioms Groundwork.Counted.cdLoop_runsB
#print axioms Groundwork.Counted.PolyTVal
#print axioms Groundwork.Counted.polyTVal_id
#print axioms Groundwork.Counted.countdown_cut
