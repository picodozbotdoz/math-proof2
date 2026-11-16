# R2 rewrite proposal — article 20 split (Interface theorem + Seam analysis note)

Lane R2, 2026-11-16, per the adopted restructuring plan (§8 of
`r2-discovery-strength.md`: article 20 → REWRITE-FULL, technical record). Rev 2 (same
day): orchestrator rulings + R1 cross-review (`r1-review-r2-rewrites.md` §A) applied —
TECHNICAL-RECORD front matter, per-theorem closed-vocabulary status rows from
`r3-verification-tables.md` §4, stale count fixed (28 public / 582 LoC),
`SharedMass`/`CommonZeroControl` defs move WITH Theorem 5, nearest-miss table, run
narration removed, README-v2 reconciliation noted. Theorem 5 carries a PAPER-ONLY
status row and stays out of the article's claims.

## Split rationale (one paragraph)

Current article 20 bills four things under one "structural theorem" voice: (a) a proved
conditional interface (Theorems 1–3: card + engine step ⇒ λ-families ⇒ 2/3, 1/2, 3/4;
family merging with multiplicity), (b) a one-line proved atom lemma (Theorem 4), (c) a
paper-level common-zero analysis (Theorem 5, not formalized), and (d) a knowledge-level
survey of what would discharge hCZ. Only (a)+(b) are Lean theorems; (c)+(d) are the
"seam analysis". The rewrite keeps (a)+(b) as a template-conformant TECHNICAL-RECORD
article and moves (c)+(d) — with the `SharedMass`/`CommonZeroControl` definitions they
depend on — to a dossier-grade note, killing the mislabel flagged in R2 §2 (kind
"structural theorem" inflates an interface). R1's audit MAJOR (Theorem 5 asserted in
the v1 abstract while unformalized) is resolved only by this split.

---

## Part 1 — replacement article text (`research/articles/20-engine-seam-interface.md`; filename rename from `20-common-zero-seam-dedekind-zero-density.md`, cross-ref sweep S–M — runbook STEP 4c)

# An Interface Theorem for Zero-Proportion Engines: the zeta23 Card, λ-Families, and Multiplicity Merging

*cross-math-fronttier research article 20 (Iter-4 edition) · kind: TECHNICAL-RECORD
(TEMPLATE-iter4 §0) · Lean `research/pilots/20/M1.lean` (28 public theorems, 582 LoC) ·
blueprint `research/pilots/20-blueprint.md` · the common-zero seam analysis formerly in
this article (incl. its Theorem 5 and the `SharedMass`/`CommonZeroControl` definitions)
lives in `research/pilots/20-seam-analysis.md` (dossier-grade) · upstream consumers:
articles 42-v2, 75*

**Status: TECHNICAL-RECORD.** Theorems 1–2 (`instantiate_family_A/B/C`, λ → 1
upgrades) and the merging facts of Theorem 3 are PROVED-CONDITIONAL on the named
engine binders; Theorem 4 (`merged_mult_of_common`) is PROVED-UNCONDITIONAL
(configurational hypotheses only). All axioms ⊆ {propext, Classical.choice,
Quot.sound}. Every engine input is an explicit hypothesis. The application-level
analysis (distinct/simple zero transport, the hCZ hypothesis) is **not** claimed here;
see the seam-analysis note. Per-theorem rows: §5.

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

[Adapted from the current §1, first two paragraphs; the third paragraph ("The engine
route is the only route to distinct- and simple-zero statements … what blocks it")
moves to the seam note. Close with:] The contribution is the interface and the two
merging lemmas, both unconditional-in-shape (hypotheses named, nothing hidden). What
the interface cannot transport — distinct- and simple-numerator bounds past common
zeros — is the subject of the companion note, and is not claimed here.

## 2. Setting

[Verbatim from current §2 (zero configurations, dyadic windows, EpsLower, H(λ)/F(λ))
**minus the SharedMass/CommonZeroControl block, which moves with Theorem 5 to the
seam note** — the article must not reference those names anywhere.]

## 3. Main results

**Theorem 1 (instantiation).** [Current §3 Theorem 1 verbatim.]
**Theorem 2 (λ → 1 upgrades).** [Current Theorem 2 verbatim.]
**Theorem 3 (merging with multiplicity).** [Current Theorem 3 verbatim.]
**Theorem 4 (atom lemma).** [Current Theorem 4 verbatim — restated without the
SharedMass vocabulary: "if z(ρ) = w(ρ) = 1 then (z+w)(ρ) = 2; if the on-line supports
of z and w are disjoint then no point is a common on-line zero." The SharedMass ≡ 0
corollary phrasing moves to the note with the definitions.]

## 4. Proofs

[Current §4 proofs of Theorems 1–4 verbatim; the Theorem 5 proof and the Discussion
paragraph move to the seam note.]

## 5. Formal verification (per-theorem rows, closed vocabulary; from `r3-verification-tables.md` §4)

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

## 6. Relation to prior work (nearest-miss table)

| source | what it owns | relation to this article |
|---|---|---|
| zeta23 (anthropics_formal-math): the engine, `PaperInputs`/`PaperInputsChi` card, `thmA₀_N0` (`Final.lean:356`), `trivial_chain` (`Statement.lean:157`) | the engine and its two instantiations | transcribed (`Card20` et al.), never re-proved — the interface generalizes the seam |
| Alpöge–Furman, arXiv:2608.13637 | the method | the interface's mathematical backdrop |
| articles 42-v2 / 42-M4 / 75 (this project) | the ζ_K/ζ_L proportion consumers | instantiate Theorems 3–4 at ζ_K and ζ_L |
| [moved to note: the classical common-zero literature — Li 2012; Garunkštis–Kalpokas; Gonek heuristics; Ingham/Huxley] | common zeros of L-functions | the seam note's knowledge-level section |

## 7. Limitations and open problems

1. The card for a *new* L-function (e.g. ζ_K itself) needs a Weil explicit formula and
   Riemann–von Mangoldt for the target — the engine route's true cost, unchanged.
2. Distinct/simple/window constants do not pass the seam; see the companion note for
   the obstruction (hCZ) and what would unblock it — no claim is made here.
3. [R3-FILL — confirm nothing else in the current §7 belongs here vs. the note.]

## References

[R3-FILL — carry over the current §References minus the common-zero citations, which
move to the note.]

---

## Part 2 — seam-analysis note text (`research/pilots/20-seam-analysis.md`, dossier-grade; extends `pilots/20-hCZ-NOTE.md`, which remains the hCZ hypothesis record)

# The Common-Zero Seam: what zero-density engines cannot transport (analysis note)

*Dossier-grade note (knowledge-level + one paper proposition), extracted from the
2026-11-09 edition of article 20; reclassified per the Iter-4 strength bar — not an
article. Carries the `SharedMass` and `CommonZeroControl` definitions verbatim
(formerly article §2) together with the proposition that uses them.*

**Contents.**

1. **Definitions (moved from article §2).** `SharedMass`, `CommonZeroControl` verbatim.
2. **The seam statement (paper proposition, not formalized).** [Current Theorem 5
   verbatim: SharedMass ≤ S₁ + (1/6 + ε)N given the factors' 5/6-distinct theorems;
   (a) hCZ at every level η > 1/6 unconditionally; (b) hCZ ⇒ S₁ = o(N); (c) S₁ = o(N) +
   density-zero multiplicity ⇒ hCZ. Proof: current §4 Theorem 5 argument verbatim.]
   Status row: **PAPER-ONLY** (no decl; the v1 abstract asserted it as a result — that
   billing is retracted by the split).
3. **Why the seam is real (knowledge-level).** [Current Discussion paragraph verbatim:
   the convex penalty meets a merged multiplicity-2 atom; S₁ as a cross-function
   coincidence count; classical zero-density estimates make shared mass with
   Re ρ > 7/12 + δ negligible but say nothing on the line; the independent-ordinates
   heuristic.]
4. **Prior work on common zeros.** Li (2012); Garunkštis–Kalpokas; Gonek's heuristics;
   Ingham; Huxley (A = 12/5). Recorded queries, nothing verified here.
5. **Consumers.** Article 42-v2 (defect + hCZ-conditional distinct bounds); article 75
   P-b (the strip-distinct arm, carried); the Montgomery–Taylor window constants for
   ζ_K (engine route, open).
6. **Open problem.** Prove S₁ = o(N) for (ζ, L(χ_D)) — or any negligibility statement
   for common on-line zeros — and the distinct/simple/window constants for ζ_K become
   reachable by the engine route.

---

## Part 3 — README row (v2-reconciled)

R1 has already reconciled the live README-v2 §B row 20 (`r1-readme-v2.md`) to the split
form; the row below is the R2-concurs form — splice target is **README v2**, not the
retired two-table README:

- new (v2 §B row 20): `| 20 | [An Interface Theorem for Zero-Proportion Engines](20-engine-seam-interface.md) | TECHNICAL-RECORD — conditional interface | Thms 1–3 PROVED-CONDITIONAL (card/step binders); Thm 4 PROVED-UNCONDITIONAL; seam analysis → `pilots/20-seam-analysis.md` (Thm 5 PAPER-ONLY) |`

**Cross-reference sweep (S–M; runbook STEP 4c):** article 42-v2's §5 seam pointer,
42-M4 §3 (hCZStrip), article 75 §7.4 (negligibility form), TRIAGE rows 20/42/75 — all
currently cite "article 20" for the seam; retarget to the note. [R3-FILL: full
citation list; the three above are the known sites.]

**Effort:** article rewrite S (text ~80% carried verbatim); note S; rename+sweep S–M.
