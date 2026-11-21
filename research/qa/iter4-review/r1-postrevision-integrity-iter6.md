# R1 — post-revision integrity sweep (Iteration 6, 2026-11-21)

**Unit:** the POST-REVISION INTEGRITY SWEEP over the 2026-11-21 external referee
set (main `2bfe771` = 17 article revisions + README sync; `2ea25a9` = 41H3 custody
settlement; `ef1e7bd` = introduction companions draft set, landed UNVERIFIED by
design). **Sweep basis: worktree HEAD `ef1e7bd`** (clean); the R8 run-9 fold
(funnel duty, relayed mid-sweep) byte-verified against main `fbf91d1` via
`git show` (log `f3d6a0d2a4d0a83d`, record-§run-9 `b9dad4806f9c2dd3` recomputed from
the commit's bytes — no worktree ff performed). Lane R1 (verification-integrity),
worktree agent-02. Local checks only — zero Modal fires; no re-audit stage required
by any finding (see D1/D2: both are prose-layer).

Method highlights: sha256 first-16 recomputed per explicit pin; a scripted pass over
the full article set — byline artifact paths (existence), 112 `file:line` program
refs (file exists, line in range, decl resolved in a ±4/+8 window, all misses
manually triaged); ledger §12 vs README vs the on-disk article set cross-read;
custody numbers re-derived from `presolve/outputs/scan_results.json` + `run_log.txt`;
`git diff 0676ba0..HEAD -- '*.lean'` inspected line-by-line; whole-tree
sorry/native_decide/axiom census at both refs.

---

## Check 1 — SHA-PIN AUDIT: PASS with 2 drift items (1 real, 1 disclosed-by-design)

Explicit sha256(16) pins exist in articles 41 and 41H3 (the corpus's pin convention:
other articles pin program files by artifact byline + §6 `file:line` tables — all of
those were verified too, see below). **No article pins any `refute1/` artifact**
(grep clean; the two refute notes live outside the repo at
`dsh-workdir/math-proof2-reviewer/article-review-docs/refute1/` and are cited only
by the revision record).

| article | pinned file | pin | on-disk | verdict |
|---|---|---|---|---|
| 41 | `pilots/41/P0.lean` | `b177acdbf0346bf1` | same | MATCH |
| 41 | `pilots/41/Core.lean` (committed tree) | `733b4a2d93a84689` | same | MATCH |
| 41 | `pilots/41/Core.lean` (fired bytes) | `921bc43cbd06d252` | `733b4a2d…` | **NOT DRIFT — DISCLOSED**: the article itself states the audit-of-record log was produced from fired bytes differing from the committed tree by a comment-only +18-line delta (documented in `Core.lean`'s provenance header) |
| 41H3 | `pilots/41/H3.lean` | `833dcff84309c986` | same | MATCH |
| 41H3 | `pilots/41/logs/h3-s-run1.log` | `6dc794e7a27d8565` | same | MATCH |
| 41H3 | `pilots/41/H3-M-candidates.md` | `7647a1f9859764bc` | `8d211d4c69cddebb` | **MISMATCH — DRIFT D1** |
| 41H3 | `novelty/round7-h3-battery.md` | `5f0b57cc99556d4d` | same | MATCH |
| 41H3 | `pilots/41/H3-precharter.md` | `60278bd4b6e824bf` | same | MATCH |
| 41H3 | `pilots/41/H2.lean` | `3bc8170121492d18` | same | MATCH |
| 41H3 | `qa/iter4-review/r2-41h3-s1s4-pass.md` | `14c86d28ee4b5e9e` | same | MATCH |

**D1 (the sweep's one pin drift):** commit `2ea25a9` appended the 13-line archival
note to `H3-M-candidates.md` (custody settlement), moving its sha
`7647a1f9…` → `8d211d4c…`, and updated article 41H3 in the SAME commit (status row,
§3, §6, abstract, README row) — but the article's FOUR occurrences of the old pin
were not refreshed: byline `41H3-…md:12`, status-table cell `(`7647a1f9`)`, §9 gate
row `:291`, ship footer `:296`. Intra-commit pin rot; prose-layer, zero verification
content at risk (the note change is additive and itself the custody settlement of
record). **Fix for H:** refresh to `8d211d4c69cddebb` (footer `:296` may instead
carry "ship-time" wording if H prefers history-style pinning — pick one convention
for :12/:291 which pin current bytes).

Byline artifact paths: **all exist** on disk (the four brace-glob bylines
`10/{M1..L5}.lean`, `42/{M1..M4b}.lean`, `50/{M1,Dirichlet,R1,R1probe}.lean`,
`72-M1/P72M1T{1,2}.lean` expand to existing files). §6 `file:line` refs: **112
checked; 13 checker false-positives (multi-decl rows — each manually resolved,
e.g. `assemble_eps` at `42/M1.lean:220` and `75/Pb.lean:253`, `V2d4_endpoint` feed at
`M4b.lean:1492`, `R1.lean:93/99/105/161`, `RedCompB.lean:111`,
`H1.lean:436` = `tracial_realizability_refuted`), 1 real mis-pin**:

**D2:** article 32 v3's rebuilt §6 Thm 4 row cites `lt_Rc_iff_gmax` at
`pilots/32/M1.lean:303` — actual `:342` (`:303` is `Rc_strictAntiOn_zero`, correctly
cited by the Thm 3 row at `:302`). `M1.lean` untouched since `6661ce6` (pre-revision),
so the v3 re-measure (2bfe771) mis-copied the adjacent line. **Fix for H:** `:303` →
`:342`.

## Check 2 — LEDGER/README/ARTICLE-SET CONSISTENCY: PASS with 3 minor notes

- **Article set:** 17 article files on disk = README's 9 (section A: 01, 30, 32, 41,
  41H, 41H3, 42, 75, 78) + 7 (section B: 11, 20, 22, 50, 52, 71, 72) + 1 C-listed
  article (10). Counts and discovery share 9/17 ≈ 52.9% consistent everywhere
  stated (README header, tables §12 KPI cell). `introduction/` drafts (ef1e7bd) are
  marked post-review companions, correctly NOT counted.
- **Status rows:** README rows sync with the articles for all 17 (verified per-row
  against the v-rev articles; 22/50/71/72/75/78/41H/42/20/11/10/32 spot-verified in
  full). A2′ retraction propagated to REPORT.md :497, INDEX.md :278/:288, dossier-78,
  ledger §12.4 — the follow-up-1 claims check out.
- **Custody settlement:** ledger §12.5 / README row-41H3 / article 41H3 §3 /
  `presolve/README.md` / `scan_results.json` / `run_log.txt` all consistent:
  **0 survivors, grand total 296,997,120 ≈ 2.97e8** (2×(51,891,840+82,575,360) +
  14,112,000+13,950,720), plants 20/20 per fiber at ≤1.55e-13, medians 7.17/7.21
  ("~7.1"), S1 census 24/13 and 37/14 exact, per-fiber split + the record-note
  reconciliation (row 1 short by 7/1287, rows 2–3 one-fiber) as stated.
- **Minor notes (non-blocking, H's option):**
  1. `qa/article-revisions-2026-11-21.md:59` — follow-up #2 says the custody state
     sits at ledger §12 "item 3"; custody is **item 5** at both `2bfe771` and HEAD
     (follow-up #3 says item 5 correctly). Stale pointer, revision-record-internal.
  2. Min-distance range: ledger §12.5 ":484" says "4.84–5.63" and article 41H3 §3
     ":146" says "4.8–5.6" — the per-class minima actually span **4.842–5.760**
     (`m_plus` class2 natural = 5.760 exceeds both stated upper ends; the stated
     endpoints are the canonical-13 class minima). Load-bearing content (distance
     bounded below by ~4.8) unaffected.
  3. README :9–10 "4 notes/certificates … + 3 relocated notes" vs the C-table's 7
     rows (6 non-article + article-10): the arithmetic only closes if 10 is counted
     among the "notes/certificates". Pre-existing wording (unchanged by the referee
     except "42 and 75 conditional"); ambiguity only.

## Check 3 — VERIFICATION-TABLE ROWS vs POST-REVISION STATE: RECONCILED (2 cross-notes landed, 1 flag reported)

The iter-5 close tally (22 rows = 15 GREEN / 2 honest-partial / 1 parked-unfired =
18 ✓) is structurally intact: the referee pass touched the tables file exactly once
(the 78 A2′ dated cross-note), no row was added/removed, and no kernel evidence moved
(Check 4). Per-invalidation:

- **75 DLRT:** NO row destabilized. The tables' 75 rows are kernel-evidence rows
  (§6/§10 all conditional-class); the v4 DLRT correction is prior-art prose
  (arXiv:1908.04876 now cited with correct GRH scope in article §4/§7 and README);
  theorem statuses A–E′/B′/B″ unchanged by it.
- **41H q=−1 scope:** no funnel conflict — §11's 41-H rows are GREEN-verdict rows
  (Walsh certificates + `rank_obstruction_nogo` triad), no unconditional "Thm B"
  billing row exists in the tables; the v-rev's PROVED-CONDITIONAL re-billing of Thm B
  (witness binders) lives in README/article consistently.
- **20 seam:** ONE billing-class contradiction, **cross-note LANDED this session**
  (funnel row §4 `merged_mult_of_common` :97): article-20 v-rev bills Thm 4 (i)
  PROVED-CONDITIONAL — hz/hw named — vs the row's PROVED-UNCONDITIONAL
  ("configurational"). Same evidence line (`axcheck-cycle2.log:63`); row stands as
  artifact-audit history per the 78 precedent.
- **32 (referee re-billing):** FLAG, reported for H (article owned by the revision
  lane; not edited here). The v3 README/§2 bills "Theorems 1–7 PROVED-UNCONDITIONAL"
  and the Thm 5 row says "hypotheses: none (statement domain: ε > 0 and a crossing
  c* > 10)" — but `frontier_of_crossing` carries an explicit `(e : IsCrossing ε cₓ)`
  binder in the source (`M1.lean:434`), and the funnel's §6 row bills it
  PROVED-CONDITIONAL with the "abstract must carry this caveat (R1 MAJOR)" note. The
  binder's satisfiability IS now kernel-proved (§10's run-12 `crossing_exists` rows,
  0 < ε < ε*), so the composite claim is mathematically unconditional on the stated
  domain — but "hypotheses: none" contradicts the same revision set's own
  binder-naming treatment of 20-Thm-4 and 41H-Thm-B. Recommended editorial fix:
  name the binder in the Thm 5 hypotheses cell ("none beyond the crossing datum,
  discharged by Thm 6 on 0 < ε < ε*"). No kernel content at risk.
- **72/22/52:** no conflicts (README adds binder detail only; 22's M1 re-scope is
  novelty prose, statuses unchanged; mathlib locator `ZetaAsymp.lean:343` verified
  at the pinned encore checkout `ff2494ea`, as is refute1/50's
  `DirichletContinuation.lean:291` — both exact).
- **eta-r4 parked row** (post-pause, not referee): parked sha `06ad527f` superseded
  by the R5 resume payload `285a411e` (pre-applied-UNFIRED, `0df2546`) —
  **cross-note LANDED** (§11 row); class unchanged parked-unfired.
- **§12 ship-event cells:** `16307eca`/`cb3da4ae` are ship-time snapshots; both
  articles were revised in place by the referee set. Annotation appended to the §12
  fold note (rows stand as landing records) — no row edit needed.

## Check 4 — TRIAD/HYGIENE SPOT-CHECK: CLEAN

`git diff 0676ba0..HEAD -- '*.lean'` = **exactly one file**: `pilots/zzv2-lam/eta-r4.lean`
(+5/−7) — the R5 resume payload (`0df2546`, post-pause landing, NOT a referee edit;
the referee commits `2bfe771`/`2ea25a9` and `ef1e7bd` touched ZERO .lean files —
the revision pass's scope guard held). The delta is purely mechanical: the :456
`((2 * lam : ℝ) : ℂ)` cast fix, push_cast relocation (:582–584), the
`set_option maxHeartbeats 1000000` heartbeat insurance (:488), the (b)-route
`div_const` divisor (:616). **Zero sorry/native_decide tokens added.** Whole-tree
tracked-`.lean` census IDENTICAL at both refs: **sorry 219 lines, native_decide 73
lines, `axiom` declarations 0** (the sorry lines are the pre-existing
probe-convention/header-disclosed classes — unchanged counts are the finding).
`introduction/` (ef1e7bd) is .md-only. No axcheck re-run required by anything above.

## Funnel folds landed this session (worktree-side, H commits)

1. §12 AL-M3 run-9 row (the R8 relay): SPLIT verdict ⇒ PERMANENT PARK per D5/D7 —
   P0 GREEN sorry-free at `c6752422` (run-8 universe root dead; runs 5–8 saga
   closed), A1 FULL GREEN triad (first of the M3 era), A2 NOT-GREEN first-sight
   (2 mechanical classes + cascades; 3 pureState-typed theorems sorryAx;
   `fibre_eq_of_column_closed` triad-clean; the runner's sorry=0 is a false
   negative — backtick-form counter, the D4 fix binds future al3d runners);
   ladder M0/M1/M2 + P0 + A1 all kernel-verified; priced continuation 2–4 fires
   FUTURE-grant-only. Log `f3d6a0d2`, record §run-9 `b9dad480`, verified at main
   `fbf91d1`.
2. §4 `merged_mult_of_common` 2026-11-21 cross-note (Check 3, 20 re-billing).
3. §11 eta-r4 sha-cell cross-note (`06ad527f` → `285a411e` pre-applied-unfired).
4. §12 fold note: ship-event-sha historical status + this note's path.

## What H must land (consolidated)

- **D1 fix:** article 41H3 — refresh `H3-M-candidates.md` pin `7647a1f9…` →
  `8d211d4c69cddebb` at :12/:291 (and the status-table cell), convention decision
  for the :296 footer.
- **D2 fix:** article 32 §6 Thm 4 row — `M1.lean:303` → `:342`.
- **32-Thm-5 editorial flag** (this note, Check 3): name the `e : IsCrossing` binder
  or cite the Thm-6 discharge in the article's Thm 5 hypotheses cell.
- Optional minors: revision-record :59 "item 3" → "item 5"; ledger :484 + article
  41H3 :146 distance range → "4.84–5.76" / "4.8–5.8"; README :9–10 note-count
  wording.
- This note + the three funnel edits (one batch, INDEX row for this file rides).

— lane R1 (verification-integrity), worktree agent-02, 2026-11-21. Basis `ef1e7bd`
(+ `fbf91d1` bytes for the run-9 fold). No Modal fires; no commits (H commits).
