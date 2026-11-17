# Pilot 75-N2 P0 — verification record + P1 recommendation

Lane A5, 2026-11-17. Charter: orchestrator P0 GO ruling of 2026-11-17; dossier
`research/candidates/75-N2-rayclass-dirichlet-consumer.md` §Pilot spec skeleton.
This file is the §10.10-format row block for the N2-P0 run (A1 folds it into
`qa/iter4-review/r3-verification-tables.md` per one-writer discipline — A1's file).
Evidence of record: `pilots/75/logs/n2-p0-run4.log` (GREEN, final); fix-loop logs
`n2-p0-run1/-run2/-run3.log`.

## Run summary

| run | date | verdict | error class fixed next |
|---|---|---|---|
| run1 (`n2-p0-run1.log`) | 2026-11-17 | Pa OK; N2-P0 FAIL rc=1 errors=8 sorry=0 | H7 missing `[NeZero q]` (root; `LFunction` demands it — DirichletContinuation.lean:50); H8 `noncomputable` marks |
| run2 (`n2-p0-run2.log`) | 2026-11-17 | Pa OK; N2-P0 FAIL rc=1 "errors=0" sorry-shown=0 (1 hidden) | runner filter missed the `: error(code):` message form; 1 error existed (see run3) |
| run3 (`n2-p0-run3.log`, diagnostic) | 2026-11-17 | Pa OK; N2-P0 FAIL rc=1 errors=1 | `Complex.analyticOnNhd` unknown — dot-chain misresolution; fixed with explicit `DifferentiableOn.analyticAt` (CauchyIntegral.lean:723) |
| run4 (`n2-p0-run4.log`) | 2026-11-17 | **Pa OK; N2-P0 GREEN — rc=0, errors=0, sorry=0** | — |

Telemetry (run4): wall 67 s, max_cpu 0.72 (spec 2.0), max_mem 2720 MB (spec 4096),
OVER=0 — within AGENTS §Modal defaults. Route: doz CLI `/home/doz/dozenv/bin/modal`,
app `crossmath-pilot-75` (image layers shared with run_pilot.py's bake), stage
`/tmp/crossmath-n2p0-stage/`, runner `run_n2p0.py` (pilot-11 dependency-order olean
pattern: `Pa.lean → Pa.olean` on LEAN_PATH, then `N2-P0.lean` with `import Pa`).
4 runs total — at the ~4-run fix-loop budget; descent 8→1(hidden)→1→0.

## Verification table (§10.10 format; coverage class C1 — every declaration has a
direct print in `n2-p0-run4.log`)

| decl | file:line | status | axioms print source | notes |
|---|---|---|---|---|
| `zetaL_rat_two_thirds_landed` | `pilots/75/N2-P0.lean:219` | PROVED-CONDITIONAL (statement rung; engine application) | `logs/n2-p0-run4.log` (Pilot75N2 block) — triad `[propext, Classical.choice, Quot.sound]`, 0 sorryAx | the N2-d landing at P0 honesty level; binders: hne, hN, hLχ, hK/hL, hntopK/hntopL/hntopψ, hAbFacQ, hfinK/hfinL/hfinψ, hAK (ζ-column slot, P3), hEχcum (Dirichlet column, P2) |
| `ThmEDyadic` | `N2-P0.lean:102` | statement-port (zeta23 `thmE_A₀` conclusion, EnclOK implication form) | idem — triad | donor chain audited GREEN at the zeta23 pin (`pilots/zeta23e/logs/zeta23e-p0-run1.log`) |
| `IsNontrivialZeroL`/`zeroMultL`/`zerosInL`/`NcountL`/`N0starL` | `N2-P0.lean:83–95` | transcription defs (zeta23 `Challenge.lean:92–108` verbatim shapes) | idem — triad | `[NeZero q]` section parity with the donor; `noncomputable` for `analyticOrderAt` |
| `IsDZDFRayClassCharacterQ`/`IsDZDFPrincipalQ`/`DZDFAbelianFactorizationQ` | `N2-P0.lean:115–147` | DZDF statement-binders (quoted, NEVER imported; G1b fence) | idem — triad | verbatim-field quotes at K = ℚ (DedekindZetaChallenge.lean:14–20/:26–28; AbelianRayCharacterFactorization.lean:62–73) |
| `HasQDirichletDictionary` | `N2-P0.lean:152` | P1 discharge target (N2-a) | idem — triad | dictionary + Hecke-tsum = `LFunction` identification + principality transfer |
| `DirichletFactorizationTransferQ` | `N2-P0.lean:166` | P1 discharge target (factorization transfer) | idem — triad | DZDF-Hecke form ⇒ Dirichlet-`LFunction` form + `1 < q i ∧ ψ i ≠ 1` |
| `HasEulerStripImmunity` | `N2-P0.lean:181` | P2 discharge target (N2-b, pair form) | idem — triad | imprimitive vs primitive-associate strip multiplicities |
| `CountsUnbounded` | `N2-P0.lean:189` | classical structural binder (hUnb; Titchmarsh §5.8/Davenport ch. 9) | idem — triad | needed only for dyadic→cumulative absorption |
| `ThmEDyadicToCumulative` | `N2-P0.lean:201` | P2 discharge target (N2-c port schema, primitive level) | idem — triad | composes with immunity for imprimitive components |
| (engine) `zetaL_assembly_landed` + 16 heritage | `Pa.lean` (frozen, GREEN run6) | PROVED (heritage carry) | `n2-p0-run4.log` Pa block — triad | recompiled clean in-run via the sibling-import route |

Hygiene class (file header): STATEMENT RUNG, ZERO-SORRY BY CONSTRUCTION — no
probe-header sorry class used; the only proof is one engine application plus mathlib
one-liners (`DirichletCharacter.differentiable_LFunction` :97 →
`DifferentiableOn.analyticAt` CauchyIntegral.lean:723). 277 LoC.

## Design deltas vs the dossier's P0 spec (recorded for P1)

1. **Abstract component family `Lχ` + `hLχ`/`hN` binders** (dossier spec had the
   landing state `(ψ i).LFunction` directly): `DirichletCharacter.LFunction` requires
   `[NeZero N]` (DirichletContinuation.lean:50), which is not synthable per-index for
   a dependent family `ψ : ∀ i, DirichletCharacter ℂ (q i)`; the landing therefore
   quantifies over `Lχ : Fin n → ℂ → ℂ` with the @-explicit identification
   `hLχ : ∀ i, Lχ i = @DirichletCharacter.LFunction (q i) (hN i) (ψ i)` and the
   instance data `hN : ∀ i, NeZero (q i)` (constructible from `hne`'s `1 < q i`).
   Consumers discharge `hLχ` by `rfl` once levels are fixed. No mathematical content
   changed — a Lean 4 elaboration constraint, priced ~0 at P1.
2. **Port schema at the primitive level + pair-form immunity** (dossier spec wrote
   `ψ.primitiveCharacter` inside the schema): `primitiveCharacter`'s level
   `ψ.conductor` again fails per-index instance synthesis inside a def; P2 states the
   port for a primitive χ and composes with `HasEulerStripImmunity (ψ, χ')` — same
   content, cleaner elaboration.
3. `DirichletFactorizationTransferQ` additionally delivers `hN : ∀ i, NeZero (q i)`
   alongside `1 < q i ∧ ψ i ≠ 1` (delta-1 plumbing on the P1 output side).

## P1 GO/NO-GO recommendation: **GO**

- P0 removes the top P1 risks at ~zero cost: (i) the DZDF quotes elaborate verbatim
  on our pin (G1a re-confirmed for the ℚ-specialized shapes incl. the `𝓞 ℚ`
  coercion form `(α : ℚ)`); (ii) the zeta23 counting vocabulary transcribes clean at
  v4.36 (`∑ᶠ` finsum notation, `Set.ncard`); (iii) the engine consumes the
  Dirichlet-form binder with `c₀ = c i = cStar = 2/3` as designed.
- Remaining P1 work = exactly the dossier's priced glue (≈0.3–0.5k LoC): the
  dictionary construction (c-trick over ℤ; `MulChar.mulEquivToUnitHom.symm`),
  the tsum↔LSeries reindex (`ZMod.LFunction_eq_LSeries`), the principality transfer,
  and the half-plane identity-theorem extension to the `hAbFacQ` form (the DZDF
  `EntireAbelianQuotient.lean:34–49` pattern). Friction watch (from the P0 loop):
  `𝓞 ℚ ↔ ℤ` ideal transport and the `LSeries` arithmetic-function wrapper — the
  dossier's F5(i)/(ii), unchanged.
- Sequencing note: P1 can proceed entirely on the P0 statement layer (prove
  `HasQDirichletDictionary`/`DirichletFactorizationTransferQ` for the ℚ case); the
  zeta23e-style binder swap needs nothing further.

— end record (A5, 2026-11-17).
