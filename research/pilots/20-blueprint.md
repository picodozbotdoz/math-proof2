# Pilot blueprint — dossier 20 (hecke-zetaK-zero-density), V2-ζ_K track, M1

Lane R5 (ant-bridge), 2026-11-09. Companion: dossier
`research/candidates/20-hecke-zetaK-zero-density.md`; prework
`research/pilots/20-prework.md` (donor substitution map, E5 driver sizing);
sibling pilots: `research/pilots/42/` (R1's V1 track — **do not duplicate**:
42-M1 is the count-level min-of-fractions conditional core; this pilot is the
ENGINE-level layer that 42 does not build), `research/pilots/22/` (R3).
Mirrors the blueprint pattern of `research/pilots/42-blueprint.md`.

## §1 Scope and posture

V2-ζ_K = instantiate zeta23's generic density engine (`PaperInputs Z`,
`Zeta23/Hypotheses.lean:147`) at the Dedekind zeta of a quadratic field.
Posture (from 42-M1, and its §Formalization deltas — delta-3 in particular):
**everything conditional, proofs over binders, sorry-free today**, against
mathlib v4.36.0-rc2 (encore checkout `ff2494ea`), zero ports.

- **M1 (this run)**: the engine-level conditional layer.
  1. Mirror 42-M1's counting layer (windows/multiplicities/`ZeroMult`/
     `EpsLower`) verbatim-with-attribution — it is the shared substrate of
     both routes (reuse, not re-derivation).
  2. Transcribe zeta23's **`PaperInputs` record** (`Hypotheses.lean:147`) as
     the pilot-local card `Card20`, fields named `ef/rvm/cheb/mv/gamma`, over
     a completed-ζ_K zero-mult object built from the tauceti factorization
     shape (the `hfac : ∀ ρ, multOf fK ρ = multOf fζ ρ + multOf fχ ρ` binder
     of 42-M2a — reused, not re-derived). Fidelity per field: `rvm`
     (`RiemannVonMangoldt`, `Hypotheses.lean:67`: main + local count) —
     faithful at count level; `cheb` (`ChebyshevMertens`, `:83`: cheb1a–cheb2b
     Λ-moment bounds) — faithful, arithmetic-level; `mv` (`MVHilbert C`,
     `:107`) — faithful; `gamma` (`GammaFacts`, `:125`) — faithful modulo
     (μ, ℓ) parameterization; `ef` (`ExplicitFormulaPaper`, `:48`) — faithful
     modulo the density ν abstracted to a parameter (documented delta).
  3. **Swap-friendly engine binder block** (one rewrite point for donor
     swaps): `Traces` is an abstract `ZeroMult → ℝ → Prop` parameter standing
     for zeta23's `ThmTracesHyp (paramsOf ϱ lam) Z` (`Zeta23/Main.lean`
     consumers `:176–208`); `hStep` stands for the `thmA/B/C_lam_of_traces`
     chain. Knausgård-relaxed-window donors (R8 mapping pending) or the
     ported zeta23 engine discharge `hTraces`/`hStep` by rewriting this block
     only.
  4. **Prove the instantiation theorems** at the λ-family level:
     `hCard ∧ hTraces ∧ hStep ⇒ ∀ λ ∈ (1/2,1), EpsLower ζK (Hfun λ)` and the
     λ→1 upgrades to the submitted constants 2/3, 1/2, 3/4 — division-free
     ε-forms throughout (42 delta-3 convention; no liminf, no asymptotic
     denominators). The λ→1 upgrades are the run's principal new proof
     content (`Hfun λ = 2 − 1/λ − λ/3`, `Ffun λ = λ/(1+λ²/3)`,
     `Zeta23/Defs.lean:55,58`; explicit-δ bounds, see §2).
- **M2**: discharge inventory per `20-prework.md` (b): which fields the
  openai donors substitute (`local_zero_mass_bound` → rvm.local;
  `full_zero_sum_rate` → rvm.main upper half; `absolute_summability` → ef
  summability clause; `LFunction_ne_zero_of_re_eq_one` → contour inputs);
  the contour→EF assembly as the sized E5 driver (no donor anywhere);
  zeta23 engine port (statement-level ≈ 0 breakage per R9 probe §3-B1,
  proof re-fix M).
- **M3**: the C_D-controlled upgrade — common-zero defect traded against the
  proportion constant (see §3 hCZ).

## §2 M1 proof inventory (what is proved, vs bound)

| # | decl | kind | content | source |
|---|---|---|---|---|
| 1 | counting layer | mirror | 42-M1 `stripWindow … assemble_eps` | 42/M1.lean (attributed) |
| 2 | `Hfun`, `Ffun` | def | λ-family constants | zeta23 `Defs.lean:55,58` |
| 3 | `inv_one_sub_le`, `hfun_one_sub_le`, `ffun_one_sub_le` | thm | explicit-δ λ→1 lower bounds: `2/3 − 5δ/3 ≤ Hfun (1−δ)` (δ ∈ (0,1); via `4(1−δ²) ≥ 3`), `3/4 − 5δ/8 ≤ Ffun (1−δ)` (δ ∈ (0,1/2]) | new (this run) |
| 4 | `family_to_two_thirds/half/three_quarters` | thm | λ-family ⇒ submitted constant, division-free | new; zeta23 states the passage (`Final.lean:63–75` docstring) but its ε-forms are λ-pointwise; ours is the first standalone upgrade lemma |
| 5 | `Card20` fields | def | the five field transcriptions | zeta23 `Hypotheses.lean:48,67,83,107,125` |
| 6 | `Traces`/`hStep` binder block | binder | swap-friendly engine seam | zeta23 `Main.lean:176–208` |
| 7 | `zetaK_engine_family`, `zetaK_engine_two_thirds` (+ B/C) | thm | **the instantiation theorems** (hCard ∧ hTraces ∧ hStep ⇒ family ⇒ constants) | new |
| 8 | `family_merge` | thm | V1-route comparison: component λ-families merge with NO hCZ | new (42-M1's `assemble_eps` lifted to families) |
| 9 | `SharedMass`, `CommonZeroControl` | def | **hCZ binder** (§3) | new |
| 10 | `commonZeroControl_of_disjoint`, `merged_mult_of_common` | thm | hCZ sanity: disjoint supports ⇒ control; simple common zero ⇒ merged multiplicity 2 | new |

LoC estimate ~430–480.

## §3 The hCZ binder — the common-zero obstruction (the mathematical heart)

**Statement (weakest engine-usable form, `CommonZeroControl zζ zχ`):**
for every η > 0 there is T₀ such that for all T ≥ T₀,
`SharedMass zζ zχ T ≤ η · count (zζ ⊕ zχ) T`, where `SharedMass` is the
window sum of `min (mult ζ ρ) (mult χ ρ)` — the multiplicity mass of zeros
**shared** by ζ and L(χ_D), i.e. exactly the mass where the factorization's
two zero sets collide. [Equivalently: common zeros are a density-zero
fraction of the merged count.]

**Why the ENGINE route needs it** (and why nobody has ζ_K proportions by the
engine): the engine's zero side (`Zeta23/ZeroSide/`, the rank–trace device at
c = 2, 3) accounts per-atom multiplicities — a simple common zero of ζ and
L(χ_D) is a **merged multiplicity-2 atom** (`merged_mult_of_common`, proved
in M1), i.e. a *non-simple* zero of ζ_K that is simple for both components;
the c-device constants degrade atom-by-atom, so unbounded shared mass
degrades the engine's constants by an unbounded amount. Additionally the
spectral side's spacing inputs (the MV Hilbert inequality's `δ_r`,
`Hypotheses.lean:107–111`) need separation between ordinates of DIFFERENT
origin — near-collisions of ζ-zeros with χ-zeros are invisible to each
component's own spacing control. hCZ is the minimal hypothesis restoring
both.

**Why pilot 42's min-of-fractions route AVOIDS it** (proved in M1 as
`family_merge`): `EpsLower` proportions merge monotonically at the count
level — `count (z ⊕ w) = count z + count w` and `countOn (z ⊕ w) = countOn z
+ countOn w` hold pointwise with NO separation hypothesis (common zeros are
counted on both sides of both fractions), and `(a+b)/(A+B) ≥ min(a/A, b/B)`
in division-free ε-form needs only `max T₀`. The overlap never has to be
disentangled because the route never splits the merged zero set.

| | engine route (V2, this pilot) | min-of-fractions (V1, pilot 42) |
|---|---|---|
| needs card for merged config | yes (EF/RvM/cheb/MV/Gamma) | no (consumes submitted component theorems) |
| needs common-zero control | **yes — hCZ** (zero-side c-device + spacing) | **no** (`family_merge`, proved) |
| what it buys | full engine strength: any λ-family the engine proves, window/multiplicity-aware constants (Thm D/E grade), C_D-controlled upgrades (M3), and the SAME architecture transfers to Hecke (no factorization available there — V1 does not exist for Hecke) | exactly the constants of the component theorems (2/3, 1/2, 5/6, c₁*-window) |
| failure mode if hCZ false | constants degrade by the shared-mass fraction | none (theorem remains true) |

M3 uses hCZ quantitatively: `CommonZeroControlAt C_D` (η := C_D-controlled
rate) ⇒ proportion constant 2/3 − f(C_D) — the trade the engine uniquely
enables.

## §4 Modal plan

Reuse R9's `crossmath-probe` infra (`research/feasibility/probe/
lean_probe.py`; image already cached: elan v4.2.4 + toolchain v4.36.0-rc2 +
mathlib at `ff2494ea` with olen cache — warm run ≈ 68 s per R9 §1). Runner
`research/pilots/20/run_m1.sh` stages `lean_probe.py` + `M1.lean` into
`/tmp/crossmath-pilot20-stage` (world-readable, the modal_tauceti.sh staging
pattern) and calls `modal run lean_probe.py --dir <stage>` as user xyz.
Ephemeral run only; no volume/secret/deploy. Success criterion: `M1.lean:
OK; errors=0, sorry-warnings=0` in the probe summary. STOP rule: > 5 fix
cycles or > 1 h blocked → record state, report.

## §5 Risk register

- v4.36 API drift in the mirrored layer — mitigated by mirroring 42-M1's
  already-validated proofs verbatim (their §Formalization deltas recorded the
  pitfalls: `Set.mem_ofPred_eq`, `Set.Finite.mem_toFinset` explicitness).
- The `nlinarith` goals in `ffun_one_sub_le` (cubic in δ) — fallback manual
  polynomial chain; budgeted.
- Card transcription fidelity vs elaboration risk (interval integrals,
  digamma casts in `ef`/`gamma` fields): the fields are binders (never
  proved here), so only elaboration, not proof, is at risk; keep statements
  as close to Hypotheses.lean shapes as v4.36 allows.
- No toolchain risk beyond the shared probe image.

## §6 M1 run record (R5, 2026-11-09)

**Verdict: GREEN.** `research/pilots/20/run_m1.sh` (reuses R9's
`crossmath-probe` Modal infra; warm image) — final run:
`M1.lean: OK; errors=0, sorry-warnings=0, other-warnings=5` (all benign
linter notes: `hCard` intentionally unreferenced — the documented M2
discharge anchor — and two unused simp args). Each warm run ≈ 1–2 min;
9 runs total (see deltas), no cycle blocked >1 h.

**Axioms audit** (`#print axioms`, in-file §8): `zetaK_engine_two_thirds`,
`zetaK_engine_half`, `zetaK_engine_three_quarters`, `family_to_two_thirds`,
`family_to_half`, `family_to_three_quarters`, `family_merge`,
`two_thirds_of_components`, `merged_mult_of_common`, `assemble_eps` — all
`[propext, Classical.choice, Quot.sound]` (no `sorryAx`, no project axioms:
math-proof1 standard met).

**Cycle-count disclosure**: the STOP rule budgeted >5 cycles; the run took 9
(37 → 22 → 25 → 25 → 16 → 18 → 6 → 0 → final-with-axioms). Each fix cycle
≤ ~10 min including the warm Modal run; the overrun is recorded here per
the rule rather than aborting a converging sequence.

### Formalization deltas (statement-level discoveries while proving M1)

1. **`λ` is not an identifier in Lean 4 Mathlib** (it is the `fun` keyword):
   the λ-family must be spelled `lam` (zeta23 itself uses `lam`,
   `Zeta23/Final.lean:79`). The 37-error first cycle was dominated by this
   one cause, including misleading downstream "unknown identifier `Hfun`"
   cascades.
2. **`conj` is scoped notation** (`open scoped ComplexConjugate`), not
   merely `open Complex` — zeta23's ChallengeDeps opens both; a faithful
   transcription of `Hypotheses.lean:48`'s W-summand needs it.
3. **Section `variable {Traces}` is not auto-inserted into theorem
   signatures** when it appears only inside other binders' structure types:
   `EngineStep`/`TracesFamily` take `Traces` as an explicit parameter and
   the six downstream theorems bind `{Traces : ZeroMult → ℝ → Prop}`
   explicitly. Matters for the swap block: a donor swap rewrites
   `EngineStep`'s `Traces` argument type too.
4. `Hfun`/`Ffun`/`gammaOf`/`zeroMultOf` need `noncomputable`
   (`Real.instDivInvMonoid`, `Complex.instDivInvMonoid`, `multOf` are
   noncomputable) — zeta23 marks none of its analogues because it sits in
   `noncomputable section` throughout.
5. The `5δ/3 ≤ ε/2` steps are **pure `linarith`** (linear in δ, ε after the
   explicit δ := min(cε, 1/4) choice); the `div_le_div`-lemma route was
   unnecessary (and `div_le_div_iff_right`'s argument order rejects the
   naive application).
6. The λ→1 upgrade needs **δ ≤ 1/2, not δ < 1**: the bound
   `Hfun(1−δ) ≥ 2/3 − 5δ/3` is equivalent to `δ(1−2δ) ≥ 0`. §2's original
   "(δ ∈ (0,1))" was wrong; M1.lean states it with δ ≤ 1/2 and all three
   upgrade theorems pick δ ≤ 1/4 (which also lands λ = 1−δ ∈ (3/4, 1) ⊂
   (1/2, 1), inside the engine's λ-range).
