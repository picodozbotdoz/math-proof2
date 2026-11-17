# An Interface Theorem for Zero-Proportion Engines: the zeta23 Card, λ-Families, and Multiplicity Merging

*kind: TECHNICAL-RECORD (TEMPLATE-iter4 §0 kept set — conditional interface + the
multiplicity-merging lemmas) · date: 2026-11-16 (Iter-4 edition; 2026-11-17 passes:
front-matter shape, status rows moved to the header, §5 verification-block depth —
no mathematical content change) · supersedes: the
Cycle-2 text whose seam analysis moved out (the common-zero seam analysis formerly
here, incl. its Theorem 5 and the `SharedMass`/`CommonZeroControl` definitions, lives
in `research/pilots/20-seam-analysis.md`, dossier-grade) · artifacts:
`research/pilots/20/M1.lean` (28 public theorems, 582 LoC),
`research/pilots/20/logs/`; blueprint `research/pilots/20-blueprint.md`; upstream
consumers: articles 42-v2, 75*

**Status: TECHNICAL-RECORD.** Theorems 1–2 (`instantiate_family_A/B/C`, λ → 1
upgrades) and the merging facts of Theorem 3 are PROVED-CONDITIONAL on the named
engine binders; Theorem 4 (`merged_mult_of_common`) is PROVED-UNCONDITIONAL
(configurational hypotheses only). All axioms ⊆ {propext, Classical.choice,
Quot.sound}. Every engine input is an explicit hypothesis. The application-level
analysis (distinct/simple zero transport, the hCZ hypothesis) is **not** claimed here;
see the seam-analysis note.

| theorem | status | hypotheses | evidence |
|---|---|---|---|
| Thms 1–2 `instantiate_family_A/B/C` (+ `two_thirds_of_components`) | PROVED-CONDITIONAL | Card20 (zeta23 PaperInputs card), TracesFamily, EngineStep — the engine binders; `two_thirds_of_components`: component family inputs | `pilots/20/logs/axcheck-cycle2.log:56` — triad; main-run `axcheck-final.log:436` |
| Thm 3 `assemble_eps` / `family_merge` | PROVED-CONDITIONAL | hz, hw (component `EpsLower` inputs) / hfamz, hfamw (component λ-family proportions; NO common-zero hypothesis) | `axcheck-cycle2.log:51` — triad; `assemble_eps` main-run in-stage (C2 sweep 38 axiom-lines, 0 sorryAx) |
| Thm 4 `merged_mult_of_common` | PROVED-UNCONDITIONAL | hz, hw configurational ("ρ is a simple zero of both") — no donor binder | `axcheck-cycle2.log:63` — triad |
| v1 Theorem 5 (hCZ at η > 1/6) | PAPER-ONLY — seam note, not an article claim | — | none |

Status rows moved to the header from §5 (template skeleton; content unchanged,
2026-11-17 depth pass). Per-decl file:line view and the verification blocks: §5.

---

## Abstract

The zeta23 zero-density engine proves Alpöge–Furman-type proportions from a "card" of
analytic inputs plus a traces family and an engine step. Neither the card nor the step
is reusable at another L-function: they are stated once, for ζ and for Dirichlet L. We
restate the engine at its natural generality — a zero configuration plus coefficient
data — and prove the instantiation layer as a formal interface: card + traces family +
engine step ⇒ λ-families of division-free proportion bounds (H(λ) = 2 − 1/λ − λ/3,
F(λ) = λ/(1+λ²/3)) ⇒ the submitted constants 2/3, 1/2, 3/4 as λ → 1. We also prove the
multiplicity-merging facts the assembly consumers (articles 42-v2, 75) rely on:
with-multiplicity proportion bounds merge through any finite sum of configurations with
no common-zero hypothesis, and a simple common zero of two factors is a double zero of
the product. Theorems 1–3 are PROVED-CONDITIONAL on the card/step binders; Theorem 4
is PROVED-UNCONDITIONAL. The interface is deliberately hollow — the analytic content is
exactly its hypotheses — but it is the load-bearing seam through which every ζ_K/ζ_L
proportion statement of this project passes.

## 1. Introduction

Zero-density proportion theorems are proved function by function. For a number field
K the Dedekind zeta factors into Artin L-functions; for K quadratic, ζ_K = ζ·L(·, χ_D).
Two routes to ζ_K proportions exist:

- **assembly** (article 42-v2): add the factor theorems using additivity of
  multiplicities;
- **engine** (this article): run the density engine directly on the zero configuration
  of ζ_K, which needs ζ_K-versions of the analytic inputs.

(The v1 article's third paragraph — that the engine route is the only route to
distinct- and simple-zero statements and to window constants for ζ_K, and what blocks
it — moved to the companion note.) The contribution is the interface and the two
merging lemmas, both unconditional-in-shape (hypotheses named, nothing hidden). What
the interface cannot transport — distinct- and simple-numerator bounds past common
zeros — is the subject of the companion note, and is not claimed here.

## 2. Setting

A *zero configuration* is a multiplicity function m : ℂ → ℕ with finite support in
every window {0 < Re ρ < 1, T₁ < Im ρ ≤ T₂}. Write N(T), N^on(T) for the dyadic window
(T, 2T] counts with multiplicity, and `EpsLower z c` for: ∀ ε > 0, eventually
(c − ε)·N(T) ≤ N^on(T). The engine's λ-family constants are

  H(λ) = 2 − 1/λ − λ/3,  F(λ) = λ/(1 + λ²/3),  λ ∈ (1/2, 1),

with H(1) = 2/3 and F(1) = 3/4 (Theorems A, B, C of zeta23 correspond to H, 2F − 1, F).

## 3. Main results

**Theorem 1 (instantiation).** If z carries a `Card20` (the five-field transcription
of `Zeta23.PaperInputs`), a traces family and an engine step, then for every λ ∈
(1/2, 1): `EpsLower z (H λ)`, `EpsLower z (2F(λ) − 1)` and `EpsLower z (F λ)`.

**Theorem 2 (λ → 1 upgrades).** A family `EpsLower z (H λ)` for all λ ∈ (1/2, 1)
implies `EpsLower z (2/3)`; similarly 2F − 1 gives 1/2 and F gives 3/4. The proof is
explicit in δ: H(1 − δ) ≥ 2/3 − 5δ/3 for 0 < δ ≤ 1/2.

**Theorem 3 (merging with multiplicity; no common-zero hypothesis).** If z and w
satisfy `EpsLower · (H λ)` for all λ, so does z + w. In particular, via a
factorization L = L₁L₂ (orders add), the with-multiplicity 2/3 statement for L follows
from those of the factors.

**Theorem 4 (atom lemma).** If z(ρ) = w(ρ) = 1 then (z + w)(ρ) = 2: a simple common
zero of the factors is a non-simple zero of the product. If the on-line supports of z
and w are disjoint, then no point is a common on-line zero of both.

## 4. Proofs

**Theorems 1–2.** Theorem 1 is the definition of the engine step applied at each λ
(the card is carried so that its eventual discharge slots in unchanged). For Theorem 2
take δ = min(3ε/10, 1/4) and λ = 1 − δ; then H(λ) − ε/2 ≥ 2/3 − ε, and the family
bound at λ with ε/2 gives the claim; the cases 2F − 1 and F are identical with their
own δ-bounds. ∎

**Theorem 3.** With-multiplicity counts are additive: N_{z+w} = N_z + N_w and
N^on_{z+w} = N^on_z + N^on_w (finite sums over supports; supp(z + w) = supp z ∪ supp w).
Add the two ε-inequalities. The factorization step is article 42-v2's counting theorem.
∎

**Theorem 4.** Immediate from (z + w)(ρ) = z(ρ) + w(ρ). ∎

(The v1 Theorem 5 proof and the Discussion paragraph moved to the companion note.)

## 5. Formal verification (per-decl view; status rows in the header; from `r3-verification-tables.md` §4)

| decl | file:line | status | axioms print source |
|---|---|---|---|
| `instantiate_family_A` (+ B/C) | `pilots/20/M1.lean:437` (+ siblings) | PROVED-CONDITIONAL — Card20 (zeta23 PaperInputs card), TracesFamily, EngineStep binders | `pilots/20/logs/axcheck-cycle2.log:56` — triad; main-run `axcheck-final.log:436` |
| `assemble_eps` | `pilots/20/M1.lean:188` | PROVED-CONDITIONAL — hz, hw (component `EpsLower` inputs) | main-run `axcheck-final.log` in-stage; C2 sweep 38 axiom-lines, 0 sorryAx |
| `family_merge` | `pilots/20/M1.lean:525` | PROVED-CONDITIONAL — hfamz, hfamw (component λ-family proportions; NO common-zero hypothesis) | `axcheck-cycle2.log:51` — triad |
| `two_thirds_of_components` | `pilots/20/M1.lean:534` | PROVED-CONDITIONAL — component family inputs | C2 sweep in-stage (38 axiom-lines, 0 sorryAx) |
| `merged_mult_of_common` | `pilots/20/M1.lean:513` | PROVED-UNCONDITIONAL (hz, hw configurational: "ρ is a simple zero of both" — no donor binder) | `axcheck-cycle2.log:63` — triad |
| Theorem 5 (hCZ at η > 1/6 from the factors' 5/6-distinct theorems) | no decl | **PAPER-ONLY** — seam note, not an article claim | none |
| engine seam (`EngineStep`, `TracesFamily`) | `pilots/20/M1.lean` (between SWAP markers) | definitions — no status row | — |

Coverage: C2, 28/28 public theorems / 582 LoC (the "29th" raw `^theorem` match is
docstring prose; the v1 article's "27 theorems / 576 LoC" was stale — corrected).

Verification-block depth (R3 §5; 2026-11-17 depth pass):

- substrate: mathlib `ff2494ea` / Lean v4.36.0-rc2 for all rows; the status rows above
  carry the per-theorem log lines.
- binder inventory (the engine binders are the article's design, not donor statements
  consumed by import): **Card20** = the zeta23 `PaperInputs`/`PaperInputsChi` card
  transcribed as an explicit hypothesis (the engine's analytic inputs — the open core
  by design); **TracesFamily / EngineStep** = the traces-family and step predicates,
  likewise hypotheses; **hz, hw / hfamz, hfamw** = component proportion inputs
  (parameters of the statement class — the seam passes them through, proves nothing
  about them); hz/hw in Theorem 4 are configurational only (definition of subject —
  "ρ is a simple zero of both factors"), which is why that row is unconditional.
- honest labels: Theorems 1–3 PROVED-CONDITIONAL (the named engine/component binders);
  Theorem 4 PROVED-UNCONDITIONAL; the v1 Theorem 5 content PAPER-ONLY and relocated to
  the companion note (not an article claim).

## 6. Relation to prior work (nearest-miss table)

| source | what it owns | relation to this article |
|---|---|---|
| zeta23 (anthropics_formal-math): the engine, `PaperInputs`/`PaperInputsChi` card, `thmA₀_N0` (`Final.lean:356`), `trivial_chain` (`Statement.lean:157`) | the engine and its two instantiations | transcribed (`Card20` et al.), never re-proved — the interface generalizes the seam |
| Alpöge–Furman, arXiv:2608.13637 | the method | the interface's mathematical backdrop |
| articles 42-v2 / 75 (this project) | the ζ_K/ζ_L proportion consumers | instantiate Theorems 3–4 at ζ_K and ζ_L |
| [moved to note: the classical common-zero literature — Li 2012; Garunkštis–Kalpokas; Gonek heuristics; Ingham/Huxley] | common zeros of L-functions | the seam note's knowledge-level section |

## 7. Limitations and open problems

1. The card for a *new* L-function (e.g. ζ_K itself) needs a Weil explicit formula and
   Riemann–von Mangoldt for the target — the engine route's true cost, unchanged.
2. Distinct/simple/window constants do not pass the seam; see the companion note for
   the obstruction (hCZ) and what would unblock it — no claim is made here.

## References

- anthropics_formal-math `zeta23` (files cited above). L. Alpöge, A. Furman,
  arXiv:2608.13637.
- openai-math `SevenEighths.HeckeFamily`; tauceti Dedekind-zeta factorization record.
- The classical common-zero literature (Li 2012; Garunkštis–Kalpokas; Gonek's
  heuristics; Ingham; Huxley) moved to the companion note `research/pilots/20-seam-analysis.md`.

