Research objective. Conduct a deep, comparative study of four corpora — mathlib (encore-mathlib/repo/mathlib4), tauceti, openai-math, and anthropics_formal-math — and identify bridge points between them: places where results, structures, or techniques from different corpora meet, partially overlap, or point at each other without connecting. From those bridges, propose candidate new theorems — statements not present in any corpus or the classical literature — that become true, natural, or provable precisely because of the combination.

Phase 1 — Deep survey (per corpus). For each project, map:

Mathematical territory covered: objects, structures, and the strongest/most distinctive results (cite exact theorem/file names).
Depth and terminal points: what is stated but not proved; proved but not generalized; isolated results with no neighboring development.
External dependencies: what each corpus assumes, imports, or cites from classical mathematics beyond its own content.
Phase 2 — Bridge mapping. Build an explicit intersection map across corpora:

Shared or analogous objects/definitions appearing under different names.
Results in one corpus that generalize, dualize, or lift results in another.
Quantitative bounds in one area that techniques from another corpus could plausibly improve.
Empty zones: questions sitting between corpora where both sides' machinery points, but nothing has been proved.
Phase 3 — Candidate generation. For each proposed discovery, produce a dossier:

Precise mathematical statement.
Novelty check — evidence it is absent from all four corpora and the known literature.
Which corpora it bridges, and why the bridge is essential (not provable from one side alone).
Proof-strategy sketch, drawing on named results from the corpora.
Feasibility note: is it within reach of formal verification given mathlib's current API?
Phase 4 — Triage. Rank candidates by novelty × significance ÷ verification effort; recommend the top 3 for a Lean pilot.

Ground rules. Discovery-first, not formalization-first: a candidate is valuable only if the statement is new. Lean is the verification vehicle, with the math-proof1 standard (no sorry, no native_decide, no external CAS). Sibling repos are read-only. Cite exact declarations, files, and paper sections for every claim.

## Cycle 2 (opened 2026-11-13, orchestrator) — the AxiomMath corpus as a fifth source

The main run (Phases 1–4 over mathlib/tauceti/openai-math/anthropics) closed 2026-11-09
(TRIAGE final; top-3 pilots 42/01 landed, 10 partial). Cycle 2 re-runs the same pipeline
over the newly registered AxiomMath siblings (`axiommath/`: DedekindZetaZeroFree,
ZetaZerosV2, ZetaZeros, PrimeNumberTheoremAnd, Weil, AreaLaw2D), which as of
2026-11-13 build on our exact pin (mathlib `ff2494ea`, v4.36.0-rc2 —
`feasibility/axiommath-bump/`) and are therefore *consumable donors*, not just references.
Scope: survey (`survey/axiommath.md`), bridges (`bridges/function-field.md`,
`bridges/area-law.md`, donor remap `novelty/axiommath-as-donor.md`), new dossiers
(70-series), novelty round 4, TRIAGE addendum, and pilots — both the open main-run items
(10-L1/L2, 52-fix, 20-M1 close-out) and new donor-swap pilots (e.g. discharging the
`hQRH` binder of pilots 20/50 from DedekindZetaZeroFree's Cureton–Thorner theorem;
ZetaZerosV2 as a second donor for 42). Same ground rules; same Phase 1–4 definitions;
file-ownership and lane conventions carry over from the main run (see STATUS.md).
