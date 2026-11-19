# A7/R7 — article-41H splice package (paste-ready; H splices on arrival)

Lane R7 (A9 lineage), 2026-11-19, PACKAGE GO. The gate chain is complete: R9's §NEGATIVE
(battery FINAL v2 `17970d4b`, N0–N3) + R2's 41H S1–S4 pass (`ace8bd28`, 4/4 PASS, locked
wording + scope-fence riders) + this lane's draft (`articles/41H-tl-realizability-
transport.md` v0.1, sha256(16) `2923f1888708c2d7`, worktree agent-10) + the orchestrator's
approval. Everything below lands in ONE commit (box-11). Byte anchors verified against
main @ `b5c4bba` this session. Companion: `a7-41-splice-package.md` (already executed by
H — the 41 splice landed; this package is its 41H twin).

## 1. README edits (`research/articles/README.md`)

### 1a. Counts line (lines 3–6)

Current exact text (byte-verified at `b5c4bba`):

```
Honest counts — **FINAL, orchestrator-ratified 2026-11-19**: **7 discovery-grade**
(01, 30, 32, 41, 42, 75, 78 — 75 conditional, 78 NEGATIVE-kind per the orchestrator
ruling; 41 the first iteration-5 shipment, kind DISCOVERY ruled 2026-11-19, quota-free)
```

Replace with (keep the sentence's remainder — "· **7 technical records** …" — unchanged;
technical/notes counts UNCHANGED per the ruling):

```
Honest counts — **FINAL, orchestrator-ratified 2026-11-19**: **8 discovery-grade**
(01, 30, 32, 41, 41H, 42, 75, 78 — 75 conditional; 78 and 41H NEGATIVE-kind per the
orchestrator rulings 2026-11-17/19, the 78 precedent, quota-free; 41 the first
iteration-5 shipment, kind DISCOVERY ruled 2026-11-19, quota-free)
```

### 1b. Row 41H (§A table; slots at README:24 — BETWEEN rows 41 and 42)

```
| 41H | [No Three-Strand Temperley–Lieb Dictionary for the q-Deformed Eight-Square Sign Rule: Certified Traciality and Rank Obstructions](41H-tl-realizability-transport.md) | NEGATIVE — no-go closing the pilot-41 dossier's 3-strand TL host hypothesis (second-discovery of the 41 program, BANK-AS-NEGATIVE ruling 2026-11-19; the 78 precedent: discovery-grade, quota NOT consumed; own file) | Thm A (traciality) PROVED-UNCONDITIONAL [propext, Quot.sound] + Thm B (rank) PROVED-UNCONDITIONAL triad (`H2.lean` h2-run11: Walsh certificates [propext] decide-certified, lifting triad); the corrected-surface transports PROVED-CONDITIONAL (realization-datum binders); the host, if any, lives at n ≥ 4 strands, non-tracial |
```

## 2. INDEX row (append after the :373 row-41 entry, `research/INDEX.md`)

```
- `research/articles/41H-tl-realizability-transport.md` | article (Iter-5) | SPLICE 2026-11-19 (R7/A9-lineage fill of R4's LANDED-FACTS stub; DRAFT v0.1 `2923f1888708c2d7` + in-commit flips; gates: R9 §NEGATIVE + R2 S1–S4 4/4) | **Kind NEGATIVE (BANK-AS-NEGATIVE ruling 2026-11-19: second-discovery, 78 precedent, discovery-grade, quota NOT consumed, own file)**: no 3-strand Temperley–Lieb dictionary for the q-deformed eight-square sign rule — Theorem A traciality obstruction (`H1.lean` GREEN h1-run2, [propext, Quot.sound], kernel-decided asymmetry witness) + Theorem B rank obstruction (`H2.lean` GREEN h2-run11, triad: the q = −1 σ-table is the full-rank Walsh table — orthogonal rows + basis expansion [propext] decide-certified, lifted by linearity — vs rank ≤ 5 of every TL₃/C·Φ·Cᵀ realization); the dossier's 3-strand (H) hypothesis FALSE in every dictionary class considered; host re-scoped to n ≥ 4 non-tracial (tranche-3 seed: raised no-go prior, SEARCH-WITH-NO-GO-ESCALATION); corrected-surface transports banked PROVED-CONDITIONAL; novelty per `novelty/round6-41-battery.md` §NEGATIVE N1 (rows 3/5/7/P1/P2; the class row stays EMPTY); wording locks: "elementary certificates, nonelemental closure"; README §A row-41H + counts 7→8 in the same commit.
```

## 3. The article's in-commit flips (base `2923f1888708c2d7`; all in the splice commit)

| # | flip | exact content |
|---|---|---|
| 1 | **§4 held row FILLS from §NEGATIVE N1** | Replace the "Negative-class row (… incoming …)" block with N1's five rows, verbatim-shaped: row 3 (tauceti stack — "the complete host exists, and the obstruction says it PROVABLY cannot carry this family at 3 strands — to our knowledge the first incompatibility statement between an eth-type cubic-corrected sign family and TL/Jones trace evaluations anywhere", scope-qualified in-sentence); row 5 (AFP Prathamesh); row 7 (Kauffman); P1 (the 78 precedent, governing — dossier-internal owner attribution as the honest analogue of 78's external-owner discipline); P2 (Bigelow 2002 as the genre marker — "a PROVED no-go in that genre's neighborhood", no claimed relation to the open questions). Append N1's closing note: the L1 class row "defect/skein identities at parallelogram quads" stays EMPTY and untouched by the negative. Drop the "[DRAFT: word count finalized at splice.]" tail once counted. |
| 2 | **Abstract novelty sentence ← N1 row 3** | The abstract's scoped claim becomes the N1-row-3 shape ("…the first incompatibility statement between a cubic-corrected sign family and TL/Jones trace evaluations, as far as the surveyed corpora show"). |
| 3 | **§7 scope fence ← N2** | Add the N2 rider: (H) restated as the dossier's own pre-negotiated descope branch ("(H) no-match ⇒ Cayley–Dickson anchor" — the q = 1 octonion host remains the classical anchor); remaining host options (n ≥ 4, non-trace shapes) OPEN and UNCLAIMED; the article words (H) as proved no-go at 3 strands + open-problem restatement, no claim beyond the refuted dictionary. |
| 4 | **§5/§7 wording lock ← N3-S3** | Replace the draft's "elementary proof, nonelementary statement" note with the locked negative reading: **"elementary certificates, nonelementary closure"** (R9's §N3 lock; also the §9-box-8 register). |
| 5 | **§9 box-11 → SATISFIED** | With the splice-commit sha; box 5's "ships with R9's §NEGATIVE" rider resolves (the appendix landed). |
| 6 | **Stub-supersession finalize** | Front matter: "supersedes: the content-free stub of this same file (R4's LANDED-FACTS state, committed batch P; superseded in-place at this splice)" — the article's §0/§1 lineage already carries the rest. |
| 7 | **R2's riders apply** | The pass record (`ace8bd28`: locked wording + scope-fence riders) — H applies any residual wording riders from that record verbatim; N3's S4 note (HostTransport binder = the refuted shape; no tauceti import in the obstruction proofs) is already §6-accurate. |
| 8 | **§6 sha stamps** | H stamps the COMMITTED article bytes + confirms the artifact shas of record (H1 `283503ada8f5571e` fired=on-disk; H2 fired `9534383949a6ac0c` / on-disk `3bc8170121492d18` comment-only delta) — the D.4 discipline. |

## 4. Box-11 splice-commit checklist (ONE commit, H-owned)

| # | item | note |
|---|---|---|
| 1 | Article file: agent-10's `41H-tl-realizability-transport.md` (base `2923f1888708c2d7` + §3 flips) replaces main's stub IN-PLACE (same path; the stub's LANDED-FACTS content is fully subsumed — §3.6 records the succession) | H |
| 2 | README row-41H (§1b) + counts 7→8 (§1a), SAME commit | H |
| 3 | INDEX row (§2), SAME commit | H |
| 4 | §3's eight in-commit flips | H |
| 5 | Guards: no other file touches — the watchlist (`a9-iter5-article-watchlist.md`) is cited not rewritten: discovery share 7/15 → **8/16 = exactly 50%** (the ≥half bar PASSes at equality; note for the iter-5 close summary's flow line); H1/H2/logs are R4's, already committed (batch P) — untouched; the battery FINAL v2 is R9's, untouched | H |
| 6 | Post-splice: the iter-5 close-summary flow line picks up "two iteration-5 discovery shipments (41 DISCOVERY + 41H NEGATIVE-kind), quota UNSPENT" | H/orchestrator |

— Lane R7 (A9 lineage), 2026-11-19, worktree agent-10. Deliver on arrival; no commits
(H commits).
