/-
Pilot liu-bnew P0 — statement-level port of Liu-1's B_new / B_r zero-free entries
(W2-5, the named-cheap item; charter §2 same-week rung 4). Statement rung ONLY:
Prop-valued defs + #check, plus two one-line consumer bridges; ZERO sorry, and NO
Liu content is proved, claimed, or imported here.

Convention (Liu-1 convention, `research/novelty/liu1-as-donor.md` §5): statement-level
citation ONLY; DO-NOT-CONSUME the sibling repo as a build dependency (toolchain
v4.34.1, vendored openai tree). Every Liu-shaped fact below is a HYPOTHESIS BINDER
(EnclOK/ProbeE precedent: donor statements as explicit Props — the port assumes
exactly what Liu-1 proves, never more). Liu-1's own hygiene remains CLAIM-level
(AGENTS.md Cycle-2 gate); nothing here upgrades it.

Provenance of mirrored shapes (read-only sibling `/home/doz/zcode-workdir/liu-zerofree/`,
rev 7d10420; never imported):
  * `B_r`, `B_new`       ~ CombinedPaperVerification.lean:16/:19 (verbatim values;
                          B_new = (1507 − 2√921)/1653 ≈ 0.8749571 exactly as the
                          AGENTS.md constant story records; the README decimal
                          0.8749570698… is this term, the ~5e-10 delta was paper-side)
  * `LiuBoundaryOrder`   ~ CombinedPaperVerification.lean:44 `boundary_order :
                          B_new < B_r ∧ B_r < 7/8` — PROVED there (via
                          RHV2.gate_v1_improvement + norm_num); STATED here as the
                          hypothesis-binder pair. Gap arithmetic: 7/8 − B_r = 1/40000.
  * entry statements     ~ RHZeroFreeExtension.lean:16–35 (Part II rational tier at
                          B_r: beta_star_le, hecke_nonzero, dirichlet_nonzero,
                          zeta_nonzero) + CombinedPaperVerification.lean:82–102
                          (Part III algebraic tier at B_new)
  * Cor. 14.1 shape      ~ ActualDirichletTransfer.lean:13–40 — boundary-parameterized
                          transfer with the Hecke premise explicit; ζ lands via the
                          principal character at q = 1 (zeta_nonzero_of_hecke_bound)
  * `H`/`LF`/`residue`   ~ abstract stand-ins for Liu-1's OAI SevenEighths.HeckeFamily
                          `Character`/`LFunction`/`.residue` (vendored openai tree,
                          absent here by the DO-NOT-CONSUME rule; docstrings anchor
                          the referents)
  * Dirichlet vocabulary ~ OUR mathlib `DirichletCharacter.LFunction`
                          (Mathlib/NumberTheory/LSeries/DirichletContinuation.lean),
                          explicit-instance route per the pilot-50 delta note
                          (pilots/50/Dirichlet.lean:9–19; logically inert)

Consumer alignment (the point of the port): given `hOr : LiuBoundaryOrder`, the two
bridges below discharge pilot 50's `hQRH` (pilots/50/M1.lean:45) and `hQRHχ`
(pilots/50/Dirichlet.lean:41–43) binders AS WRITTEN — the same weakening step as
Liu-1's own `original_*_nonzero` (lt_trans boundary_order.2). Liu's B_r = 0.874975
beats the in-corpus openai 7/8 donor constant (informal frontier B♭ 0.8748866 /
B_new 0.8749570, charter §2 rung 4 context).

Billing: ENGINEERING statement-port — never discovery-billed; no article
(`a9-iter5-article-watchlist.md` §1 row 8). Probe-convention file: NEVER a Step-B
stage (FINAL-SWEEP-PLAN §7a zzv2-P0 ruling class); the two bridge theorems are the
only proofs and are complete (no sorry).
Substrate: mathlib ff2494ea5e43…, Lean v4.36.0-rc2, warm `crossmath-probe`, doz CLI.
-/
import Mathlib

namespace CrossMath.LiuBNew

/-! ## The constants (verbatim Liu-1 spellings) -/

/-- The public-entry boundary of Liu-1, the exact rational `34999/40000 = 0.874975`
(CombinedPaperVerification.lean:16; the deliberately weakened public constant —
Liu-1's headline theorems consume this, not B_new). `noncomputable` for the same
reason Liu-1's own file opens `noncomputable section`: ℝ-division lives in the
`Real.instDivInvMonoid` noncomputable instance (run-1 finding, fixed in run 2). -/
noncomputable def B_r : ℝ := 34999 / 40000

/-- Liu-1's optimal constant in exact arithmetic (CombinedPaperVerification.lean:19):
`B_new = (1507 − 2√921)/1653 ≈ 0.8749571`; PROVED inside Liu-1 to satisfy
`B_new < B_r` (the paper's improvement gate) — never consumed numerically here. -/
noncomputable def B_new : ℝ := (1507 - 2 * Real.sqrt 921) / 1653

/-! ## The boundary-order binder pair and the entry statements (all hypothesis binders) -/

/-- Liu-1's proved order fact (CombinedPaperVerification.lean:44), stated here as the
hypothesis-binder pair our consumers assume: `B_new < B_r ∧ B_r < 7/8`. The second
component is the discharge lever for every 7/8-class consumer. -/
def LiuBoundaryOrder : Prop := B_new < B_r ∧ B_r < (7 / 8 : ℝ)

/-- Hecke-family zero-free statement at boundary `b`, abstract over the family:
`H` = the character type, `LF` = its L-function, `residue` = the pole-residue test.
Mirrors Liu-1 `hecke_nonzero` (RHZeroFreeExtension.lean:17–19, Part II tier at
`B_r`; algebraic tier `algebraic_hecke_nonzero` at `B_new`): nonvanishing in the
open half-plane `b < Re s`, with the principal-pole disjunction carried verbatim. -/
def LiuHeckeZeroFree (H : Type) (LF : H → ℂ → ℂ) (residue : H → ℂ) (b : ℝ) : Prop :=
  ∀ (η : H) (s : ℂ), b < s.re → (s ≠ 1 ∨ residue η ≠ 1) → LF η s ≠ 0

/-- Supremum statement, abstract: `β` stands in for Liu-1's `HeckeZeroSupremum.beta`
(the supremum over the finite-residue Hecke family over the Eisenstein field
ℚ(√−3), sentinel 1/2). Mirrors `beta_star_le` (RHZeroFreeExtension.lean:16,
`β ≤ 34999/40000`) and `algebraic_family_bound` (`β ≤ B_new`). -/
def LiuBetaBound (β : ℝ) (b : ℝ) : Prop := β ≤ b

/-- Dirichlet entry: every Dirichlet L-function is zero-free in the open half-plane
`b < Re s`, principal pole excluded. Mirrors Liu-1 `dirichlet_nonzero`
(RHZeroFreeExtension.lean:20–25). Instance binder explicit + `@`-application per the
pilot-50 delta note (deterministic elaboration; logically inert). -/
def LiuDirichletZeroFree (b : ℝ) : Prop :=
  ∀ (q : ℕ) (inst : NeZero q) (χ : DirichletCharacter ℂ q) (s : ℂ),
    b < s.re → ¬ (χ = 1 ∧ s = 1) →
    @DirichletCharacter.LFunction q inst χ s ≠ 0

/-- ζ entry, public-entry shape: the pole clause `s ≠ 1` is carried verbatim from
Liu-1 `zeta_nonzero` (RHZeroFreeExtension.lean:27–29) — unused in Liu-1's own proof,
kept for shape fidelity with the OAI challenge family. -/
def LiuZetaZeroFree (b : ℝ) : Prop :=
  ∀ s : ℂ, b < s.re → s ≠ 1 → riemannZeta s ≠ 0

/-- ζ entry, pole-free shape — the transfer's conclusion form
(`zeta_nonzero_of_hecke_bound`, ActualDirichletTransfer.lean:31–35) and the shape
directly comparable to the openai 7/8 challenge form (pilot 50's `hQRH`). -/
def LiuZetaZeroFree' (b : ℝ) : Prop :=
  ∀ s : ℂ, b < s.re → riemannZeta s ≠ 0

/-- Cor. 14.1 transfer shape (Liu arXiv:2610.12234 Cor. 14.1; formal shape =
ActualDirichletTransfer.lean:13–40): at any positive boundary, a Hecke-family
zero-free premise transfers to EVERY Dirichlet L-function AND to ζ — ζ enters as the
principal character at `q = 1`. Liu-1 proves this for its OAI vocabulary; the port
states the shape with the Hecke premise explicit over the abstract family. -/
def LiuCor14_1Transfer (H : Type) (LF : H → ℂ → ℂ) (residue : H → ℂ) : Prop :=
  ∀ b : ℝ, 0 < b →
    LiuHeckeZeroFree H LF residue b →
      LiuDirichletZeroFree b ∧ LiuZetaZeroFree' b

/-- The full entry surface as one bundle (the artifact's summary statement):
the Part II rational tier at `B_r` and the Part III algebraic tier at `B_new`,
exactly the seven public entries of Liu-1's two verification tiers. -/
def LiuEntryTiers (H : Type) (LF : H → ℂ → ℂ) (residue : H → ℂ) (β : ℝ) : Prop :=
  LiuBetaBound β B_r ∧
    LiuHeckeZeroFree H LF residue B_r ∧
    LiuDirichletZeroFree B_r ∧ LiuZetaZeroFree B_r ∧
    LiuHeckeZeroFree H LF residue B_new ∧
    LiuDirichletZeroFree B_new ∧ LiuZetaZeroFree B_new

/-! ## Consumer bridges (proved; the pilot-50 discharge, AS WRITTEN) -/

/-- Consumer bridge 1: from the pole-free Liu ζ statement at `B_r` and the boundary
order, pilot 50's `hQRH` binder (M1.lean:45 — `∀ s : ℂ, 7/8 < s.re → riemannZeta s ≠ 0`)
follows AS WRITTEN. Same weakening step as Liu-1's own `original_zeta_nonzero`
(`lt_trans boundary_order.2`). No Liu content used: pure order composition. -/
theorem discharge_hQRH_of_liu
    (hOr : LiuBoundaryOrder) (hζ : LiuZetaZeroFree' B_r) :
    ∀ s : ℂ, (7 / 8 : ℝ) < s.re → riemannZeta s ≠ 0 :=
  fun _ hs => hζ _ (lt_trans hOr.2 hs)

/-- Consumer bridge 2: the Dirichlet analogue — pilot 50's `hQRHχ` binder
(Dirichlet.lean:41–43, explicit-instance form) follows AS WRITTEN from the Liu
Dirichlet statement at `B_r` plus the boundary order. -/
theorem discharge_hQRHχ_of_liu
    (hOr : LiuBoundaryOrder) (hχ : LiuDirichletZeroFree B_r) :
    ∀ (q : ℕ) (inst : NeZero q) (χ : DirichletCharacter ℂ q) (s : ℂ),
      (7 / 8 : ℝ) < s.re → ¬ (χ = 1 ∧ s = 1) →
      @DirichletCharacter.LFunction q inst χ s ≠ 0 :=
  fun _ _ _ _ hs hpole => hχ _ _ _ _ (lt_trans hOr.2 hs) hpole

#print axioms discharge_hQRH_of_liu
#print axioms discharge_hQRHχ_of_liu

/-! ## Statement-rung checks -/

#check @LiuBoundaryOrder
#check @LiuHeckeZeroFree
#check @LiuBetaBound
#check @LiuDirichletZeroFree
#check @LiuZetaZeroFree
#check @LiuZetaZeroFree'
#check @LiuCor14_1Transfer
#check @LiuEntryTiers

end CrossMath.LiuBNew
