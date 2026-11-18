# A9 — claims-to-records audit of the 6 discovery-grade articles (pre-close; 2026-11-18)

Lane A9 (articles editorial). Scope: every load-bearing claim of the six
discovery-grade articles — **01, 30, 32, 42, 75, 78** — cross-checked against the
landed records on MAIN (`2f90dcc`): pilot logs (verdict lines, triad counts, run
ids/walls, shas), Lean declaration locators, donor citations in the read-only
siblings (zeta23, eth, 3sum-apsp, ZetaZerosV2, DZDF, openai-math, encore-mathlib),
novelty/qa records (VERDICTS rows, R2 strength bar, A1 prechecks, A7 sweeps), and
status-token semantics (GREEN/PENDING/NOT-GREEN vocabulary). Method: log lines and
declaration lines re-read on disk; donor lines re-read in the sibling trees; counts
re-measured (`wc`, `grep -c`); shas re-hashed. **Zero Modal runs** (no claim needed
elaboration — everything checked against persisted records). The §D.4 PENDING-CLOSE
sha cells of articles 75/78 were excluded by instruction (close-time edits, not
double-applied).

**Verdict: 213 claim-checks, 6 PASS articles, 4 locator defects (all fixed in the
agent-10 worktree; zero semantic defects — no status token, triad count, run id, sha,
donor statement, or novelty claim misstates the record).**

| article | claim-checks | defects | class |
|---|---|---|---|
| 01 | 31 | 0 | PASS |
| 30 | 22 | 1 | locator off-by-one — FIXED |
| 32 | 36 | 0 | PASS |
| 42 | 41 | 2 | locator (one wrong-decl, one keyword-line) — FIXED |
| 75 | 55 | 0 | PASS |
| 78 | 28 | 1 (×3 sites) | locator off-by-8 — FIXED |

## Article 01 — PASS (0 defects)

All header-table evidence lines verified in `pilots/01/logs/axcheck-final.log`:
`:1` (29/29 stages OK, 0 sorryAx), `:246–247` (donor `rank_trace_mult(_k)` triad),
`:253`/`:309` (port09/port10 stage OK; axiom-lines 42/41 — matches the disclosed
"12 of 42 / 12 of 41 persisted" excerpt-class qualifier), `:295–299` (the five
`*Defect_nonneg` prints), `:305` (`master_identity`), `:306` (anchor
`rank_trace_mult_k_of_master`), `:357` (port10 re-print), `:359` (`lemmaR_tight`),
`:362` (`tightness_of_master`). Files: `10_TightMult.lean` = 2,234 LoC (article: 2,234
✓); port set 01–08 + 09/10 present. Donor cites (zeta23 sibling):
`RankTraceMult.lean:281` (`rank_trace_mult`), `:369` (`rank_trace_mult_k`), `:81`
(`sq_sub_ge_gc`), `TightMult.lean:93` (`lemmaR_tight`) — all exact. QA cites:
`r2-discovery-strength.md:202` ("Items that pass the bar … **01**"), `novelty/VERDICTS.md`
row 01 (NEW, A4 narrowed, Knausgård HOT — matches §6/§7 wording),
`a1-3x01v2-precheck.md` (F01-1), `a7-32-01-priorart-hardening.md` — all on disk.

## Article 30 — 1 defect, FIXED

Verified: `run3-green.log:1` (ALL THREE OK, 0 errors, 0 sorry-warnings),
`:12`/`:60` (both files OK), `:14–19` (faithfulness layer ×6), `:20–22` (witnesses),
`:23` (`TheoremB2_refuted_h1`), `:24–26` (moment instances ×3), `:62` (`nab_nab`),
`:63` (`scalar_second_diff` = `[propext, Quot.sound]` — the "not even choice" claim),
`:64–69` (closed-form layer ×8); `axcheck-final.log:505–506` (ClosedForm stage OK, 16
axiom lines), `:561–562` (falsify stage OK, **25 axiom lines, 0 sorryAx** — the
header-row claim "25 axiom lines" is the stage line, exact). eth donor cites:
`AppHalfPiecesStatement.lean:89–90` (∇), `:93`/`:105` (display region), `:131`
(pairing), `:146` (angle), `:149` (Q/display 48), `PaperIndex.lean:2389/:2394`
(aliases). VERDICTS row 30 (NEW-SUPPORTED, COLD, anchors) ✓.

**DEFECT A30-1 (FIXED, worktree):** byline cites the strength-bar caveat at
`r2-discovery-strength.md:68`; `:68` is the **01** row — the "should say *whose*
conjecture" caveat is the **30** row at `:69`. Fixed `:68`→`:69` + dated change-log
line. (Born off-by-one at the 2026-11-17 drafting; the r2 file itself last changed
2026-11-16.)

## Article 32 — PASS (0 defects)

Verified: `axcheck-final.log:655–671` — every cited line maps to the named
declaration (`:655` lnΛ_10_0, `:656` Rc_10_0, `:657` Rc_strictAntiOn_zero, `:658`
Rc_antitone_gamma, `:659` the "(…18 more)" excerpt marker, `:661` lnΛ_affine, `:662`
lnΛ_mono, `:664` repeat, `:665` Rc_lt_epsStar, `:666` ceiling, `:667–670` the four
Thm-5 decls, `:671` frontier_nonempty_iff); `:618` (AxPilot32_M1 OK, **22 axiom
lines, 0 sorryAx** — matches the verdict-level disclosure; section persists 16 of 22);
`run3-green.log:105–113` all nine prints; `run12-crossing-existence.log` header
(M1+M2 OK rc=0, triad for 7 M2 + 9 M1 theorems, 3-run descent, wall 45 s warm, M2 sha
`9c10fcf5…`, **675 LoC** ✓) + `:58` (M2 stage OK) + `:60–66` (**all seven** M2
theorems incl. `crossing_exists`/`frontier_unconditional`/`frontier_formula_unconditional`)
+ `:16–24` (M1 regression ×9). All 20 M1 lemma names + 7 M2 names present as
declarations in `M1.lean`/`M2.lean` (511/675 LoC). Donor cites (3sum-apsp
`PaperStatements.lean`): `:2006` (entropy), `:2011` (lnΛ), `:2015` (Rc), `:2018`
(epsStar), `:2021` (rhoC), `:2024` (gammaOf), `:2319/:2325/:2334`
(Sec4_Rc_strictAntiOn/zero_tendsto/lt_epsStar), `:4014` (Corollary_31) — all exact.
QA: `a1-3x01v2-precheck.md` F32-1/F32-2 (both quoted accurately, incl. the
BLOCKER-AT-CLOSE class + the sweep discharge note), `a7-32-01-priorart-hardening.md`,
VERDICTS §5.2(a) — all on disk. The byline's `r2-discovery-strength.md:202` cite
points at the sentence opener ("Items that pass the bar as they stand: **01** …
**30**"); the **32** token rides `:203` — sentence-level cite, accepted (noted, not a
defect).

## Article 42 — 2 defects, FIXED

Verified: `m4b2-axcheck-run1.log:2` (GREEN triad-only, **98 prints / 72 names** ✓),
`:139–145` (Thms 1–3 + V2d4/V2d5 endpoints + donor `simple_proportion_d4`/
`distinct_proportion_d5`), `:211–212` (discharge lemmas); `axcheck-c2-final.log:7`
(M4a OK, 57 axiom-lines, 0 sorryAx) and `:8` (donor-tree verdict of record: OK,
**80 axiom-lines, 74 print-sets**, 0 sorryAx ✓); `m4b-axcheck-run1.log:2` (68
distinct theorems = 66 + 2 @simp ✓) + `:20–21`; `m4b-run2.log:2` GREEN;
`m4-axcheck-run1.log:58/:68`; `m4-run2.log:2` GREEN; `axcheck-final.log:731–733`
(v1 certificate-route prints). Declarations: `M4b.lean:1390/:1396` (wrappers),
`:1404/:1439` (discharge lemmas), `:1479/:1497/:1535` (Thms 1–3), `:1492` (ζ column
fed `V2d4_endpoint` inline), `:1513`; `M2b.lean:1062/:1081/:1121` (v1 route). LoC:
M1/M2a/M3/M2b = 337/612/453/1150 ✓ "matches disk exactly"; M4a 1,194 / M4b 1,571 ✓;
**54 public theorems (M4a) / 70 declarations (M4b)** — re-measured with the
wide pattern (line-start + indented + @\[simp\] forms), exact. Fallback
`M4b-fallback-GREEN.lean`: 1,560 lines, **85,641 bytes** ✓. Donor endpoints
(ZetaZerosV2 `Main.lean:130/:149`): statements contain `0.6725 <` and `0.83625 <`
verbatim ✓. Version-history commit times: `c540682` 02:31, `4e19304` 09:19 ✓.
`stepB-c2-m4b-donor.log`, `20-seam-analysis.md`, `20-hCZ-NOTE.md`, zeta23
`Challenge.lean:131–229` (Theorem-E source span; :131 = `two_thirds_on_critical_line`,
:229 = the closing `sorry` stub) ✓.

**DEFECT A42-1 (FIXED, worktree):** §6 row cites `EpsLowerDistinctStripCum` at
`M4a.lean:833` — `:833` is inside `def EpsLowerCum` (the with-multiplicity form);
the strip-distinct def is at **`:837`**. Wrong-declaration locator. Fixed → `:837`.

**DEFECT A42-2 (FIXED, worktree):** same row cites `distinctCountCum` at `:821` —
the def keyword line is **`:820`** (`:821` is the body line). Keyword-line convention
applied. Fixed → `:820`. Both + dated §0 history line.

*Judgment call recorded:* 42 is R1's v2 (R1 closed at L1); A9 is the editorial
successor and no in-flight lane owns the file (A3 owns 71/22 only) — the two
unambiguous fixes were applied in the worktree per the re-task's surgical rule.
`m2b_run6.log`'s verdict line reads "OK; errors=0, sorry-warnings=0" without the
GREEN token (C2-era raw-probe log, pre-header-convention); the article's "GREEN run"
characterization is consistent with the record (OK + 0/0 + triad at
`axcheck-final.log:731–733`) — PASS, noted.

## Article 75 — PASS (0 defects)

Every load-bearing cite verified. Header table: `Pa.lean:1473/:1525`,
`Pb.lean:2144/:2191/:2229/:2255`, `Pb.lean:51` (`import Mathlib` only ✓);
`run6-final.log:31–32`, `pb-run12-auditfix.log:33–34`, `pb-run11-final.log:50–53`,
`pb-run12-auditfix.log:52–55` — all triad at the cited lines. §2/§5 locators:
`Pa.lean:911` (K673OfLayers), `:902` (two_thirds_le_673), `:904`
(five_sixths_le_839), `Pb.lean:935` (K839OfLocalStrip), `:1797` (offDiag_cons_ge),
`:1873` (bonferroni_union_le) — exact. §6 preamble: closure log
`axcheck-full-run1.log` header (2,303 lines; sha `da05c60ceb78755b`; 124 records =
89 appended + 35 ride-along — re-counted, exact); census split 82+7 (closure) /
79+10 (run-11) per r3-tables §10.4; `Pb.lean` 2,303 by `wc` ✓; run-11 sha
`b9ad881689927936` per §10.4. zeta23e donor-pin audit:
`zeta23e-p0-run1.log:15–18` (hygiene gate PASS, all five chain theorems triad, 0
sorryAx), `:190` + repeat `:203` (`thmE_A₀`), chain `:190–194` / repeats
`:203–207`; `P0.lean:54` (`hex_two_thirds_binder_port`, probe-convention);
`P0.lean` sha `986f1ce879786f33` on disk **equals the log-header stamp** (bytes
unchanged since the audit). Donor statements: zeta23 `Zeta23/ThmE/Final.lean:93`
(`thmE_A₀ (hq : 1 < q) (hprim : χ.IsPrimitive)` — quoted verbatim in §3.3 ✓),
`:93–105` span; DZDF `AbelianRayCharacterFactorization.lean:62`
(`theorem abelianFactorization`) and `EntireAbelianQuotient.lean:13`
(`dedekindAbelianQuotient`); ZetaZerosV2 `Main.lean:130/:149`. Elaboration verdicts:
`run6-final.log:6`, `pb-run11-final.log:4` (GREEN rc=0/0/0), `pb-run12-auditfix.log:2`
(GREEN re-confirmed). **N2 status language**: the article claims nothing about N2
beyond "carried completion, not a claim" (§3.3) and "not proved here" (§7.2) — both
still true at `2f90dcc`; the current N2 state (P0 15/15, P1-core c-trick GREEN-triad)
lives in the README row and the N2 records, and the update path is the D.2
branch machinery (both branches pre-written in the splice checklist addendum).
**3×NOVEL sweep**: `qa/iter4-review/a7-n2-preshipping-sweep.md` on disk — 3× NOVEL,
no retract; its 2 mandatory nearest-miss adds are routed to the N2 dossier
(`candidates/75-N2-rayclass-dirichlet-consumer.md`), correctly NOT to article 75
(no N2 claim exists there to harden).

## Article 78 — 1 defect (3 sites), FIXED

Verified: `p0-run4.log:20` (P0.lean OK), `:22–24` (A1/A2/A2′ triad), `:53–55`
(repeats) — exact; `P0.lean:365/:383/:405` declarations; 444 lines; sha
`d94d115e3d8d08d7` on disk = the in-file run-4 bytes (PENDING-CLOSE untouched);
`import Mathlib` only ✓; the three-lemma substrate and §5 proof-shape claims match
the P0-record. mathlib cite `Mathlib/Algebra/Tropical/Basic.lean:55/:54`
(`:55` = `def MinTropical`, `:54` = the `@[to_dual]` max-tropicalization doc line) ✓.
Support files: `P0-record.md`, dossier `candidates/78-truffet-substitution-refutation.md`,
`r7-bib-cards.md`, `iter4-truffet-classical-scope.md` §9/§10.1 ✓; OAI sibling
`TruffetModel.lean:33–116` span ✓ (121-line file; :33 `def eval`, :116 `def better`).

**DEFECT A78-1 (FIXED, worktree, 3 sites — §1, §4 row 1, §8):** the OAI sibling
theorem `OAI.TruffetV4Counterexample.finite_execution_not_optimal` is cited at
`TruffetCounterexample.lean:126`; the theorem's keyword line is **`:118`**
(namespace chain verified: `OAI` :3, `TruffetV4Counterexample` :6). Off-by-8 locator,
all three sites fixed + dated change-log line.

## Fixes applied (worktree agent-10; H pulls with the close batch)

| file | edit | defect |
|---|---|---|
| `articles/30-…md` | byline `r2-discovery-strength.md:68`→`:69` + change-log line | A30-1 |
| `articles/42-…md` | §6 row `:821`→`:820`, `:833`→`:837` + §0 history line | A42-1/2 |
| `articles/78-…md` | `TruffetCounterexample.lean:126`→`:118` ×3 + change-log line | A78-1 |
| `articles/10-…md` | **relay fold (A2 rehearsal D5)**: D2/D3 header rows, abstract tranche sentence, §6 L4/L5 rows + prose, §7 scope line, §8.1 D2/D3/D4–D6 bullets, change-log line | not an audit defect — landed-record sync |

## Orchestrator defect list — EMPTY (judgment calls recorded instead)

No ambiguous defect (verdict semantics, kind labels, in-flight-unit touches) was
found. Three judgment calls, all resolved PASS with rationale above: (1) 42's
editorial-lineage ownership for the two surgical fixes; (2) `m2b_run6.log`'s
"GREEN run" characterization vs its C2-era OK-verdict line; (3) 32's `:202`
sentence-opener cite for the strength-bar pass. None touches the five in-flight
units (A3/A4/A5/A7/A8 own no article file in this audit's scope).

— Lane A9 (wave 3, second pass), 2026-11-18. Source of truth: main `2f90dcc` +
read-only siblings; no Modal; no commits (H commits). Companion: the splice-checklist
wave-3 addendum (D.0 corrected, D.1 + D6 rule, D.1-bis, D.2 both-branch).
