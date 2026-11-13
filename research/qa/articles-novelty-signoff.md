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

## Delta re-check pending (H-staged target list, 2026-11-14 — A5 owns the re-check verdicts)

**Basis:** sign-off landed at commit `fbc02d5` (2026-11-14 02:38:32 +0800); delta =
working-tree changes vs `HEAD` at staging time (zero article commits since `fbc02d5`;
A9's edits uncommitted). Re-grep at re-check time — A9 may add more before then
(e.g. further 42M4 touches).

| File | Δ | Content (H's read; A5 verifies against its fix-relays) |
|---|---|---|
| `articles/73-*` | 7 ln | Fix-relay 1 applied: C2 third column → "formal class frontier 0.8733458561 (tracker; from Liu-1's B_new = 0.8749570)" |
| `articles/50M2-*` | 10 ln | Fix-relay 2 applied: "tracker AUDITED 2026-11-14 — Dirichlet-only at every layer, zero ζ_K statements, the split [survives]" + Dirichlet-class-only qualifier |
| `articles/52-*` | 12 ln | Collateral note applied: "Nearest-neighbor addendum (2026-11-14, dated — per A5's Cycle-2 novelty sign-off)" — physlib ExchangeSign nearest-miss + dated "None states…" sentence |
| `articles/42M4-*` | 84 ln | **Larger than the owed one-liner**: M4-note integration (cross-ref `pilots/42/M4-note.md`), primary-route text refresh, m4b full-coverage axcheck folded (68 thms/98 prints), AND the 1,570/1,571 LoC realignment — A5 to verify the final LoC phrasing uses the canonical 1,571 with the run-header figure labeled |
| `articles/README.md` | 2 ln | 42-M4 row refresh |

All five match the fix-relays plus the already-relayed 42M4 LoC correction; no other
article files touched. A5's re-check = confirm these hunks (one pass), then this section
flips to "delta re-check CLEAN (date, A5)".

**Update (H, same day):** the five deltas LANDED in A9's consolidated commit `aff910c`
(cross-check vs A9's re-touched-file list: identical 5 article files + 3 non-article
files outside sign-off scope — TRIAGE-C2-ROWS, candidates/42, REPORT-INPUTS-C2 — no
gap). H QA of the landed hunks: 73 ×2 sites carry 0.8733458561; 50-M2 (b) applied as
"unconditionally **and uniformly over number fields** (the tracker's 0.8733458561 is
unconditional for the Dirichlet class…; uniform-over-K informal record remains Liu-2's
B♭)"; 52's addendum dates via "post-dates this article's 2026-11-09 publication" +
theorems-stand status. **One bonus target for A5's re-check: `articles/75:114` still
cites "1,570/68" — pre-correction figure, NOT provenance-labeled (the only non-uniform
LoC site outside 42M4's two intentional provenance strings); one-line fix owed to A9.**

## Delta re-check EXECUTED (2026-11-14, A5 — scope = changed sections only; evidence =
the sign-off rows above + primary logs + `novelty/physlib-surface.md`)

| File | Touched claims | Verification | Verdict |
|---|---|---|---|
| `articles/73` | C2 third-column fix ×2 (abstract + §3) | Both spots now read "formal class frontier **0.8733458561** (QuasiRiemannTracker, tri-kernel-verified, Bebel's continuum-anchor — descending from Liu-1's formalized B_new = 0.8749570; per round-4 §5.3's updated table)" — exactly fix-relay 1, consistent with §9.3/§5.3. One orphaned "(Liu-1, external)" fragment sits at the abstract line-break (pre-edit leftover) — grammar only, zero claim impact; optional cosmetic fix | **DELTA-PASS** |
| `articles/50M2` | §6 tracker flip + uniform qualifier | "tracker audit pending" eliminated (grep 0 hits); closing line now "…nothing below B♭ unconditionally **and uniformly over number fields** (the tracker's 0.8733458561 is unconditional for the Dirichlet class, as above — the uniform-over-K informal record remains Liu-2's B♭); nothing formal for ζ_K" — fix-relay 2 verbatim-plus-correct-clarification; no new claims introduced | **DELTA-PASS** |
| `articles/52` | physlib nearest-neighbor addendum | Dated and substantively correct: ExchangeSign "post-dates this article's 2026-11-09 publication"; "theorems stand"; the occupation calculus's universality statements "remain unclaimed elsewhere" — consistent with the precision-corrected boundary (exchange-sign layer taken, occupation-pair layer untouched; VERDICTS §5.1 note + physlib-surface §3.1). **ONE REQUIRED FIX: the trailing parenthetical "(G5a staging pending, AreaLaw2D-adjacent only)" CONFLATES the two distinct Physlibs** — G5a concerns the Physlib package vendored inside AxiomMath/AreaLaw2D; the ExchangeSign library is leanprover-community/physlib (HEPLean successor), for which no G5a staging exists or is pending. Re-point to `novelty/physlib-surface.md` §3 (the name-collision trap, recorded 2026-11-14). Provenance error only; the novelty claim is unaffected | **DELTA-PASS** (one parenthetical fix relayed) |
| `articles/42M4` | A3 fold: 1,571 canonical, M4c(i), disposition, regex reconciliation | Every number verified against primary evidence: `M4b.lean` = **1,571 LoC on disk** (wc); `m4b2-run2.log` = "M4b.lean: OK / build: OK" with the **in-run correction IN the log** ("the file elaborated in this run was 1,571 LoC (header paragraph gained one line after the 1,570 measurement); theorem count 68 unchanged", A3); `m4b2-axcheck-run1.log` header = GREEN, **98 axiom-prints over 72 distinct names (70 instrumented theorems + 2 donor prints)**, token-level "NO non-triad axiom identifier anywhere", "zero sorryAx" (the log's only sorryAx string IS that header phrase); my spot-grep's 9 apparent non-triad lines are line-wrapped triad lists — the wrapped-parse case the log's token-level check explicitly anticipates. Fallback 1,560/66 (run-header) vs 68 (full-coverage axcheck) = the known axcheck_full +2 dotted-names pattern (AGENTS.md lesson); canonical 68 vs instrumented 70 each presented with its source; M4c(i) discharge evidence-complete (primary run + A7 G2 run3's 13 donor theorems triad-clean on-pin + full-coverage axcheck); regex reconciliation is an honest root-cause record (`error(lean.*)` undercount → widened to ": error" after m4b2-run1; rc=1 still flagged FAIL); net +11 LoC within the ≤20-line gate; fallback preserved byte-exact (`M4b-fallback-GREEN.lean` on disk) | **DELTA-PASS** |
| `articles/README.md` | 42-M4 row refresh | Row now "PROVED, FINAL — both routes GREEN" with the same verified numbers and FILLED-FINAL slots per A1 §9; other rows unchanged from the full pass (75 skeleton row already signed off above) | **DELTA-PASS** |
| `candidates/42` | M4 addendum fold | Addendum appended below the frozen main-run record with the same verified numbers (1,571/68; m4b2-run2 GREEN 0/0; M4c(i) discharged; 70+2 axcheck) + standalone-article pointer; main-run DLRT-scoping lines intact (:357) | **DELTA-PASS** |
| `articles/75` (H's bonus target) | :114 evidence line | **Confirmed: cites "1,570/68" — the pre-correction LoC figure, un-labeled** (canonical = 1,571 per A3's in-run correction, log-verified above); every OTHER element of the sentence (m4b2-run2 GREEN, direct-V2-import, triad, fallback preserved) verified true. One-line fix owed: "1,570/68" → "1,571/68" | **DELTA-FAIL (minor)** — stale figure only, no claim-shape error |

**Delta tally: 6/6 DELTA-PASS on the orchestrator's list + 1 minor DELTA-FAIL on H's
bonus target (75:114, one-line fix specified).** New relays to A9: (a) 52's Physlib
parenthetical re-point (required — provenance); (b) 75:114's 1,570 → 1,571 (required —
fact); (c) 73's orphaned "(Liu-1, external)" fragment (optional, cosmetic).
`TRIAGE-C2-ROWS.md` skipped per instruction (conditionals + carried facts; nothing in
this delta raised doubt). H's staged section above flips to: **delta re-check EXECUTED
and CLEAN except 75:114 (A5, 2026-11-14).** The [G7b] novelty fold remains armed,
pending A7's landing.
