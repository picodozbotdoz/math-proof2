# AGENTS.md substrate-note amendment — DRAFT (user-gated; 2026-11-21)

**STATUS: DRAFT ONLY.** AGENTS.md is user-owned; no lane edits it. This file is the
text the orchestrator offers the user; it applies only on an explicit user yes. The
never-applied 2026-11-17 correction patch (backup
`agent-01.carry/2026-11-21-resume/untracked/agents-substrate-note-correction.patch`)
is superseded by this draft — do not apply the old patch (its routing ruling predates
the reconciled doz-PRIMARY chain).

## Current text of record (AGENTS.md, "Substrate note", recorded 2026-11-13)

> - Substrate note (recorded 2026-11-13): `sudo -n -u xyz` is blocked in this
>   environment; runners fall back to the doz CLI directly — `MODAL_BIN=
>   /home/doz/dozenv/bin/modal` (in use by `pilots/71/run_pilot.sh:11`);
>   `run_axcheck.sh` DEFAULTS to `MODAL_USER=doz` (canonical protocol:
>   `research/RESUME-BRIEF-C2.md` §Protocol 3). The xyz staging pattern
>   (world-readable `/tmp/crossmath-*-stage/`) still applies when xyz is available.
>   Long builds (> ~40 min) use `modal run --detach` from a `setsid nohup` wrapper so
>   they survive the session (G7b lesson; `feasibility/probe/run_gprobe.sh g7`,
>   Volume `crossmath-g7-tree`).

## Evidence basis

- 2026-11-13: xyz blocked (the note above).
- 2026-11-17: xyz live — client 1.6.3, workspace `donniexyz888`, no crossmath warm
  layers, concurrent foreign workloads (the unapplied correction patch; the
  dual-primary ruling of that day was later reconciled to doz-PRIMARY per
  a8-midwave-audit F1).
- 2026-11-21: xyz live again — H's probe passed today.
- No probe record between 11-17 and 11-21; treat availability as dated, not standing.
- Canonical routing today: `RESUME-BRIEF-ITER6.md` §(b)3 — doz CLI
  `/home/doz/dozenv/bin/modal` PRIMARY (it owns the warm-layer caches of every app
  family in use), Modal SPEC discipline unchanged.

## Proposed amendment (append directly after the existing substrate-note bullet)

```markdown
  **Substrate amendment (2026-11-21, user-approved):** `sudo -n -u xyz` is live again
  (probe passed 2026-11-21). Both routes are now documented: the doz CLI
  `/home/doz/dozenv/bin/modal` stays PRIMARY — it owns the warm-layer caches of every
  app family in use (per RESUME-BRIEF-ITER6 §(b)3) — and xyz (`sudo -n -u xyz
  …/xyzenv/bin/modal`, workspace `donniexyz888`, client 1.6.3 at last observation) is
  usable again as the documented fallback / brand-new-app route, with the xyz staging
  pattern (world-readable `/tmp/crossmath-*-stage/`) applying on that route. xyz
  availability has oscillated (blocked 2026-11-13 → live 2026-11-17 → live
  2026-11-21, no probe record in between), so the blocked/unblocked state above is a
  dated observation, not a standing fact: a runner that needs xyz probes it first and
  records the probe date in its run log; the doz-primary routing is independent of
  xyz state. The 2026-11-13 note's "blocked" claim is superseded as of 2026-11-21;
  its staging-pattern and detach-wrapper sentences stand unchanged.
```

## Alternative (replace the parenthetical instead of appending)

If the user prefers a minimal edit: change "(recorded 2026-11-13): `sudo -n -u xyz` is
blocked in this environment; runners fall back to the doz CLI directly" to "(recorded
2026-11-13; availability amended 2026-11-21): xyz was blocked 2026-11-13 and is live
again as of the 2026-11-21 probe — dated observation, re-probe before use; the doz CLI
remains PRIMARY". The append variant is recommended: it keeps the historical record
inline, which has been useful (three availability states in eight days).
