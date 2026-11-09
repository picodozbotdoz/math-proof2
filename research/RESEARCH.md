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
