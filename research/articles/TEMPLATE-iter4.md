# TEMPLATE-iter4 — mandatory article skeleton + shipping gate (iteration 4)

Status: **MANDATORY for every iteration-4 article.** An article ships only when every
gate item in §9 is checked and no BLOCKER from the R1 audit
(`research/qa/iter4-review/r1-articles-editorial.md`) applies. Written 2026-11-16 from
the R1 editorial audit of the 17 iteration-1/2 articles, after UNSATISFACTORY external
feedback. This file is the quality gate, not a style suggestion.

---

## 0. Before you start: is this an article at all?

Article kinds (tag in the front matter, §1). Anything not in the left column does NOT
get an article — it goes to the dossier, the pilot notes, or the verification ledger.

| article kind | rule | non-article kinds (→ where they go instead) |
|---|---|---|
| `DISCOVERY` — new theorem, unconditional | full article | donor swap / binder discharge → **revise the upgraded article to v2** with a changelog line |
| `DISCOVERY-CONDITIONAL` — new theorem class under named open hypotheses | full article; hypotheses must be the open core of the field, named in the abstract | progress tranche with open headline → **dossier tranche record** (`pilots/<NN>/next-tranche-spec.md` pattern) |
| `NEGATIVE` — refutation / no-go / certified comparison | full article; the negated claim and its true owner must be attributed | addendum / closure note / "knowledge-level record" → **dossier or survey note**; articles are versioned wholes, never append-only |
| `TECHNICAL-RECORD` — interface / fence / calculus / formalization articles kept by orchestrator ruling (iteration-4 kept set: 11, 20, 50, 52, 72) | full article under the same gate (added 2026-11-16 per the R1 cross-review of `r2-rewrite-20/72`; the kept set is closed, not a channel for new engineering articles) | new technical records beyond the kept set and R9's two-strike cap (≤ 2 non-discovery articles/cycle) → dossier/pilot records |
| `FORMALIZATION-FIRST` — classical math first formalized | article ONLY if formalization changed the statement (forced correction, found falsity) or yields a theorem another dossier consumes; otherwise dossier notes | infrastructure narrative (Modal runs, sweeps, probes) → **verification ledger**, never the article |

Audit anchors: 42-M4 (donor swap) and 10 (open-headline tranche) were published as
articles and are demotion candidates; 71 (FORMALIZATION-FIRST that forced a statement
correction) legitimately keeps article status; 22's closure note and 52's addendum are
append-only patches inside articles — do not repeat.

## 1. Front matter (exact block)

```
# <Title — plain mathematical English; no project vocabulary; no donor-internal
   numbering unless the donor is in the title's own clause; no self-reference to
   "Article NN">

*kind: <DISCOVERY | DISCOVERY-CONDITIONAL | NEGATIVE | FORMALIZATION-FIRST> ·
 date: <YYYY-MM-DD> · supersedes: <article file(s) or none> ·
 artifacts: <Lean file(s) (repo-relative), log path(s) (repo-relative)>*
```

**Status row (mandatory, immediately after the byline, before the abstract):**

```
| theorem | status | hypotheses | evidence |
|---|---|---|---|
| <name> | one of: PROVED-UNCONDITIONAL / PROVED-CONDITIONAL / CERTIFIED-NUMERIC / PAPER-ONLY | <complete binder list, or "none"> | <axcheck log path : line> |
```

Status vocabulary is CLOSED. These four strings are the only allowed status values:

- `PROVED-UNCONDITIONAL` — kernel-verified, no hypotheses beyond definitions.
- `PROVED-CONDITIONAL` — kernel-verified **with named hypothesis binders**; the binder
  list is part of the status row. If a theorem keeps any donor statement as a binder,
  it is this, never plain "PROVED".
- `CERTIFIED-NUMERIC` — exact-rational/interval certificate outside the kernel; say so
  and cite the certificate artifact.
- `PAPER-ONLY` — human mathematics not machine-checked; such a result may not be the
  article's headline theorem.

Guidance from the audit: "**Status: PROVED at Tier C, FINAL.**" (73:8) and "PROVED
(entry milestone)" (75:10) were unparseable externally; bold "Status: PROVED, FINAL."
over χ-conditional theorems (42-M4:11) read as overclaim. Banned from status lines and
titles: "Tier", "milestone", "GREEN", "landed", "donor", "binder" (as a noun of status),
"Frozen", run/loop/sweep identifiers, orchestrator bookkeeping ("A8 formal report
received"). One status row per theorem — not one label for the whole file (20's
Theorem 5 was asserted in the abstract and disclosed as unformalized only in §5).

**Substrate qualifier (reconciled with R3's rule 6, 2026-11-16):** the phrase
"**at donor pin**" appended after a closed status string (e.g. "PROVED-UNCONDITIONAL —
at donor pin (Lean v4.34.1, mathlib d13f23b7)") is REQUIRED, not banned, whenever the
kernel evidence was elaborated on a donor's toolchain rather than the project pin —
the ban list above targets status *nouns* ("donor" as a kind of result), not the
substrate disclosure. An unconditional claim proven at a donor pin must say so in the
status row itself (example: article 50 v2's Theorem 1).

## 2. Abstract (one paragraph, ≤ 200 words)

Must contain, in order: (i) the question; (ii) **the exact theorem or the precise
pointer "Theorem N below"** with its hypotheses named — a referee must be able to
restate it; (iii) the verification status in the closed vocabulary of §1; (iv) the
novelty claim with its scope qualifier inside the same sentence; (v) one sentence on
the nearest prior work.

Guidance from the audit: 75's abstract placed "the first zero-proportion statements for
ζ_L, formal or informal" (:34–35) above "The mathematics is deliberately
corollary-level" (:37); the scope must travel with the claim. 32's abstract asserted
"the frontier is given by a unique crossing point" while §5 carried the
crossing-existence caveat — caveats live in the abstract too. No bracketed errata in an
abstract (42:29–31) — rewrite the sentence.

## 3. Statement (numbered theorems, full hypothesis lists)

Every hypothesis explicit. If a hypothesis is a transcription of a donor theorem,
restate it in full and cite decl + file:line. Notation defined locally even if a
sibling article defines it (a reader of one file must not need another). State here —
not in limitations — anything the theorem is NOT (e.g. 73 should have said up front
that the "L-series" identification is the hypothesis `hRat` and series agreement is
unformalized).

## 4. Novelty and nearest misses (MANDATORY table)

An article does not ship without ≥ 2 nearest-miss rows:

| prior work (exact citation) | what it proves | why this differs |
|---|---|---|
| … | … | … |

Rules: every "first" claim needs a row that could have beaten you and an explicit
differential; scope qualifiers ("inside Lean", "in the surveyed corpora") are permitted
only with the survey named. Guidance: the corpus's best precedent is 42's DLRT
paragraph — which still had to be erratum-patched because the claim frame ("improves
… to the 5/6 class") was left around the correction; write the comparison correctly the
first time.

## 5. Proofs

Proof sketches sufficient for a referee to reconstruct; Lean-structural proofs may cite
the file. Per-theorem labels matching the §1 status row.

## 6. Formal record

Exactly this content, nothing else:

```
| theorem | Lean declaration | file:line | axioms | log path:line |
```

- axioms: the printed axiom list (or "⊆ {propext, Classical.choice, Quot.sound}").
- log path: the axcheck/final-sweep extract with a provenance header
  (`pilots/<NN>/logs/axcheck-c2-final.log` pattern; ledger §9.F for sweep results).
- File sizes in lines are optional and must be re-measured at final commit (audit
  found 279-vs-282 and 178-vs-180 drifts).
- **Infrastructure narration is banned here**: no run histories, no error-count
  trajectories ("20→14→…→0"), no diffstats ("net change of +11 lines"), no Modal/CPU/
  memory stories (50-M2 §5 "Substrate" is the cautionary example). That content lives
  in `feasibility/VERIFICATION-LEDGER.md`.

## 7. Limitations and open problems

What is NOT proved, what is assumed, what is carried forward. If a planned extension
failed to land this cycle, it appears here once, in plain language — and the §3
statement must already have been written so that no section of the article contradicts
it (audit BLOCKER: article 11 §7 said M2 "is not attempted here" while its own
addendum proved it).

## 8. Prior work and references

Two separated lists: (a) literature (authors, venue/arXiv, theorem numbers); (b)
project artifacts (repo-relative paths only). Never mixed (01's mixed list was the
audit's MINOR). Donor citations keep the corpus's existing discipline — the audit's 28
spot checks found donor citations exact to the line; that is the bar.

## 9. Shipping gate — check every box

Hard rules (any unchecked = BLOCKER = does not ship):

- [ ] Kind is one of §0's four article kinds; this is not a donor swap, tranche
      report, addendum, or closure note wearing article clothing.
- [ ] Title contains no project-internal token (audit found "Family-265" and "Donor
      Swap" in titles; "Theorem 19 of the 3SUM/APSP Refutation" is borderline — the
      donor must be named AND the mathematical content stated).
- [ ] Status row present, per theorem, using only the four closed strings;
      `PROVED-CONDITIONAL` lists every binder.
- [ ] Abstract ≤ 200 words, contains the exact theorem + hypotheses + status + scoped
      novelty + nearest prior work.
- [ ] Novelty table has ≥ 2 nearest-miss rows; every "first" claim carries its scope
      in the same sentence.
- [ ] No bracketed errata anywhere; the corrected sentence is written correctly.
- [ ] No section contradicts another (statement vs limitations vs any addendum —
      there must be no addendum; revise instead).
- [ ] Formal record is the §6 table only; no infrastructure narration.
- [ ] All internal vocabulary (dossier, pilot, sweep, probe IDs) either removed or
      defined at first use in one bracketed gloss — maximum 3 such glosses per
      article.
- [ ] Citations spot-checked: 5 per article, donor decl + file:line against the tree,
      log paths against disk, line counts re-measured.
- [ ] README row updated in the same commit as the article, with the same status
      vocabulary (audit BLOCKER: README said dossier 10 "has no article yet" in the
      same file that listed article 10; row 11 contradicted the article's addendum).
- [ ] If this article supersedes an earlier one, the earlier file is revised or
      clearly marked superseded at its top — and any claim about another article's
      edit state is checked against git before writing it (audit BLOCKER: 42-M4's
      "kept frozen … not edited" was false the morning it was written).

Rubric floor: an article must score ≥ 1 on all six R1 axes (precision, status honesty,
novelty-evidence, citations, self-containment, register) and 2 on axes (a), (b), (d);
`research/qa/iter4-review/r1-articles-editorial.md` §1 defines them.

## 10. Fill-in skeleton (copy from here)

    # <Title>

    *kind: … · date: … · supersedes: … · artifacts: …*

    | theorem | status | hypotheses | evidence |
    |---|---|---|---|
    | … | … | … | … |

    ## Abstract
    <one paragraph, ≤ 200 words>

    ## 1. Introduction
    ## 2. Setting and notation
    ## 3. Main results (numbered theorems, full hypothesis lists)
    ## 4. Novelty and nearest misses (table, ≥ 2 rows)
    ## 5. Proofs
    ## 6. Formal record (table only)
    ## 7. Limitations and open problems
    ## 8. Prior work and references (literature; project artifacts)

Section order and numbering are fixed across the corpus (audit MINOR: article 50's
unnumbered trailing sections broke the set's skeleton).
