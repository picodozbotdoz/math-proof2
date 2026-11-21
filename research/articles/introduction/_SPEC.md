# _SPEC.md — binding spec for beginner-introduction companions

Every introduction file in this directory follows this spec exactly. The finished
exemplar is `41-parallelogram-defect-deformation-eight-square.md` — match its
structure, tone, and rigor.

## Purpose

One expository companion per research article, closing the reader gap flagged by the
2026-11-21 external reviews (review-q4: density/notation/no examples; review-ds:
wrong-field imports caused by undefined scope). Target reader: an undergraduate in
mathematics or an expert reviewer from an adjacent field. Assumed: modular arithmetic,
polynomials, basic ring language. NOT assumed: Lean, formalization culture, the
article's specialty.

## File rules

- Location: `research/articles/introduction/`. Name: **same stem** as the article
  (`NN-slug.md` → `NN-slug.md`). One file per article.
- Never edit the source article, the registry README, or anything else in the repo.
  Only create your own introduction files. Never commit, never run Modal, never spawn
  subagents.

## Required skeleton (in this order; merge §8+§9 if the article is short)

1. `# <Article title> — a beginner's introduction`
2. Header blockquote: what this file is; link back to `../<article>.md`; audience line;
   the **non-normative marker** (verbatim): *"Nothing here adds, weakens, or replaces any
   claim of the article: if this file and the article ever disagree, the article and its
   Lean artifacts win."*; written-date.
3. **In plain words** — 4–6 sentences, no unexplained notation. The reader should be able
   to say what the article is about after this alone.
4. **The background, in one page** — the classical/standard context the article assumes,
   built from the ground up. State standard facts as "(classical)" with no citation
   theater. End by restating the article's core question in plain language.
5. **One example, by hand** — MANDATORY. A concrete witness fully computed. For discovery
   articles use the article's own witness; for NEGATIVE/refutation articles use the
   certified counterexample; for conditional articles use the smallest instance that
   shows the machinery. Every number must be (a) recorded in the article/logs, or (b)
   hand-recomputed by you from the article's definitions and shown to agree with the
   recorded values. Close with a provenance line: which values are article-recorded and
   which are hand-checked. If you cannot verify a number, drop the example rather than
   guess.
6. **How the proof works, without Lean** — 1–3 paragraphs of prose sketch from the
   article's §5-equivalent. Name the engine of the proof. No tactic names.
7. **What the main results say, informally** — one bullet per headline theorem in the
   article's §1/§3 tables. Each bullet: plain-language gloss, then hypotheses EXACTLY as
   strong as the article's (simplified wording OK, dropped qualifiers NOT OK), the
   article's status string verbatim (PROVED-UNCONDITIONAL / PROVED-CONDITIONAL /
   PAPER-ONLY / CERTIFIED-NUMERIC, "at donor pin" where the article flags it), and
   "→ formal statement: article §N". For conditional articles, explain the binder
   structure in plain words: *"a hypothesis the formal theorem carries as an explicit
   assumption; the kernel proof is complete relative to it; the article names and does
   not discharge it."*
8. **Glossary** — table: symbol | one-line meaning | tiny example. Every symbol the
   article introduces in its Setting section.
9. **What this is — and what it is not** — 3–5 disambiguation bullets preempting the
   wrong-field imports an outside reviewer is likely to make (the review-ds failure
   mode). Include one bullet on what "kernel-verified" means here in one sentence
   (triad = propext / Classical.choice / Quot.sound).
10. **How to read the real article** — router: claim in words / formal statement / proof
    idea / verification / novelty, each with the article's §-pointer.
11. **What you need going in** — prerequisites in 3–5 bullets.

## Quality rules

- Define every symbol at first use; never more than ~3 live undefined symbols.
- Every formula shown is also said in words.
- Short sentences. No idioms that depend on this project's internal history; where
  project context is needed (dossiers, iterations), explain it in one clause or drop it.
- Total length 120–220 lines.
- No new mathematics, no new literature, no external sources (no web). Everything comes
  from the article and its cited artifacts.
- Restatements must be neither stronger nor weaker than the article's. Conditional means
  conditional; "at donor pin" stays.
- Honest about exposition: the provenance line in §5 says hand-checked vs article-recorded.

## Per-article adaptation

- kind DISCOVERY: skeleton as-is.
- kind NEGATIVE (refutation/no-go): §3 = the certified counterexample or obstruction
  witness; §5 leads with what is *ruled out* and what stays open; make the no-go's scope
  (which fibers/dimensions are closed, which open) explicit.
- TECHNICAL-RECORD / FORMALIZATION-FIRST: §4 explains what is formalized and why it is a
  record rather than a new theorem; the "in plain words" must say what the formalized
  object is for.
- Conditional/assembly articles: §5 must carry the full conditional chain, leaf to root,
  and say which conditions are open statements vs discharged elsewhere.

## Report back

Per article: path, the §3 witness used, one line on any ambiguity resolved. Then a
one-line self-check: every file has the non-normative marker, the provenance line, and
≤ 220 lines.
