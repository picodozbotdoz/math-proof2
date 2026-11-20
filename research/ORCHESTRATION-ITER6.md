# ORCHESTRATION-ITER6 — Iteration 6 lane tracker

Iteration 6 opened 2026-11-20 (the iter-5 close `6306dbe`; charter = the §Iteration 6
splice from R9's typeset of charter v6 `f0565371` w/ the orchestrator's rulings —
executes on R9's report + approval). Launch brief `RESUME-BRIEF-ITER6.md`.
**Predecessors: `ORCHESTRATION-ITER5.md` (FROZEN at the close) + `RESUME-BRIEF-ITER5.md`
(SESSION END wrap convention).** Maintained by H on orchestrator signal. Worktree
assignments non-sequential vs lane numbers — pull per REPORT; lanes never commit
(H commits exact-file batches, hardened gate); file funnels + Modal rules per the
launch brief §(b).

| Lane | Worktree | Role | Current unit | Status | Last update |
|---|---|---|---|---|---|
| H | (main) | helper/infra (sole committer) | the iter-6 opening commit on R9's typeset + approval (git apply --check FIRST; conflict ⇒ STOP, route to R9); day-1 records + INDEX rows ride | active | 2026-11-20 |
| R1 | agent-02 | verification-integrity | **the N2P1 override re-bind FIRST** (the one OVERRIDDEN carry from the close G2: the GIT_BYTES override stages run-26 `ce6719c8` vs HEAD `396d8710` — move/drop per the tracked rule + the make_axcheck row), then iter-6 verification duty | active | 2026-11-20 |
| R2 | agent-03 | close→article-75-v3 S1–S4 eval | the S1–S4 strength evaluation for the article-75 v2/v3-candidacy revision (dossier `12219e48`; the NOT-A-SHIP standing box + the three S4(b) bite-risks govern) | active | 2026-11-20 |
| R3 | agent-07 | 12-core day-1 fire | the STAGED-UNFIRED set fires on the day-1 signal (`stage_and_fire_core.sh`; expected GREEN shape PROBE-OK rc=0 errors=0 sorry=10 falling; CORE.lean `5a9b19b4` + the runner pair) | active | 2026-11-20 |
| R4 | agent-08 | H3 standby | evidence complete (precharter + S-rung GREEN + the banked M pre-solve + §M-PRE battery); the article decision + any M-GO at open per the charter | standby | 2026-11-20 |
| R5 | agent-04 | η-r4 one-fire | the parked rung's completion fire (T2/T3 residuals pre-decoded; fix-batch-10 APPLIED-unfired; the amended-band discipline) | active | 2026-11-20 |
| R6 | agent-06 | article-75-v3 dossier owner | standby (the dossier delivered; supports R2's eval + the editorial chain) | standby | 2026-11-20 |
| R7 | agent-10 | H3 draft + article-75-v3 editorial read | the H3 article draft (on the orchestrator's ship decision) + the v3 editorial read | standby | 2026-11-20 |
| R8 | agent-05 | M3 one-fire | the inheritance fire at the FIXED shas (P0 `33c75942` + A1 `a8feb25b` + A2 `221eb30b`; GREEN ⇒ the AL ladder closes; red ⇒ park per the cap) | active | 2026-11-20 |
| R9 | agent-09 | charter/typeset | the §Iteration 6 typeset + splice diff from charter v6 `f0565371` w/ the orchestrator's rulings folded | active | 2026-11-20 |

Standing: the runner-hygiene lesson family (the `: error(` filter class, the
fused-iff suppression, assertion-guarded replaces, the parse-trap class, the
echo-backtick trap) + the site-closure≠certification rule + the Modal SPEC
discipline live in `qa/iter4-review/h-wave4-log.md` (the lineage continues there).
Day-1 fire records land worktree-side until the opening commit.

## PAUSED — user-ordered (2026-11-21; off-peak reclaim killed the two running lanes; user directed no resume under a different plan)

| Lane | Worktree | State at pause |
|---|---|---|
| H | agent-01 (main) | idle-landed; 47 batches + ship family committed; tree CLEAN at 8c99166 |
| R1 | agent-02 | standby; §12 opened (both ship rows + fire folds landed) |
| R2 | agent-03 | standby; both gate verdicts DELIVERED (41H3 4/4 PASS 14c86d28; 75v3 splice-time PASS 74ef9e67) |
| R3 | agent-07 | **INTERRUPTED** (off_peak_cancelled 21:16); CORE.lean @ 7e40dff4 = the landed milestone; closing GO stands (≤5 fires) |
| R4 | agent-08 | standby (evidence owner: H3 wave package + M pre-solve banked) |
| R5 | agent-04 | **INTERRUPTED** (off_peak_cancelled 21:19); eta-r4.lean @ 285a411e = routes (b)+heartbeat PRE-APPLIED UNFIRED — fire as-is on resume |
| R6 | agent-06 | drained/standby (75-N2 arc complete; v3 dossier owner) |
| R7 | agent-10 | standby (both editorial units delivered; provenance fix landed) |
| R8 | agent-05 | frozen standby (M3 run-8 park; variant-1 pre-applied, re-scope queued) |
| R9 | agent-09 | standby (novelty-verification queue armed; typeset delivered) |

Restart map: RESUME-BRIEF-ITER6 §SESSION END (plan check FIRST per the user directive).
