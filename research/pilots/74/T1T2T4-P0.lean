/-
Pilot 74 / T1T2T4-P0 — statement rung of the dossier-74 discovery-dense core
(iteration 4; staged 2026-11-17 by lane A8). **STAGED-NO-RUN — the orchestrator gates
the run** (probe auto-glob route: this file is mathlib-only; stage under a ProbeG*-matching
name or a dedicated pilot stage at execution time). NOT a proof artifact: sorry-free
Prop-defs + #check pins (pilot-22 `ProbeP1_PNT.lean` house style; ZERO sorries — the
declared probe-convention class is EMPTY; elaboration IS the deliverable).

Scope (dossier `candidates/74-surprisal-moment-hierarchy-ceilings.md`, the chartered
T1+T2+T4 core; T3 = the contingent LP M-core, NOT in this tranche — it rides the shared
02 LP layer). The three week1-agenda row-7 scope rules are applied as follows:
  1. Entropy object phrased as **p-indexed finite sums** (`Real.negMulLog`,
     `NegMulLog.lean:164`), i.e. the claim shape is "mathlib-absent" — NEVER
     "Lean-ecosystem-absent" (physlib master has `Sᵥₙ`/DPI; dossier wing-check rows
     (f)–(g) are the record).
  2. `m_u` here is the FILTERED single-spectrum moment — NOT a trace functional; the
     physlib sandwiched-Rényi DPI family (`QuantumInfo/Entropy/DPI.lean`, gh-API-verified
     `physlib-surface.md` §6(g)) is a MUST-CITE nearest-miss in the record chain, never a
     dependency. If any P1+ restatement rephrases `m_u` as trace functionals of the
     state, that cite becomes mandatory in the artifact header (rule verbatim in
     core-prep.md).
  3. Proof-engine: tauceti `Analysis/Matrix/OperatorJensen.lean` is importable on our pin
     (d92acc5c0, same toolchain family — census: `conjTranspose_mul_cfc_mul_le_
     cfc_conjTranspose_mul_mul` :64, `PosDef.conjTranspose_mul_log_mul_le_log` :124);
     physlib `QuantumInfo/ForMathlib/HayataGroup/TraceInequality/` is v4.35
     DO-NOT-CONSUME — citation only. NOT in tauceti (census 2026-11-17: 0 hits). P1's
     route choice cites BOTH (core-prep.md §4).

Census anchors (this session, A8; full table in `core-prep.md` §3):
  * mathlib-absent (the S1 evidence): NO Rényi entropy (only the Erdős–Rényi random-graph
    NAMING debate, `Probability/Combinatorics/BinomialRandomGraph/Defs.lean:28–35`), NO
    `relativeEntropy`/`sandwiched`/`traceFunctional` (rg over `Mathlib/` = 0), NO
    von-Neumann/matrix entropy (`LinearAlgebra/Matrix/` rg = 0; `InformationTheory/` =
    classical Shannon/KL only). Substrate present: `Real.negMulLog` :164, `Real.exp/log/
    sqrt`, `Analysis/Convex/Separation.lean` (T3's, not this tranche).
  * OAI donor (statement-level citation, Liu-1; v4.34.1 DO-NOT-CONSUME):
    `PEPSSubvolume/EntropyMoments.lean` `moment :93 / entropy :94 / logMoment :95`
    re-verified this session. OUR `mU` is the FILTERED left-hand definition — the u ≠ 1
    caveat (A5 VERDIENTS row-74 glue note) is void in our statements by construction;
    T1b/T1c quantify u over windows excluding 1 regardless.

Binder inventory (the open cores, EnclOK naming): `hMGF` inside `InMGFClass`/`stmt_T1c`
(verbatim first clause of AreaLaw2D `MarginalTails`, `Statements.lean:482–485`,
transcribed onto our defs); `hVarLB` inside `stmt_T4` (extremal-family variance floor —
P1 discharges by explicit two-atom construction); the B₁/B₂ class-restriction reading of
T4 is the declared P1 statement-design question Q1 (`core-prep.md` §5).

A8 fix (2026-11-17, run1→run2): the data defs carry `noncomputable` (Real.log /
negMulLog / decidableLT / sInf / sSup are noncomputable — run1's 10-error class),
and the datum exponent is `((j : ℕ) + 1)` (was `j + 1`, which elaborates in `Fin k`
— run1's OfNat/HPow errors). Quotation/annotation fixes; no content change.
-/
import Mathlib

open Filter

namespace CrossMath.Pilot74

/-! ## Decl pins (elaboration fails here if any cited name/signature drifted) -/

#check @Real.negMulLog
#check @Real.exp
#check @Real.sqrt

/-! ## The data: spectra, surprisal, entropy, filtered moment, variance, window -/

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- Dossier §Precise [VERIFIED]: `p ≥ 0`, `∑ p = 1` (the eigenvalue list of a reduced
density matrix). -/
def IsSpectrum (p : ι → ℝ) : Prop := (∀ i, 0 ≤ p i) ∧ ∑ i, p i = 1

/-- The support (`{i | 0 < p i}` as a `Finset`). -/
noncomputable def supp (p : ι → ℝ) : Finset ι := Finset.univ.filter (fun i => 0 < p i)

/-- Surprisal `K i := -log (p i)` (OAI265 Lemma 3.1 convention). -/
noncomputable def surprisal (p : ι → ℝ) (i : ι) : ℝ := -Real.log (p i)

/-- Entropy `S p = ∑ negMulLog (p i)` — identical to OAI `entropy` (:94). -/
noncomputable def S (p : ι → ℝ) : ℝ := ∑ i, Real.negMulLog (p i)

/-- The shared moment object `m_u(p) := ∑_{supp} p i * exp (-u * log (p i))` — the
FILTERED left-hand definition (dossier §Precise; the unfiltered OAI `moment p u = ∑
(p i)^(1-u)` :93 differs only at the degenerate `u = 1`, A5 glue note — excluded by every
window used below). -/
noncomputable def mU (p : ι → ℝ) (u : ℝ) : ℝ := ∑ i ∈ supp p, p i * Real.exp (-u * Real.log (p i))

/-- `Var_p(K) = E[K²] − S²` over the finite spectral measure. -/
noncomputable def varK (p : ι → ℝ) : ℝ := (∑ i ∈ supp p, p i * surprisal p i ^ 2) - S p ^ 2

/-- The ε-smooth surprisal window `W_ε(p) := inf {w ≥ 0 | ∑_{w < |K − S|} p ≤ ε}`
(the effective-rank object; Kuwahara-safe family member). -/
noncomputable def W (p : ι → ℝ) (ε : ℝ) : ℝ :=
  sInf {w : ℝ | 0 ≤ w ∧
    ∑ i ∈ Finset.univ.filter (fun i => w < |surprisal p i - S p|), p i ≤ ε}

/-- `W_ε` as a functional (the `F`-slot occupant for the certificate layer). -/
noncomputable def Wfun (ε : ℝ) : (ι → ℝ) → ℝ := fun q => W q ε

/-! ## T1 — moment–window floor AND subgaussian ceiling (unconditional) -/

/-- **T1(a) floor** (Cantelli over the finite spectral measure): for every spectrum and
ε ∈ (0,1), `√((1−ε)/ε · Var) ≤ W_ε(p)`. -/
def stmt_T1a (p : ι → ℝ) : Prop :=
  ∀ ε : ℝ, 0 < ε → ε < 1 → Real.sqrt ((1 - ε) / ε * varK p) ≤ W p ε

/-- The canonical two-sided subgaussian quantile — the statement-level constant choice
for the dossier's `Φ(ε) = Θ(log(1/ε))` (P1 owns the constant bookkeeping). -/
noncomputable def Phi (ε : ℝ) : ℝ := Real.sqrt (2 * Real.log (2 / ε))

/-- **T1(b) ceiling** (local-MGF variance + window): if `log m_u ≤ u·S + σ²u²` on
`|u| ≤ 1/(2σ)`, then `Var ≤ 2σ²` and `W_ε ≤ σ·Φ(ε)` for every ε ∈ (0,1). -/
def stmt_T1b (p : ι → ℝ) : Prop :=
  ∀ σ : ℝ, 0 < σ →
    (∀ u : ℝ, |u| ≤ 1 / (2 * σ) →
      Real.log (mU p u) ≤ u * S p + σ ^ 2 * u ^ 2) →
    varK p ≤ 2 * σ ^ 2 ∧
      ∀ ε : ℝ, 0 < ε → ε < 1 → W p ε ≤ σ * Phi ε

/-- **T1(c) binding MarginalTails** — the hMGF binder is the VERBATIM first clause of
AreaLaw2D `MarginalTails` (`Statements.lean:482–485`) transcribed onto our defs;
conclusion `Var ≤ 1024·e·θ·B` (= 2·(512eθB)) and `W_ε ≤ √(512·e·θ·B)·Φ(ε)` —
MarginalTails recovered as the 2-moment-level point of the hierarchy. -/
def stmt_T1c (p : ι → ℝ) : Prop :=
  ∀ θ B : ℝ, 0 < θ → 1 ≤ B →
    (∀ u : ℝ, |u| ≤ 1 / (32 * Real.sqrt ((1 + θ) * B)) →
      Real.log (mU p u) ≤ u * S p + 512 * Real.exp 1 * θ * B * u ^ 2) →
    varK p ≤ 1024 * Real.exp 1 * θ * B ∧
      ∀ ε : ℝ, 0 < ε → ε < 1 →
        W p ε ≤ Real.sqrt (512 * Real.exp 1 * θ * B) * Phi ε

/-! ## T2 — inclusion monotonicity of the certificate ceilings -/

/-- The k-moment datum `d^(k)(p) = (E[K], E[K²], …, E[K^k])` (`j+1` indexing). -/
noncomputable def datum (p : ι → ℝ) (k : ℕ) : Fin k → ℝ :=
  fun j => ∑ i ∈ supp p, p i * surprisal p i ^ ((j : ℕ) + 1)

/-- F-validity of a k-moment certificate `(c₀, a)` (dossier §Precise). -/
def CertValid (F : (ι → ℝ) → ℝ) (k : ℕ) (c₀ : ℝ) (a : Fin k → ℝ) : Prop :=
  ∀ q : ι → ℝ, IsSpectrum q → c₀ + ∑ j, a j * datum q k j ≤ F q

/-- The k-th ceiling `B_k(F) := sup {c₀ | ∃ a, (c₀, a) F-valid}` (dossier-02 pattern). -/
noncomputable def Bk (F : (ι → ℝ) → ℝ) (k : ℕ) : ℝ :=
  sSup {c₀ : ℝ | ∃ a : Fin k → ℝ, CertValid F k c₀ a}

/-- **T2** (zero-padding injection preserves validity and value):
`B_k(F) ≤ B_{k+1}(F)` for every functional `F` and `k`. -/
def stmt_T2 (F : (ι → ℝ) → ℝ) (k : ℕ) : Prop := Bk F k ≤ Bk F (k + 1)

/-! ## T4 — method-barrier tightness for the ≤2-moment data class (binder form) -/

/-- hMGF-class membership at scale `B` (the binder-inventoried class; P1 refines the
class shape with the dossier owner). -/
def InMGFClass (p : ι → ℝ) (θ B : ℝ) : Prop :=
  IsSpectrum p ∧ 1 ≤ B ∧
    ∀ u : ℝ, |u| ≤ 1 / (32 * Real.sqrt ((1 + θ) * B)) →
      Real.log (mU p u) ≤ u * S p + 512 * Real.exp 1 * θ * B * u ^ 2

/-- **T4** (family-binder form; consumer = AreaLaw2D 3D target C.3): under an
hMGF-class family `P` and the INVENTORIED binder `hVarLB` (extremal-family variance
floor `κ·B ≤ Var(P B)` — P1 discharges it by explicit two-atom construction), the floor
is achieved at every scale AND the window is not `o(√B)` — the √B window is tight for
the ≤2-moment data class (both sides from T1). The B₁/B₂ class-restriction reading is
P1 question Q1 (core-prep.md §5). -/
def stmt_T4 (P : ℝ → ι → ℝ) (θ κ ε : ℝ) : Prop :=
  0 < κ → 0 < ε → ε < 1 →
    (∀ B : ℝ, 1 ≤ B → InMGFClass (P B) θ B) →
    (∀ B : ℝ, 1 ≤ B → κ * B ≤ varK (P B)) →
    (∀ B : ℝ, 1 ≤ B → Real.sqrt ((1 - ε) / ε * varK (P B)) ≤ W (P B) ε) ∧
      ¬ (fun B : ℝ => W (P B) ε) =o[atTop] (fun B : ℝ => Real.sqrt B)

end CrossMath.Pilot74
