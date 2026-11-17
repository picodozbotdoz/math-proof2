# A7 pre-shipping prior-art sweep — 75-N2 (dictionary class, N2-d landing, hEχ consumer)

*Lane A7, 2026-11-17. Web work, no Modal. Trigger: 75-N2 under construction (A5 mid-P1);
harden before its article. All sources accessed 2026-11-17 (URLs inline). Verdict classes
NOVEL / KNOWN-core / RETRACT; no RETRACT-class finding — nothing to flag as article-gating.*

## (1) Dictionary statement class (ℚ ray-class characters ⟷ Dirichlet characters, at the
formalized-dictionary level)

**Verdict: NOVEL-FORMALIZATION over classical-known mathematics — the expected verdict
CONFIRMED.** The dictionary is textbook: over ℚ, the ray class group mod m is (ℤ/mℤ)× and
ray-class characters are Dirichlet characters (Milne, *Class Field Theory* course notes,
`jmilne.org/math/CourseNotes/CFT.pdf`; MIT 18.785 Lecture 21–22 notes,
`math.mit.edu/classes/18.785/`, which spell the ℚ ray class group and the conductor of a
ray-class character in exactly this dictionary's terms). No formal venue has it: mathlib
has `DirichletCharacter` and the L-functions line (Loeffler, "Formalizing zeta and
L-functions in Lean", arXiv:2503.00959, AFM #15954 — scope: Dirichlet's theorem,
Dirichlet-L nonvanishing; no class-field theory, no ray classes) but **no ray class group
theory**; tauceti's own roadmap lists "Global number fields, ray classes, adeles, and
Hecke characters" as planned-not-built
(`trough.jackmccarthy.org/roadmap/tauceti/part-01/…`); Isabelle AFP / Coq sweeps surface
no ray-class/CFT formalization (nearest: representation-theory and Kummer-lemma
formalizations, unrelated); the only nearby computational line (Kopp et al. 2025, ray
class groups for orders, `par.nsf.gov/servlets/purl/10618633`) is algorithmic, not a
formalized character dictionary. The pilot's dictionary glue is therefore
formalization-new over completely classical content — bill exactly that way.

## (2) N2-d landing shape (≥ 2/3−ε of ζ_L's window zeros on the line, every abelian L/ℚ)

**Verdict: NOVEL — the every-abelian-L/uniform discriminator holds against the entire
line, and the closest miss's own text confirms the gap.** Checked:
**arXiv:2608.13637** (the Alpöge–Furman-verified "more than two thirds" paper, HTML v1
2026-08-13): Theorem A = ζ, unconditional, dyadic; **Theorem B = "Theorem A verbatim for
L(s,χ) for any FIXED primitive Dirichlet character χ"** — constants O_q(·), explicitly
non-uniform over the modulus; and **no ζ_K corollary for abelian fields anywhere** —
verbatim from the fetch: "the paper nowhere states a corollary for Dedekind zeta
functions ζ_K of abelian number fields… A ζ_K corollary would presumably follow by
combining Theorem B over the characters factorizing ζ_K, but that deduction is not made
anywhere in the text, and the non-uniformity of Theorem B (constants depending on the
conductor) is not addressed for such an application." **DLRT arXiv:1908.04876**: fixed
abelian K under GRH (A5 P2-3 resolution of 2026-11-13 stands — not uniform).
**Bansal–Maji arXiv:2507.18121**: infinitude of on-line zeros for any ζ_L, no
proportion. **Lamzouri 2609.02882 / Knausgård 2610.08965 + 2609.33043**: ζ-only
proportions. 2026 arrivals re-checked: arXiv:2610.29018 (quadratic-family zero
numerics), 2610.31744 (gap biases), 2610.26841 (isolated zeros / linear combinations),
Sono arXiv:2105.07422 (fixed-L mollifier proportions) — none at every-abelian-L
generality. **Action:** 2608.13637 Theorem B becomes a MANDATORY nearest-miss row (the
component-side closest miss: unconditional but fixed-χ, non-uniform, un-assembled; our
components enter as hEχ binders and our statement is the uniform ζ_L assembly — the
honest frame is hypothesis-shape-to-hypothesis-shape, as dossier 75 already styles the
DLRT comparison), and the "not made anywhere in the text" quote is
novelty-strengthening (the assembly corollary was available to them and not taken).

## (3) hEχ / zeta23 Theorem-E consumer class (prior formal transfer of a zeta23-grade
dyadic theorem to Dirichlet L)

**Verdict: NOVEL consumer shape — the Dirichlet-side formal landscape is exactly zeta23's
own Theorem E (our known donor) plus one hygiene-caveated fork; nobody transfers to ζ_L
or assembles.** Evidence: the zeta23 corpus itself carries Theorem E (analogues A–D for
primitive Dirichlet L(s,χ)) — the project's own hEχ binder source, known since the
zeta23E companion planning (RESEARCH.md §launch order; week1-agenda row 8). The one
external object found: **`github.com/Oliverds321/simple-zeros`** (Oliver D'Souza, 2026,
accessed 2026-11-17) — a "modified copy" of the Anthropic zeta23 artifact: copies
upstream Theorems A–E (incl. the Dirichlet Theorem E), and adds ZetaQ (conductor-aspect
family constants, e.g. 0.7212 at T = (log Q)^{r+ε}), ZetaS (0.6751…/0.8375… window
variants), ZetaShell (0.9059… conditional on a displayed `ZeroDensityInput` hypothesis)
— preprints "not independently refereed", single-commit snapshot, "not rebuilt outside
this project", follow-up libraries contain open sorries (ZetaShell Skeleton/, one ZetaS
module, four unconsumed ZetaQ modules), headline numerics certified outside Lean —
Knausgård-class hygiene (bib-card C.4 pattern; never consume at headline level). Its
quantity is family-aspect averages, not per-field ζ_L assembly; no ray-class content, no
Dedekind ζ, no transfer theorem (their Dirichlet results are proved directly from a
formalized explicit formula). **Action:** cite the fork as the zeta23-ecosystem
nearest-miss row with the hygiene caveat; the consumer statement (Theorem-E binders →
uniform ζ_L assembly) remains unclaimed everywhere.

## Summary for the article

All three pre-registered expectations verified; two mandatory additions to the
nearest-miss table (2608.13637 Theorem B; D'Souza fork) and one billing note (the
dictionary glue is formalization-new over classical mathematics — never bill the
dictionary itself as mathematical novelty). No retracts; N2's discovery billing (the
uniform abelian-assembly statement family, N stays 4 per the A5 P2-3 re-scope) is
unaffected.

— lane A7, 2026-11-17.
