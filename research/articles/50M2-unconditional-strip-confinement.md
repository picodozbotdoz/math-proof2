# Unconditional Strip Confinement for ζ in Lean: Discharging the Quasi-RH Hypothesis of Article 50

*cross-math-fronttier research article 50-M2 (Cycle 2) · FINAL · grows article 50
(main run, Part II: hypothesis-conditional strip confinement) and dossier 70 Part A ·
Lean `research/pilots/50/R1.lean` (+ the main-run shells `pilots/50/{M1,Dirichlet}.lean`) ·
route plan `research/pilots/50/R1-prework.md`, `research/pilots/50-M2-31-32-spec.md` ·
donor audit `research/feasibility/axiommath-donor-probes.md` §G7b*

**Status: PROVED, FINAL.** `strip_confinement_seven_eighths` holds with no hypotheses:
every nontrivial zero of the Riemann zeta function satisfies 1/8 ≤ Re ρ ≤ 7/8. It is
kernel-verified with axioms exactly `[propext, Classical.choice, Quot.sound]`. The input
is openai-math's in-corpus proof that ζ(s) ≠ 0 for Re s > 7/8. Before consuming it, we
audited it at the donor's own pin (G7b): its whole proof tree uses only the same three
axioms. The Dirichlet analogue holds at the full 7/8 constant with one remaining
hypothesis, the functional-equation reflection that mathlib lacks.

---

## Abstract

Article 50 (main run) proved in Lean that a zero-free half-plane "ζ(s) ≠ 0 for
Re s > θ" forces every nontrivial zero into the strip [1 − θ, θ]. It also proved the
primitive Dirichlet analogue. The half-plane input, `hQRH` at θ = 7/8, was left as a
hypothesis. In October 2026 several groups proved such half-planes (7/8, 11/12, 0.87496,
31/32 for all number fields). Some were formalized, but none on our toolchain pin. We
discharge the hypothesis from openai-math's own Lean theorems
`OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re` and
`OAI.DirichletCharacter.LFunction_ne_zero_of_seven_eighths_lt_re`. These are consumed by
direct import inside openai's 2,924-file proof closure, built at its own pin. We first
certified the donor's hygiene by `#print axioms` on both headlines and their delegation
roots. The result is the first unconditional formal statement of this kind for ζ in our
corpora, at the full constant pair [1/8, 7/8].

## 1. Introduction

**Mathematics.** If ζ has no zeros with Re s > θ (θ ≥ 1/2), then the functional
equation ζ(1 − s) = 2(2π)^{−s} Γ(s) cos(πs/2) ζ(s) reflects this to "no nontrivial zeros
with Re s < 1 − θ". Together these confine every nontrivial zero to [1 − θ, θ].
Classically this is weaker than the de la Vallée Poussin region σ ≥ 1 − c/log|t| for
large |t|. The value here is a uniform, fixed-constant, formally verified statement with
no hypotheses.

**Why it needed work.** The half-plane input exists in Lean in three places:
- openai-math (7/8, ζ and all Dirichlet L);
- Liu's repository (0.874975 = 34999/40000, external);
- AxiomMath DedekindZetaZeroFree (31/32, all number fields).

None of these is consumable on our mathlib pin as a dependency. The openai tree is
Lean v4.34.1 with a 2,924-file closure (≈486k lines). Our earlier attempts to build it
(G7b runs 19–28) failed for infrastructure reasons: unapplied compatibility patches,
session deaths, timeouts, and an over-provisioned run. It finally succeeded as a chain of
28 cached Modal image layers (`feasibility/probe/g7_layers.py`, 2 CPU per layer), after
which the consumer files elaborate on the cached top layer.

**Honesty.**
- No new analytic mathematics: the 7/8 half-plane is openai's theorem, and the
  reflection is classical.
- The contribution is the formal unconditional strip theorem, the audited consumption
  route, and a substrate pattern (donor-pin build plus axiom audit) that we can reuse.
- For ζ and Dirichlet L at 7/8 or better we claim **no first**. The best formal
  Dirichlet-class zero-free bound tracked in the QuasiRiemannTracker is 0.8733458561
  (2026-11-13). Our result is a downstream *consequence* (strip confinement) at a weaker
  constant.

## 2. Setting

`R1.lean` (178 lines) is elaborated inside the donor workspace (v4.34.1, mathlib
`d13f23b7`). It carries pilot 50's main-run cores, ported down from v4.36 (`push Not` was
replaced by `not_le.mp`; nothing else changed).
- `IsNontrivialZeroP50 ρ` :⟺ ζ(ρ) = 0 ∧ 0 < Re ρ < 1. This is zeta23's
  `IsNontrivialZero` shape.
- `strip_confinement (hQRH : ∀ s, 7/8 < Re s → ζ s ≠ 0)`: the conditional core
  (article 50 Part II).
- `Dirichlet.strip_confinement_dirichlet (hQRHχ) (hFEχ)`: the Dirichlet core.
  `hFEχ` says a zero ρ of L(·, χ) for primitive χ with 0 < Re ρ < 1 gives a zero 1 − ρ of
  L(·, χ⁻¹). This is the product-form reflection, which mathlib does not have.

## 3. Main results

**Theorem 1 (`strip_confinement_seven_eighths`, unconditional).** For every ρ with
ζ(ρ) = 0 and 0 < Re ρ < 1, we have 1/8 ≤ Re ρ ≤ 7/8.

**Theorem 2 (`strip_confinement_mem_seven_eighths`, `strip_confinement_set_seven_eighths`).**
The same in mathlib's vocabulary: for z ∈ `riemannZetaZeros` with 0 < Re z < 1,
1/8 ≤ Re z ≤ 7/8. As sets:
`riemannZetaZeros ∩ {0 < Re < 1} ⊆ {1/8 ≤ Re ≤ 7/8}`.

**Theorem 3 (`Dirichlet.strip_confinement_dirichlet_seven_eighths_of_FE`).** Assume
`hFEχ`. Then for every q, every primitive χ mod q, and every zero ρ of L(·, χ) with
0 < Re ρ < 1: 1/8 ≤ Re ρ ≤ 7/8.

**Discharges.** `hQRH_seven_eighths := fun s hs => OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re hs`.
`Dirichlet.hQRHχ_seven_eighths` is the corresponding application of the Dirichlet donor
theorem, with explicit-instance bookkeeping. The main-run hypotheses were transcribed
from these very statements, so the discharge is definitional: no glue lemmas are needed.

## 4. Proofs

**Theorem 1.** Let ρ be a nontrivial zero.
- Since 0 < Re ρ, ρ ≠ 1 and ρ ≠ −n for every n ∈ ℕ. So mathlib's `riemannZeta_one_sub`
  applies: ζ(1 − ρ) = 2(2π)^{−ρ} Γ(ρ) cos(πρ/2) ζ(ρ) = 0.
- If Re ρ < 1/8, then Re(1 − ρ) = 1 − Re ρ > 7/8. The donor theorem then gives
  ζ(1 − ρ) ≠ 0, a contradiction.
- If Re ρ > 7/8, the donor theorem gives ζ(ρ) ≠ 0 directly, a contradiction.

**Theorem 3.** The same argument, with `hFEχ` in place of the ζ functional equation
(reflecting to χ⁻¹). The pole exclusion ¬(χ⁻¹ = 1 ∧ 1 − ρ = 1) follows from Re ρ > 0.
∎

## 5. Formal verification

- **Donor audit (G7b), PASS.** `feasibility/probe/logs-g/run32-g7-elab.log`:
  `ProbeG7b_OAI_SevenEighths.lean` is OK. Both headlines and both delegation roots
  `OAI.SevenEighths.ProbeFinalAssemblyUnconditional.{dirichlet,zeta}_nonzero` depend on
  exactly `[propext, Classical.choice, Quot.sound]`. There is no `sorryAx` and no
  `native_decide`-class axiom anywhere in the 2,924-file delegation closure, since
  `#print axioms` is transitive.
- **R1 GREEN.** In the same run, `R1probe.lean` and `R1.lean` are OK with 0 errors and
  0 sorry-warnings. All four landing theorems print exactly the triad (14/14 axiom prints
  in the run are triad).
- **Substrate.** `feasibility/probe/g7_layers.py`: base, the donor tree, prep (`lake exe
  cache get` plus the donor's 12 lean4341 compatibility patches), chunk 0, 25
  topologically ordered ~20k-line chunks, and the target. Each layer is cached by Modal,
  so re-elaboration needs no rebuild. Resources: 2 CPU; layers at 8 GB, user-approved
  after telemetry showed 5.3–6.5 GB of memory-mapped Mathlib `.olean` pages.
- **Main-run cores** on our pin: `pilots/50/{M1,Dirichlet}.lean` are GREEN
  (`AxPilot50_M1`, `AxPilot50_Dirichlet` in the Cycle-2 final sweep). R1 is a donor-pin
  file, not an on-pin sweep target.

## 6. Relation to prior work

- **Article 50** (main run): Part I shows zero-free regions cannot improve the
  window-certificate constants. Part II is the conditional shell discharged here.
- **openai-math** `OAI/NumberTheory/DirichletL/Nonvanishing.lean:19,29`: the donor
  theorems (preprint lineage [Ope26a]). This article adds an axiom audit and a
  downstream formal consequence, not the half-plane itself.
- **Liu, arXiv:2610.12234** and its Lean repository: zero-free for Re s > B_new =
  (1507 − 2√921)/1653 ≈ 0.874957 (public entry 34999/40000). This is a stronger constant
  but an external toolchain (route R3, statement-level). **Cureton–Thorner /
  DedekindZetaZeroFree**: 31/32 for every number field (route R2). It does not build on
  our pin (G1b: 62 errors in its vendored class-field-theory tree).
- **Race context** (dossier 70 standing notes): Liu arXiv:2610.26835 (B♭ = 0.8748866
  uniform, informal); Chang–Wang arXiv:2611.00924 (conditional); Ji arXiv:2611.16665;
  QuasiRiemannTracker (formal Dirichlet frontier 0.8733458561 as of 2026-11-13,
  Dirichlet-only).
- **Classical:** Hadamard–de la Vallée Poussin; the reflection via the functional
  equation is textbook (e.g. Titchmarsh ch. II).

## 7. Limitations and open problems

1. **`hFEχ` remains for Dirichlet L.** A mathlib lemma `DirichletCharacter.LFunction_one_sub`
   (product-form reflection for primitive χ) would make Theorem 3 unconditional. It is a
   one-declaration donation candidate.
2. **Not done:** the ζ_K / Hecke strip at 31/32 (route R2) and the parametric-θ
   refactor. Both are specified in `pilots/50-M2-31-32-spec.md`. No formal ζ_K
   zero-location statement exists anywhere in the corpora we audited, so that strip
   would be a genuine first. It needs DedekindZetaZeroFree's statements as hypotheses on
   our pin.
3. **Toolchain:** R1 lives on the donor pin (v4.34.1). Porting it to our v4.36 pin means
   porting the openai closure. The statements port at cost ≈ 0; the proofs are the cost.
4. **Constants** are stale on arrival by design. The formal frontier for the Dirichlet
   class is already below 7/8. The strip theorem re-instantiates at any better donor
   constant with the same proof.

## References

openai-math `lean/OAI/NumberTheory/DirichletL/Nonvanishing.lean:19,29`;
`research/pilots/50/{R1,R1probe,M1,Dirichlet}.lean`; `research/pilots/50/R1-prework.md`;
`research/pilots/50-M2-31-32-spec.md`; `research/feasibility/probe/{g7_layers.py,
ProbeG7b_OAI_SevenEighths.lean}`, logs `logs-g/run31-g7-layers.log`,
`logs-g/run32-g7-elab.log`; `research/feasibility/axiommath-donor-probes.md` §G1b/§G7/§G7b;
`research/novelty/liu1-hygiene-sweep.md`; dossier 70 (standing notes). Liu
arXiv:2610.12234, arXiv:2610.26835; Chang–Wang arXiv:2611.00924; Ji arXiv:2611.16665;
E. C. Titchmarsh, *The Theory of the Riemann Zeta-Function*, ch. II.
