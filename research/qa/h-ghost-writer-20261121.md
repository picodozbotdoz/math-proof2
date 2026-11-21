# Ghost-writer containment pack — main-side intro writes (2026-11-21)

Author: the general helper lane (worktree agent-01). For the USER'S DECISION — no
process is killed or signalled (user precedent: strays are left alone). H's
containment protocol is already operating; this note is the record + the tooling.

## 1. Timeline (all 2026-11-21 +08; sources: `git log --format=%ci`, `ls
--time-style=full-iso` on main + both lane worktrees, H's relay)

| Time | Event |
|---|---|
| 11:45:15–12:15:39 | The 19-file introduction set staged onto MAIN (spec 11:45, exemplar-41 11:46, 8-file cluster 12:07:10–42, marker/11/50/75/52 through 12:15:39) — the prior-session host's writing cadence |
| 12:16:08 | commit `ef1e7bd` — the set landed UNVERIFIED (17 stems + `_SPEC` + marker) |
| 12:16:16 | lane worktrees checked out at ef1e7bd (agent-10's untouched files carry this mtime) |
| 12:20:04 | commit `d694a45` (resume records) |
| 12:21:09.352–.360 | **agent-06 (R6) writes 01 / 42 / 71 WORKTREE-SIDE** (one batch, 8 ms span) |
| 12:22:02–12:27:14 | agent-10 (R7) writes 10 / 72 / 11 / 30 / 32 worktree-side (12:26:40 = agent-06's 41H3) |
| 12:24:15 | commit `0a15ec0` (R4 L3 re-charter) |
| **12:24:43 / 12:25:28** | **GHOST WRITES ON MAIN** (H's observation) — two bursts 45 s apart, inside the inter-commit window `0a15ec0`→`fbf91d1` |
| 12:26:08 | commit `fbf91d1` (R8 M3 run-9) |
| 12:29:12 | commit `aac8e20` (INDEX reconciliation batch) |
| **12:29:40.363445016** | **H RESTORES the four ghost-touched files** — identical nanosecond mtime on {01, 41H3, 42, 71} = one batch restore; verified: all 19 main files are byte-identical to `ef1e7bd` again (sha16 sweep, table §2) |
| 12:29:40 | commit `bbda51d` (R9 novelty verification) — gates held |
| 12:30:21 | agent-10 writes `introduction/README.md` (the registry; worktree-side) |
| 12:30:46 / 12:32:14 | commits `5e4f173` (R2 quota deliverables) / `9cadcbe` (**R7's verified half landed**: 5 fixed + registry README `f264d6b0`; marker superseded+deleted) |
| 12:31:43 | agent-06 writes `50-…` worktree-side (the R6 set grows to five) |
| **12:32:43 / 12:34:04** | **GHOST BURSTS 3+4 (caught live by this unit's snapshot script)**: 12:32:43.612 partial ({01,41H3,42}); 12:34:04.654 FULL SET — all five R6 files written in one batch (identical nanoseconds), byte-identical to agent-06's current bytes (§2). Main's intro dir is ghost-staged as of this note |

## 2. Sha-identity evidence (sha256-16; sweeps 12:29–12:36)

- Post-restore sweep (12:29+): all 19 main files == `ef1e7bd` bytes — zero corruption
  at HEAD at that gate.
- Ghost-touched set (bursts 1–2, restored 12:29:40) = exactly **{01, 41H3, 42, 71}**
  = exactly agent-06's dirty set at that time; H's pre-restore observation (relayed):
  main-side bytes **sha-identical to agent-06's worktree copies**.
- LIVE CATCH (bursts 3–4, 12:32:43 / 12:34:04, first-hand via `ghost_snapshot.sh` +
  a direct sweep): main's five dirty files byte-equal agent-06's CURRENT bytes, all ≠
  HEAD — `01`=51d461ee4038cab7, `41H3`=8d910ce623d9fae4, `42`=55846eb9b4b035bd,
  `50`=4c3c37cbf9fa27ac, `71`=30ed5d7f04d2edae. The mirror tracks agent-06's
  evolving set with ~1–8 min lag (50 was written worktree-side 12:31:43, mirrored
  12:34:04).
- agent-10's five fixes + registry README were NEVER ghost-mirrored — they reached
  main only via H's commit `9cadcbe`. The ghost mirrors **agent-06 only**.

## 3. Attribution reasoning

- **R6/R7 exonerated**: every current-lane write is worktree-side (mtime evidence
  above; lanes run in separate checkouts and never write main by protocol).
- The main-side writes post-date agent-06's 12:21:09 worktree batch by ~3.5–4 min and
  were byte-identical to it ⇒ the writer **read agent-06's worktree outputs and
  mirrored them into main**. A mirroring reader whose working tree is MAIN matches
  the prior-session host (claude-desktop, Nov 20) with its two accessibility agents —
  the same actor family that staged the set onto main 11:45–12:15. Two mtime bursts
  45 s apart = two agents.
- Disclosed ambiguity (not load-bearing): 41H3's worktree mtime (12:26:40) post-dates
  the ghost window — either R6 revised it after the ghost mirrored the earlier
  version, or the 12:26:40 write re-saved identical bytes. Attribution rests on the
  MAIN-side writes alone, which no current lane made.

## 4. Containment protocol (H, standing)

1. **At every commit gate**, before staging: sweep
   `research/articles/introduction/` on main; any file whose bytes ≠ HEAD bytes ⇒
   `git -C <main> restore research/articles/introduction/<file>`. Executed once at
   12:29:40 (evidence above). Run `research/qa/ghost_snapshot.sh` (below) and append
   to the gate log.
2. **Zero-corruption argument**: while ghost content is sha-identical to the lane
   worktree copies, a restore discards nothing unique — the fixed bytes live in
   agent-06/agent-10 and are re-copied at the landing runbook
   (`h-intro-landing-runbook.md`). Residual risk class = staging collision only (a
   ghost write landing mid-`git add`/commit of a batch touching intro files); the
   hardened gate (`git diff --cached --stat` == intended batch) catches that.
   **Idempotence end-state (the clean containment exit):** once H's landing commit
   puts agent-06's bytes INTO HEAD, the ghost's subsequent writes equal HEAD bytes and
   become no-ops — `git status` stays clean and the flap self-extinguishes for
   unchanged content. The only post-landing DIRTY signals will be genuine new R6
   revisions (normal landing flow).
3. **Burst cadence observed**: 12:24:43, 12:25:28, 12:32:43, 12:34:04 — irregular,
   roughly tracking agent-06's write events with minutes of lag. Snapshot at EVERY
   gate; do not assume the previous restore still holds.
4. **No killing, no signalling** — user precedent; this note exists for the user's
   decision on the stray host.

## 5. Snapshot script

`research/qa/ghost_snapshot.sh` — mtime + sha16 + HEAD-bytes sha16 of all files in
`research/articles/introduction/` on main, one line each, appended to a log (default
`/tmp/crossmath-ghost-snapshot.log`, override: arg 1 or `$GHOST_LOG`; main repo
override: `$MAIN_REPO`). Read-only against main; H runs it at each gate. A file whose
`sha16` ≠ `head` column is flagged `[DIRTY-VS-HEAD]` (ghost or H staging —
disambiguate by whether H is mid-batch). **Field-tested 12:33–12:36**: its first run
caught bursts 3–4 live (§1); 19 lines per snapshot, smoke-verified.

## 6. Stale `.claude` worktrees check (REPORT ONLY — deletion is user-gated)

`/home/doz/zcode-workdir/cross-math-fronttier/.claude/worktrees/` holds FOUR dirs;
**every branch tip is an ancestor of main HEAD (merged), so nothing is unrescued and
deletion is loss-free at the user's discretion**:

| Worktree | Branch | Tip | State | Note |
|---|---|---|---|---|
| `decl-index-v3-et-v2-893da6` | `claude/decl-index-v3-et-v2-893da6` | `e363431` | clean | = the et-v2 embedding landing (INDEX row 447's branch; already noted "on main at e363431" since `aac8e20`) |
| `gpu-lean-theorem-proving-940d0d` | `claude/gpu-lean-theorem-proving-940d0d` | `44a87b6` | clean | = the semantic-stage landing (decl_embed/embed_v3_modal) |
| `indo-tts-improvements-e3cf01` (beyond the named pair) | same-name | `b1ea051` | clean | merged ancestor; unrelated-name project branch |
| `nervous-vaughan-88fb3b` (beyond the named pair) | same-name | `f05614b` | 1 untracked `.run/` | merged ancestor; `.run/` is runtime scratch, not rescue-class |

These are NOT the ghost (a worktree is a reader of its own checkout; the ghost's
writes were on the MAIN working tree). No action taken.

## 7. Post-exit evolution + the delta-quarantine protocol (2026-11-21, this lane's round 2)

**Evolution of the ghost's behavior (H's relay + first-hand this round):** after the
containment exit at `f586b47` (R6's verified half landed 12:34:35), the ghost's writes
were idempotent for ~1 h (writes == HEAD bytes, no-ops). At the `e61201b` gate
(12:36:28) it wrote NEW content on `71-splane` (`54527b1a` vs landed `30ed5d7f`;
restored by H) — the prior-session agent is now progressing **its own fix loop**, no
longer pure mirroring. First-hand continuation, caught by this round's watch:

| Time | File | sha16 (new) | vs HEAD | Class |
|---|---|---|---|---|
| 12:36:38.882 | 41H3 | `484b1c94ac0bc4c9` | ≠ `8d910ce6` (landed) | new content |
| 12:36:38.910 | 50 | `6b3e5ef8dd9a2792` | ≠ `4c3c37cb` (landed) | new content, then REVISED |
| 12:37:49.792 | 71 | `54527b1a90360c79` | ≠ `30ed5d7f` (landed) | re-write of the H-relayed content (same sha) |
| 12:37:50.120 | 50 | `7f7b9fe5aba8589a` | ≠ HEAD | second revision ~70 s after its first |

**Character of the new edits (diff vs HEAD, quarantined copies):** prose-polish
class — sentence merges in §7/prerequisite lists (41H3, 50), a glossary-row removal
(71, the "binder" row). Accessibility-agent micro-edits; no math-content change
observed this round. Still UNVERIFIED bytes — never landed unreviewed.

**Quarantine protocol (this round, standing recommendation):** any intro file whose
sha ≠ HEAD bytes AND ≠ the landed lane-verified sha = NEW ghost content ⇒ copy to
`/tmp/ghost-quarantine/<ts>/<file>` (never into main/`research/`), one log line in
`/tmp/ghost-quarantine/quarantine.log`. This preserves potentially-useful
prior-session fixes for OPTIONAL lane verification later (a lane may diff a
quarantined copy and adopt specific edits through the normal verified-fix flow)
without ever landing unverified bytes. /tmp is ephemeral — H rescues the quarantine
tree + log into the record (e.g. under `external-doc/` or a committed evidence dir)
if the user wants it durable.

**This round's quarantine manifest (4 copies, 3 files):**
`20261121T123732/` = {41H3 @484b1c94, 50 @6b3e5ef8}; `20261121T123800/` = {71
@54527b1a}; `20261121T124020/` = {50 @7f7b9fe5}. Watch cadence: start + end of the
unit only (no poll loop); snapshot log `/tmp/ghost-gate.log` (3 snapshots:
12:33:43 smoke, 12:37:32 baseline, 12:40:10 end).

**Containment implications:** restores at gates remain the mechanism, but the
idempotence exit is no longer a terminal state — the ghost keeps producing deltas on
its own fix loop. Until the user decides on the stray host, expect recurring
DIRTY-VS-HEAD signals on intro stems with bytes ≠ landed; each is quarantine
material, and H's restore stays zero-corruption (HEAD bytes are the verified set of
record).
