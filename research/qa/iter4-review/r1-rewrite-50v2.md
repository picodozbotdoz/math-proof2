# PROPOSAL (R1, iteration-4 review) — Article 50 v2: merged 50 + 50-M2

**This is a proposal file, not a live article.** Target path at swap time:
`research/articles/50-zero-free-regions-cannot-move-certificate-constants.md` (replaces v1
in place; `50M2-unconditional-strip-confinement.md` is retired into it). Built on
`research/articles/TEMPLATE-iter4.md`; evidence filled 2026-11-16 from R3's landed
audits — `r3-verification-integrity.md` §1.6/§2/§3 ("[R3 §x]" cites) and
`r3-verification-tables.md` §2 "50-v2" (per-declaration print lines; all R3 table slots
consumed). Posture per R2
(`r2-discovery-strength.md` §4 item 11): a **technical record** — Part I is a
source-verified observation (knowledge-level), never billed as a theorem of the same
rank as Part II; Part II is the formal content, now with its quasi-RH binder discharged.

Editorial deltas vs v1 + 50-M2:
- one article instead of two (the v1/50-M2 split left the main-run row carrying a
  2026-11-09 "binder-conditional" status with the discharge in a second file);
- per-theorem status rows in the closed vocabulary; R3's rule 6 applied — the donor-pin
  substrate is in the status line, not only in §5–§7;
- the G7b infrastructure trail (runs 19–28, layer build, memory approvals) moves out of
  the article into ledger pointers; §6 is table-only;
- v1's cited `combined-run14-green.log` (a headerless class-k log, R3 §2 50-row note) is
  replaced by the headered axcheck logs as evidence of record;
- Part I keeps its honest label verbatim in spirit ("source-verified mathematical
  argument, not a Lean theorem" — R3 §3: "the right label; keep"), now with PAPER-ONLY
  status-row billing.

---

# What the 7/8 Half-Plane Buys: Formal Strip Confinement for ζ and Dirichlet L; and Why It Cannot Move Window-Certificate Constants

*kind: NEGATIVE (technical record) · date: 2026-11-16 (v2; v1 2026-11-09) · supersedes:
`50-zero-free-regions-cannot-move-certificate-constants.md` (v1) and
`50M2-unconditional-strip-confinement.md` (2026-11-14) · artifacts:
`research/pilots/50/{M1,Dirichlet,R1,R1probe}.lean`,
`research/pilots/50/logs/`, `research/feasibility/probe/logs-g/run32-g7-elab.log`*

| theorem / item | status | hypotheses | evidence |
|---|---|---|---|
| Part I, Proposition 1 (no engine statement of the form "c₁\* improves to c₁\*(σ₀) under a zero-free half-plane") | PAPER-ONLY — source-verified reading of donor source files; not a theorem of mathematics and not kernel-checked | — (zeta23 file:line citations, §3) | zeta23 `ThmD/Functional.lean:40–43,53`, `Defs.lean:120,140`, `Hypotheses.lean:147`, `Final.lean:79–119` (carried from v1; v1 audited VERIFIED, R3 §2) |
| Part II, Thm 1 `strip_confinement_seven_eighths` (ζ) | PROVED-UNCONDITIONAL — **at donor pin** (Lean v4.34.1, mathlib `d13f23b7`, elaborated inside openai-math's 2,924-file closure) | only definitional: `hρ : IsNontrivialZeroP50 ρ` (ρ is a nontrivial zero — the object being classified); the quasi-RH binder is **discharged** via `hQRH_seven_eighths` = the imported `OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re` | statement `pilots/50/R1.lean:93–96` (discharge applied at `:96`, donor at `:87–88`); `run32-g7-elab.log:137–145` — R1.lean OK rc=0, 0 errors, 0 sorry; landing print triad `:138–141`; both donor headlines triad `:144–145` [R3 §1.6] |
| Part II, Thm 2 `strip_confinement_mem_seven_eighths`, `strip_confinement_set_seven_eighths` (mathlib vocabulary forms) | PROVED-UNCONDITIONAL — at donor pin | definitional only | `R1.lean:99–110`; prints within `run32-g7-elab.log:138–141` [R3 §1.6] |
| Part II, Thm 3 `Dirichlet.strip_confinement_dirichlet_seven_eighths_of_FE` | PROVED-CONDITIONAL — at donor pin | `hFEχ` (product-form functional equation for primitive χ: a zero ρ of L(·,χ) gives a zero 1−ρ of L(·,χ⁻¹); a named mathlib gap, §7) | statement `R1.lean:161–168`; donor headline `OAI.DirichletCharacter.LFunction_ne_zero_of_seven_eighths_lt_re` triad `run32-g7-elab.log:144–145` [R3 §1.6] |
| conditional shells (project pin, v1 Part II) | PROVED-CONDITIONAL | hQRH : `∀ s, 7/8 < Re s → riemannZeta s ≠ 0` (and hQRHχ for Dirichlet); hFEχ (product-form FE reflection — mathlib gap) | `strip_confinement` (`M1.lean:44`) print `pilots/50/logs/axcheck-final.log:815` triad; `strip_confinement_mem`/`_set` (`:75/:85`) prints `:817–818`; `Dirichlet.strip_confinement_dirichlet` (`Dirichlet.lean:40`) prints `:810–811`; sweep AxPilot50_M1 OK 4 axiom-lines, AxPilot50_Dirichlet OK 2, both sweeps; C2 coverage (3/3, 1/1) [R3 §1.6; tables §2] |
| discharges | `hQRH_seven_eighths` (`R1.lean:87`), `Dirichlet.hQRHχ_seven_eighths` (`:154`) | PROVED-UNCONDITIONAL (applications of the imported donor theorems); no direct print — covered transitively via the landing theorems' prints [tables §2] | donor pin (see Thm 1 row) |

## Abstract

If ζ(s) ≠ 0 for Re s > 7/8, the functional equation reflects this to Re s < 1/8, so
every nontrivial zero of ζ satisfies 1/8 ≤ Re ρ ≤ 7/8; the same holds for primitive
Dirichlet L-functions given the product-form functional equation. We prove the ζ
statement in Lean with **no hypotheses beyond the definition of a nontrivial zero**
(Theorem 1; mathlib vocabulary forms, Theorem 2) and the Dirichlet statement under the
single remaining hypothesis hFEχ (Theorem 3). The 7/8 half-plane input is not assumed:
it is imported from openai-math's own theorems
(`OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re`,
`OAI.DirichletCharacter.LFunction_ne_zero_of_seven_eighths_lt_re`), consumed at the
donor's pin after a transitive axiom audit of the whole 2,924-file closure (exactly
{propext, Classical.choice, Quot.sound}; no sorryAx, no native_decide-class axiom). We
claim **no mathematical priority**: the strip corollary is printed in the donor
preprint (Cor. 1.2) and the reflection is classical; the contribution is the formal
statement, the audited consumption route, and — the negative half of the record — a
source-verified observation that zero-free regions of this kind are invisible to the
window-certificate zero-proportion constants: no re-optimization of the zeta23
functional under a zero-free half-plane exists within that engine.

## 0. Version history

v1 (2026-11-09) stated Part I as a source-verified argument and Part II with the
half-plane input as an explicit binder (hQRH at θ = 7/8). 50-M2 (2026-11-14) discharged
that binder from openai-math's donor theorems after the G7b audit, at the donor's pin.
This v2 merges the two records into one article with one status story. Substrate note
(ledger-pointer, not narrated here): the donor build and audit trail are
`research/feasibility/axiommath-donor-probes.md` §G7b and
`research/feasibility/VERIFICATION-LEDGER.md` (G7b rows; run logs
`feasibility/probe/logs-g/run31-g7-layers.log`, `run32-g7-elab.log`).

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
the half-plane imported rather than assumed. Billing (R2 §4 item 11): Part I is
knowledge-level — a correct and useful reading, not a theorem; Part II is the formal
content of this record.

## 2. Setting

`IsNontrivialZeroP50 ρ` :⟺ ζ(ρ) = 0 ∧ 0 < Re ρ < 1 (zeta23's `IsNontrivialZero` shape).
The conditional cores live on the project pin (mathlib `ff2494ea`, Lean v4.36.0-rc2):
`strip_confinement (hQRH : ∀ s, 7/8 < Re s → ζ s ≠ 0)` and
`Dirichlet.strip_confinement_dirichlet (hQRHχ) (hFEχ)`. The discharged landings live in
`R1.lean`, elaborated at the donor pin (Lean v4.34.1, mathlib `d13f23b7`): the main-run
cores ported down from v4.36 (`push Not` → `not_le.mp`; nothing else changed), with
`hQRH_seven_eighths := fun s hs => OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re hs`
and the Dirichlet analogue applied definitionally (the main-run binders were
transcribed from these very statements).

## 3. Part I — the source-verified observation (PAPER-ONLY)

**Proposition 1 (reading, not a theorem).** Within the zeta23 engine as shipped, no
statement of the form "c₁\* improves to c₁\*(σ₀) under a zero-free half-plane
Re s > σ₀" is expressible at any stage of the constant extraction.

*Source-verified argument (carried from v1, citations re-checked at audit).* (i) The
ThmD functional's variational variable is the height offset inside the window (T, 2T]:
the concrete window is φ_D(u) = √(v⋆(u/L))·taper(u) (`ThmD/Window.lean`, above
`phiD_even :45`), with maximizer v⋆(s) = cos(√2 λ s) and c⋆(λ) =
√2 sin ϑ/(cos ϑ + ϑ sin ϑ), ϑ = λ/√2 (`ThmD/Functional.lean:32,35,40–43`; constants
H_D(λ) = 2 − 1/c⋆(λ) at `:53` and `ChallengeDeps.lean:107`). (ii) The engine's data
structures — `ZeroConfig` (`Defs.lean:120`) and `PaperInputs`
(`Hypotheses.lean:147`) — expose carrier, multiplicity, window and analytic-card data;
the only location predicate is `onLine := {ρ | Re ρ = 1/2}` (`Defs.lean:140`). The
on-line count is bounded below through the rank–trace certificate and the total count
by Riemann–von Mangoldt; excising a zero-free region changes neither. (iii) Hence the
constants are functions of the window shape λ alone; the engine's actual improvement
axes are internal λ-families (`Final.lean:79,99,119`) and window-shape variants
(article 21's certified comparison). ∎ (reading)

**Value and limits.** The observation kills a wrong bridge before formal effort is
spent on it, and pins down why (horizontal zero information is invisible to
height-window certificates). It is a reading of source files, not a Lean theorem, and
is billed as such; it should not be cited as a proved impossibility.

## 4. Part II — formal strip confinement (discharged)

**Theorem 1 (`strip_confinement_seven_eighths`, unconditional, at donor pin).** For
every ρ with `IsNontrivialZeroP50 ρ`: 1/8 ≤ Re ρ ≤ 7/8.

**Theorem 2 (vocabulary forms).** For z ∈ `riemannZetaZeros` with 0 < Re z < 1:
1/8 ≤ Re z ≤ 7/8; as sets, `riemannZetaZeros ∩ {0 < Re < 1} ⊆ {1/8 ≤ Re ≤ 7/8}`.

**Theorem 3 (Dirichlet, one hypothesis, at donor pin).** Assume `hFEχ` (§7). For every
q, every primitive χ mod q, and every zero ρ of L(·, χ) with 0 < Re ρ < 1:
1/8 ≤ Re ρ ≤ 7/8.

**Discharges.** `hQRH_seven_eighths` is the imported openai theorem applied verbatim;
`Dirichlet.hQRHχ_seven_eighths` likewise, with explicit-instance bookkeeping. The
main-run hypotheses were transcribed from these statements, so the discharges are
definitional — no glue lemmas.

## 5. Proofs

**Theorem 1.** Let ρ be a nontrivial zero. Since 0 < Re ρ, ρ ≠ 1 and ρ ≠ −n (n ∈ ℕ), so
mathlib's `riemannZeta_one_sub` applies: ζ(1 − ρ) = 2(2π)^{−ρ} Γ(ρ) cos(πρ/2) ζ(ρ) = 0.
If Re ρ < 1/8 then Re(1 − ρ) > 7/8 and the donor theorem gives ζ(1 − ρ) ≠ 0 —
contradiction. If Re ρ > 7/8 the donor theorem gives ζ(ρ) ≠ 0 directly. **Theorem 3**
is the same argument with `hFEχ` in place of the ζ functional equation (reflecting to
χ⁻¹); the pole exclusion ¬(χ⁻¹ = 1 ∧ 1 − ρ = 1) follows from Re ρ > 0. ∎

## 6. Formal record

| theorem / artifact | declaration | file | axioms | evidence |
|---|---|---|---|---|
| Thm 1–3, donor pin | `strip_confinement_seven_eighths`, `…_mem_seven_eighths`, `…_set_seven_eighths`, `Dirichlet.strip_confinement_dirichlet_seven_eighths_of_FE` | `research/pilots/50/R1.lean` (180 lines on disk; v1/50-M2 said 178 — drift, R3 §4 F5) | ⊆ triad | `run32-g7-elab.log:137–145` (rc=0, 0 errors, 0 sorry; 4 landing prints triad `:138–141`; donor headlines `:144–145`) [R3 §1.6] |
| donor audit (G7b) | both OAI 7/8 headlines + delegation roots `OAI.SevenEighths.ProbeFinalAssemblyUnconditional.{dirichlet,zeta}_nonzero` | `feasibility/probe/ProbeG7b_OAI_SevenEighths.lean` | ⊆ triad, transitive over the 2,924-file closure | probe OK `run32-g7-elab.log:44`; donor-audit prints `:48` (Dirichlet headline), `:51` (ζ headline); delegation roots `:52–55` [R3 §1.6; tables §2]; trail: `axiommath-donor-probes.md` §G7b, VERIFICATION-LEDGER G7b rows |
| conditional shells, project pin | `strip_confinement` (`M1.lean:44`), `strip_confinement_mem`/`_set` (`:75/:85`), `Dirichlet.strip_confinement_dirichlet` (`Dirichlet.lean:40`) | `research/pilots/50/M1.lean` (94 LoC), `Dirichlet.lean` (73 LoC) | ⊆ triad | prints `pilots/50/logs/axcheck-final.log:815` (core), `:817–818` (vocabulary), `:810–811` (Dirichlet); verdict of record = the axcheck logs (v1's `combined-run14-green.log` is a headerless class-k log — R3 §2); sweep AxPilot50_M1 OK 4 axiom-lines, AxPilot50_Dirichlet OK 2, C2 coverage (3/3, 1/1) [R3 §1.6; tables §2] |
| discharges | `hQRH_seven_eighths` (`R1.lean:87`), `Dirichlet.hQRHχ_seven_eighths` (`:154`) | `research/pilots/50/R1.lean` | ⊆ triad (transitive, via the landing theorems' prints) | covered transitively [tables §2]; donor pin |
| donor theorems | `OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re` (`Nonvanishing.lean:29`), `OAI.DirichletCharacter.LFunction_ne_zero_of_seven_eighths_lt_re` (`:19`) | openai-math `lean/OAI/NumberTheory/DirichletL/Nonvanishing.lean` | ⊆ triad | consumer-side prints `run32-g7-elab.log:144–145`; statements verified line-exact in the R1 audit §4 |
| statement probe | `R1probe.lean` | idem | — | `run32-g7-elab.log` (OK, 0 tokens — Step A) |

## 7. Limitations and open problems

1. **hFEχ remains for Dirichlet L** — the one-declaration mathlib donation candidate
   `DirichletCharacter.LFunction_one_sub` (product-form reflection for primitive χ;
   the completed form exists at `Mathlib/NumberTheory/LSeries/DirichletContinuation.lean:291`).
2. **Donor-pin substrate.** R1 lives at Lean v4.34.1 / mathlib `d13f23b7`; porting to
   the project pin means porting the openai closure (statements ≈ 0 cost; proofs are
   the cost). Until then every unconditional status here is "at donor pin" — said in
   the status rows, per R3's rule 6.
3. **Not done:** the ζ_K / Hecke strip at 31/32 (route R2, specified in
   `pilots/50-M2-31-32-spec.md`; would be a genuine first — no formal ζ_K zero-location
   statement exists in the corpora) and the parametric-θ refactor.
4. **Constants stale on arrival by design**: the formal Dirichlet-class frontier is
   already at 0.8733458561 (QuasiRiemannTracker, 2026-11-13); the strip theorem
   re-instantiates at any better donor constant with the same proof.
5. **Part I is a reading**, not a theorem; it is billed PAPER-ONLY and must not be
   counted among proved artifacts.

## 8. Novelty/nearest misses and references

| prior work | what it is | why this differs |
|---|---|---|
| openai-math preprint, *The Quasi-Riemann Hypothesis* (2026-09-30), proof of Cor. 1.2 | prints the strip corollary "1/8 ≤ Re s ≤ 7/8" for primitive Dirichlet L | our contribution is formal, not mathematical: kernel proofs + transitive donor audit |
| Titchmarsh, *The Theory of the Riemann Zeta-Function*, ch. II | classical reflection via the functional equation | textbook; we formalize the reflection step from mathlib's product form |
| AxiomMath DedekindZetaZeroFree (`Main.lean:9`) | ζ_K ≠ 0 for Re s > 31/32, every number field (statement-level on our pin; direct build fails, G1b) | stronger constant, number-field scope; not consumable on our pin — the carried route R2 |
| Liu, arXiv:2610.12234 (+ repo) | 0.874957 half-plane, external toolchain | statement-level citation only (AGENTS.md: DO-NOT-CONSUME) |

**Project artifacts.** `research/pilots/50/` (M1, Dirichlet, R1, R1probe + logs);
`research/pilots/50/R1-prework.md`, `50-M2-31-32-spec.md`;
`research/feasibility/axiommath-donor-probes.md` §G1b/§G7/§G7b;
`research/feasibility/VERIFICATION-LEDGER.md` (G7b rows);
`research/novelty/liu1-hygiene-sweep.md`; dossier 70 standing notes; superseded v1 and
50-M2 articles (history in §0).

---

## Shipping-gate self-check (TEMPLATE-iter4 §9) — R1, 2026-11-16 · verdict: **PASSES, all blockers cleared**

| # | hard rule | result |
|---|---|---|
| 1 | article kind | PASS — `NEGATIVE (technical record)`; Part I PAPER-ONLY as a section, never the headline (headline = Theorem 1, PROVED-UNCONDITIONAL at donor pin) |
| 2 | title free of project-internal tokens | PASS |
| 3 | status row per theorem, closed vocabulary, every binder listed | PASS — 6 rows incl. the shells and the two discharge rows; hQRH/hQRHχ/hFEχ named verbatim; "at donor pin" substrate qualifier used per the template §1 reconciliation (required by R3 rule 6, not a status noun) |
| 4 | abstract ≤ 200 words with theorem+hypotheses+status+scoped novelty+nearest prior | PASS — 190 words; explicit "no mathematical priority"; nearest = donor preprint Cor. 1.2 |
| 5 | nearest-miss table ≥ 2 rows; any "first" scoped | PASS — 4 rows (donor preprint, Titchmarsh, DZDF 31/32, Liu); no "first" claim made |
| 6 | no bracketed errata | PASS |
| 7 | no section contradicts another; no addendum | PASS — merged v2; §0 records the v1/50-M2 history |
| 8 | formal record table-only; no infra narration | PASS — §6 table; G7b trail as ledger pointers (grep-verified at runbook STEP 2) |
| 9 | internal vocabulary ≤ 3 glosses | PASS — "donor" only as corpus/substrate language, never as a status noun or title token |
| 10 | citations spot-checked (5+) | PASS — R1 audit §4 (`Nonvanishing.lean:19/:29` line-exact, run32 log) + R3 integrity §1.6 + tables §2 prints |
| 11 | README row in same commit | satisfied via runbook STEP 7 |
| 12 | superseded files marked; record claims git-checked | PASS — §0; 50-M2 retired into this file at swap |

Rubric floor: (a) 2, (b) 2, (d) 2. All evidence slots filled from R3's audits; the
headered-axcheck substitution for v1's headerless `combined-run14-green.log` is applied.
Proposal header stripped at swap (runbook STEP 2 paste rule).
