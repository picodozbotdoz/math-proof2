# R2 rewrite proposal — article 20 split (Interface theorem + Seam analysis note)

Lane R2, 2026-11-16, per the adopted restructuring plan (§8 of
`r2-discovery-strength.md`: article 20 → REWRITE-FULL, technical record). This file
contains the complete replacement texts for H/R3 to splice. Placeholders `[R3-FILL]`
mark cells R3 must re-verify against `research/pilots/20/logs/` before promotion.
Line citations to the current article refer to
`research/articles/20-common-zero-seam-dedekind-zero-density.md` (2026-11-09 edition).

## Split rationale (one paragraph)

Current article 20 bills four things under one "structural theorem" voice: (a) a proved
conditional interface (Theorems 1–3: card + engine step ⇒ λ-families ⇒ 2/3, 1/2, 3/4;
family merging with multiplicity), (b) a one-line proved atom lemma (Theorem 4), (c) a
paper-level common-zero analysis (Theorem 5, **not formalized** — current article §5
admits it), and (d) a knowledge-level survey of what would discharge hCZ. Only (a)+(b)
are Lean theorems; (c)+(d) are the "seam analysis". The rewrite keeps (a)+(b) as a
template-conformant technical-record article and moves (c)+(d) to a dossier-grade note,
killing the mislabel flagged in R2 §2 (kind "structural theorem" inflates an interface).

---

## Part 1 — replacement article text (`research/articles/20-engine-seam-interface.md`; filename rename from `20-common-zero-seam-dedekind-zero-density.md`, cross-ref sweep S–M — or keep the old filename at the cost of a title/filename mismatch)

# An Interface Theorem for Zero-Proportion Engines: the zeta23 Card, λ-Families, and Multiplicity Merging

*cross-math-fronttier research article 20 (Iter-4 edition) · technical record · Lean
`research/pilots/20/M1.lean` · blueprint `research/pilots/20-blueprint.md` · the
common-zero seam analysis formerly in this article lives in
`research/pilots/20-seam-analysis.md` (dossier-grade) · upstream consumers: articles
42, 42-M4, 75*

**Status: PROVED (conditional interface), kernel-verified — technical record, not a
discovery article (Iter-4 strength bar).** All 27 theorems of `pilots/20/M1.lean` have
axioms exactly `[propext, Classical.choice, Quot.sound]`; no `sorry`, no
`native_decide`. Every engine input is an explicit hypothesis. The application-level
analysis (distinct/simple zero transport, the hCZ hypothesis) is **not** in this
article; see the seam-analysis note.

---

## Abstract

The zeta23 zero-density engine proves Alpöge–Furman-type proportions from a "card" of
analytic inputs plus a traces family and an engine step. Neither the card nor the step
is reusable at another L-function: they are stated once, for ζ and for Dirichlet L. We
restate the engine at its natural generality — a zero configuration plus coefficient
data — and prove the instantiation layer as a formal interface: card + traces family +
engine step ⇒ λ-families of division-free proportion bounds (H(λ) = 2 − 1/λ − λ/3,
F(λ) = λ/(1+λ²/3)) ⇒ the submitted constants 2/3, 1/2, 3/4 as λ → 1. We also prove the
two multiplicity-merging facts the assembly consumers (articles 42, 75) rely on:
with-multiplicity proportion bounds merge through any finite sum of configurations with
no common-zero hypothesis (`family_merge`), and a simple common zero of two factors is a
double zero of the product (`merged_mult_of_common`). The interface is deliberately
hollow — the analytic content is exactly its hypotheses — but it is the load-bearing
seam through which every ζ_K/ζ_L proportion statement of this project passes.

## 1. Introduction

[Adapted from current §1, first two paragraphs; the third paragraph ("The engine route
is the only route to distinct- and simple-zero statements … what blocks it") moves to
the seam note. Close with:] The contribution is the interface and the two merging
lemmas, both unconditional-in-shape (hypotheses named, nothing hidden). What the
interface cannot transport — distinct- and simple-numerator bounds past common zeros —
is the subject of the companion note.

## 2. Setting

[Verbatim from current §2 (zero configurations, dyadic windows, EpsLower, H(λ)/F(λ),
SharedMass, CommonZeroControl definitions) minus the SharedMass/CommonZeroControl
block, which moves to the seam note.]

## 3. Main results

**Theorem 1 (instantiation).** [Current §3 Theorem 1 verbatim.]
**Theorem 2 (λ → 1 upgrades).** [Current Theorem 2 verbatim.]
**Theorem 3 (merging with multiplicity).** [Current Theorem 3 verbatim.]
**Theorem 4 (atom lemma).** [Current Theorem 4 verbatim: z(ρ)=w(ρ)=1 ⇒ (z+w)(ρ)=2;
disjoint on-line supports ⇒ SharedMass ≡ 0.]

## 4. Proofs

[Current §4 proofs of Theorems 1–4 verbatim; the Theorem 5 proof and the Discussion
paragraph move to the seam note.]

## 5. Formal verification

| item | Lean (`CrossMath.Pilot20`, `research/pilots/20/M1.lean`) |
|---|---|
| card transcription | `Card20`, `ChebyshevMertensCard`, `MVHilbertCard`, `RvMCard`, `GammaFactsCard`, `EFCard` |
| engine seam | `EngineStep`, `TracesFamily` |
| Theorem 1 | `instantiate_family_A/B/C`, `zetaK_engine_two_thirds/half/three_quarters` |
| Theorem 2 | `hfun_one_sub_le`, `ffun_one_sub_le`, `family_to_two_thirds/half/three_quarters` |
| Theorem 3 | `assemble_eps`, `family_merge`, `two_thirds_of_components`, `count_add_of_factorization` |
| Theorem 4 | `merged_mult_of_common`, `sharedMass_eq_zero_of_disjoint` |
| axioms / runs | [R3-FILL — re-verify against `pilots/20/logs/axcheck-final.log` and the Cycle-2 green log `m1-cycle2-green.log`; carry-over candidates from the 2026-11-09 edition: all 27 theorems triad; 9 Modal cycles] |

## 6. Relation to prior work

- zeta23 (anthropics_formal-math): the engine, its `PaperInputs`/`PaperInputsChi` card,
  `thmA₀`, `trivial_chain` — the interface transcribes, never re-proves.
- Alpöge–Furman (arXiv:2608.13637): the method.
- Articles 42 / 42-M4 / 75 (this project): the consumers that instantiate Theorems 3–4
  at ζ_K and ζ_L.
- [Moved to note:] the classical common-zero literature (Li 2012; Garunkštis–Kalpokas;
  Gonek's heuristics; Ingham/Huxley density estimates).

## 7. Limitations and open problems

1. The card for a *new* L-function (e.g. ζ_K itself) needs a Weil explicit formula and
   Riemann–von Mangoldt for the target — the engine route's true cost, unchanged.
2. Distinct/simple/window constants do not pass the seam; see the companion note for the
   obstruction (hCZ) and what would unblock it.
3. [R3-FILL — confirm nothing else in the current §7 belongs here vs. the note.]

## References

[R3-FILL — carry over current §References minus the common-zero citations, which move
to the note.]

---

## Part 2 — seam-analysis note text (`research/pilots/20-seam-analysis.md`, dossier-grade; extends `pilots/20-hCZ-NOTE.md`, which remains the hCZ hypothesis record)

# The Common-Zero Seam: what zero-density engines cannot transport (analysis note)

*Dossier-grade note (knowledge-level + one paper proposition), extracted from the
2026-11-09 edition of article 20 (§3 Theorem 5, §4 last proof, §4 Discussion, §7);
reclassified per the Iter-4 strength bar — not an article.*

**Contents.**

1. **The seam statement (paper proposition, not formalized).** [Current Theorem 5
   verbatim: SharedMass ≤ S₁ + (1/6 + ε)N given the factors' 5/6-distinct theorems;
   (a) hCZ at every level η > 1/6 unconditionally; (b) hCZ ⇒ S₁ = o(N); (c) S₁ = o(N) +
   density-zero multiplicity ⇒ hCZ. Proof: current §4 Theorem 5 argument verbatim.]
2. **Why the seam is real (knowledge-level).** [Current Discussion paragraph verbatim:
   the convex penalty meets a merged multiplicity-2 atom; S₁ as a cross-function
   coincidence count; classical zero-density estimates make shared mass with
   Re ρ > 7/12 + δ negligible but say nothing on the line; the independent-ordinates
   heuristic.] Status: analysis, not theorem — the R2 audit classifies this section
   knowledge-level.
3. **Prior work on common zeros.** Li (2012); Garunkštis–Kalpokas; Gonek's heuristics;
   Ingham; Huxley (A = 12/5). Recorded queries, nothing verified here.
4. **Consumers.** Article 42 Theorems 4–5 (defect + hCZ-conditional distinct bounds);
   article 75 P-b (the strip-distinct arm, carried); the Montgomery–Taylor window
   constants for ζ_K (engine route, open).
5. **Open problem.** Prove S₁ = o(N) for (ζ, L(χ_D)) — or any negligibility statement
   for common on-line zeros — and the distinct/simple/window constants for ζ_K become
   reachable by the engine route.

---

## Part 3 — README row edits (old → new)

**Main-run table, README.md:18.**
- old: `| 20 | [The Common-Zero Seam](20-common-zero-seam-dedekind-zero-density.md) | structural theorem + obstruction analysis | conditional core **proved**; hCZ analysis on paper |`
- new: `| 20 | [An Interface Theorem for Zero-Proportion Engines](20-engine-seam-interface.md) | conditional interface — technical record | Thms 1–4 **proved** (λ-family instantiation + multiplicity merging); the common-zero seam analysis is `pilots/20-seam-analysis.md` (dossier-grade) |`

**Notes & certificates section (new README section), add row:**
- `| 20-note | The Common-Zero Seam (analysis) | `research/pilots/20-seam-analysis.md` | knowledge-level + paper Prop (Thm 5 of the 2026-11-09 edition) |`

**Cross-reference sweep (S–M):** article 42 (:131 "hCZ conjecture-grade … hCZ-NOTE"),
article 42-M4 §3 (hCZStrip), article 75 §7.4 (negligibility form), TRIAGE rows 20/42/75
— all currently cite "article 20" for the seam; retarget to the note. [R3-FILL: full
citation list; the three above are the known sites.]

**Effort:** article rewrite S (text is 80% carried verbatim); note S; rename+sweep S–M.
