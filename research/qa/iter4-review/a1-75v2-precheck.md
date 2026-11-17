# A1 PRE-CHECK — article-75 v2 verification blocks vs the record chain (lane A1 = R3-role successor, 2026-11-17)

Target: `research/articles/75-abelian-assembly-zetaL-proportions.md` @ `a6c7b13`
(2026-11-17 19:04 +0800; read from the main checkout, read-only). Scope: the R3 §5
pass, early — §6 formal record + per-theorem blocks + §3.3 discharge accounting +
§4 nearest misses + the §9 self-audit's record-facing claims, audited against the
record chain (`r3-verification-tables.md` §10.4/§10.5/§10.8; Pa/Pb on disk at
post-run-12 bytes, Pb sha256(16) `da05c60ceb78755b`; the persisted logs). Every
citation below was re-read on disk this session. Findings for A9 to apply on
orchestrator relay; severities: BLOCKER-AT-CLOSE vs COSMETIC.

## Verdict: 4 findings (1 blocker-at-close, 3 cosmetic); everything else VERIFIED CLEAN

## Findings

**F1 [BLOCKER-AT-CLOSE] — §6 omits the Step-B full-coverage closure evidence.** The
strongest per-theorem evidence now on record post-dates the v2 draft by minutes
(closure ran 18:47–18:48 +080; v2 committed 19:04; the closure log was uncommitted
lane state at draft time — omission excusable, now owed): `pilots/75/logs/axcheck-full-run1.log`
— ALL 89 census decls direct-print exactly `[propext, Classical.choice, Quot.sound]`,
0 sorryAx, official scan 124 records all-triad, source sha `da05c60ceb78755b`
(§10.8's Step-B closure). As written, §6's per-row evidence stops at run-11/run-12
prints and its coverage story rests on the run-11/12 elimination arguments that the
closure supersedes. Fix: add one sentence to the §6 preamble (closure log + sha +
89/89 + 124-record scan) and cite it in the C/D/E/E′ rows alongside the run-11/12
prints (the closure's appended-tail records cover every row of the table). Box 10's
"re-verify at splice" note is the natural hook.

**F2 [COSMETIC] — census split precision.** §6 preamble: "89 declarations (79 public +
10 private at the audited bytes…)" — accurate for the run-11 bytes, but the current
census is **82 public + 7 private** (post-exposure; `axcheck_iter4.py decls`
2026-11-17, §10.8). Suggest: "89 declarations (82 public + 7 private at the closure
bytes; 79 + 10 at the run-11 bytes before the three §5.3 helpers were exposed)". Fold
into F1's sentence (same preamble).

**F3 [COSMETIC] — closed-vocabulary case drift.** The tables' vocabulary is
`PROVED-CONDITIONAL` / `PROVED-UNCONDITIONAL` (§10 rows); the article's honest labels
write `PROVED-conditional`. Self-audit box 3 claims "closed vocabulary" — either
upper-case the article labels or note the article-side rendering once. No semantic
gap (binder lists and conditions match exactly).

**F4 [COSMETIC] — run-11 vs run-12 bytes sha clarity.** §6 gives the run-11 sha
`b9ad881689927936…` as "the audited bytes" while the run-12 re-print columns cite
prints from the post-fix bytes (`da05c60ceb78755b`). The PENDING-CLOSE sweep-sha field
correctly owns the final stamp (owner H) — but one clause naming da05c60c as the
run-12/closure bytes prevents a reader mis-binding the re-prints to b9ad8816. Fold
into F1/F2's preamble sentence.

## Verified clean (no action)

- **(a) Labels vs evidence.** All 8 rows: 7 conditional rows PROVED-conditional with
  verbatim binder inventories; the single unconditional row is the DONOR row with the
  donor-pin wording "at donor pin (Lean v4.33.0-rc2, mathlib `51e6992e`)" — exactly
  §10.5's class (PROVED-UNCONDITIONAL (donor), D-PIN). Donor-row cites verified:
  `zeta23e-p0-run1.log:15–18` (hygiene-gate PASS block, verbatim), `:190` and `:203`
  (thmE_A₀ triad, both), chain `:190–194`/`:203–207` — and the article correctly uses
  the REAL print lines, not the log header's stale "165-169" self-cite (the §10.5
  citation correction is respected). The 42-row (`zetaK_two_thirds_landed_of_V2`,
  PROVED-conditional(H + hEχ)) verifies: `M4b.lean:1479` + `m4b2-axcheck-run1.log:139`
  (triad print, exact line).
- **(b) Binder inventories vs disk.** Thm A `Pa.lean:1473` — the 12 binders on disk
  are exactly the article's list (hK/hF/hntopK/hntopF structural; hAbFac; hfinK/
  hfinL/hfinF; hcK/hcF; hAK/hAF open core). Thm B `Pa.lean:1525` — +hCert +hK673,
  hAF at 2/3; `K673OfLayers` at `Pa.lean:911` with the exact constant
  1669159/2478195. Thm C/D/E at `Pb.lean:2144/:2191/:2229/:2255` — lines UNCHANGED at
  the post-run-12 bytes (verified on the da05c60c tree); `K839OfLocalStrip` at
  `Pb.lean:935` with 1645064/1960733; the hCZStripFam summed-form seam note is exactly
  at `Pb.lean:41–45`. Article Thm-A range :1473–1518 and Thm-B :1525–1539 consistent
  with the next decl at :1525/:1540-carry.
- **(c) Counts and spellings.** 89-decl census ✓; Pa.lean 68 = 65 public + 3 private
  ✓ (T2 census) and 1,557 lines ✓ (wc, both trees); Pb 2,302 LoC header vs 2,303
  `wc -l` ✓ (final-newline convention, as the article says); all six theorem names
  spell-match the census exactly; the coverage claim "17 of 17 (heritage 3 + public
  11 + private 3)" matches `run6-final.log:6` VERBATIM, and Pa's in-file tail is
  exactly 3 heritage prints (`:1195–1197`) + 11 public (`:1544–1554`) + 3 private
  (`:1555–1557`); `run6-final.log:31/:32` are the Thm A/B triad prints ✓; pb-run12
  re-prints at `:52–55` ✓ (verified in the §10.8 pass).
- **(d) PENDING-CLOSE fields.** Correctly owned, none silently filled: sweep shas +
  LoC re-measure → owner H; README row (self-audit box 11 PENDING owner H) is
  ACCURATE — `articles/README.md:22` verified still in v1 wording (no v2 two-tier /
  Dirichlet-column text), so the pending flag matches disk; G-class ledger rows →
  owner A1. Box 12's supersession claim (v1 superseded in place by §0) consistent
  with the file's own §0.
- **(e) Nearest-miss cites.** All 5 rows resolve at named sources: DLRT
  arXiv:1908.04876 (project records round-1/round-4/CLAIMS-REGISTER; the corrected
  scope qualifiers — GRH-conditional, fixed quadratic — match the CLAIMS-REGISTER
  row-42 erratum record); Bansal–Maji arXiv:2507.18121 (iter4-external-priorart +
  rounds); Lamzouri arXiv:2609.02882 + the local anchor `ZetaZeros/Main.lean:130/:149`
  VERIFIED in the sibling tree (= `simple_proportion_d4` / `distinct_proportion_d5`);
  Knausgård 2609.33043/2610.08965 (`novelty/knausgaard-as-donor.md`; both constants
  disk-verified above); article-42-v2 cross-ref (M4b decl + log verified above).
  The scope paragraph's corpora list matches the project's surveyed set.

## Note for the relay

F1 is the only finding that touches a §9-box claim (box 8's "record facts" and box
10's citation list both gain the closure log). F2–F4 are one-preamble-sentence fixes
that can ride the same edit. No finding invalidates any status row, binder list,
count, or nearest-miss citation — the v2's verification content is accurate against
the chain as of its drafting; F1 brings it current with the 18:47 closure.

— lane A1, 2026-11-17. Sources read: main checkout @ a6c7b13 (article, README);
worktree agent-02 (Pa/Pb da05c60c bytes, all 75/42/zeta23e logs); sibling
axiommath/ZetaZerosV2 (read-only).
