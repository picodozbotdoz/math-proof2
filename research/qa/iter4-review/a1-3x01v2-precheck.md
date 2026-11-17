# A1 PRE-CHECK — article-32 v2 + article-01 v2 verification blocks vs the record chain (lane A1 = R3-role successor, 2026-11-17)

Same method as `a1-75v2-precheck.md`. Targets (identical in main and agent-10,
sha-verified): `research/articles/32-rc-savings-frontier.md` @ `061fe8f`,
`research/articles/01-inertial-defect-master-identity.md` @ `061fe8f`. Every citation
below re-read on disk (worktree agent-02 logs + main-checkout articles). Findings for
A9 to apply on orchestrator relay; severities BLOCKER-AT-CLOSE vs COSMETIC.

## Verdict: 3 findings (2 blocker-at-close, 1 cosmetic) + 1 machinery action (taken)

# article-32 v2 (`32-rc-savings-frontier.md`)

**F32-1 [BLOCKER-AT-CLOSE] — seven §5-named lemma decls have no axiom print anywhere.**
§5's Thm-to-decl table names `lnΛ_pos_gamma` (Thm 1), `lnΛ_decompose`, `hasDerivAt_Ffun`,
`Ffun_mvt`, `kappa_pos`, `lnΛ_upper` (Thm 3), and `lt_Rc_iff_gmax` (Thm 4 — its ONLY
decl). Census: M1.lean = **41 decls = 13 theorems + 28 lemmas**; every print surface in
the chain is theorem-only (M1's in-file tail prints 9; run-12's M1-regression prints
the same 9; the C2 make_axcheck stage was theorem-only) — so these seven lemmas have
NEVER printed axioms; their triad status is elaboration-level (rc=0, 0 sorry) +
consumption. The blanket line "Axioms of every printed theorem" is carefully worded
("printed") but the table rows name the lemmas as if equivalently evidenced. Fix (one
sentence): mark the lemma-named cells "elaboration-clean; direct prints owed at the
wave-2 full-coverage pass" — machinery ALREADY STAGED: 32-M1 added to
FINAL-SWEEP-PLAN-ITER4 §7b(ii) this session (axcheck_iter4 gen captures lemmas).

**F32-2 [BLOCKER-AT-CLOSE, one clause] — the cited sweep stage is excerpt-class.**
`axcheck-final.log:618` = `[ax] AxPilot32_M1.lean: OK; axiom-lines=22, sorryAx-lines=0`
verified verbatim — but the stage section persists **16 of 22** lines (12 distinct + 3
in-file-tail dupes; the C2 T6 TALLY-ONLY class, re-confirmed by count this session).
The citation is verdict-level. Fix: append "(stage verdict; the section persists 16 of
22 records — C2 excerpt class; the wave-2 full-coverage re-run is the print of record)"
— or cite the re-run once it exists.

**Verified clean (32):** run-12 cites exact — M2 triad `run12-crossing-existence.log:60–66`
(7 decls, re-verified), M1 regression triad `:16–24` (9, re-verified); `run3-green.log:105–113`
= exactly the 9 in-file M1 theorem prints, all triad ✓; every §5-named decl exists on
disk with matching spelling (theorems AND the seven lemmas, lines :133–:416 region);
**the 0<ε amendment note is consistent** — §3's Thm 4 ("For ε > 0, c ≥ 10, γ ≥ 0") and
Thm 5 ("For ε > 0") already quantify ε > 0, so the binder adaptation (`gmax_pos_near_ten`/
`crossing_exists`/`gmax_neg_far`/`frontier_unconditional` carry `0 < ε`) weakens nothing,
matching §10.11's form-2 adaptation record verbatim; **README row matches** —
`articles/README.md:20` carries the v2 state (crossing discharge 2026-11-17, the three
M2 decls, the PAPER-ONLY residue named, `frontier_nonempty_iff` PROVED-UNCONDITIONAL,
which prints triad in-run). Novelty rows (3sum-apsp donor cites, Majdoddin 2610.17420
superseding-constants caveat, 2610.20297) consistent with VERDICTS §5.2(a) scoping.

# article-01 v2 (`01-inertial-defect-master-identity.md`)

**F01-1 [BLOCKER-AT-CLOSE, one clause] — the ported-spine triad claim is verdict-level.**
§5's axioms row: "[triad] for all of the above and the ported spine (`rank_trace_ineq`,
`rank_trace_mult(_k)`, `vonNeumann_trace_ineq`, …)". Every HEADLINE decl IS directly
persisted at the cited lines (re-verified: the 5 `*Defect_nonneg` + 5 splits +
`master_identity` + `rank_trace_mult_k_of_master` at `axcheck-final.log:295–306`;
`rank_trace_mult`/`rank_trace_mult_k` at `:246–247`; `tightness_of_master` `:362`,
`lemmaR_tight` `:359` — port10's block `:351–362`; stage verdicts `:253` port09 /
`:309` port10 verbatim ✓) — but `rank_trace_ineq` and `vonNeumann_trace_ineq` (named!)
are stage-verdict-level only: the port09/port10 stage sections persist **12 of 42 / 12
of 41** claimed records (counted this session — the C2 excerpt class). Fix: one
qualifier clause on the axioms row ("named headline decls print-persisted at the cited
lines; the ported spine at stage-verdict level (12-of-42/41 persisted, C2 excerpt
class)"). Note: the port stages are C2-frozen rows (drift-check class at sweep); if a
full-coverage pass for 01/port is wanted it is a NEW §7b(ii) entry — not pre-staged
here, A9/orchestrator call.

**Verified clean (01):** decls on disk — `master_identity`/`rank_trace_mult_k_of_master`
(port09) + `tightness_of_master` (port10) present; port10 = **2,234 LoC exact** as
claimed; novelty rows match the record chain precisely — VERDICTS.md row 01 ("Statement
NEW … A4 partially contested by AF v2 Lemma 3.2 + §7.2(b) … Knausgård Thm 2 … race is
lost") reflected verbatim in §6 rows 1/3 (incl. "we claim no improved zero-density
constants") and in §7's converse-as-open; R2 cites check: `r2-discovery-strength.md:68`
(the strength-bar row: "genuine — the strongest result in the project"; AF v2
equality-case-only; Knausgård Thm 2; §5 q6 no-defect-decomposition query) and `:202`
(pass-bar line "01 unconditional identity, clean") — both as the article's scope
statement represents them; **the :167 fix-cycles removal lost NO donor attribution**
(git-diff 6661ce6→061fe8f: v1's "ported verbatim … with **zero** fix cycles; the new
layer (~320 LoC) took six fix cycles" narrative removed; "Apache-2.0, copyright
Anthropic PBC" + "ported verbatim from Lean v4.33 to v4.36" retained in §5, and the §0
change-log records the evidence-row re-pointing).

**Cosmetic (01):** `axcheck-final.log`'s port10 block contains a PRIMED-name record
(`'Zeta23.ZeroSide.TightMult.lemmaR_tight''`, the axcheck_iter4 T9 class) — persisted
and triad; pre-T9 scans undercounted it; no article action (noted so nobody
"re-counts" the block to 11).

## Machinery action taken this session (not an A9 fix)

`FINAL-SWEEP-PLAN-ITER4.md` §7b(ii): **+ 32-M1** to the full-coverage pass list (the 28
lemmas incl. F32-1's seven get direct prints at sweep; also subsumes F32-2's
print-of-record once run).

— lane A1, 2026-11-17. Sources read: main checkout @ 061fe8f (articles, README,
git diffs); worktree agent-02 (32/01 logs, M1/M2/port decls; census tool).
