# /tmp rescue sweep + Modal baseline — 2026-11-21 (session-wrap convention chore)

Author: the general helper lane (worktree agent-01). Convention: never leave
record-value artifacts in /tmp. Sweep 12:49–12:51 +08; method = the known-ephemeral
classes from the pause diagnosis + a broad name grep (crossmath|ghost|modal|stage|
al3d|p12|zzv2|pilot|eta|h3/h4|g7|semraker) over /tmp (223 entries total).

## 1. Verdict table (one line per artifact class/file)

| Artifact | Verdict | Evidence |
|---|---|---|
| `/tmp/eta-r4-run5-raw.log` (Nov 20 20:52, 18,261 B) | **RESCUED** → `external-doc/tmp-rescue-20261121/` | verdict line `eta-r4.lean FAIL rc=1 errors=8` + whnf-timeout `:491` context = NO-HIT vs every landed zzv2-lam log (the cancelled-era descent transcript; the resume re-fire landed GREEN, so this raw is the only record of the errors=8 state) |
| `/tmp/eta-r4-run6-raw.log` (Nov 20 21:08, 12,299 B) | **RESCUED** (same dir) | `FAIL rc=1 errors=2`, no-goals `:488` — NO-HIT vs landed family (same class) |
| `/tmp/eta-pair-refire-raw.log` (Nov 20 18:31, 24,848 B) | **RESCUED** (same dir) | partial overlap only with landed run4/run5-era lines; whole-file supersession NOT verifiable — safe-side rescue |
| `/tmp/eta-r2-run10-…-eta-r4-run5-raw.log` (Nov 21 12:29) + `eta-r4-run5-header.txt` (12:34) | superseded | 14,239 + 3,580 = 17,819 B = EXACTLY the landed `zzv2-lam/logs/eta-r2-run10-eta-r3-run7-eta-r4-run5.log` (`cebc4730`) — byte-exact assembly |
| `/tmp/al3d-run9-{header,raw,footer}` (12:21–12:24) | superseded | 1,217 + 25,870 + 3,446 = 30,533 B = EXACTLY the landed `alp2-m3-run9-variant1fire.log` (`f3d6a0d2`) |
| `/tmp/al3d-prefire-sha-m3run{2..9}.txt` (8 guards) | superseded | run-9's pins `c6752422/a8feb25b/221eb30b` = the landed INDEX-row pins; runs 2–8 per the pause-diagnosis guard-class ruling |
| `/tmp/p12-core-run{1..9}-raw.log` + `p12-p0-run{1,2}-raw.log` (Nov 20) | superseded | pause diagnosis + landings (`core-run{1,2,3}`, `core-runs4-9`, `p0-runs1-2`) |
| `/tmp/p12-core-run10-raw.log` (Nov 21 12:48) | **LIVE — leave; re-check at wrap** | R3's closing batch in flight (12-core stage dir + `crossmath-12-core-last.sha` guard updated 12:46); the lane lands its processed log — if the wrap re-sweep still finds it, it becomes rescue-class |
| `/tmp/crossmath-{12-core,12-p0,74-p2}-last.sha` | superseded / LIVE | guard class (fired-bytes shas recorded in landed logs); the 12-core one is the live fire's guard |
| 15× `/tmp/crossmath-*-stage*/` dirs (Nov 20 + Nov 21) | superseded / LIVE | staging copies of landed payloads (Nov 20 set); the Nov 21 12:39–12:48 set (n2p4, n2p4v2, probe-40, 41-h4fire, 12-core) = live lane infra, leave |
| `/tmp/core_batch{3,4}.py` | LIVE — leave | R3's closing-batch runner scripts (in use) |
| `/tmp/41H3-old-backup.md` | superseded | sha16 `2a41055884c643a2` = the git blob at `ef1e7bd`/`9cadcbe` — fully recoverable from history |
| `/tmp/ghost-gate.log` + `/tmp/ghost-quarantine/{3 dirs,quarantine.log}` | superseded (already rescued) | H's rescue landed them verbatim in `external-doc/ghost-quarantine-20261121/` (verified present, incl. the gate log) |

**Rescue manifest**: `external-doc/tmp-rescue-20261121/{RESCUE-MANIFEST.txt, 3 raws}`
(sha16s in the manifest). Nothing deleted — /tmp cleans itself; the verdict table is
the record of what was safe to lose.

## 2. Modal baseline (for the close's pre-wrap health compare; 12:50 +08)

- **Apps (5, ALL current close-prep firing wave 12:46–12:49, zero orphans):**
  `crossmath-pilot-12core` (stopped 12:48; R3's closing batch), `crossmath-pilot-75-p4v2`
  (ephemeral, 1 task LIVE 12:48; R8's N2P4V2), `crossmath-probe-40` ×2 (stopped
  12:47/12:49 + one ephemeral LIVE 12:49; R7/probe-40 arc). Every app attributable to
  a live lane — nothing stale from prior sessions (the pause-era apps expired).
- **Volumes (7, no crossmath orphans):** `crossmath-g7-tree` (2026-11-14, **the G7
  volume — present**) + `crossmath-g11-tree` (2026-11-16) are the project's; the other
  five (`zapfast-src/-target`, `enter1-lean-cache`, `lean-cache`, `huggingface-cache`)
  are older/foreign-family on the same account — pre-existing, not this project's, no
  action.
- **Pre-wrap compare rule**: at the close's health snapshot, diff against this list —
  new apps must be attributable to close-act fires (the G2 batch); any app NOT
  attributable = orphan flag; volumes should be unchanged (any new volume = flag).
