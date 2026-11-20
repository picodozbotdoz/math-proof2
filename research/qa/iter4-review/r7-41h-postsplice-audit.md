# R7 — post-splice consistency audit: article-41H / splice-2 (cc71841)

Lane R7 (editorial/units), 2026-11-20, desk audit — byte-level, no Modal fires.
Scope per the iter-5 restart queue: verify the landed 41H splice against the splice
package `a7-41h-splice-package.md` (sha256(16) `ac7a5da7cfa3f939`, identical on main
and worktree) — README row-41H + counts, INDEX row, the article's internal anchors vs
the package's eight in-commit flips, the artifact sha stamps, and the KPI cells
(discovery share 8/16 = 50% at equality). PASS/FAIL per check; drift found is listed
with exact line numbers. Main @ `a6ad33d` (splice commit `cc718418` reachable,
verified directly).

Files of record (sha256(16)): landed article
`research/articles/41H-tl-realizability-transport.md` = `fcbcd81282ff7804`;
`research/articles/README.md` = `0c935217469a3b0a`; `research/INDEX.md` =
`b61293ee7fe942d9`; R2 pass record = `ace8bd282d51c7b6` (matches its INDEX citation);
battery FINAL v2 = `17970d4b75115853` (matches); R7 draft (worktree agent-10) =
`2923f1888708c2d7` (matches the package's base claim, byte-verified).

## A. Checks — all verdicts

| # | check | verdict |
|---|---|---|
| A1 | README counts block (README:3–6) = package §1a replacement, byte-identical | **PASS** — `diff` empty; 8 discovery-grade, list (01, 30, 32, 41, 41H, 42, 75, 78) exact |
| A2 | README row-41H (README:25) = package §1b row, byte-identical, slotted between 41 (:24) and 42 (:26) | **PASS** — `diff` of package line 36 vs README:25 empty |
| A3 | README remainder untouched (technical/notes counts UNCHANGED per §1a) | **PASS** — pre/post diff shows ONLY the row-41H insertion; §B still 7 rows, §C note line intact; numbered table rows 21→22 (+1 = 41H only) |
| A4 | INDEX row lands (research/INDEX.md:377) | **PASS** with 2 benign deltas (see B1) — content carries every package-required element: kind NEGATIVE + BANK-AS-NEGATIVE ruling + 78 precedent + quota-not-consumed; Thm A/B with artifact+log+axiom classes; hypothesis-FALSE; n≥4 re-scope + SEARCH-WITH-NO-GO-ESCALATION seed; transports PROVED-CONDITIONAL; wording lock; README-row-plus-counts rider |
| A5 | Article flip 1 — §4 negative-class rows filled from battery §NEGATIVE N1 | **PASS** — five rows 3/5/7/P1/P2 verbatim-shaped vs `round6-41-battery.md` N1 (row 3 delta column verbatim incl. "first incompatibility statement … anywhere"; row 7 drops only the battery-internal "same:" lead; P1/P2 minor cell compressions, no claim change) + the L1-class EMPTY closing note; the "[DRAFT: word count finalized at splice.]" tail dropped (0 hits) |
| A6 | Article flip 2 — abstract novelty sentence ← N1 row 3 | **PASS** — abstract closes "As far as the surveyed corpora show, this is the first incompatibility statement between a cubic-corrected sign family and TL/Jones trace evaluations." (the package's scoped shape) |
| A7 | Article flip 3 — §7 scope fence ← N2 | **PASS** — §7 "The scope fence (N2)" bullet: descope branch "(H) no-match ⇒ Cayley–Dickson anchor", q=1 octonion classical anchor, remaining options OPEN and UNCLAIMED, proved no-go at 3 strands + open-problem restatement |
| A8 | Article flip 4 — wording lock ← N3-S3 | **PASS** — "Elementary certificates, nonelementary closure" in §7 (locked reading, R9 §N3 cited) and §9 box 8; the draft's "Elementary proof, nonelementary statement" phrase is gone |
| A9 | Article flip 5 — §9 final + box-11 SATISFIED; box-5 rider resolves | **PASS** — heading "final — splice-day state"; box 11 "SATISFIED — in this commit"; box 5 cites "§NEGATIVE landed, `17970d4b`"; boxes 4/8/10 finalized ("PASS at splice"). Accepted deviation: package asked box-11 to carry "the splice-commit sha"; a commit cannot embed its own sha — resolved as "in this commit", cross-registered in §6 ("this article's own committed bytes carry 'this commit' (the splice-2 commit)") |
| A10 | Article flip 6 — stub-supersession front matter | **PASS** — "supersedes: the content-free stub of this same file (R4's LANDED-FACTS state, committed batch P; superseded in-place at this splice — the stub made no content claims)" |
| A11 | Article flip 7 — R2's riders applied | **PASS** — all four gate conditions of `r2-41h-s1s4-pass.md` §Verdict verified in-text: (i) both wording locks (§7 + box 8) and the scope-fence verbatim elements; no "TL/Jones-formalization-first" claim anywhere (grep 0 hits); (ii) novelty table = N1's 5 rows + marker + carried EMPTY class row; (iii) own-pre-registered-(H) attribution in title/§1/§3/P1; (iv) corrected-surface fence, no conflation with the 41-core article |
| A12 | Article flip 8 — §6 committed-bytes stamps (D.4) | **PASS** — stamps present and TRUE against disk: `H1.lean` on-disk = `283503ada8f5571e` = fired (h1-run2 header, GREEN 0/0); `H2.lean` on-disk = `3bc8170121492d18` = fired `9534383949a6ac0c` (h2-run11 header, GREEN 0/0) + comment-only note, both documented; article's own bytes carry "this commit" |
| A13 | Draft→landed diff = exactly the eight flips (no unmapped edits) | **PASS** — full `diff -u` maps 1:1 onto flips 1–8 + the §9 final-state polish + ship-chain tail; zero content changes outside the package scope |
| A14 | Internal anchor counts | **PASS** — §4 base table 6 rows; N1 table 5 rows + closing note; §9 12 boxes; §6 formal-record table 8 rows matching the run-log axiom lines exactly (Thm A [propext, Quot.sound]; B1/B2 [propext]; sigmaExpand + Thm B triad — verified against `h1-run2.log`/`h2-run11.log` axiom blocks); abstract **179 words** (box-4 claim verified; ≤ 200) |
| A15 | KPI cells — splice-owned | **PASS** — README counts (A1); INDEX:377 KPI note; `RESUME-BRIEF-ITER5.md:95–96` ("discovery share 8/16 = exactly 50% … quota N=1 UNSPENT"); `h-wave4-log.md:1020` — all agree. Arithmetic verified: §A 8 rows + §B 7 + §C article-status 1 (row 10) = 16 article files → 8/16 = exactly 50%; the ≥half bar passes at equality |
| A16 | Guards — no out-of-scope file touched by cc71841 | **PASS** — commit touches exactly 5 files: INDEX (+1), the article, README (+8/−1 lines), the splice package itself (landing WITH the splice; the 41 twin landed pre-splice at 4ef1bad — a sequencing difference, not a violation), and `h-wave4-log.md` (+14, H's own execution log, records "ALL EIGHT in-commit flips, every anchor count-verified 1/1"). Watchlist `a9-iter5-article-watchlist.md` untouched (cited, not rewritten — per the package §4 box-5 guard); H1/H2/logs/battery untouched (R4/R9-owned) |

**Overall: 16/16 PASS. The splice executed the package faithfully; every sha anchor
checked is true against the landed bytes.**

## B. Findings (drift + benign deltas — none fire-worthy; all wording-class)

1. **B1 (benign, INDEX)**: (a) placement — the package said "append after the :373
   row-41 entry"; the row landed at :377, after the two gate records it cites (battery
   `17970d4b` :375, R2 pass `ace8bd28` :376) and before the older 75-P2 tail entry —
   chronology-coherent, no information lost. (b) H enriched the row in-commit (gates'
   shas, "splice per `a7-41h-splice-package.md` `ac7a5da7`", the KPI note) and
   compressed Thm B's parenthetical (dropped "orthogonal rows + basis expansion
   [propext] decide-certified, lifted by linearity" — that content survives verbatim in
   the README row, the abstract, and article §3). No claim drift.
2. **B2 (drift, shipped article — 4 stale pre-gate phrases, all OUTSIDE the package's
   flip scope, i.e., package under-specification, not splice misexecution; zero
   mathematical/claim-level effect)**:
   - `:69` (§1): "The negative-class novelty row refresh (R9's §NEGATIVE appendix) is
     the pending gate named in §7." — STALE TWICE: the gate landed (battery FINAL v2),
     and §7 no longer names it (flip 3 replaced the refresh-gate bullet with the N2
     fence). Stray cross-reference.
   - `:134` (§4 heading): "(seeded; R9's §NEGATIVE appendix refresh pending)" vs the
     §4 body's own "the gate landed" two lines below — internal tension; brushes §9
     box 7's "no section contradicts another".
   - `:263` (§8b): "the §NEGATIVE appendix incoming" — landed (`17970d4b`, INDEX:375).
   - `:257` (§8b): the companion article billed "(DRAFT-final, same ship chain)" — the
     companion SHIPPED at splice-1 (cb87a67, INDEX:373 "SPLICE 2026-11-19").
   Recommended disposition: four one-line micro-edits at H's next convenience commit or
   the close-summary splice; do not re-open the ship gate (S1–S4, the ruling, and all
   counts are unaffected).
3. **B3 (expected residual, close instruments — NOT splice drift)**: the prep-ONLY
   close instruments retain pre-splice stock figures — `iter5-closeout-gates.md:119`
   and `iter5-close-block-skeleton.md:112` ("stock 7/15 ≈ 47%"),
   `REPORT-INPUTS-ITER5.md:63` — per the package's cited-not-rewritten guard they
   execute at close. Flag for the close summary: refresh those cells to the 8/16 = 50%
   state and pick up the box-6 flow line ("two iteration-5 discovery shipments (41
   DISCOVERY + 41H NEGATIVE-kind), quota UNSPENT").

— Lane R7, 2026-11-20, worktree agent-10. Desk audit only (no Modal runs, no commits;
H commits on main).
