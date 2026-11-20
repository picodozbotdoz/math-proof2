# 12-CORE day-1 STAGING — the iter-6 launch-order artifact set (STAGED, UNFIRED)

Lane R3 (worktree agent-07), 2026-11-20, per the orchestrator's iter-6 day-1 staging
unit. The 12-core is a day-1-STAGED item on the iteration-5→6 pattern ("launch order
day-1 items STAGED, unfired"): everything below sits on disk ready to fire, and fires
ONLY on the iter-6 orchestrator's day-1 signal. **Zero fires were made in this unit.**
The item-13 override (wave-close audit fire) remains unchanged and absolute — it
preempts any 12-core work.

## 1. The staged artifact set (paths + shas)

| file | sha256(16) | role |
|---|---|---|
| `research/pilots/12/CORE.lean` | `5a9b19b4563b6612` | the day-1 fire artifact (statement scaffold) |
| `research/pilots/12/run_core.py` | `55e541eafc43a704` | Modal runner, app `crossmath-pilot-12core` |
| `research/pilots/12/stage_and_fire_core.sh` | `7546ffd3dfd046e9` | sha-guarded fire script |
| `research/pilots/12/core-charter-input.md` | `5f8facd4544f92a9` | the charter scoping this scaffold implements |
| `research/pilots/12/P0-record.md` | `3f88feb897571e30` | the P0 GREEN evidence base |
| `research/pilots/12/logs/p0-runs1-2.log` | `46abd882b5484e78` | P0 raw evidence |

All worktree-side (`/home/doz/zcode-workdir/worktrees/agent-07/`); H commits.

## 2. CORE.lean — what it is (built by guarded splice from the P0 GREEN surface)

Base = `P0.lean` `3d924056ed4c3e2c` VERBATIM (the P0 run-2 GREEN statement surface:
verbatim donor ports incl. `Claim.Theorem_17`'s freed `MM` slot + the Sec-4
trade-off block; the frozen-route restatements; `WordRamMMData`/`EpsData`/
`route15/16_MMgeneral`/`route16_symbolic`; the top-level OAI block; `flagship_shape`;
the F5 consumer `balancePoint_monotone_shape`), header re-dated to the day-1 staging,
PLUS Part 4 — the three core-target stubs:

1. `epsParam_data : EpsData` — component (b): the explicit ε construction target
   (the closed form to be built from the Sec-4 data; the P0 pinned only the binder
   properties, with the CORRECTED `strict_anti` decreasing form).
2. `parametric_main (M) (W) (h16) (h17) : Claim.Theorem_19_explicit M
   (epsParam_data.ε W.ωb) (epsParam_data.e W.ωb)` — the composition target: for
   EVERY word-RAM MM in the band, the explicit theorem at the ε-fiber of its
   exponent (the dossier core deliverable).
3. `epsParam_frozen_fiber_claim : epsParam_data.ε (Real.logb 2 7) = 0.00175` —
   component (d): the frozen-fiber numeric match (validator class
   `sec4_epsStar_numeric`).

**Expected sorry count = 10** (7 inherited P0 stubs at :194/:202/:237/:244/:257/:387/
:411 + the 3 core stubs at :424/:433/:440). Scope tree verified balanced (2 namespace
opens / 2 ends, single-level reopen after the top-level OAI block — the run-1
dupNamespace class is pre-empted). Day-1 GREEN shape: `PROBE-OK rc=0 errors=0
sorry=10`. As proof work lands, the count FALLS; the proof-complete shape is plain
`OK` (0 sorry) — then the donor-hygiene gate (triad check) applies to every consumed
theorem per AGENTS.md Cycle-2 conventions.

## 3. The staged firing instruction (day-1 signal required)

    bash /home/doz/zcode-workdir/worktrees/agent-07/research/pilots/12/stage_and_fire_core.sh 1

- Pre-fire assertions (live, before accepting the run): (a) iter-6 day-1 signal in
  hand; (b) `sha256sum …/CORE.lean | cut -c1-16` still prints `5a9b19b4563b6612` AND
  the guard's staged-sha line agrees; (c) `modal app list` (doz CLI) shows no orphan
  `crossmath-pilot-12core` run; (d) item-13/wave-close state is not live (the
  override preempts this fire).
- Expected GREEN output: `[sha-guard] staged sha256(16) = 5a9b19b4563b6612` →
  `[p12core] staging ['CORE.lean']` → `[tele] start run: spec cpu=2.0 mem=4096MB` →
  `[p12core] CORE.lean: PROBE-OK rc=0 errors=0 sorry=10` → `[p12core] SUMMARY` →
  `[tele] SUMMARY … OVER=0`; wall ≈ 30–60 s warm.
- NOT-GREEN handling: classify errors by site (donor-port region vs Part 4 stubs vs
  infra); statement-scaffold defects are fixed assertion-guarded and re-fired per the
  verify-fire discipline (sha guard enforces the fix applied); NO proof work starts
  until day-1 statement-GREEN is on the books.
- Log rescue (mandatory, /tmp is ephemeral): provenance-headered persist to
  `research/pilots/12/logs/core-run1.log` (the `p0-runs1-2.log` header format);
  record + relay to the orchestrator; H commits.
- Sidecar state at staging: `/tmp/crossmath-12-core-last.sha` ABSENT (fresh guard —
  prints `last-fired = <none>` on day-1). Standing caveat (as item-13 §3): the
  sidecar is written BEFORE the Modal call, so an infra-failed day-1 run needs a
  deliberate, recorded `rm -f /tmp/crossmath-12-core-last.sha` before any re-fire
  decision.

## 4. Dry-verification record (per the item-13 prestage checklist pattern)

| # | check | verdict |
|---|---|---|
| 1 | `run_core.py` parses; app `crossmath-pilot-12core`; ephemeral `modal run`, no volume/secret beyond CAP, no deploy | **GO** (ast.parse + greps) |
| 2 | SPEC `cpu=2.0/memory=4096` via `modal_telemetry.SPEC`; `LEAN_NUM_THREADS=2` via CAP secret; `@telemetered` every run | **GO** (wiring greps :30/:31/:64/:65) |
| 3 | Image recipe byte-identical to the 74 lineage in all OPERATIVE strings (`diff` vs `run_p1.py` image blocks: one Python comment line only — layer cache unaffected) | **GO** (warm layers) |
| 4 | Widened sorry-filter (both `'sorry'` and `` `sorry` `` forms) inherited from run_p0 | **GO** (the P0 run-2 fix) |
| 5 | `stage_and_fire_core.sh`: `SRC` absolute → worktree `CORE.lean`; fresh `STAGE=/tmp/crossmath-12-core-stage`; copies `run_core.py` + `modal_telemetry.py` (main-first, worktree fallback — both exist, sha `62c97b5d`); `chmod -R a+rX` | **GO** (bash -n + operative-line greps) |
| 6 | Sha guard: prints staged sha pre-fire; refuses byte-identical-to-sidecar; sidecar ABSENT at staging (fresh); pre-write semantics + infra-fail contingency documented (§3) | **GO** |
| 7 | Modal invocation: `/home/doz/dozenv/bin/modal` hardcoded — the designated primary doz CLI | **GO** (line 46) |
| 8 | Raw log → `/tmp/p12-core-run1-raw.log` + mandatory provenance rescue path defined (§3) | **GO** |
| 9 | `CORE.lean`: scope tree balanced; 10 stubs at the named sites; base = P0 GREEN surface verbatim (guarded splice, 4 anchors ==1, invariants asserted) | **GO** |
| 10 | Day-1 signal received from the iter-6 orchestrator | **NO-GO until signal** (the staged-unfired hold; item-13 override absolute above it) |

## 5. Provenance

`run_core.py` = guarded-clone of `run_p0.py` `a3976f96` (7 replaces, anchors ==1,
invariants: app renamed, `[p12core]` tags, no `run_p0`/`[p12p0]` residue, image recipe
untouched). `stage_and_fire_core.sh` = guarded-clone of `stage_and_fire_p0.sh`
`a8658c4b` (11 replaces, anchors ==1, functional invariants: no `P0.lean`/`run_p0.py`/
`crossmath-pilot-12p0`/`/tmp/crossmath-12-p0` residue; doz CLI + `set -euo pipefail`
present). `CORE.lean` = guarded splice of Part 4 into `P0.lean` `3d924056` (4
anchors ==1; post-asserts: 2/2 namespace balance, exactly 10 sorry stubs). The two
guard trips during generation (invariant vs intentional provenance mentions) both
fired BEFORE write — the assertion-guarded discipline held; no partial artifacts.

— lane R3 (A6 lineage, worktree agent-07), 2026-11-20. STAGED UNFIRED; standing by
(item-13 pre-fire assertions remain first in queue on the close signal).
