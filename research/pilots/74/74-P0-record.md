# 74-P0 record — T1+T2+T4 statement rung GREEN (lane A8, 2026-11-17)

**Verdict (one line):** 74 T1T2T4-P0 **GREEN** — `pilots/74/logs/t1t2t4-p0-run2-fix.log`:
OK rc=0, errors=0, **sorry-warnings=0** (the declared probe-convention sorry class is
EMPTY — all Prop-defs + pins; staging v1 failed run 1 on two annotation/coercion classes
— 10× `dependsOnNoncomputable` on the data defs, `j + 1` elaborating in `Fin k` — fixed
by `noncomputable` ×10 + exponent `((j : ℕ) + 1)`, the one authorized fix-retry; the
anticipated `sInf`/`sSup`-totality and `=o[atTop]` risks did NOT bite). Wall 43 s post a
container-preemption restart (input unchanged; both telemetry segments preserved),
warm `crossmath-gprobe` probe route, doz CLI, OVER=0 on the final segment. Decl pins
printed live: `Real.negMulLog`, `Real.exp`, `Real.sqrt`.

**Artifact:** `pilots/74/T1T2T4-P0.lean` — 14 defs + 5 statement Prop-defs
(`stmt_T1a/T1b/T1c/T2/T4`) + 3 pins, all elaborating on mathlib ff2494ea; the dated
in-file fix note records run1→run2 (quotation/annotation fixes, no content change).

## Binder-table confirmation (as staged, now elaborated)

| Binder | Status at GREEN |
|---|---|
| `hMGF` (verbatim MarginalTails first clause, `Statements.lean:482–485`) | elaborated inside `InMGFClass` + `stmt_T1c` — shape confirmed on-pin |
| `hVarLB` (extremal-family variance floor `κ·B ≤ Var(P B)`) | inventoried open core, elaborated in `stmt_T4` — P1-e's discharge target |
| `hB` / scale framing | absorbed into `InMGFClass`'s `1 ≤ B`; crossing-count reading restored at P1-e |
| `u ≠ 1` degeneracy | void by construction (filtered `mU`) — confirmed: no side condition needed anywhere in the file |

## P1 GO/NO-GO input (per core-prep §1 decomposition)

**GO input, with two charter prerequisites.** The statement layer is GREEN and the
decomposition stands (P1-a Cantelli ≈60 LoC routine; P1-b MGF-variance + Chernoff with
`Phi`-constant bookkeeping; P1-c hMGF instantiation at σ² = 512eθB; P1-d zero-padding
injection; P1-e T4 assembly). Prerequisites for the P1 charter:
1. **Q1 must be resolved first** (core-prep §5): T4's class-restricted-`B₁` vs
   per-spectrum-floor reading — it decides whether P1-e works against the staged
   `stmt_T4` (shape (ii)) or first adds a class-indexed `Bk` variant (shape (i)).
   Owner: the dossier owner (A4) + the P1 chartering lane; the P0 shape is (ii).
2. **Run1's lesson travels:** P1's proof files will hit the same `noncomputable` class
   on any data-carrying def over `Real.log`/`negMulLog`/`sInf`/`sSup` — annotate at
   authoring time (the 74-P0 fix note is the in-corpus precedent); `Fin k` exponents
   coerce explicitly.

Effort class unchanged: **S for T1+T2+T4** (≈0.6–1k LoC; dossier feasibility §; hVarLB's
two-atom construction is the only genuinely new lemma); T3 stays unchartered (+M, the
cost-shared LP layer). Route notes: tauceti `OperatorJensen` importable (:64/:124) vs
physlib HayataGroup citation-only — P1's spectral-step route cites both (row-7 rule 3);
the sandwiched-Rényi DPI must-cite is latent (rule 2) until any trace-functional
rephrasing.

— lane A8, 2026-11-17. H commits; A1 folds the §10 row. Sources: runs 1–2 logs; the
artifact + `core-prep.md`; no other files touched by this tranche.
