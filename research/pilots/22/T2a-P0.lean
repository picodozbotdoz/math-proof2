/-
Pilot 22 / T2a-P0 — statement-first tranche (iteration 4, task-slot charter GO,
orchestrator ruling 2026-11-17; executed by lane A8). NOT a proof artifact: the
elaboration of this file IS the P0 deliverable (pilot-22 house style — sorry-free
Prop-defs + #check decl pins, mirroring `pilots/22/ProbeP1_PNT.lean`; ZERO sorries
by construction, so no probe-convention sorry class is declared).

Charter + chain of record:
  * GO condition (i) of `qa/iter4-review/a8-22t2a-g9-recommendation.md` resolved GREEN
    2026-11-17 (G9 runs 36/37: upstream StrongPNT statement-binder transcribes onto our
    pin after one `open Filter` spelling fix; `logs-g/run37-g9-fix.log` — OK rc=0
    errors=0, sorry-warnings=2 = the declared G9 probe class exactly).
  * Consumer statement per `pilots/22-blueprint.md:285` (Tier 2, dossier 22 T2a):
    "∀ ε>0, ∃C, ∀x≥2, `|ψ x − x| ≤ C·x^(7/8+ε)` … (dossier T2a; openai-math quasi-RH
    band as input)".
  * The quasi-RH input binder is the Liu-1 statement-level QUOTATION of the G7b-audited
    OAI 7/8 zero-free theorem for ζ (`OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re`,
    read-only donor `OAI/NumberTheory/DirichletL/Nonvanishing.lean:29`; triad on-pin at
    `logs-g/run32-g7-elab.log:47/:51/:84/:144–145`). `riemannZeta` is MATHLIB's own, so
    the quotation is verbatim. The donor's parallel Dirichlet form
    (`LFunction_ne_zero_of_seven_eighths_lt_re`, donor :19) is NOT transcribed —
    `DirichletCharacter.LFunction` is the donor's own def, not mathlib's (the G11
    header's recorded caveat); it stays a donor-side citation only.
  * ψ-object mathlib-native on our pin (A8-validated in the encore checkout):
    `Chebyshev.psi` — `Mathlib/NumberTheory/Chebyshev.lean:70` (Λ = `ArithmeticFunction.
    vonMangoldt`, `…/ArithmeticFunction/VonMangoldt.lean:66`; scoped `ψ` notation
    `Chebyshev.lean:74`); `x ^ (7/8 + ε)` via the global rpow instance `Pow ℝ ℝ`
    (`Mathlib/Analysis/SpecialFunctions/Pow/Real.lean:37`). `=O` is global notation
    (`Mathlib/Analysis/Asymptotics/Defs.lean:91`).

BILLING + THE PRE-REGISTERED T2 RULE (quoted verbatim from `research/RESEARCH.md`
§Iteration 4 :149–160; the charter ruling re-affirms it):

    **FB-2/PNT+ T2 ignition rule (pre-registered; NOT fired this cycle):** IF an FB-2
    PNT-AP pilot charters (the G7b-audited 7/8 tree as zero-free binder, error
    x^{7/8+δ}, landing on mathlib's `NumberTheory/LSeries/PrimesInAP.lean`), THEN T2
    FIRES and the PNT+ watchlist upgrades DEFER → REGISTER-AND-PORT (upstream statement
    as binder; G9 preflight staged). R6's deciding rg resolved the effort class: **FB-2 =
    L-grade explicit-formula build** (zero PNT-AP statements in the OAI tree; the
    DirichletL endgame stops at the two zero-free theorems) — FB-2 stays **iteration-5
    unless chartered as an explicit L**; T2 does not fire this cycle and the PNT+ entry
    stays DEFER (T3 also unfired: upstream still v4.35.0, fetched 2026-11-16; a future
    FB-2 build IMPORTS StrongPNT-grade ψ-machinery at the donor pin — OAI's
    lake-manifest already declares PrimeNumberTheoremAnd/StrongPNT + TauCeti as deps —
    rather than porting it).

THIS pilot (22-T2a) is the ψ-error-term task-slot, statement-first: chartering it does
NOT fire T2 (the rule's antecedent is an FB-2 PNT-AP pilot; T1/T3 also unfired). PNT+
stays UNREGISTERED — external formal prior art, statement citation only (Liu-1
convention), zero upstream imports. Technical-record billing; the T2a tranche never
receives discovery billing (r3 §7 relabel; backlog :349).
-/
import Mathlib

open Filter

namespace CrossMath.Pilot22

/-! ## Decl pins (elaboration fails here if any cited name/signature drifted) -/

#check @Chebyshev.psi
#check @ArithmeticFunction.vonMangoldt
#check @riemannZeta

/-! ## The quasi-RH input binder (Liu-1 quotation of the G7b-audited OAI 7/8 statement) -/

/-- **hQRHζ binder.** Statement-level quotation (verbatim — `riemannZeta` is mathlib's)
of `OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re`: ζ is zero-free on Re s > 7/8, the
openai-math quasi-RH band. The T2a INPUT; its discharge class is the G7b donor-pin
audit (triad), consumable by binder per the Cycle-2 donor-hygiene gate. -/
def HypQRHzeta : Prop :=
  ∀ ⦃s : ℂ⦄, (7 / 8 : ℝ) < s.re → riemannZeta s ≠ 0

/-! ## The StrongPNT donor binder (the ψ-machinery comparison tier, G9-verified) -/

/-- **hStrongPNT binder.** Verbatim from `feasibility/probe/ProbeG9_StrongPNT.lean`
(run37 GREEN): upstream Kontorovich PNT+ `StrongPNT` — ψ = x + O(x·exp(−c√log x)) — on
mathlib's ψ-object. Recorded side by side with the T2a target for the P1 route
decision; NO implication between the two error terms is claimed at P0 (the
sub-exponential and polynomial-7/8+ε bands are incomparable as stated). -/
def HypStrongPNT : Prop :=
  ∃ c > 0, (Chebyshev.psi - id) =O[atTop]
    fun (x : ℝ) ↦ x * Real.exp (-c * (Real.log x) ^ ((1 : ℝ) / 2))

/-! ## T2a: the effective error term from the quasi-RH band (blueprint :285, verbatim) -/

/-- **T2a statement** (dossier 22 Tier 2a; `pilots/22-blueprint.md:285`): for every
ε > 0 there is C with |ψ x − x| ≤ C·x^(7/8+ε) for all x ≥ 2 — the quasi-RH 7/8 band as
input (`HypQRHzeta`). Statement-only: proofs are P1 work (explicit-formula build,
L-grade, explicitly NOT this charter). -/
def stmt_T2a : Prop :=
  ∀ ε > 0, ∃ C : ℝ, ∀ x : ℝ, 2 ≤ x →
    |Chebyshev.psi x - x| ≤ C * x ^ (7 / 8 + ε)

/-- **The conditional P1 target.** `HypQRHzeta → stmt_T2a` — the shape a P1 proof
discharges (quasi-RH band in, effective error term out). Prop-def, statement-only. -/
def stmt_T2a_of_QRH : Prop := HypQRHzeta → stmt_T2a

end CrossMath.Pilot22
