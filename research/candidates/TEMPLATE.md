# Candidate dossier template (Phase 3)

Copy this file to `research/candidates/NN-slug.md` (NN = two-digit ordinal, e.g.
`01-zetazero-density-bandwidth-two.md`). Fill every section; write "unknown" rather
than deleting a section. Ground rules from `research/RESEARCH.md` apply: exact
declarations, files, and paper sections for every claim; discovery-first (the
statement must be new); Lean kernel verification only.

Ownership: the creating researcher owns their dossier file; H owns this template.
Score fields at the bottom are left empty — they are filled at Phase 4 triage
(see `research/TRIAGE.md`), not by the dossier author.

---

## Name

<short memorable name, kebab-case slug matches filename>

## One-line pitch

<one sentence: what is new and why the combination makes it work>

## Precise mathematical statement

<Self-contained, formalizable phrasing. All objects defined or cited to an exact
declaration (e.g. `Mathlib.LinearAlgebra.Matrix.Rank`, `Zeta23.LinAlg.RankTrace.
rank_trace_ineq`). No hand-waving: a Lean statement could be written from this
alone. State hypotheses and quantifier order explicitly.>

## Novelty check

- Absent from all four corpora — cite the searches, not just the conclusion.
  For each corpus give the rg pattern(s) and result count:
  - mathlib (`encore-mathlib/repo/mathlib4`): `rg -i -c '<pattern>' Mathlib/` → 0 hits …
  - tauceti: `rg -i -c '<pattern>' .` → 0 hits …
  - openai-math: …
  - anthropics_formal-math: …
  Also search for the *objects* under other names (synonym list), not just the
  statement text.
- Absent from the literature — cite the searches/URLs used (arXiv listing search,
  Google Scholar query, zbMATH open query, …) with date and result.
- Cross-reference lane R8's `research/novelty/round-1.md` once it lands; until
  then mark `[R8 confirmation pending]`.
- Known nearest misses: the closest existing statements (in corpora or literature)
  and precisely what differs.

## Bridge analysis

- Corpora bridged: <which two or more of mathlib / tauceti / openai-math / anthropics>.
- Why the bridge is essential: <why this is NOT provable from one side alone —
  which ingredient exists only in corpus A, which only in corpus B>.
- Empty-zone fit: <which Phase 2 bridge-map entry this realizes (file + section)>.

## Proof-strategy sketch

<Numbered steps, each citing named results/declarations from the corpora, e.g.
"3. Apply `Zeta23.LinAlg.rank_trace_ineq` (RankTrace.lean:163) with c = 2 to the
Gram matrix G …". Indicate which steps are routine vs. the one or two genuinely
new ideas.>

## Feasibility

<To be filled via lane R9's template from `research/feasibility/mathlib-verification.md`
§3 once it exists; until then give a preliminary assessment in the same shape:>

- mathlib API entry points: <exact module/decl names the proof would import>.
- Donor lemmas: <corpus declarations to port (file:line) and expected porting friction>.
- Missing glue: <what neither mathlib nor the corpora provide>.
- Effort: S (< ~500 new LoC) / M (~500–3k) / L (> 3k or missing analytic API).
- Risks: <what could sink it — implicit iris, API mismatch, constants not computable…>.

## Significance

<2–3 sentences: why it matters, what it would unlock, who would care.>

## Score (filled at triage — leave empty)

- Novelty (1–5):
- Significance (1–5):
- Effort (S/M/L → 1–5):
- Rank (novelty × significance ÷ effort):

---

# EXAMPLE-NOT-A-CANDIDATE

The entry below is a **format illustration only**. Strassen's algorithm is famous
known mathematics, present in the corpora/literature — it fails the novelty bar
by construction. Sections are deliberately short ("fake-short") but show the
expected *density*: exact decls, exact rg patterns, exact citations. Real
dossiers are expected to be longer and must contain real searches.

## Name

example-strassen-word-ram

## One-line pitch

Strassen's 7-multiplication identity gives O(n^log₂7) ≈ O(n^2.81) matrix product
on the 3sum-apsp word-RAM — illustration of the dossier format only.

## Precise mathematical statement

There exist b, T with `BigO T (Real.logb 2 7)` such that for all word sizes
W ≥ b·(⌊log₂ n⌋+1), the program family computes C = A·B for n×n integer matrices
within T(n) steps (phrasing mirrors `Problem.SolvedInTime`, `3sum-apsp/EndStatement.lean:67`).

## Novelty check

- Corpora (ILLUSTRATIVE PATTERNS — run real ones in a true dossier):
  - mathlib: `rg -i -c 'strassen' Mathlib/` → 0 …
  - 3sum-apsp: `rg -i -c 'logb_two_seven' .` → hits (Strassen exponent already used,
    `Sec*` …) — nearest miss: exponent appears, algorithm-as-program does not.
- Literature: textbook algorithm (Strassen 1969) — **fails novelty**; kept only to
  show the shape. `[R8 confirmation pending]` in a real entry.

## Bridge analysis

- Bridges anthropics/3sum-apsp (word-RAM model, `Instr`/`exec`) with mathlib
  `Matrix` API.
- Essential only in the illustrative sense: the RAM model exists solely in 3sum-apsp;
  the divide-and-conquer bookkeeping would come from mathlib.

## Proof-strategy sketch

1. Port Strassen 7-term identity as a `MvPolynomial` identity (cf. `Term`s in
   `3sum-apsp/PaperStatements.lean:111–161`).
2. Recursion to depth ⌈log₂ n⌉; bound multiplications by 7^⌈log₂ n⌉ ≤ n^log₂7
   (cf. `logb_two_seven_lt` cited in survey §2(c)).
3. Word-size growth per level handled by `Problem.SolvedInTime`'s W ≥ b·(⌊log₂ n⌋+1).

## Feasibility

- Entry points: `EndStatement.Instr`/`exec`; mathlib `Matrix.mul`.
- Donor lemmas: 3sum-apsp `Lang`/`Programs` compiler layer.
- Missing glue: block-recursive program construction in the word-RAM `Lang`.
- Effort: M. Risks: pointer/addressing bookkeeping on the RAM.

## Significance

Illustrates the format. (In a real candidate: why the result matters and what it
unlocks.)

## Score (filled at triage — leave empty)

- Novelty (1–5): —
- Significance (1–5): —
- Effort (S/M/L → 1–5): —
- Rank: —
