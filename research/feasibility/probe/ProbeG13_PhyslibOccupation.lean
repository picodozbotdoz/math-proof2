/-
Statement elaboration probe — not a proof artifact.
**STAGED 2026-11-17 (lane A8, iteration-4 wave-2 prep; bench item backlog S13 / §14
row 14) — run only on orchestrator approval.** Mathlib-only on OUR pin (ff2494ea /
v4.36.0-rc2); rides the `run_gprobe.sh probe` auto-glob exactly like G1/G3/G4/G7/G9
(NOT in gprobe.py's skip set — the file elaborates mathlib-only; the next approved
probe-mode batch picks it up). Zero sorries: every decl below is a def (Prop shapes)
or a trivial binder-consumption theorem; the elaboration IS the evidence.

Probe G13 (physlib occupation-pair bridge, seed 13): article-52's ε-uniform
occupation-pair axiom layer — OUR GREEN pilot (`pilots/52/M1.lean`, structure
`OccupationPair` :37–46, `dual_family` :105, on-pin triad per pilots/52 logs) —
instantiated on physlib's create/annihilate-tagged field-op carrier. The bridge
direction is relation-layer donation FROM us: physlib's `CreateAnnihilate` /
`CrAnFieldOp` impose NO relation semantics (physlib-surface.md §1 verdict; re-read
unchanged on master 2026-11-16, §6 wing check — "no CAR/CCR relation layer for
fermions anywhere"), which is exactly the empty zone (i) of physlib-surface §4.
physlib is v4.35.0 and NOT ff2494ea-compatible (G5a BLOCKED-INFRA precedent) —
**DO-NOT-CONSUME as a build dependency; statement-level quotation only** (the Liu-1
convention): the physlib-side shapes below are QUOTED mirrors of

  * `FieldStatistics/CreateAnnihilate.lean` — the two-element tag type
    (`create`/`annihilate`) and `normalOrder : CreateAnnihilate → CreateAnnihilate →
    Prop` (total, transitive; FALSE only for (annihilate, create));
    physlib-surface.md :34–36;
  * `FieldSpecification/CrAnFieldOp.lean` — `CrAnFieldOp := Σ (s : 𝓕.FieldOp),
    𝓕.fieldOpToCrAnType s` with the tag map `crAnFieldOpToCreateAnnihilate`;
    "no algebra structure is imposed"; physlib-surface.md :39–41;

and the article-52 side quotes `OccupationPair`'s field shapes VERBATIM from
`pilots/52/M1.lean:37–46` (cc / aa / ac_self / ac_ne / vac / avac) as a Prop-valued
predicate — the probe is standalone (G-series files import Mathlib only), so the
structure itself is not imported, only its axiom shapes re-stated with the M1 cite.

DIFFERENTIATION GATES (backlog row 14 — before any PILOT, not before this statement
elaboration): (a) article 52 is ours (M1 GREEN on-pin; `OccupationPair`/`dual_family`
name-absence in the corpus checked pre-run per 52-blueprint :88/:149); (b) physlib's
`WickContraction/Sign/` stack is the exchange-SIGN layer, not an occupation-pair
relation layer (physlib-surface §5.1 precision-corrected verdict); (c) OAI Laughlin
matrices are a distinct target (§6 wing check (1)); (d) the §5.5 physlib clock
(`pushed_at` single-fetch) must show the relation-layer gap still open at fire time —
the library moves daily (LadderSystem wing).

SIZING CARD (A8's §4 method, a8-week1-validation.md §4; applied as instructed):
  * THIS probe: closure = `import Mathlib` single file; elaboration jobs = 1 on the
    warm probe image; class C1 statement probe, 3–4 min warm (§5b cost row 1; the
    G9/G1/G3/G4/G7 batch class). No Modal surface beyond the existing kit (§5c).
  * IF a donor-pin elaboration is ever chartered (physlib's own tree, v4.35.0):
    closure census = import-BFS from the three entry files above (oai_closure.py
    method, ROOT re-pointed; prefix classes Physlib / PhyslibAlpha / QuantumInfo /
    Mathlib); job estimate = BFS files + residual after physlib's own
    `lake exe cache get`; anchors — zeta23e 144-file pruned closure → 3,698 jobs ≈
    14.4 min at 2cpu (≈4.3 jobs/s), OAI whole-tree donor build ≈ 29 min (run35);
    physlib full tree = 2,284 paths (master snapshot 2026-11-16) → whole-tree ≈
    V2-class upper range (1–2 h), but the PRUNED CrAnFieldOp closure is expected ≪
    (the FieldSpecification cluster only) → minutes-class single SPEC function,
    3-h timeout; pre-flag the lake-build CPU burst (launch `lake build -j 2` per the
    wave-2 runner-fix pattern). Memory non-binding at this scale (measured donor
    builds peaked 1.6–1.8 GB; the 5–6 GB `mem` readings are the inherent
    mmapped-olen class — `anon` is the signal).

Expected verdict (one line, for the probes ledger): OK, 0 errors, 0 sorry-warnings —
the axiom-layer shapes and the bridge statement elaborate on ff2494ea; a FAIL means
a mirror-shape drift (fix the quotation, never the donor).

VERDICT (2026-11-17, runs 38/39, orchestrator-approved): run 38 FAIL (sigma-universe
quotation drift, :107 — fixed Type-0-uniform) → **run 39 GREEN: OK rc=0 errors=0
sorry-warnings=0**, wall 77 s, telemetry mem OVER=1 = inherent mmapped-olen class
(anon=0). Logs: `logs-g/run38-g13.log`, `logs-g/run39-g13-fix.log`.
-/
import Mathlib

namespace ProbePhyslibOccupation

#check @Module.End

/-! ## Article-52 side: the occupation-pair axiom layer (M1.lean:37–46, verbatim shapes) -/

/-- The `OccupationPair` field axioms (`cc`, `aa`, `ac_self`, `ac_ne`, `vac`, `avac`)
as a Prop-valued predicate on given creation/annihilation endomorphism families and a
vacuum — `pilots/52/M1.lean:37–46`, quoted (the probe is standalone mathlib-only). -/
def IsOccupationPairOn {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]
    (ε : R) (ι : Type*) [DecidableEq ι]
    (c a : ι → (M →ₗ[R] M)) (vac : M) : Prop :=
  (∀ i j, c i * c j = ε • (c j * c i)) ∧
    (∀ i j, a i * a j = ε • (a j * a i)) ∧
    (∀ i, a i * c i = 1 + ε • (c i * a i)) ∧
    (∀ i j, i ≠ j → a i * c j = ε • (c j * a i)) ∧
    (∀ i, a i vac = 0)

/-! ## Physlib side (QUOTED mirrors — statement-level citation, Liu-1 convention;
the donor is v4.35.0 and is never imported here). -/

/-- Mirror of physlib's two-element tag type (`CreateAnnihilate.lean`;
physlib-surface.md :34–36). -/
inductive CrAnTag : Type
  | create : CrAnTag
  | annihilate : CrAnTag

/-- Mirror of physlib `normalOrder : CreateAnnihilate → CreateAnnihilate → Prop`
(total, transitive; false only for (annihilate, create)) — physlib-surface.md :35–36.
Quoted for the record; the dossier owns the orientation argument. -/
def normalOrderMirror : CrAnTag → CrAnTag → Prop
  | .create, _ => True
  | .annihilate, .create => False
  | .annihilate, .annihilate => True

/-- Mirror of physlib `CrAnFieldOp := Σ (s : 𝓕.FieldOp), 𝓕.fieldOpToCrAnType s`
(`FieldSpecification/CrAnFieldOp.lean`; physlib-surface.md :39–41 — "no algebra
structure is imposed", the relation-layer gap this seed donates INTO). The tag map
`crAnFieldOpToCreateAnnihilate` is abstracted to a parameter below (`tagOf`).
A8 fix (2026-11-17, run38→run39): Type-0-uniform (was `Type*` — the sigma
`Σ s : F, σ s : Type (max u v)` cannot land in the def's `Type` result; quotation
fix per the header rule, no content change). -/
def CrAnFieldOpMirror (F : Type) (σ : F → Type) : Type := Σ s : F, σ s

/-! ## Seed-13 bridge statement (statement-only; elaborates, unproved by design —
the 22-blueprint `stmt_Tier2` Prop-def pattern). -/

/-- SEED 13 (backlog S13 / §14 row 14; physlib-surface §4(i)): article-52's
ε-uniform occupation-pair axioms admit an instantiation on the create/annihilate-
tagged field-op carrier — linear state space, creation/annihilation endomorphisms
indexed by tagged field ops, a vacuum, the `OccupationPair` relations, and the tag
discipline (every index's carrier op is create- or annihilate-tagged via `tagOf`).
Nondegeneracy conditions are deliberately NOT asserted here — the dossier refines
them; this is the statement-elaboration surface the G13 verdict certifies. -/
def stmt_physlib_occupation_pair (R M ι F : Type)
    [CommRing R] [AddCommGroup M] [Module R M] [DecidableEq ι]
    (σ : F → Type) (ε : R) (tagOf : CrAnFieldOpMirror F σ → CrAnTag) : Prop :=
  ∃ (φ : ι → CrAnFieldOpMirror F σ) (c a : ι → (M →ₗ[R] M)) (vac : M),
    (∀ i, tagOf (φ i) = CrAnTag.create ∨ tagOf (φ i) = CrAnTag.annihilate) ∧
      IsOccupationPairOn ε ι c a vac

/-- Binder-consumption pattern (trivial; validates the conditional-theorem shape —
the G9 `conditional_shape` precedent). -/
theorem conditional_shape {R M ι F : Type}
    [CommRing R] [AddCommGroup M] [Module R M] [DecidableEq ι]
    {σ : F → Type} {ε : R} {tagOf : CrAnFieldOpMirror F σ → CrAnTag}
    (h : stmt_physlib_occupation_pair R M ι F σ ε tagOf) :
    stmt_physlib_occupation_pair R M ι F σ ε tagOf := h

end ProbePhyslibOccupation
