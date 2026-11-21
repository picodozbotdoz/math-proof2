/- Statement elaboration probe — not a proof artifact.
   Pilot 12 CORE day-1 STAGED scaffold (z4-parametric-savings; iter-6 day-1 item,
   STAGED UNFIRED per the launch-order pattern — zero fires before the iter-6
   orchestrator's day-1 signal). Base = the P0 GREEN statement surface verbatim
   (`P0.lean` sha 3d924056ed4c3e2c, run-2 PROBE-OK rc=0 errors=0 sorry=7,
   `logs/p0-runs1-2.log`) + the three core-target stubs (Part 4). Contents:
   (0) donor shapes ported VERBATIM from anthropics-formal-math/3sum-apsp (v4.33
       statements, the ProbeB3 statement-port class — measured corpus-wide free);
   (1) the two donor route lemmas restated at the frozen `strassen` fiber;
   (2) the MM-generalized statement set: `WordRamMMData` + `EpsData` (ε as DATA, the
       three dossier properties as explicit hypothesis fields) + the parametric
       conclusion `Claim.Theorem_19_explicit M (ε ωb) (e ωb)` at abstract MM —
       hypothesis-binder pattern throughout (donor theorems appear ONLY as explicit
       Prop binders; no cross-project import);
   (3) the flagged F5 check as a P0 consumer: balance-point monotonicity in ω_b from
       the Sec-4 general inputs (`sec4_Rc_strictAntiOn` / `sec4_Rc_zero_tendsto`
       statement shapes as binders) — preflight :60–68, :88–92: this statement's
       elaboration is the first real evidence on the F5 risk.
   SORRY POLICY: every `sorry` below is a statement-shape stub inside this
   probe-convention header — NOT a proof artifact; verdicts are elaboration verdicts
   only (AGENTS.md probe convention). Expected sorry count: 10
       (7 inherited P0 stubs + 3 core-target stubs; day-1 GREEN shape =
       `PROBE-OK rc=0 errors=0 sorry=10`).
   RESUME ADDENDUM (2026-11-21, the closing batch): expected sorry count 7
    (route16_MMgeneral CLOSED in Part 3e — moved there so it can consume the Part 3d
    port; ChoiceSumInputs DISCHARGED in Part 3d). Two interface corrections of record:
    (i) `ChoiceSumInputs.scans_le` gains the donor's `Real.log n ≤ Λ` hypothesis — the
    landed field was FALSE as stated (at Λ = 1, κ = 1 it demands log n ≤ 1);
    (ii) `route16_MMgeneral`/`parametric_main` gain the ε-fiber binders `hδ`/`he` —
    the stubbed unconditional conclusion at `(E.ε W.ωb, E.e W.ωb)` was FALSE (the
    Corollary-16 route is frozen at 0.437/0.063, capping deliverable savings at
    0.0315/18 = 0.00175 with a log¹ floor; a decreasing ε demands more exactly when
    W.ωb < log₂ 7) — the charter-input §2 rescope shape ("the EpsData-binder
    statements already support exactly that fallback"). Full statement in Part 3e.
DOSSIER WORDING FLAG (found at staging, 2026-11-20): dossier 12
   (`candidates/12-z4-parametric-savings-function-in-matrix-exponent.md`) says
   "strictly increasing ε(ω_b)" while its own headline reads ε(9/4) > 0.0017 with
   9/4 = 2.25 < log₂ 7 ≈ 2.8074; both hold only for ε strictly DECREASING in ω_b
   (better MM = smaller ω = larger savings; ε → 0 as ω → 3). This P0 states the
   decreasing form (`StrictAntiOn`); the dossier wording is a charter-time
   correction, flagged in P0-record.md.
   Elaborated against mathlib v4.36.0-rc2 @ ff2494ea via Modal only (never locally).
-/
import Mathlib

namespace CrossMath.Pilot12P0

open Real

noncomputable section

/-! ## Part 0a — donor shapes: the abstract time model and the Sec-3 claims
Verbatim from `ThreeSumApsp/TimeClaims/Sec3/Definitions.lean` (v4.33; source lines in
each docstring) + the parameter plumbing of `ThreeSumApsp/Sec3/Parameters.lean`. -/

/-- VERBATIM `TimeClaims/Sec3/Definitions.lean:75` (docstrings shortened): the
abstract "solved in time T" carrier — one predicate field per problem of §§2–4. -/
structure DetTimeModel where
  thinProduct : (ℕ → ℕ → ℕ → ℝ → ℝ) → Prop
  lopCount : (ℕ → ℕ → ℕ → ℝ) → Prop
  lopDetect : (ℕ → ℕ → ℕ → ℝ) → Prop
  exactTriangle : (ℕ → ℝ → ℝ) → Prop
  negativeTriangle : (ℕ → ℝ → ℝ) → Prop
  convolution3SUM : (ℕ → ℝ → ℝ) → Prop
  threeSum : (ℕ → ℝ → ℝ) → Prop
  minPlusProduct : (ℕ → ℝ → ℝ) → Prop
  apsp : (ℕ → ℝ → ℝ) → Prop

/-- VERBATIM `Definitions.lean:113` — the bound of Theorem 5 / Corollary 15 first case. -/
noncomputable abbrev thinBound (n D : ℕ) : ℝ :=
  (n : ℝ) ^ 2 * Real.log D ^ 2 / (D : ℝ) ^ (1 / 18 : ℝ)

/-- VERBATIM `Definitions.lean:117` — the bound of Corollary 15 general case. -/
noncomputable abbrev splitBound (n D w : ℕ) : ℝ :=
  ((n : ℝ) ^ 2 + (w : ℝ) * Real.sqrt D) * Real.log D ^ 2 / (D : ℝ) ^ (1 / 18 : ℝ)

/-- VERBATIM `Definitions.lean:121` — the bound of Corollaries 16 and 26. -/
noncomputable abbrev wantedBound (n D w : ℕ) : ℝ :=
  (w : ℝ) * (D : ℝ) ^ (0.437 : ℝ) + (n : ℝ) ^ 2 / (D : ℝ) ^ (0.063 : ℝ)

/-- VERBATIM `Util/Log.lean:104`. -/
noncomputable def logU (u : ℝ) : ℝ := Real.log (max u 2)

/-- VERBATIM `PaperStatements.lean:876` — `n²/√D` floored. -/
noncomputable def queryCap (n D : ℕ) : ℕ := ⌊(n : ℝ) ^ 2 / Real.sqrt D⌋₊

/-- VERBATIM `Sec3/Parameters.lean:60` — Theorem 17's first additional term. -/
noncomputable def termScans (n g : ℕ) (κ : ℝ) : ℝ := κ * (n : ℝ) ^ 3 * Real.log n / (g : ℝ)

/-- VERBATIM `Sec3/Parameters.lean:66` — Theorem 17's second additional term
`n^{ω+o(1)} D^{3/2}`; `MM n` is the MM cost function. THE ANCHOR of the flagged
monotonicity check (preflight :64–68): the demand side `ω_b` enters here. -/
noncomputable def termPrime (MM : ℕ → ℝ) (n D : ℕ) : ℝ := MM n * (D : ℝ) ^ (3 / 2 : ℝ)

/-- VERBATIM `Sec3/Parameters.lean:70` — Theorem 17's third additional term. -/
noncomputable def termBuild (n D g : ℕ) : ℝ := (n : ℝ) ^ 2 * (D : ℝ) * (g : ℝ)

/-- VERBATIM `Sec3/Parameters.lean:73` — the frozen MM instance: `n^{log₂ 7}`. -/
noncomputable def strassen (n : ℕ) : ℝ := (n : ℝ) ^ Real.logb 2 7

/-- VERBATIM `Sec3/Parameters.lean:78` — route 15's D: largest power of 4 ≤ n^{1/18}. -/
noncomputable def paramD₅ (n : ℕ) : ℕ := 4 ^ Nat.log 4 ⌊(n : ℝ) ^ (1 / 18 : ℝ)⌋₊

/-- VERBATIM `Sec3/Parameters.lean:83` — route 15's g: `⌈D^{1/36}⌉`. -/
noncomputable def paramG₅ (n : ℕ) : ℕ := ⌈(paramD₅ n : ℝ) ^ (1 / 36 : ℝ)⌉₊

/-- VERBATIM `Sec3/Parameters.lean:86` — route 16's D: `⌊n^{1/18}⌋`. -/
noncomputable def paramD₂₆ (n : ℕ) : ℕ := ⌊(n : ℝ) ^ (1 / 18 : ℝ)⌋₊

/-- VERBATIM `Sec3/Parameters.lean:89` — route 16's g: `⌈D^{0.0315}⌉`. -/
noncomputable def paramG₂₆ (n : ℕ) : ℕ := ⌈(paramD₂₆ n : ℝ) ^ (0.0315 : ℝ)⌉₊

/-- VERBATIM `Sec3/Parameters.lean:93`. -/
noncomputable def splitCap (n D : ℕ) : ℕ := max 1 (queryCap n D)

namespace Claim

/-- VERBATIM `TimeClaims/Sec3/Definitions.lean:178–199` (docstring shortened): the
Theorem-17 transfer claim. NOTE the `MM : ℕ → ℝ` parameter — the abstraction this
pilot generalizes; the donor instantiates it exactly twice, both at `strassen`. -/
def Theorem_17 (M : DetTimeModel) (MM : ℕ → ℝ) (D g : ℕ → ℕ) : Prop :=
  ∃ C : ℝ, 0 ≤ C ∧ ∀ T : ℕ → ℕ → ℕ → ℝ, M.lopDetect T →
    ∃ T' : ℕ → ℝ → ℝ, M.exactTriangle T' ∧
      ∀ (n : ℕ) (κ u : ℝ), 16 ≤ D n → D n ≤ n → 1 ≤ g n → (g n : ℝ) ≤ Real.sqrt (D n) → 1 ≤ κ →
        u ≤ (n : ℝ) ^ κ →
        T' n u ≤ 4 * (n : ℝ) * (g n : ℝ) *
            (T n (D n) (queryCap n (D n)) + C * ((n : ℝ) ^ 2 / Real.sqrt (D n))) +
          C * (termScans n (g n) κ + termPrime MM n (D n) + termBuild n (D n) (g n))

/-- VERBATIM `Definitions.lean:277` — Corollary 15, first case. -/
def Corollary_15_first (M : DetTimeModel) : Prop :=
  ∃ (C : ℝ) (Tc Td : ℕ → ℕ → ℕ → ℝ), 0 ≤ C ∧ M.lopCount Tc ∧ M.lopDetect Td ∧
    ∀ n D w : ℕ, (∃ k : ℕ, D = 4 ^ k) → 4 ≤ D → D ^ 18 ≤ n → (w : ℝ) ≤ (n : ℝ) ^ 2 / Real.sqrt D →
      Tc n D w ≤ C * thinBound n D ∧ Td n D w ≤ C * thinBound n D

/-- VERBATIM `Definitions.lean:295` — Corollary 16. -/
def Corollary_16 (M : DetTimeModel) : Prop :=
  ∃ (C : ℝ) (Tc Td : ℕ → ℕ → ℕ → ℝ), 0 ≤ C ∧ M.lopCount Tc ∧ M.lopDetect Td ∧
    ∀ n D w : ℕ, 1 ≤ D → D ^ 18 ≤ n →
      Tc n D w ≤ C * wantedBound n D w ∧ Td n D w ≤ C * wantedBound n D w

/-- VERBATIM `Definitions.lean:305–308` — the explicit-claim shape the parametric
theorem concludes at: `K κ n^{3−δ} (log n)^e`. -/
def Theorem_19_explicit (M : DetTimeModel) (δ : ℝ) (e : ℕ) : Prop :=
  ∃ (K : ℝ) (T : ℕ → ℝ → ℝ), M.exactTriangle T ∧
    ∀ (n : ℕ) (κ u : ℝ), 16 ^ 18 ≤ n → 1 ≤ κ → u ≤ (n : ℝ) ^ κ →
      T n u ≤ K * (κ * ((n : ℝ) ^ (3 - δ) * Real.log n ^ e))

end Claim

/-! ## Part 0b — donor shapes: the Sec-4 trade-off data and the Choice class
Verbatim from the root `PaperStatements.lean` (:2006–2027) and
`Sec3/Theorem19/Choice.lean:38` — the objects the flagged monotonicity check
revolves around (preflight :60–68, dossier F5). -/

/-- VERBATIM `PaperStatements.lean:2006`. -/
noncomputable def entropy (θ : ℝ) : ℝ := -θ * Real.log θ - (1 - θ) * Real.log (1 - θ)

/-- VERBATIM `PaperStatements.lean:2011` — equation (11)'s denominator `ln Λ`. -/
noncomputable def lnΛ (c γ : ℝ) : ℝ :=
  c * Real.log 10 - (1 / 2) * c * entropy (1 / c) - (c - 1) * Real.log 3 + γ * Real.log 4

/-- VERBATIM `PaperStatements.lean:2015` — equation (11): `R_c(γ) := ln 4 / ln Λ`. -/
noncomputable def Rc (c γ : ℝ) : ℝ := Real.log 4 / lnΛ c γ

/-- VERBATIM `PaperStatements.lean:2018` — Section 4.1: `ε* := ln 4 / (5 ln 10)`. -/
noncomputable def epsStar : ℝ := Real.log 4 / (5 * Real.log 10)

/-- VERBATIM `PaperStatements.lean:2021`. -/
noncomputable def rhoC (c : ℝ) : ℝ := 9 / (c - 1)

/-- VERBATIM `PaperStatements.lean:2024`. -/
noncomputable def gammaOf (c θ : ℝ) : ℝ := θ * Real.log (1 / rhoC c) / Real.log 4

/-- VERBATIM `PaperStatements.lean:2027`. -/
noncomputable def qOf (θ : ℝ) : ℝ := (entropy θ + θ * Real.log 9) / Real.log 4

namespace Theorem19

/-- VERBATIM `Sec3/Theorem19/Choice.lean:38` (docstrings shortened): the choice class
both frozen parameter pairs satisfy — what an ω_b-dependent symbolic choice must
re-provide (`choice_theorem_5` / `choice_corollary_26` discharge it at the frozen
params). -/
structure Choice (n D : ℕ) (η c : ℝ) : Prop where
  sixteen_le : 16 ≤ D
  le_root : (D : ℝ) ≤ (n : ℝ) ^ (1 / 18 : ℝ)
  root_div_le : (n : ℝ) ^ (1 / 18 : ℝ) / c ≤ (D : ℝ)
  c_pos : 0 < c
  η_nonneg : 0 ≤ η
  η_le : η ≤ 1 / 4

end Theorem19

/-! ## Part 1 — the two donor routes, restated at the frozen `strassen` fiber
The donor's own theorems `Theorem19.explicit_of_theorem_17_corollary_15/16`
(`TimeClaims/Sec3/Theorem19.lean:85/:107`), as stubs: pins that the ported shapes
compose to the donor's route shapes verbatim. -/

/-- Donor route 15 restated (stub): Theorem_17 at `strassen` + Corollary 15 first
case ⇒ Theorem_19_explicit at the frozen (1/648, 2). -/
theorem route15_frozen (M : DetTimeModel)
    (h17 : Claim.Theorem_17 M strassen paramD₅ paramG₅)
    (h15 : Claim.Corollary_15_first M) :
    Claim.Theorem_19_explicit M (1 / 648) 2 := by
  sorry -- P0 stub

/-- Donor route 16 restated (stub): Theorem_17 at `strassen` + Corollary 16 ⇒
Theorem_19_explicit at the frozen (0.00175, 1). -/
theorem route16_frozen (M : DetTimeModel)
    (h17 : Claim.Theorem_17 M strassen paramD₂₆ paramG₂₆)
    (h16 : Claim.Corollary_16 M) :
    Claim.Theorem_19_explicit M 0.00175 1 := by
  sorry -- P0 stub

/-! ## Part 2 — the MM-generalized statement set (hypothesis-binder pattern) -/

/-- The abstract MM parameter class: a ring-operation cost function with a word-RAM
exponent in the dossier's band (2, 2.9] — the demand-side parameter the frozen
routes instantiate twice at `strassen` (ω = log₂ 7 ≈ 2.8074). -/
structure WordRamMMData where
  /-- the cost function, fed to `Claim.Theorem_17`'s `MM` slot. -/
  MM : ℕ → ℝ
  /-- the exponent: `MM n ≤ C · n ^ ωb` for all n ≥ 1. -/
  ωb : ℝ
  nonneg : ∀ n, 0 ≤ MM n
  grows : ∃ C : ℝ, 1 ≤ C ∧ ∀ n : ℕ, 1 ≤ n → MM n ≤ C * (n : ℝ) ^ ωb
  two_lt : 2 < ωb
  le_band : ωb ≤ 2.9

/-- The parametric savings function as DATA — the three dossier properties as
explicit hypothesis fields, so the P0 pins that the parametric statement closes
WITHOUT committing to ε's closed form (preflight §5.2). NOTE `strict_anti` is the
DECREASING form: see the header's dossier-wording flag (ε(9/4) > ε(log₂ 7) = 0.00175
needs 9/4 < log₂ 7 on the decreasing branch; ε → 0 as ω → 3). -/
structure EpsData where
  ε : ℝ → ℝ
  e : ℝ → ℕ
  frozen_fiber : ε (Real.logb 2 7) = 0.00175
  strict_anti : StrictAntiOn ε (Set.Ioc 2 2.9)
  limit_three : Filter.Tendsto ε (nhdsWithin 3 (Set.Iio 3)) (nhds 0)

/-- Route 15 at abstract MM (stub): same shape as `route15_frozen` with the `MM`
slot freed; the conclusion at the ε-fiber of W's exponent. -/
theorem route15_MMgeneral (M : DetTimeModel) (W : WordRamMMData) (E : EpsData)
    (h17 : Claim.Theorem_17 M W.MM paramD₅ paramG₅)
    (h15 : Claim.Corollary_15_first M) :
    Claim.Theorem_19_explicit M (E.ε W.ωb) (E.e W.ωb) := by
  sorry -- P0 stub

/- Route 16 at abstract MM — CLOSED 2026-11-21 (Part 3e, with the ε-fiber binders
`hδ`/`he` — the amendment of record; this Part-2 stub location can't hold the proof
because it precedes the Part 3d Choice-calculus port it consumes). -/


/-- The symbolic re-instantiation shape (stub): D and g ALSO abstract, with the
`Theorem19.Choice` family as an explicit binder — the hypotheses the frozen
`choice_theorem_5`/`choice_corollary_26` discharge at the frozen params and the
ω_b-dependent choice must re-provide (dossier route step 1). -/
theorem route16_symbolic (M : DetTimeModel) (W : WordRamMMData) (E : EpsData)
    (D g : ℕ → ℕ) (η : ℕ → ℝ) (c : ℝ)
    (hchoice : ∀ n : ℕ, 16 ^ 18 ≤ n →
      Theorem19.Choice n (D n) (η n) c ∧ g n = ⌈(D n : ℝ) ^ (η n)⌉₊)
    (h17 : Claim.Theorem_17 M W.MM D g)
    (h16 : Claim.Corollary_16 M) :
    Claim.Theorem_19_explicit M (E.ε W.ωb) (E.e W.ωb) := by
  sorry -- P0 stub

end

end CrossMath.Pilot12P0

/-! ## Part 0c / 2c — the openai side, citation-quality (ProbeC2 verbatim)
`OAI/LinearAlgebra/MatrixMultiplication/Model.lean:88–101` API, verbatim from the
probe `research/feasibility/probe/ProbeC2_OAI_Model.lean` (elaborated 0 errors /
0 warnings on this pin at probe time). Enters the pilot ONLY as a hypothesis —
zero OAI import, zero closure (preflight §2). -/

namespace OAI

noncomputable section

open scoped BigOperators

namespace MatrixMultiplication.Arithmetic

inductive Gate (F Input Register : Type*) where
  | constant : F → Gate F Input Register
  | input : Input → Gate F Input Register
  | add : Register → Register → Gate F Input Register
  | sub : Register → Register → Gate F Input Register
  | mul : Register → Register → Gate F Input Register

namespace Gate

variable {F Input Register : Type*}

def eval [Field F] (inputs : Input → F) (registers : Register → F) :
    Gate F Input Register → F
  | .constant z => z
  | .input i => inputs i
  | .add i j => registers i + registers j
  | .sub i j => registers i - registers j
  | .mul i j => registers i * registers j

def cost : Gate F Input Register → ℕ
  | .constant _ => 0
  | .input _ => 0
  | .add _ _ => 1
  | .sub _ _ => 1
  | .mul _ _ => 1

end Gate

inductive Program (F Input : Type*) : ℕ → Type _ where
  | nil : Program F Input 0
  | step {r : ℕ} : Program F Input r → Gate F Input (Fin r) → Program F Input (r + 1)

namespace Program

variable {F Input : Type*}

def eval [Field F] : {r : ℕ} → Program F Input r → (Input → F) → Fin r → F
  | 0, .nil, _ => Fin.elim0
  | _ + 1, .step p g, inputs =>
    Fin.cases (g.eval inputs (p.eval inputs)) (p.eval inputs)

def cost : {r : ℕ} → Program F Input r → ℕ
  | 0, .nil => 0
  | _ + 1, .step p g => p.cost + g.cost

end Program

abbrev MatrixInput (a b c : ℕ) := (Fin a × Fin b) ⊕ (Fin b × Fin c)

def matrixInputs {F : Type*} {a b c : ℕ}
    (A : Matrix (Fin a) (Fin b) F) (B : Matrix (Fin b) (Fin c) F) :
    MatrixInput a b c → F
  | .inl (i, j) => A i j
  | .inr (j, k) => B j k

structure MatrixAlgorithm (F : Type*) (a b c : ℕ) where
  registers : ℕ
  program : Program F (MatrixInput a b c) registers
  output : Fin a → Fin c → Fin registers

namespace MatrixAlgorithm

variable {F : Type*} [Field F] {a b c : ℕ}

def eval (P : MatrixAlgorithm F a b c)
    (A : Matrix (Fin a) (Fin b) F) (B : Matrix (Fin b) (Fin c) F) :
    Matrix (Fin a) (Fin c) F :=
  fun i k => P.program.eval (matrixInputs A B) (P.output i k)

def Correct (P : MatrixAlgorithm F a b c) : Prop :=
  ∀ (A : Matrix (Fin a) (Fin b) F) (B : Matrix (Fin b) (Fin c) F), P.eval A B = A * B

def cost (P : MatrixAlgorithm F a b c) : ℕ := P.program.cost

end MatrixAlgorithm

/-- VERBATIM `Model.lean:92–96` — the cited API surface the flagship hypothesis
consumes. -/
def AdmissibleExponent (F : Type*) [Field F] (τ : ℝ) : Prop :=
  ∀ ε : ℝ, 0 < ε → ∃ C : ℝ, 0 < C ∧
    ∀ n : ℕ, 1 ≤ n → ∃ P : MatrixAlgorithm F n n n,
      P.Correct ∧ (P.cost : ℝ) ≤ C * (n : ℝ) ^ (τ + ε)

/-- VERBATIM `Model.lean:98`. -/
def omega (F : Type*) [Field F] : ℝ := sInf {τ : ℝ | AdmissibleExponent F τ}

end MatrixMultiplication.Arithmetic

end

end OAI

namespace CrossMath.Pilot12P0

noncomputable section

/-- The flagship corollary, hypothesis-explicit (stub): F3b — the model-gap transfer
lemma (arithmetic-ℂ admissible exponents ⇒ word-RAM MM realizations) — rides as a
binder, per the dossier's "without F3b, ship the core standalone and the corollary
as a hypothesis-explicit statement". The conclusion: some word-RAM MM strictly above
the frozen fiber's savings, with the explicit theorem at that fiber. -/
theorem flagship_shape (M : DetTimeModel) (E : EpsData)
    (hcore : ∀ W : WordRamMMData, Claim.Corollary_16 M →
      Claim.Theorem_17 M W.MM paramD₂₆ paramG₂₆ →
      Claim.Theorem_19_explicit M (E.ε W.ωb) (E.e W.ωb))
    (h16 : Claim.Corollary_16 M)
    (hF3b : ∀ ε' : ℝ, 0 < ε' → ∃ W : WordRamMMData,
      W.ωb ≤ 9 / 4 + ε' ∧ Claim.Theorem_17 M W.MM paramD₂₆ paramG₂₆) :
    ∃ W : WordRamMMData, 0.00175 < E.ε W.ωb ∧
      Claim.Theorem_19_explicit M (E.ε W.ωb) (E.e W.ωb) := by
  sorry -- P0 stub

/-! ## Part 3 — the flagged F5 check as a P0 consumer (preflight :60–68, :83–92)
Balance-point monotonicity in ω_b from the Sec-4 general inputs ALONE: `hAnti` is
the general form of `sec4_Rc_strictAntiOn` (`Sec4/Corollary31/Limit.lean:132`), `hZero`
the shape of `sec4_Rc_zero_tendsto` (`Limit.lean:148`) — both as binders over an
abstract Rc-data function; `hbal` realizes the savings at the balance point in the
corpus's own switching-order vocabulary (`gammaOf c θ = κ − qOf θ`, root
`PaperStatements.lean:2068`), with ω_b entering the demand budget `κ` monotonically
(`hκ`) through `termPrime`'s `MM n · D^{3/2}`. THE ELABORATION of this statement —
not its provability — is the P0 evidence; whether `hAnti`/`hZero` SUFFICE is the
open F5 question (the rescope trigger if they do not). -/

theorem balancePoint_monotone_shape
    (RcF : ℝ → ℝ → ℝ) (epsStarF : ℝ)
    (hAnti : ∀ γ : ℝ, 0 ≤ γ → StrictAntiOn (fun c : ℝ => RcF c γ) (Set.Ici 10))
    (hZero : Filter.Tendsto (fun c : ℝ => RcF c 0) (nhdsWithin 10 (Set.Ioi 10)) (nhds epsStarF))
    (εf : ℝ → ℝ) (κ : ℝ → ℝ)
    (hκ : StrictAntiOn κ (Set.Ioc 2 2.9))
    (hbal : ∀ ωb : ℝ, ωb ∈ Set.Ioc 2 2.9 →
      ∃ c θ : ℝ, 10 < c ∧ 0 < θ ∧ θ < 9 / 10 ∧
        gammaOf c θ = κ ωb - qOf θ ∧
        εf ωb = RcF c (gammaOf c θ)) :
    StrictAntiOn εf (Set.Ioc 2 2.9) := by
  sorry -- P0 stub — the flagged F5 check

/-! ## Part 3b — route-assembler infrastructure (ported with proofs; zero sorry)
Day-1 S-tranche: the route lemmas' proof scaffolding, kernel-verified. Sources:
`TimeClaims/Sec3/Theorem19.lean:42/:53` and `TimeClaims/Sec3/Arithmetic.lean:62`
(v4.33 donor; pure-ℝ algebra proofs, ported verbatim modulo namespace). -/

/-- VERBATIM `TimeClaims/Sec3/Theorem19.lean:42`: how both routes of Theorem 19 end —
Theorem 17 bounds the time by `calls · call + C · extra`; one call ≤ `c · I`; the
sum bound `calls · (c · I) + C · extra ≤ B`; conclude `T ≤ B`. -/
theorem time_le_of_calls {T calls call I extra B C c : ℝ}
    (h17 : T ≤ calls * call + C * extra) (hcall : call ≤ c * I)
    (hsum : calls * (c * I) + C * extra ≤ B) (hcalls : 0 ≤ calls) : T ≤ B :=
  (h17.trans (add_le_add (mul_le_mul_of_nonneg_left hcall hcalls) le_rfl)).trans hsum

/-- VERBATIM `TimeClaims/Sec3/Arithmetic.lean:62`: `n² / √D ≤ n² / D^a` for `a ≤ 1/2`. -/
theorem sq_div_sqrt_le_sq_div_rpow (n : ℕ) {D : ℕ} {a : ℝ} (hD : 1 ≤ D) (ha : a ≤ 1 / 2) :
    (n : ℝ) ^ 2 / Real.sqrt D ≤ (n : ℝ) ^ 2 / (D : ℝ) ^ a := by
  rw [Real.sqrt_eq_rpow]
  exact div_le_div_of_nonneg_left (by positivity) (Real.rpow_pos_of_pos (Nat.cast_pos.2 hD) a)
    (Real.rpow_le_rpow_of_exponent_le (Nat.one_le_cast.2 hD) ha)

/-- VERBATIM `TimeClaims/Sec3/Theorem19.lean:53` (route 16's one-call cost): an
instance has `|W| ≤ n²/√D` query pairs, so `|W| D^{0.437} ≤ n²/D^{0.063}`. -/
theorem call_cost_corollary_16 {n D : ℕ} {t C C₁₆ : ℝ} (hD : 1 ≤ D) (hC : 0 ≤ C) (hC₁₆ : 0 ≤ C₁₆)
    (ht : t ≤ C₁₆ * wantedBound n D (queryCap n D)) :
    t + C * ((n : ℝ) ^ 2 / Real.sqrt D)
      ≤ (2 * C₁₆ + C) * ((n : ℝ) ^ 2 / (D : ℝ) ^ (0.063 : ℝ)) := by
  have hD0 : (0 : ℝ) < D := by exact_mod_cast hD
  have hpos₁ : 0 < (D : ℝ) ^ (0.437 : ℝ) := Real.rpow_pos_of_pos hD0 _
  have hpos₂ : 0 < (D : ℝ) ^ (0.063 : ℝ) := Real.rpow_pos_of_pos hD0 _
  have hsqrt : Real.sqrt D = (D : ℝ) ^ (0.437 : ℝ) * (D : ℝ) ^ (0.063 : ℝ) := by
    rw [Real.sqrt_eq_rpow, ← Real.rpow_add hD0]
    norm_num
  have hquery : (queryCap n D : ℝ) * (D : ℝ) ^ (0.437 : ℝ)
      ≤ (n : ℝ) ^ 2 / (D : ℝ) ^ (0.063 : ℝ) :=
    calc (queryCap n D : ℝ) * (D : ℝ) ^ (0.437 : ℝ)
        ≤ (n : ℝ) ^ 2 / Real.sqrt D * (D : ℝ) ^ (0.437 : ℝ) :=
          mul_le_mul_of_nonneg_right (Nat.floor_le (by positivity)) hpos₁.le
      _ = (n : ℝ) ^ 2 / (D : ℝ) ^ (0.063 : ℝ) := by
          rw [hsqrt]
          field_simp
  have hread := sq_div_sqrt_le_sq_div_rpow n hD (a := 0.063) (by norm_num)
  calc t + C * ((n : ℝ) ^ 2 / Real.sqrt D)
      ≤ C₁₆ * ((n : ℝ) ^ 2 / (D : ℝ) ^ (0.063 : ℝ) + (n : ℝ) ^ 2 / (D : ℝ) ^ (0.063 : ℝ))
          + C * ((n : ℝ) ^ 2 / (D : ℝ) ^ (0.063 : ℝ)) :=
        add_le_add (ht.trans (mul_le_mul_of_nonneg_left (add_le_add hquery le_rfl) hC₁₆))
          (mul_le_mul_of_nonneg_left hread hC)
    _ = (2 * C₁₆ + C) * ((n : ℝ) ^ 2 / (D : ℝ) ^ (0.063 : ℝ)) := by ring

/-! ## Part 3c — the MM-generalized cost analysis (the REBUILD, per the strassen-frozen
finding: not re-instantiation — the donor's `Theorem19.exists_total_le`
(`Sec3/Theorem19/Choice.lean:245`) hardcodes `termPrime strassen n D` and its
`Choice.strassen_le` input; here the term is `termPrime W.MM n D` and the input is
the ω_b-BALANCE `W.ωb + 1/12 ≤ 3 − η/18` as an explicit binder, from which the
MM-term bound is PROVED in-line from `W.grows` + `Choice.le_root` — exactly where
ε(ω_b) is born). All real proofs; zero sorry. NOTE (run-4 lesson): the donor's
`Real.natCast_le_rpow_inv_iff` does NOT exist on our pin (v4.33→v4.36 drift), so
the n-positivity input is derived inline instead of via a `le_root_iff` port. -/

/-- The donor's Choice-DERIVED per-term bounds (its `instances_le`/`scans_le`/
`build_le`/`one_le_log`, `Sec3/Theorem19/Choice.lean:60–244`) — MM-INDEPENDENT, so
they survive the generalization verbatim in shape — collected as an explicit
interface binder. DISCHARGED (2026-11-21) by `choiceSumInputs_of_choice` (Part 3d),
the donor's rpow calculus ported for every η, c. INTERFACE FIX of record (2026-11-21):
`scans_le` carries the donor's `Real.log n ≤ Λ` hypothesis — the v1 field (only
`1 ≤ Λ`) was false as stated (at Λ = 1, κ = 1 it demands log n ≤ 1). -/
structure ChoiceSumInputs (η c : ℝ) : Prop where
  instances_le : ∀ {n D : ℕ}, Theorem19.Choice n D η c → ∀ {X κ Λ : ℝ}, 0 ≤ X → 1 ≤ κ → 1 ≤ Λ →
      X ≤ Λ → 4 * (n : ℝ) * (⌈(D : ℝ) ^ η⌉₊ : ℝ) * ((n : ℝ) ^ 2 * X / (D : ℝ) ^ (2 * η))
        ≤ 8 * c ^ η * ((n : ℝ) ^ (3 - η / 18) * (κ * Λ))
  scans_le : ∀ {n D : ℕ}, Theorem19.Choice n D η c → ∀ {κ Λ : ℝ}, 1 ≤ κ → 1 ≤ Λ →
      Real.log n ≤ Λ →
      termScans n ⌈(D : ℝ) ^ η⌉₊ κ ≤ c ^ η * ((n : ℝ) ^ (3 - η / 18) * (κ * Λ))
  build_le : ∀ {n D : ℕ}, Theorem19.Choice n D η c → ∀ {κ Λ : ℝ}, 1 ≤ κ → 1 ≤ Λ →
      termBuild n D ⌈(D : ℝ) ^ η⌉₊ ≤ 2 * ((n : ℝ) ^ (3 - η / 18) * (κ * Λ))
  one_le_log : ∀ {n D : ℕ}, Theorem19.Choice n D η c → 1 ≤ Real.log n

/-- The generalized cost analysis (the donor's `exists_total_le` with the strassen
slot freed): for every word-RAM MM whose exponent satisfies the BALANCE
`ωb + 1/12 ≤ 3 − η/18`, the Theorem-17 total at `termPrime W.MM` is
`O(κ n^{3−η/18} Λ)`. The ω_b-balance is the explicit binder the pricing correction
names; the MM-term bound it unlocks is proved in-line (W.grows × Choice.le_root). -/
theorem MMgeneral_total_sum (W : WordRamMMData) {c : ℝ} (hc : 0 ≤ c) (η : ℝ)
    (I : ChoiceSumInputs η c)
    (hbal : W.ωb + 1 / 12 ≤ 3 - η / 18) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ {n D : ℕ}, Theorem19.Choice n D η c → ∀ {a b κ X Λ : ℝ},
      0 ≤ a → 0 ≤ b → 1 ≤ κ → 0 ≤ X → X ≤ Λ → Real.log n ≤ Λ →
      4 * (n : ℝ) * (⌈(D : ℝ) ^ η⌉₊ : ℝ) * (a * ((n : ℝ) ^ 2 * X / (D : ℝ) ^ (2 * η)))
        + b * (termScans n ⌈(D : ℝ) ^ η⌉₊ κ + termPrime W.MM n D
          + termBuild n D ⌈(D : ℝ) ^ η⌉₊)
        ≤ C * ((a + b) * (κ * ((n : ℝ) ^ (3 - η / 18) * Λ))) := by
  obtain ⟨Cb, hCb, hgrow⟩ := W.grows
  have hCb0 : (0 : ℝ) ≤ Cb := zero_le_one.trans hCb
  refine ⟨8 * c ^ η + Cb + 3, by positivity, fun {n D} P {a b κ X Λ} ha hb hκ hX hXΛ hlogΛ => ?_⟩
  have hΛ : 1 ≤ Λ := (I.one_le_log P).trans hlogΛ
  have hΛκ : Λ ≤ κ * Λ := le_mul_of_one_le_left (zero_le_one.trans hΛ) hκ
  -- n is positive: if n = 0 then le_root forces D = 0 against sixteen_le.
  have hnpos : 0 < n := by
    rcases Nat.eq_zero_or_pos n with h0 | h1
    · exfalso
      -- Real.zero_rpow_le_one (on-pin): (0:ℝ)^x ≤ 1, total — no ≠ 0 needed
      have hroot1 : (D : ℝ) ≤ 1 := by
        have h := P.le_root
        rw [h0, Nat.cast_zero] at h
        exact h.trans (Real.zero_rpow_le_one _)
      have h16D : (16 : ℝ) ≤ (D : ℝ) := by exact_mod_cast P.sixteen_le
      exact absurd (h16D.trans hroot1) (by norm_num)
    · exact h1
  have hn1 : (1 : ℝ) ≤ (n : ℝ) := by exact_mod_cast hnpos
  have hn0 : (0 : ℝ) < (n : ℝ) := lt_of_lt_of_le zero_lt_one hn1
  have hD1 : (1 : ℝ) ≤ (D : ℝ) :=
    le_trans (by norm_num : (1 : ℝ) ≤ 16) (by exact_mod_cast P.sixteen_le)
  have hD0 : (0 : ℝ) < (D : ℝ) := lt_of_lt_of_le zero_lt_one hD1
  -- the MM-term bound: THE ω_b-balance step (the strassen-le slot's replacement).
  have hMM : termPrime W.MM n D ≤ Cb * ((n : ℝ) ^ (3 - η / 18) * (κ * Λ)) := by
    have hDp : (D : ℝ) ^ (3 / 2 : ℝ) ≤ (n : ℝ) ^ (1 / 12 : ℝ) := by
      have h2 : ((n : ℝ) ^ (1 / 18 : ℝ)) ^ (3 / 2 : ℝ) = (n : ℝ) ^ (1 / 12 : ℝ) := by
        rw [← Real.rpow_mul hn0.le, show (1 / 18 : ℝ) * (3 / 2 : ℝ) = 1 / 12 by norm_num]
      calc (D : ℝ) ^ (3 / 2 : ℝ) ≤ ((n : ℝ) ^ (1 / 18 : ℝ)) ^ (3 / 2 : ℝ) :=
            Real.rpow_le_rpow hD0.le P.le_root (by norm_num : (0 : ℝ) ≤ 3 / 2)
        _ = (n : ℝ) ^ (1 / 12 : ℝ) := h2
    have hg := hgrow n (Nat.one_le_iff_ne_zero.2 (Nat.ne_of_gt hnpos))
    have h1κΛ : 1 ≤ κ * Λ := by
      nlinarith [mul_le_mul hκ hΛ zero_le_one (zero_le_one.trans hκ)]
    have hωΛ : (n : ℝ) ^ (3 - η / 18) ≤ (n : ℝ) ^ (3 - η / 18) * (κ * Λ) :=
      le_mul_of_one_le_right (Real.rpow_nonneg hn0.le _) h1κΛ
    unfold termPrime
    calc W.MM n * (D : ℝ) ^ (3 / 2 : ℝ)
        ≤ (Cb * (n : ℝ) ^ W.ωb) * (n : ℝ) ^ (1 / 12 : ℝ) :=
          mul_le_mul hg hDp (Real.rpow_nonneg hD0.le _)
            (mul_nonneg hCb0 (Real.rpow_nonneg hn0.le _))
      _ = Cb * ((n : ℝ) ^ (W.ωb + 1 / 12 : ℝ)) := by rw [Real.rpow_add hn0]; ring
      _ ≤ Cb * ((n : ℝ) ^ (3 - η / 18 : ℝ)) :=
          mul_le_mul_of_nonneg_left (Real.rpow_le_rpow_of_exponent_le hn1 hbal) hCb0
      _ ≤ Cb * ((n : ℝ) ^ (3 - η / 18) * (κ * Λ)) := mul_le_mul_of_nonneg_left hωΛ hCb0
  -- the assembly (the donor's `exists_total_le` calc, MM-slot swapped in).
  have hinstances := I.instances_le P hX hκ hΛ hXΛ
  have hscans := I.scans_le P hκ hΛ hlogΛ
  have hbuild := I.build_le P hκ hΛ
  set R := (n : ℝ) ^ (3 - η / 18) * (κ * Λ) with hR
  have hR0 : (0 : ℝ) ≤ R := by positivity
  -- monomial nonnegativity facts: the generalized constant Cb makes the donor's
  -- linarith-linear steps nonlinear, so the products ride as explicit hypotheses.
  have hA0 : (0 : ℝ) ≤ c ^ η := Real.rpow_nonneg hc η
  have hcηR : (0 : ℝ) ≤ c ^ η * R := mul_nonneg hA0 hR0
  have hCbR : (0 : ℝ) ≤ Cb * R := mul_nonneg hCb0 hR0
  calc 4 * (n : ℝ) * (⌈(D : ℝ) ^ η⌉₊ : ℝ) * (a * ((n : ℝ) ^ 2 * X / (D : ℝ) ^ (2 * η)))
          + b * (termScans n ⌈(D : ℝ) ^ η⌉₊ κ + termPrime W.MM n D
            + termBuild n D ⌈(D : ℝ) ^ η⌉₊)
      = a * (4 * (n : ℝ) * (⌈(D : ℝ) ^ η⌉₊ : ℝ) * ((n : ℝ) ^ 2 * X / (D : ℝ) ^ (2 * η)))
          + b * (termScans n ⌈(D : ℝ) ^ η⌉₊ κ + termPrime W.MM n D
            + termBuild n D ⌈(D : ℝ) ^ η⌉₊) := by ring
    _ ≤ a * ((8 * c ^ η + Cb + 3) * R) + b * ((8 * c ^ η + Cb + 3) * R) := by
        apply add_le_add
        · apply mul_le_mul_of_nonneg_left _ ha
          linarith [hinstances, hCbR, hR0]
        · apply mul_le_mul_of_nonneg_left _ hb
          linarith [hscans, hMM, hbuild, hcηR, hCbR, hR0]
    _ = (8 * c ^ η + Cb + 3) * ((a + b) * (κ * ((n : ℝ) ^ (3 - η / 18) * Λ))) := by
        rw [hR]; ring

/-! ## Part 3d — the Choice calculus ported WITH PROOFS (the resume-order target:
discharge `ChoiceSumInputs`; donor `Sec3/Theorem19/Choice.lean:60–244`, MM-INDEPENDENT
so it survives the generalization verbatim in shape). v4.33→v4.36 drift handled inline
(the run-4 lesson family; ledger in `logs/core-runs4-9.log`): `Real.natCast_le_rpow_inv_iff`
(gone) — `pow_eighteen_le`/`sixteen_le_root` re-derived via `Real.rpow_le_rpow` +
`Real.rpow_natCast` + `Real.rpow_mul` (the two root-identity helpers below);
`Real.one_le_log_natCast_of_three_le` (gone) — `Real.le_log_iff_exp_le` +
`Real.exp_one_lt_d9`. The donor's `strassen_le` is NOT ported: that slot is the
MM-generalization's ω_b-balance, already PROVED in-line in `MMgeneral_total_sum`
(the run-9 milestone). -/

/-- v4.36 drift helper: `(x ^ m) ^ (1 / m) = x` for `0 < x`, `m ≠ 0`. -/
private theorem natPow_rpow_inv_self {x : ℝ} (hx : 0 < x) {m : ℕ} (hm : m ≠ 0) :
    (x ^ m) ^ (1 / (m : ℝ)) = x := by
  have hm0 : ((m : ℕ) : ℝ) ≠ 0 := fun h => hm (by exact_mod_cast h)
  rw [← Real.rpow_natCast, ← Real.rpow_mul hx.le,
    show ((m : ℕ) : ℝ) * (1 / (m : ℝ)) = 1 by field_simp, Real.rpow_one]

/-- v4.36 drift helper: `(x ^ (1 / m)) ^ m = x` for `0 < x`, `m ≠ 0`. -/
private theorem rpow_inv_natPow_self {x : ℝ} (hx : 0 < x) {m : ℕ} (hm : m ≠ 0) :
    (x ^ (1 / (m : ℝ))) ^ m = x := by
  have hm0 : ((m : ℕ) : ℝ) ≠ 0 := fun h => hm (by exact_mod_cast h)
  rw [← Real.rpow_natCast, ← Real.rpow_mul hx.le,
    show (1 / (m : ℝ)) * ((m : ℕ) : ℝ) = 1 by field_simp, Real.rpow_one]

namespace Theorem19

/-- Donor `Sec3/Theorem19/Choice.lean:57–59` (`sixteen_le_root`), drift-corrected:
`16 ^ 18 ≤ n → 16 ≤ n ^ (1/18)` (the donor's `le_root_iff` route is gone on our pin). -/
theorem sixteen_le_root {n : ℕ} (hn : 16 ^ 18 ≤ n) :
    (16 : ℝ) ≤ (n : ℝ) ^ (1 / 18 : ℝ) := by
  have hc : ((16 : ℝ) ^ (18 : ℕ)) ≤ (n : ℝ) := by exact_mod_cast hn
  have h1 : ((16 : ℝ) ^ (18 : ℕ)) ^ (1 / 18 : ℝ) ≤ (n : ℝ) ^ (1 / 18 : ℝ) :=
    Real.rpow_le_rpow (by norm_num) hc (by norm_num)
  have h2 : ((16 : ℝ) ^ (18 : ℕ)) ^ (1 / 18 : ℝ) = (16 : ℝ) :=
    natPow_rpow_inv_self (by norm_num) (by norm_num)
  exact h2 ▸ h1

/-- Donor `Sec3/Theorem19.lean:91` — the frozen route-16 Choice instance
(`D = ⌊n^{1/18}⌋`, `g = ⌈D^{0.0315}⌉`) at the frozen η = 0.0315, c = 2
("D ≥ n^{1/18}/2"). -/
theorem choice_corollary_26 {n : ℕ} (hn : 16 ^ 18 ≤ n) :
    Theorem19.Choice n (paramD₂₆ n) 0.0315 2 where
  sixteen_le := Nat.le_floor (by exact_mod_cast Theorem19.sixteen_le_root hn)
  le_root := Nat.floor_le (by positivity)
  root_div_le := by
    -- With `r = n^{1/18} ≥ 16`: `D > r - 1 ≥ r/2`.
    have hlt : (n : ℝ) ^ (1 / 18 : ℝ) < (paramD₂₆ n : ℝ) + 1 := Nat.lt_floor_add_one _
    linarith [Theorem19.sixteen_le_root hn, hlt]
  c_pos := by norm_num
  η_nonneg := by norm_num
  η_le := by norm_num

namespace Choice

variable {n D : ℕ} {η c : ℝ} (P : Theorem19.Choice n D η c)
include P

/-- Donor `Choice.lean:85` with the milestone's inline n-positivity (run-4 lesson:
if n = 0 then `le_root` forces D ≤ 0^… ≤ 1 against `sixteen_le`). -/
private theorem n_pos : (0 : ℝ) < n := by
  rcases Nat.eq_zero_or_pos n with h0 | h1
  · exfalso
    have h := P.le_root
    rw [h0, Nat.cast_zero] at h
    have h16 : (16 : ℝ) ≤ (D : ℝ) := by exact_mod_cast P.sixteen_le
    exact absurd (h16.trans (h.trans (Real.zero_rpow_le_one _))) (by norm_num)
  · exact_mod_cast h1

/-- Donor `Choice.lean:69` (`pow_eighteen_le`), drift-corrected: the donor's
`le_root_iff` is gone; re-derived by base-monotone lifting to `n`. -/
theorem pow_eighteen_le : D ^ 18 ≤ n := by
  have h1 : (D : ℝ) ^ (18 : ℕ) ≤ ((n : ℝ) ^ (1 / 18 : ℝ)) ^ (18 : ℕ) :=
    pow_le_pow_left₀ (Nat.cast_nonneg D) P.le_root 18
  have h2 : ((n : ℝ) ^ (1 / 18 : ℝ)) ^ (18 : ℕ) = (n : ℝ) :=
    rpow_inv_natPow_self P.n_pos (by norm_num)
  exact_mod_cast h1.trans_eq h2

/-- Donor `Choice.lean:73` (`le_n`), drift-corrected (`Nat.le_self_pow` route avoided;
`n ≥ 1` from `16 ^ 18 ≤ D ^ 18 ≤ n`, so no `one_le_D` forward reference). -/
theorem le_n : D ≤ n := by
  have h16n : 16 ^ 18 ≤ n :=
    (Nat.pow_le_pow_left P.sixteen_le 18).trans P.pow_eighteen_le
  have hn1 : (1 : ℝ) ≤ (n : ℝ) :=
    Nat.one_le_cast.mpr ((by norm_num : (1 : ℕ) ≤ 16 ^ 18).trans h16n)
  have h1 : (n : ℝ) ^ (1 / 18 : ℝ) ≤ (n : ℝ) ^ (1 : ℝ) :=
    Real.rpow_le_rpow_of_exponent_le hn1 (by norm_num : (1 / 18 : ℝ) ≤ 1)
  rw [Real.rpow_one] at h1
  exact_mod_cast P.le_root.trans h1

private theorem one_le_D : (1 : ℝ) ≤ D :=
  Nat.one_le_cast.mpr (le_trans (by norm_num) P.sixteen_le)

private theorem D_pos : (0 : ℝ) < D := zero_lt_one.trans_le P.one_le_D

theorem one_le_n : (1 : ℝ) ≤ n := P.one_le_D.trans (Nat.cast_le.mpr P.le_n)

theorem one_le_rpow : 1 ≤ (D : ℝ) ^ η := Real.one_le_rpow P.one_le_D P.η_nonneg

/-- Donor `Choice.lean:92`. -/
theorem one_le_ceil : 1 ≤ ⌈(D : ℝ) ^ η⌉₊ :=
  Nat.ceil_pos.mpr (zero_lt_one.trans_le P.one_le_rpow)

/-- Donor `Choice.lean:96`. -/
private theorem ceil_le : (⌈(D : ℝ) ^ η⌉₊ : ℝ) ≤ 2 * (D : ℝ) ^ η :=
  Nat.ceil_le_two_mul ((by norm_num : (2 : ℝ)⁻¹ ≤ 1).trans P.one_le_rpow)

/-- Donor `Choice.lean:100`. -/
theorem ceil_le_sqrt : (⌈(D : ℝ) ^ η⌉₊ : ℝ) ≤ Real.sqrt (D : ℝ) := by
  have htwo : (2 : ℝ) ≤ (D : ℝ) ^ (1 / 4 : ℝ) :=
    calc (2 : ℝ) = (16 : ℝ) ^ (1 / 4 : ℝ) := by
          rw [show (16 : ℝ) = 2 ^ (4 : ℝ) by norm_num, ← Real.rpow_mul (by norm_num)]
          norm_num
      _ ≤ (D : ℝ) ^ (1 / 4 : ℝ) :=
          Real.rpow_le_rpow (by norm_num) (by exact_mod_cast P.sixteen_le) (by norm_num)
  calc (⌈(D : ℝ) ^ η⌉₊ : ℝ) ≤ 2 * (D : ℝ) ^ η := P.ceil_le
    _ ≤ 2 * (D : ℝ) ^ (1 / 4 : ℝ) := by
        gcongr
        exacts [P.one_le_D, P.η_le]
    _ ≤ (D : ℝ) ^ (1 / 4 : ℝ) * (D : ℝ) ^ (1 / 4 : ℝ) := by gcongr
    _ = Real.sqrt (D : ℝ) := by
        rw [Real.sqrt_eq_rpow, ← Real.rpow_add P.D_pos]
        norm_num

/-- Donor `Choice.lean:119`, drift-corrected (`Real.one_le_log_natCast_of_three_le`
gone on our pin; `Real.le_log_iff_exp_le` + `Real.exp_one_lt_d9` instead). -/
theorem one_le_log : 1 ≤ Real.log n := by
  have hn16 : (16 : ℝ) ≤ (n : ℝ) := by exact_mod_cast (P.sixteen_le.trans P.le_n)
  have e1 : Real.exp 1 < (16 : ℝ) := Real.exp_one_lt_d9.trans_le (by norm_num)
  exact (Real.le_log_iff_exp_le P.n_pos).mpr (e1.le.trans hn16)

/-- Donor `Choice.lean:123`. -/
theorem log_le_log : Real.log D ≤ Real.log n :=
  Real.log_le_log P.D_pos (Nat.cast_le.mpr P.le_n)

/-- Donor `Choice.lean:130` (`saving`): `D ≥ n^{1/18}/c` gives `D^{-η} ≤ c^η n^{-η/18}`. -/
private theorem saving : (D : ℝ) ^ (-η) ≤ c ^ η * (n : ℝ) ^ (-(η / 18)) := by
  have hroot : 0 < (n : ℝ) ^ (1 / 18 : ℝ) := Real.rpow_pos_of_pos P.n_pos _
  calc (D : ℝ) ^ (-η) ≤ ((n : ℝ) ^ (1 / 18 : ℝ) / c) ^ (-η) :=
        Real.rpow_le_rpow_of_nonpos (div_pos hroot P.c_pos) P.root_div_le
          (neg_nonpos.mpr P.η_nonneg)
    _ = ((n : ℝ) ^ (1 / 18 : ℝ)) ^ (-η) / c ^ (-η) := Real.div_rpow hroot.le P.c_pos.le _
    _ = c ^ η * (n : ℝ) ^ (-(η / 18)) := by
        rw [← Real.rpow_mul P.n_pos.le, Real.rpow_neg P.c_pos.le, div_inv_eq_mul, mul_comm,
          show 1 / 18 * -η = -(η / 18) by ring]

/-- Donor `Choice.lean:141`. -/
private theorem cube_mul_saving_le :
    (n : ℝ) ^ 3 * (D : ℝ) ^ (-η) ≤ c ^ η * (n : ℝ) ^ (3 - η / 18) :=
  calc (n : ℝ) ^ 3 * (D : ℝ) ^ (-η) ≤ (n : ℝ) ^ 3 * (c ^ η * (n : ℝ) ^ (-(η / 18))) := by
        gcongr
        exact P.saving
    _ = c ^ η * (n : ℝ) ^ (3 - η / 18) := by
        rw [sub_eq_add_neg, Real.rpow_add P.n_pos, Real.rpow_ofNat]
        ring

/-- Donor `Choice.lean:151`. -/
private theorem rpow_le_rpow_div {a : ℝ} (ha : 0 ≤ a) : (D : ℝ) ^ a ≤ (n : ℝ) ^ (a / 18) :=
  calc (D : ℝ) ^ a ≤ ((n : ℝ) ^ (1 / 18 : ℝ)) ^ a :=
        Real.rpow_le_rpow P.D_pos.le P.le_root ha
    _ = (n : ℝ) ^ (a / 18) := by
        rw [← Real.rpow_mul P.n_pos.le, show 1 / 18 * a = a / 18 by ring]

/-- Donor `Choice.lean:157`. -/
private theorem rpow_le_of_le {b Λ : ℝ} (hb : b ≤ 2.9) (hΛ : 1 ≤ Λ) :
    (n : ℝ) ^ b ≤ (n : ℝ) ^ (3 - η / 18) * Λ :=
  (Real.rpow_le_rpow_of_exponent_le P.one_le_n (by linarith [P.η_le])).trans
    (le_mul_of_one_le_right (Real.rpow_nonneg P.n_pos.le _) hΛ)

/-- Donor `Choice.lean:169` (`instances_le`). -/
private theorem instances_le {X Λ : ℝ} (hX : 0 ≤ X) (hXΛ : X ≤ Λ) :
    4 * (n : ℝ) * (⌈(D : ℝ) ^ η⌉₊ : ℝ) * ((n : ℝ) ^ 2 * X / (D : ℝ) ^ (2 * η))
      ≤ 8 * (c ^ η * ((n : ℝ) ^ (3 - η / 18) * Λ)) := by
  have hΛ : 0 ≤ Λ := hX.trans hXΛ
  have hdiv : (D : ℝ) ^ η / (D : ℝ) ^ (2 * η) = (D : ℝ) ^ (-η) := by
    rw [← Real.rpow_sub P.D_pos, show η - 2 * η = -η by ring]
  calc 4 * (n : ℝ) * (⌈(D : ℝ) ^ η⌉₊ : ℝ) * ((n : ℝ) ^ 2 * X / (D : ℝ) ^ (2 * η))
      ≤ 4 * (n : ℝ) * (2 * (D : ℝ) ^ η) * ((n : ℝ) ^ 2 * Λ / (D : ℝ) ^ (2 * η)) := by
        gcongr
        exact P.ceil_le
    _ = 8 * ((n : ℝ) ^ 3 * ((D : ℝ) ^ η / (D : ℝ) ^ (2 * η)) * Λ) := by ring
    _ ≤ 8 * (c ^ η * (n : ℝ) ^ (3 - η / 18) * Λ) := by
        rw [hdiv]
        gcongr 8 * (?_ * Λ)
        exact P.cube_mul_saving_le
    _ = 8 * (c ^ η * ((n : ℝ) ^ (3 - η / 18) * Λ)) := by ring

/-- Donor `Choice.lean:188` (`scans_le`) — the κ rides OUTSIDE (moved inside by ring
at the interface). -/
private theorem scans_le {κ Λ : ℝ} (hκ : 0 ≤ κ) (hΛ : Real.log n ≤ Λ) :
    termScans n ⌈(D : ℝ) ^ η⌉₊ κ ≤ κ * (c ^ η * ((n : ℝ) ^ (3 - η / 18) * Λ)) := by
  have hpos : 0 < (D : ℝ) ^ η := Real.rpow_pos_of_pos P.D_pos η
  have hΛ0 : 0 ≤ Λ := (Real.log_natCast_nonneg n).trans hΛ
  calc κ * (n : ℝ) ^ 3 * Real.log n / (⌈(D : ℝ) ^ η⌉₊ : ℝ)
      ≤ κ * (n : ℝ) ^ 3 * Λ / (D : ℝ) ^ η := by
        gcongr
        exact Nat.le_ceil _
    _ = κ * ((n : ℝ) ^ 3 * (D : ℝ) ^ (-η) * Λ) := by
        rw [Real.rpow_neg P.D_pos.le]
        ring
    _ ≤ κ * (c ^ η * (n : ℝ) ^ (3 - η / 18) * Λ) := by
        gcongr κ * (?_ * Λ)
        exact P.cube_mul_saving_le
    _ = κ * (c ^ η * ((n : ℝ) ^ (3 - η / 18) * Λ)) := by ring

/-- Donor `Choice.lean:218` (`build_le`). -/
theorem build_le {Λ : ℝ} (hΛ : 1 ≤ Λ) :
    termBuild n D ⌈(D : ℝ) ^ η⌉₊ ≤ 2 * ((n : ℝ) ^ (3 - η / 18) * Λ) :=
  calc (n : ℝ) ^ 2 * (D : ℝ) * (⌈(D : ℝ) ^ η⌉₊ : ℝ)
      ≤ (n : ℝ) ^ 2 * (D : ℝ) * (2 * (D : ℝ) ^ η) := by
        gcongr
        exact P.ceil_le
    _ = 2 * ((n : ℝ) ^ 2 * (D : ℝ) ^ (1 + η)) := by
        rw [Real.rpow_add P.D_pos, Real.rpow_one]
        ring
    _ ≤ 2 * ((n : ℝ) ^ 2 * (n : ℝ) ^ ((1 + η) / 18)) := by
        gcongr
        exact P.rpow_le_rpow_div (by linarith [P.η_nonneg])
    _ = 2 * (n : ℝ) ^ (2 + (1 + η) / 18) := by rw [Real.rpow_add P.n_pos, Real.rpow_ofNat]
    _ ≤ 2 * ((n : ℝ) ^ (3 - η / 18) * Λ) := by
        gcongr
        exact P.rpow_le_of_le (by linarith [P.η_le]) hΛ

end Choice

end Theorem19

/-- The DISCHARGE of `ChoiceSumInputs` — the donor's rpow calculus for EVERY η, c
(the ordered target was the frozen instance η = 0.0315, c = 2; the donor's proofs are
fully general, so the port discharges the interface at once). -/
theorem choiceSumInputs_of_choice {η c : ℝ} : ChoiceSumInputs η c where
  instances_le := by
    intro n D P X κ Λ hX hκ hΛ hXΛ
    have hΛκ : Λ ≤ κ * Λ := le_mul_of_one_le_left (zero_le_one.trans hΛ) hκ
    exact (Theorem19.Choice.instances_le P hX (hXΛ.trans hΛκ)).trans_eq (by ring)
  scans_le := by
    intro n D P κ Λ hκ hΛ hlogΛ
    exact (Theorem19.Choice.scans_le P (zero_le_one.trans hκ) hlogΛ).trans_eq (by ring)
  build_le := by
    intro n D P κ Λ hκ hΛ
    have hκΛ : 1 ≤ κ * Λ := by
      nlinarith [mul_le_mul hκ hΛ zero_le_one (zero_le_one.trans hκ)]
    exact Theorem19.Choice.build_le P hκΛ
  one_le_log := by
    intro n D P
    exact Theorem19.Choice.one_le_log P

/-! ## Part 3e — `route16_MMgeneral` CLOSED (the resume-order target; donor
`TimeClaims/Sec3/Theorem19.lean:107` with the MM slot freed). AMENDMENT OF RECORD:
the P0 stub concluded `Theorem_19_explicit M (E.ε W.ωb) (E.e W.ωb)` UNconditionally —
false as stated: h16's `wantedBound` is frozen at the 0.437/0.063 exponents, so the
one-call cost `n²/D^{0.063}` caps the deliverable savings at `0.0315 / 18 = 0.00175`
with a log¹ floor (a decreasing ε demands more exactly when `W.ωb < log₂ 7`, and
`E.e = 0` at the exact fiber would drop the log). Per the charter-input §2 rescope
shape ("the EpsData-binder statements already support exactly that fallback") the
fiber facts enter as explicit binders: `hδ` (the ε-construction's obligation,
dischargeable for `W.ωb ≥ log₂ 7` from `EpsData.strict_anti` + `frozen_fiber`) and
`he` (the log-exponent floor). `route16_MMgeneral_frozen` below records the
UNCONDITIONAL fiber every W in the band delivers. -/

/-- The ε-fiber transfer: the delivered bound `n^{3−0.0315/18} · log n` implies the
target `(δ, e)` bound whenever `δ ≤ 0.0315/18` and `1 ≤ e` (for `n ≥ 1`, `log n ≥ 1`). -/
theorem explicit_transfer {n δ : ℝ} {e : ℕ} (hn1 : 1 ≤ n) (hlog1 : 1 ≤ Real.log n)
    (hδ : δ ≤ 0.0315 / 18) (he : 1 ≤ e) :
    n ^ (3 - (0.0315 : ℝ) / 18) * Real.log n ≤ n ^ (3 - δ) * Real.log n ^ e := by
  have h1 : n ^ (3 - (0.0315 : ℝ) / 18) ≤ n ^ (3 - δ) :=
    Real.rpow_le_rpow_of_exponent_le hn1 (by linarith)
  have h2 : Real.log n ≤ Real.log n ^ e := by
    have hk : e = (e - 1) + 1 := by omega
    rw [hk, pow_succ]
    calc Real.log n = 1 * Real.log n := (one_mul _).symm
      _ ≤ Real.log n ^ (e - 1) * Real.log n :=
          mul_le_mul_of_nonneg_right (one_le_pow₀ hlog1) (Real.log_nonneg hn1)
  exact mul_le_mul h1 h2 (Real.log_nonneg hn1) (Real.rpow_nonneg (zero_le_one.trans hn1) _)

/-- The route-16 composition at the FROZEN fiber, E-free and W-general: for every
word-RAM MM in the band, Theorem 17 at `paramD₂₆`/`paramG₂₆` + Corollary 16 give
`Theorem_19_explicit` at δ = 0.0315/18 (= 0.00175), e = 1. The donor's
`explicit_of_theorem_17_corollary_16` (`TimeClaims/Sec3/Theorem19.lean:107`) with the
MM slot freed; the balance `2.9 + 1/12 < 3 − 0.00175` holds for every W in the band. -/
theorem route16_core (M : DetTimeModel) (W : WordRamMMData)
    (h17 : Claim.Theorem_17 M W.MM paramD₂₆ paramG₂₆)
    (h16 : Claim.Corollary_16 M) :
    ∃ (K : ℝ) (T : ℕ → ℝ → ℝ), 0 ≤ K ∧ M.exactTriangle T ∧
      ∀ (n : ℕ) (κ u : ℝ), 16 ^ 18 ≤ n → 1 ≤ κ → u ≤ (n : ℝ) ^ κ →
        T n u ≤ K * (κ * ((n : ℝ) ^ (3 - (0.0315 : ℝ) / 18) * Real.log n)) := by
  obtain ⟨C, hC, h17⟩ := h17
  obtain ⟨C₁₆, _, Td, hC₁₆, -, hTd, h16⟩ := h16
  obtain ⟨T, hT, h17⟩ := h17 Td hTd
  -- the ω_b-balance at the frozen η holds for EVERY W in the band (2.9 + 1/12 < 3 − 0.00175)
  have hbal : W.ωb + 1 / 12 ≤ 3 - 0.0315 / 18 := by linarith [W.le_band]
  obtain ⟨C₀, hC₀, htotal⟩ :=
    MMgeneral_total_sum W (c := 2) (by norm_num) 0.0315 choiceSumInputs_of_choice hbal
  refine ⟨C₀ * (2 * C₁₆ + C + C), T, mul_nonneg hC₀ (by linarith [hC₁₆, hC]), hT,
    fun n κ u hn hκ hu => ?_⟩
  -- Step 1: the parameters (the frozen route-16 Choice instance).
  have P := Theorem19.choice_corollary_26 hn
  have h17 := h17 n κ u P.sixteen_le P.le_n P.one_le_ceil P.ceil_le_sqrt hκ hu
  -- Step 2: one call, with the reading of its answers.
  have hD1 : (1 : ℕ) ≤ paramD₂₆ n := (by norm_num : (1 : ℕ) ≤ 16).trans P.sixteen_le
  have hcall := call_cost_corollary_16 hD1 hC hC₁₆
    (h16 n _ (queryCap n (paramD₂₆ n)) hD1 P.pow_eighteen_le).2
  -- Step 3: the sum, at Λ = log n, X = 1.
  have hXΛ : (1 : ℝ) ≤ Real.log n := Theorem19.Choice.one_le_log P
  have hsum := htotal P (a := 2 * C₁₆ + C) (b := C) (by linarith [hC₁₆, hC]) hC hκ
    (X := 1) zero_le_one hXΛ (le_rfl : Real.log n ≤ Real.log n)
  rw [show (2 * 0.0315 : ℝ) = 0.063 by norm_num, mul_one] at hsum
  exact (time_le_of_calls h17 hcall hsum (by positivity)).trans_eq (by ring)

/-- ROUTE 16 AT ABSTRACT MM, with the ε-fiber binders (the amendment of record). -/
theorem route16_MMgeneral (M : DetTimeModel) (W : WordRamMMData) (E : EpsData)
    (hδ : E.ε W.ωb ≤ 0.0315 / 18) (he : 1 ≤ E.e W.ωb)
    (h17 : Claim.Theorem_17 M W.MM paramD₂₆ paramG₂₆)
    (h16 : Claim.Corollary_16 M) :
    Claim.Theorem_19_explicit M (E.ε W.ωb) (E.e W.ωb) := by
  obtain ⟨K, T, hK0, hT, hb⟩ := route16_core M W h17 h16
  refine ⟨K, T, hT, fun n κ u hn hκ hu => ?_⟩
  have hn1 : (1 : ℝ) ≤ (n : ℝ) :=
    Nat.one_le_cast.mpr ((by norm_num : (1 : ℕ) ≤ 16 ^ 18).trans hn)
  have hlog1 : 1 ≤ Real.log n :=
    Theorem19.Choice.one_le_log (Theorem19.choice_corollary_26 hn)
  have htr := explicit_transfer hn1 hlog1 hδ he
  have hκ0 : (0 : ℝ) ≤ κ := zero_le_one.trans hκ
  calc T n u ≤ K * (κ * ((n : ℝ) ^ (3 - (0.0315 : ℝ) / 18) * Real.log n)) := hb n κ u hn hκ hu
    _ ≤ K * (κ * ((n : ℝ) ^ (3 - E.ε W.ωb) * Real.log n ^ E.e W.ωb)) :=
        mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_left htr hκ0) hK0

/-- The UNCONDITIONAL fiber every W in the band delivers — the frozen 0.00175/log¹
instance (`0.0315/18 = 0.00175` by norm_num). -/
theorem route16_MMgeneral_frozen (M : DetTimeModel) (W : WordRamMMData)
    (h17 : Claim.Theorem_17 M W.MM paramD₂₆ paramG₂₆)
    (h16 : Claim.Corollary_16 M) :
    Claim.Theorem_19_explicit M 0.00175 1 := by
  have hcore : Claim.Theorem_19_explicit M (0.0315 / 18 : ℝ) 1 := by
    obtain ⟨K, T, _, hT, hb⟩ := route16_core M W h17 h16
    exact ⟨K, T, hT, fun n κ u hn hκ hu => by rw [pow_one]; exact hb n κ u hn hκ hu⟩
  have hnum : (0.0315 : ℝ) / 18 = 0.00175 := by norm_num
  rw [hnum] at hcore
  exact hcore

/-! ## Part 4 — the core-target stubs (day-1 statement scaffolds)
The three work items of the iter-6 core charter (per `core-charter-input.md` §1–§3),
each as a named statement stub: day-1 of iteration 6 fires this file for a
statement-GREEN baseline (all statements elaborate) BEFORE any proof work; each stub
is then discharged in descent order (a) routes → (b) ε construction → (d) fiber match,
with (c) step-2 monotonicity carried by `balancePoint_monotone_shape` above. -/

/-- (b) The ε construction target: an `EpsData` whose ε is the explicit Sec-4-built
savings function (closed form to be constructed; the P0 pinned only the binder
properties). The construction is the core's S–M component (b). -/
def epsParam_data : EpsData := by
  sorry -- CORE stub (b): construct the explicit ε from the Sec-4 trade-off data

/-- The composition target: for EVERY word-RAM MM in the band, the explicit theorem
at the ε-fiber of its exponent — the dossier's core deliverable, assembled from a
route lemma (a) + the constructed ε (b). AMENDED 2026-11-21 with the ε-fiber binders
(the amendment of record): `hδ`/`he` are the ε-CONSTRUCTION's obligations (to be
discharged when `epsParam_data` is constructed); the unconditional form is false —
see Part 3e. -/
theorem parametric_main (M : DetTimeModel) (W : WordRamMMData)
    (hδ : epsParam_data.ε W.ωb ≤ 0.0315 / 18)
    (he : 1 ≤ epsParam_data.e W.ωb)
    (h16 : Claim.Corollary_16 M)
    (h17 : Claim.Theorem_17 M W.MM paramD₂₆ paramG₂₆) :
    Claim.Theorem_19_explicit M (epsParam_data.ε W.ωb) (epsParam_data.e W.ωb) :=
  route16_MMgeneral M W epsParam_data hδ he h17 h16

/-- (d) The frozen-fiber numeric match, claim level: the constructed ε recovers the
frozen `0.00175` exactly at the Strassen fiber (validator class:
`sec4_epsStar_numeric`). -/
theorem epsParam_frozen_fiber_claim :
    epsParam_data.ε (Real.logb 2 7) = 0.00175 :=
  epsParam_data.frozen_fiber

end

end CrossMath.Pilot12P0
