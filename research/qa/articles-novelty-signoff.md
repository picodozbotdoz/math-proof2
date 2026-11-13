# QA — Cycle-2 articles NOVELTY SIGN-OFF (close-out novelty gate)

Lane A5 (novelty), 2026-11-14. Object: the Cycle-2 article drafts in
`research/articles/` (read-only pass over A9's files; this file is the sign-off
record). Method: every novelty claim / positioning statement / prior-work framing in
each article checked against the novelty record AS OF TODAY — `novelty/VERDICTS.md`
(main + Cycle-2 addendum + standing notes), `novelty/round-4.md` (§5.3 table as
updated 2026-11-14, §8 clocks, §9 tracker audit, §10 HKT close-out),
`novelty/CLAIMS-REGISTER.md` (row 70 as updated), plus the seed-triage checks run
earlier today (Faifman–Rudnick, physlib/ExchangeSign). Verdict scale: **PASS** /
**PASS-with-notes** (fix relayed, cosmetic or one-line, no claim withdrawal) /
**FAIL** (claim must be withdrawn or re-scoped before close-out). Scope note: the six
novelty-bearing Cycle-2 drafts are 71, 72, 73, 42-M4, 50-M2, 10; articles 11/22
(Cycle-2 addenda) and main-run 42 (touched 2026-11-14) are signed off as secondary
entries; article 52 appears as a COLLATERAL entry (not a Cycle-2 draft, but today's
physlib evidence touches its positioning).

**Tally: 10 PASS (incl. article 75 at skeleton level, added mid-pass), 2
PASS-with-notes, 0 FAIL. One collateral PASS-with-notes (article 52, outside the
six). Two fix-relays to A9 (both one-line).**

| Article | Verdict | One-line reason |
|---|---|---|
| 71 s-plane zeta dictionary | **PASS** | Every claim consistent: formalization-first posture (VERDICTS row 71), falsity trap respected with the zbMATH-pinned papers, HKT cited exactly per the 2026-11-14 PARTIAL-PIN rule ("Part 3 (chs. XIV–XVIII, pp. 393–626)"; bare chapter numbers excluded), Suzuki method-neighbor clock + WenrongZou nearest-formal-neighbor both carried, P2 slots correctly fenced as unproved |
| 72 Rényi monotonicity no-go gate | **PASS** | Kuwahara 2610.15199 scoped as binder (hKL), "first formal area law DOA" discipline held (AreaLaw2D is the first), negative-result precedent (30/50) accurate, N1/N2/N3 deviations from Appendix A documented, M1 slot open — matches VERDICTS row 72 incl. the P2 [HYPOTHESIS] fence |
| 73 formal Tate dictionary I | **PASS-with-notes** | Scope softening per P2-13 correctly applied ("function-field/rationality-dictionary scope ONLY", WenrongZou clock attached); C1 honesty correction recorded. **NOTE (relay): §3 C2's third column cites the ζ/Dirichlet window at Liu-1's B_new = 0.8749570 — stale vs round-4 §5.3 as updated 2026-11-14: the formal Dirichlet-class frontier is the QuasiRiemannTracker's 0.8733458561 (tri-kernel, 2026-11-13), which the C2 comparison should cite (or add) since it claims to "extend dossier 70's §5.3 per-class table to the Hecke row"** |
| 42-M4 ζ_K proportions, V2 donor swap | **PASS** | "First ζ_K proportion statements with no external certificate artifact in the dependency tree" — scoped and true per rows 42/70; constants C₀ = 0.6725007… > 2/3, C₁ = 0.8362504… > 5/6 consistent with the V2 record; Knausgård supersession narrative accurate (his constants numerically larger but external/native_decide-fronted — hygiene trade, correctly told); DLRT corrected qualifiers (GRH-conditional, fixed K) applied; M4b slots fenced as on-disk-unofficial |
| 50-M2 unconditional strip confinement | **PASS-with-notes** | Tracker race facts folded correctly everywhere audited (tri-kernel verification mode, 0.8733458561 Bebel frontier, below-Chang–Wang leapfrog, tracker's exact-algebraic B_new replay, DyadicColumns.lean:245 nuance, ζ_K-split survival, no-"first"-claimed honesty block). **NOTES (2, both relay): (a) §6 bullet 2 ends "tracker audit pending" — stale against the landed audit cited in §1/§4/§6 of the same article; flip to "tracker audited 2026-11-14" together with the dossier-70 note-4 relay. (b) §6 closing line "the cluster — nothing below B♭ unconditionally; nothing formal for ζ_K" — the second half is right, the FIRST half needs the scope qualifier "uniform over number fields / in the informal ζ_K-uniform literature": the tracker's 0.8733458 IS unconditional and below B♭ for the Dirichlet class (the article itself says so three paragraphs earlier)** |
| 10 uniform poly-space ETH refutation | **PASS** | "Neither source paper claims the combination… no uniform+space combination claimed anywhere" — exactly VERDICTS row 10 (conjunction un-pre-empted, three-way audited); "first formal contact between the two ETH-refuting corpora" consistent with the corpus record; L1 GREEN / L2 slot fencing correct |

**Secondary entries:**

- **75 abelian-assembly ζ_L proportions (SKELETON, landed mid-pass 2026-11-14)** —
  **PASS (at skeleton level)**: appeared after the six-draft pass; claims checked
  against VERDICTS C2 row 75 and match exactly — "first zero-proportion statements
  for ζ_L of any kind", "DLRT is SCOPED (fixed quadratic K, GRH-conditional, T→∞ —
  nothing uniform over K) ⇒ primary NOT math-known, Novelty 4 stands", Liu-2
  correctly framed as family-overlap-half-plane-only (C3 clock, not a (P)
  competitor); slot family [VERDICT:75-N0..N3] registered and fenced ("nothing
  below them is citable"); status honestly SKELETON pending A4's wave-4 report. No
  action.
- **11 (Cycle-2 addendum)** — **PASS**: M2 record is verification-state only ("nothing
  on this page claims B(ii) complete"); no novelty deltas vs row 11.
- **22 (Cycle-2 closure note)** — **PASS**: T2b closed-by-upstream disclaimed
  correctly ("Neither the theorem nor the claim is ours"); consistent with VERDICTS
  Cycle-2 standing note 1 (upstream @ 938912bb, fork amputation).
- **42 main-run (touched 2026-11-14)** — **PASS**: DLRT erratum applied at both sites
  (:29 abstract-level, :151–155 with the honest "different hypothesis shape"
  repositioning per dossier 75); frozen-history header consistent with 42-M4's
  standalone decision.

**Collateral entry (not a Cycle-2 draft; flagged by today's physlib evidence):**

- **52 statistics-universal occupation calculus (main-run, 2026-11-09)** —
  **PASS-with-notes (pre-existing claims stand; positioning needs one update)**. The
  article's theorems (occupation-pair axiomatization, ε-uniform dual-family theorem,
  sign-transposition law, Pauli boundary, exterior-algebra instance) remain proved and
  unclaimed-by-others; physlib's `FieldStatistics/ExchangeSign.lean` (pushed
  2026-11-13, i.e. post-dating the article) formalizes a NEIGHBORING layer — the
  ε = ±1 exchange-sign cocycle on the statistics type inside the Wick stack — not the
  occupation-pair layer. Required update (relay): add physlib exchangeSign to §6
  nearest-miss list + date the "None states the common structure" sentence
  ("as of 2026-11-09; the exchange-sign layer appeared in physlib 2026-11-13").
  Record trail: VERDICTS §5.1 staleness note (2026-11-14, precision-corrected) +
  `novelty/iter4-seed-triage.md` seed-11 check.

## Fix-relays to A9 (both one-line edits; no claim withdrawals)

1. Article 73 §3 C2 third column: replace/augment "B_new = 0.8749570 (Liu-1, external)"
   with the current per-class table content — formal Dirichlet frontier 0.8733458561
   (QuasiRiemannTracker, tri-kernel, 2026-11-13); Liu-1 may remain as the
   consume-on-our-pin-relevant external artifact.
2. Article 50-M2 §6: (a) "tracker audit pending" → "tracker audited 2026-11-14
   (round-4 §9)"; (b) "nothing below B♭ unconditionally" → "nothing below B♭
   unconditionally uniform over number fields (the tracker's 0.8733458 is
   Dirichlet-class-only)".

## Sign-off statement

As of 2026-11-14, all six Cycle-2 novelty-bearing article drafts are consistent with
the project's novelty record, including the tracker-race facts (tri-kernel
verification mode; formal Dirichlet frontier 0.8733458561; the formal-below-
conditional leapfrog; Liu exact-algebraic replay) and the ζ_K-split survival (no ζ_K
formal artifact anywhere, tracker included). Zero claims require withdrawal; two
one-line staleness fixes relayed (73's C2 column, 50-M2's §6) plus one dated
nearest-neighbor update for collateral article 52. The per-class honesty blocks
(50-M2 "no first claimed" for ζ/Dirichlet; 42-M4's certificate-free first for ζ_K
proportions; 71/73 formalization-first labels; 10's conjunction claim) match
VERDICTS/CLAIMS-REGISTER row-for-row.
