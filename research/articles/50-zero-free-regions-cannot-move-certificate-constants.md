# What the 7/8 Half-Plane Buys: Formal Strip Confinement for ζ and Dirichlet L; and Why the Shipped Window-Certificate Engine Cannot Move Its Constants

*kind: TECHNICAL-RECORD · date: 2026-11-21 · supersedes: the 2026-11-16 and 2026-11-09
revisions of this file and `50M2-unconditional-strip-confinement.md` (2026-11-14) ·
artifacts: `research/pilots/50/{M1,Dirichlet,R1,R1probe}.lean`,
`research/pilots/50/logs/`, `research/feasibility/probe/logs-g/run32-g7-elab.log`*

| theorem | status | hypotheses | evidence |
|---|---|---|---|
| Part I, Proposition 1 (source reading: within the zeta23 engine as shipped, no statement of the form "c₁\* improves to c₁\*(σ₀) under a zero-free half-plane Re s > σ₀" is expressible at any stage of the constant extraction) | PAPER-ONLY — source-verified reading of donor source files; not a theorem of mathematics and not kernel-checked | none (zeta23 file:line citations, §3) | zeta23 `ThmD/Functional.lean:40–43,53`, `Defs.lean:120,140`, `Hypotheses.lean:147`, `Final.lean:79–119` |
| Part II, Theorem 1 `strip_confinement_seven_eighths` (ζ) | PROVED-UNCONDITIONAL — at donor pin (Lean v4.34.1, mathlib `d13f23b7`, elaborated inside openai-math's 2,924-file closure) | definitional only: `hρ : IsNontrivialZeroP50 ρ` (ρ is a nontrivial zero — the object being classified); the quasi-RH hypothesis is discharged by `hQRH_seven_eighths` = the imported `OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re`, applied at `R1.lean:87–88` | statement `research/pilots/50/R1.lean:93–96` (discharge applied at `:96`); elaboration OK rc=0, 0 errors, 0 sorry, with axiom prints ⊆ {propext, Classical.choice, Quot.sound} at `research/feasibility/probe/logs-g/run32-g7-elab.log:137–143`; donor headline axiom print `:144` |
| Part II, Theorem 2 `strip_confinement_mem_seven_eighths`, `strip_confinement_set_seven_eighths` (mathlib vocabulary forms) | PROVED-UNCONDITIONAL — at donor pin | definitional only | `research/pilots/50/R1.lean:99–110`; axiom prints within `run32-g7-elab.log:138–143` |
| Part II, Theorem 3 `Dirichlet.strip_confinement_dirichlet_seven_eighths_of_FE` | PROVED-CONDITIONAL — at donor pin | `hFEχ` (product-form functional equation for primitive χ: a zero ρ of L(·,χ) gives a zero 1−ρ of L(·,χ⁻¹); a named mathlib gap, §7) | statement `research/pilots/50/R1.lean:161–168`; axiom print `run32-g7-elab.log:141–143`; donor headline axiom print `:145–147` |
| Part II, discharge `hQRH_seven_eighths` (half-plane input of Theorem 1) | PROVED-UNCONDITIONAL — at donor pin | none — the half-plane input is the imported donor theorem, not an assumed binder (statement antecedent `7/8 < Re s`) | `research/pilots/50/R1.lean:87–88`; covered transitively by Theorem 1's axiom print (`run32-g7-elab.log:138`) |
| Part II, discharge `Dirichlet.hQRHχ_seven_eighths` (half-plane input of Theorem 3) | PROVED-UNCONDITIONAL — at donor pin | none — the imported donor theorem applied with explicit-instance bookkeeping; statement antecedents `7/8 < Re s` and `¬(χ = 1 ∧ s = 1)` | `research/pilots/50/R1.lean:154–158`; covered transitively by Theorem 3's axiom print (`run32-g7-elab.log:141–143`) |
| Part II, conditional shells (project pin, earlier revision of this file) | PROVED-CONDITIONAL | hQRH : `∀ s, 7/8 < Re s → riemannZeta s ≠ 0` (and hQRHχ for Dirichlet); hFEχ (product-form FE reflection — mathlib gap) | `strip_confinement` (`research/pilots/50/M1.lean:44`), `strip_confinement_mem`/`_set` (`:75/:85`), `Dirichlet.strip_confinement_dirichlet` (`research/pilots/50/Dirichlet.lean:40`); axiom prints `research/pilots/50/logs/axcheck-final.log:815` (core), `:817–818` (vocabulary), `:810–811` (Dirichlet); audit verdicts `:814` (4 axiom-lines, 0 sorryAx), `:809` (2 axiom-lines, 0 sorryAx) |

## Abstract

If ζ(s) ≠ 0 for Re s > 7/8, the functional equation reflects this to Re s < 1/8, so
every nontrivial zero of ζ satisfies 1/8 ≤ Re ρ ≤ 7/8; the same holds for primitive
Dirichlet L-functions given the product-form functional equation. What more does such
a half-plane buy? Theorem 1 (`strip_confinement_seven_eighths`) is
PROVED-UNCONDITIONAL — at donor pin (Lean v4.34.1, mathlib d13f23b7) — with no
hypotheses beyond the definition of a nontrivial zero (mathlib vocabulary forms:
Theorem 2); Theorem 3 is PROVED-CONDITIONAL on the single named hypothesis hFEχ, the
product-form reflection (§7). The 7/8 input is not assumed: it is imported from
openai-math's theorems (`OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re`,
`OAI.DirichletCharacter.LFunction_ne_zero_of_seven_eighths_lt_re`), consumed at the
donor's pin after a transitive axiom audit of the 2,924-file closure (exactly
{propext, Classical.choice, Quot.sound}; no sorryAx). We claim
**no mathematical priority**: the strip is derived in the proof of the donor
preprint's Cor. 1.2 and the reflection is classical (Titchmarsh); the contribution is
the formal statement, the audited consumption route, and a source-verified observation
that within the zeta23 engine as shipped, zero-free regions of this kind are invisible
to the window-certificate zero-proportion constants — no re-optimization under a
zero-free half-plane is expressible there (PAPER-ONLY, Proposition 1).

## 1. Introduction

October 2026 produced several formal zero-free half-planes for the Dirichlet class
(7/8 for ζ and Dirichlet L in openai-math; 31/32 for all number fields in AxiomMath
DedekindZetaZeroFree; 0.8749… external in Liu's repository). Two natural bridges were
raised against them in this project. Bridge 1 (negative): "truncate the zero support at
7/8 and re-optimize the zeta23 window-certificate constant". Part I records, as a
structured reading of the donor sources, why no such statement exists in the engine —
the certificate functional's variable is the height offset inside the detection window
and its zero classification is binary, so horizontal zero-free information never
enters. Bridge 2 (positive, formal): the half-plane plus the functional equation
confine all nontrivial zeros to a fixed strip. Part II proves Bridge 2 in Lean, with
the half-plane imported rather than assumed. Part I is knowledge-level — a correct and
useful reading, not a theorem; Part II is the formal content of this record. This
revision merges the two earlier articles on these bridges — the conditional strip
confinement (the 2026-11-09 revision of this file) and the discharge record
`50M2-unconditional-strip-confinement.md` (2026-11-14) — into one; what the merge
changed is that the half-plane input is discharged rather than assumed.

## 2. Setting and notation

`IsNontrivialZeroP50 ρ` :⟺ ζ(ρ) = 0 ∧ 0 < Re ρ < 1 (zeta23's `IsNontrivialZero` shape).
The conditional cores live on the project pin (mathlib `ff2494ea`, Lean v4.36.0-rc2):
`strip_confinement (hQRH : ∀ s, 7/8 < Re s → ζ s ≠ 0)` and
`Dirichlet.strip_confinement_dirichlet (hQRHχ) (hFEχ)`. The discharged strip theorems
live in `R1.lean`, elaborated at the donor pin (Lean v4.34.1, mathlib `d13f23b7`): the
project-pin cores ported down from v4.36 (`push Not` → `not_le.mp`; nothing else
changed), with
`hQRH_seven_eighths := fun s hs => OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re hs`
and the Dirichlet analogue applied definitionally (the project-pin binders were
transcribed from these very statements).

## 3. Main results

**Theorem 1 (`strip_confinement_seven_eighths`, unconditional, at donor pin).** For
every ρ with `IsNontrivialZeroP50 ρ`: 1/8 ≤ Re ρ ≤ 7/8.

**Theorem 2 (vocabulary forms).** For z ∈ `riemannZetaZeros` with 0 < Re z < 1:
1/8 ≤ Re z ≤ 7/8; as sets, `riemannZetaZeros ∩ {0 < Re < 1} ⊆ {1/8 ≤ Re ≤ 7/8}`.

**Theorem 3 (Dirichlet, one hypothesis, at donor pin).** Assume `hFEχ` (§7). For every
q, every primitive χ mod q, and every zero ρ of L(·, χ) with 0 < Re ρ < 1:
1/8 ≤ Re ρ ≤ 7/8.

**Discharges.** `hQRH_seven_eighths` is the imported openai theorem applied verbatim;
`Dirichlet.hQRHχ_seven_eighths` likewise, with explicit-instance bookkeeping. The
project-pin hypotheses were transcribed from these statements, so the discharges are
definitional — no glue lemmas.

## 4. Novelty and nearest misses

| prior work | what it is | why this differs |
|---|---|---|
| openai-math preprint, *The Quasi-Riemann Hypothesis* (2026-09-30), Cor. 1.2 | derives the strip "1/8 ≤ Re s ≤ 7/8" for primitive Dirichlet L inside the corollary's proof | our contribution is formal, not mathematical: kernel proofs + transitive donor audit |
| Titchmarsh, *The Theory of the Riemann Zeta-Function*, ch. II | classical reflection via the functional equation | textbook; we formalize the reflection step from mathlib's product form |
| AxiomMath DedekindZetaZeroFree (`Main.lean:9`) | ζ_K ≠ 0 for Re s > 31/32, every number field (statement-level on our pin; direct build fails) | stronger constant, number-field scope; not consumable on our pin — the carried route (`research/pilots/50-M2-31-32-spec.md`) |
| Liu, arXiv:2610.12234 (+ repo) | 0.874957 half-plane, external toolchain | statement-level citation only (project ground rules: DO-NOT-CONSUME) |

## 5. Proofs

**Theorem 1.** Let ρ be a nontrivial zero. Since 0 < Re ρ, ρ ≠ 1 and ρ ≠ −n (n ∈ ℕ), so
mathlib's `riemannZeta_one_sub` applies: ζ(1 − ρ) = 2(2π)^{−ρ} Γ(ρ) cos(πρ/2) ζ(ρ) = 0.
If Re ρ < 1/8 then Re(1 − ρ) > 7/8 and the donor theorem gives ζ(1 − ρ) ≠ 0 —
contradiction. If Re ρ > 7/8 the donor theorem gives ζ(ρ) ≠ 0 directly. **Theorem 3**
is the same argument with `hFEχ` in place of the ζ functional equation (reflecting to
χ⁻¹); the pole exclusion ¬(χ⁻¹ = 1 ∧ 1 − ρ = 1) follows from Re ρ > 0, and the direct
right-half application needs ¬(χ = 1 ∧ ρ = 1), which follows from Re ρ < 1. ∎

## 6. Formal record

| theorem | Lean declaration | file:line | axioms | log path:line |
|---|---|---|---|---|
| Thm 1–3, donor pin | `strip_confinement_seven_eighths` (`R1.lean:93`), `strip_confinement_mem_seven_eighths` (`:99`), `strip_confinement_set_seven_eighths` (`:105`), `Dirichlet.strip_confinement_dirichlet_seven_eighths_of_FE` (`:161`) | `research/pilots/50/R1.lean` (180 lines, re-measured at this revision) | ⊆ {propext, Classical.choice, Quot.sound} | `research/feasibility/probe/logs-g/run32-g7-elab.log:137–147` — elaboration OK rc=0, 0 errors, 0 sorry (`:137`); strip-theorem axiom prints `:138–143`; donor headline axiom prints `:144–147` |
| donor audit | both OAI 7/8 headlines + delegation roots `OAI.SevenEighths.ProbeFinalAssemblyUnconditional.{dirichlet,zeta}_nonzero` | `research/feasibility/probe/ProbeG7b_OAI_SevenEighths.lean` | ⊆ {propext, Classical.choice, Quot.sound}, transitive over the 2,924-file closure | probe OK `run32-g7-elab.log:44`; headline axiom prints `:48–51`; delegation-root axiom prints `:52–57`; trail: `research/feasibility/axiommath-donor-probes.md` §G7b and `research/feasibility/VERIFICATION-LEDGER.md` (G7b rows) |
| conditional shells, project pin | `strip_confinement` (`M1.lean:44`), `strip_confinement_mem` (`:75`), `strip_confinement_set` (`:85`), `Dirichlet.strip_confinement_dirichlet` (`Dirichlet.lean:40`) | `research/pilots/50/M1.lean` (94 lines), `research/pilots/50/Dirichlet.lean` (73 lines) | ⊆ {propext, Classical.choice, Quot.sound} | `research/pilots/50/logs/axcheck-final.log:815` (core), `:817–818` (vocabulary), `:810–811` (Dirichlet); audit verdicts `:814`, `:809` |
| discharges | `hQRH_seven_eighths` (`R1.lean:87`), `Dirichlet.hQRHχ_seven_eighths` (`:154`) | `research/pilots/50/R1.lean` | ⊆ {propext, Classical.choice, Quot.sound}, transitive via the strip theorems' prints | `run32-g7-elab.log:138` (ζ), `:141–143` (Dirichlet) |
| donor theorems | `OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re` (`Nonvanishing.lean:29`), `OAI.DirichletCharacter.LFunction_ne_zero_of_seven_eighths_lt_re` (`:19`) | openai-math `lean/OAI/NumberTheory/DirichletL/Nonvanishing.lean` | ⊆ {propext, Classical.choice, Quot.sound} | consumer-side prints `run32-g7-elab.log:144–147`; statements quoted line-exact in `research/pilots/50/R1-prework.md` §1 |
| statement probe | — (no new declarations; prints donor and interface signatures) | `research/pilots/50/R1probe.lean` | — | `run32-g7-elab.log:83–104` (OK rc=0, 0 errors) |

## 7. Limitations and open problems

1. **hFEχ remains for Dirichlet L** — the one-declaration mathlib donation candidate
   `DirichletCharacter.LFunction_one_sub` (product-form reflection for primitive χ;
   the completed form exists at `Mathlib/NumberTheory/LSeries/DirichletContinuation.lean:291`,
   mathlib at the project pin `ff2494ea`).
2. **Donor-pin substrate.** R1 lives at Lean v4.34.1 / mathlib `d13f23b7`; porting to
   the project pin means porting the openai closure (statements ≈ 0 cost; proofs are
   the cost). Until then every unconditional status here is "at donor pin" — said in
   the status rows.
3. **Not done:** the ζ_K / Hecke strip at 31/32 (specified in
   `research/pilots/50-M2-31-32-spec.md`; would be a genuine first — no formal ζ_K zero-location
   statement exists in the corpora) and the parametric-θ refactor.
4. **Constants stale on arrival by design**: the formal Dirichlet-class frontier is
   already at 0.8733458561 (QuasiRiemannTracker, 2026-11-13); the strip theorem
   re-instantiates at any better donor constant with the same proof.
5. **Part I is a reading**, not a theorem; it is billed PAPER-ONLY and must not be
   counted among proved artifacts.

## 8. Prior work and references

**(a) Literature.**

- openai-math, *The Quasi-Riemann Hypothesis* (preprint, 2026-09-30): main theorem —
  no zero of a finite-order Hecke L-function over ℚ(√−3), nor of any Dirichlet
  L-function including ζ, in Re s > 7/8; Cor. 1.2, whose proof derives the strip
  1/8 ≤ Re s ≤ 7/8.
- E. C. Titchmarsh, *The Theory of the Riemann Zeta-Function*, 2nd ed., ch. II
  (reflection via the functional equation).
- Liu, arXiv:2610.12234, with repository
  `liubaiying101/Slightly-improved-zero-free-half-planes-for-the-quasi-Riemann-hypothesis`
  (0.874957… half-plane, external toolchain).

**(b) Project artifacts.**

- `research/pilots/50/` — `M1.lean`, `Dirichlet.lean`, `R1.lean`, `R1probe.lean`,
  `R1-prework.md`; audit logs under `research/pilots/50/logs/`.
- `research/pilots/50-M2-31-32-spec.md` — the ζ_K 31/32 strip specification.
- `research/feasibility/probe/ProbeG7b_OAI_SevenEighths.lean`;
  `research/feasibility/probe/logs-g/run32-g7-elab.log`.
- `research/feasibility/axiommath-donor-probes.md` (§G1b/§G7/§G7b);
  `research/feasibility/VERIFICATION-LEDGER.md` (donor-build and audit trail).
- `research/novelty/liu1-hygiene-sweep.md`;
  `research/candidates/70-unconditional-zetaK-zero-confinement.md` (standing notes).
