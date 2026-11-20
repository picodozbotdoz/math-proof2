# ITEM-13 PRESTAGE — the P2-c audit-tail fire runbook (dry-check record; NO fire performed)

Lane R3 (A6 lineage, worktree agent-07), 2026-11-20 (iteration-5 restart, unit
pre-stage). This is the CLOSE-CHECKLIST ITEM 13 execution runbook: the P2-c
audit-tail move + ONE audit fire at wave-close, **on the orchestrator's close
signal ONLY** (verification-machinery class, the iter-4 staging-fix precedent;
NOT a research grant). This document dry-verifies the staged state and the
fire instrument. **Nothing was fired, edited, or committed herein.**

## 1. Authority chain (all read-verified 2026-11-20)

- Checklist: `research/qa/iter5-close-block-skeleton.md` item 13 (lines
  120–125, orchestrator addition dated 2026-11-19): "the P2-c audit-tail move +
  ONE audit fire at wave-close (verification-machinery class; **R3 executes on
  the orchestrator's close signal**; the final park `531a9eb7…` is
  elaboration-complete 0-sorry/19 runs, rc=1 = the audit-tail namespace
  placement alone — the audit-pending note rides R1's §11 row)."
- Restart map: `research/RESUME-BRIEF-ITER5.md` §SESSION END (g)4: "R3
  close-support with the close-time audit fire pre-staged at staged sha
  `6c6a251f03eb0797` — fire = `bash research/pilots/74/stage_and_fire_p2.sh 20`".
- Tracker: `research/ORCHESTRATION-ITER5.md` R3 row (item-2b FINAL `531a9eb7`;
  item 13 assigned; R1's P2-c fold RELEASES at the final-parked row,
  audit-pending note included).
- Charter note: `research/qa/iter4-review/a3-waveclose-reopen-charter.md`
  (sha256(16) `40eee946` — the "item 2 CLOSED, two-fire history + audit-pending"
  file of record; its item-2 block: "the completion for any future fire is
  moving `end` after the 13 prints, which also releases the PENDING triad
  audit").
- Lane record: `research/pilots/74/P2-record.md` §Unit-8 FINAL ENTRY +
  §CLOSE-TIME STANDBY (worktree copy carries the latter; it rides the run-20
  evidence at H's close commit).

## 2. The staged state (shas verified 2026-11-20)

| file | sha256(16) | role |
|---|---|---|
| `worktrees/agent-07/research/pilots/74/P2.lean` | **`6c6a251f03eb0797`** | STAGED, UNFIRED (the audit-tail fix applied) |
| `cross-math-fronttier/research/pilots/74/P2.lean` (main) | `531a9eb7` | FINAL PARK of record (landed batch O, `cc1c566`; unchanged — do not touch) |
| `worktrees/agent-07/research/pilots/74/stage_and_fire_p2.sh` | `5176aa83` | fire instrument (byte-identical on main) |
| `research/pilots/74/run_p1.py` (both trees) | `13c908a2` | Modal runner (byte-identical on main) |
| `research/feasibility/probe/modal_telemetry.py` (main) | `62c97b5d` | SPEC + `@telemetered` source |
| `worktrees/agent-07/research/pilots/74/P2-record.md` | `afa15d6b` | main's `aaf521b8` + §CLOSE-TIME STANDBY (uncommitted delta) |

**The edit (ALREADY APPLIED — no further file edits before the fire):** diff
main→worktree P2.lean is EXACTLY the namespace-placement move, two hunks:
delete `end CrossMath.Pilot74P1` + trailing blank at parked lines 1475–1476;
add blank + `end CrossMath.Pilot74P1` at staged line 1489. Effect: the audit
tail (staged lines 1475–1487 = nine `#print axioms` for
`mgfBound_var_sharp, t1c_sharp, famN_spectrum, famN_varK, famN_W, famN_Mdev,
famN_inClass, t4_floor_achieved, t4_not_littleO` + four `#check @…` for
`famClassMemProbe, famVarLBProbe, famTailProbe, BkClass`) moves INSIDE the
Part-P2 namespace, so the bare names resolve (run-19's 13 errors were all
`unknownIdentifier` from the tail resolving against the ROOT namespace).
Namespace map of the staged file (balanced): P1 body 116–815 (P1's own 7-print
tail inside, lines < 815), Part P2 reopened 817, closed 1489 AFTER the tail.
Zero mathematical content in the move (authoring-class, 14 lines).

## 3. The fire instrument, verified end-to-end

Command (from the worktree root, or by absolute path — the script's `SRC` is an
absolute worktree path, so the staged file is `6c6a251f` regardless of CWD):

    bash /home/doz/zcode-workdir/worktrees/agent-07/research/pilots/74/stage_and_fire_p2.sh 20

Script walkthrough (`stage_and_fire_p2.sh`, 39 lines):
- `SRC` = worktree P2.lean (absolute, line 12); `STAGE=/tmp/crossmath-74-p2-stage`
  (rebuilt fresh each call, `rm -rf` first — line 18); copies `run_p1.py` from
  the script's own dir, `modal_telemetry.py` from MAIN's
  `research/feasibility/probe/` (worktree fallback), `P2.lean` in;
  `chmod -R a+rX` (the staging pattern).
- **Sha guard** (lines 26–37): prints staged sha256(16) BEFORE firing; refuses
  (exit 3) only if byte-identical to sidecar `/tmp/crossmath-74-p2-last.sha`;
  writes the sidecar BEFORE the Modal call. **State at prestage: the sidecar is
  ABSENT** (the 2026-11-20 restart wiped /tmp) → guard will print
  `last-fired = <none>` and pass. Semantics caveat: because the sidecar is
  written pre-fire, an INFRA-failed run 20 (no verdict) would leave the sidecar
  at `6c6a251f` and a same-file re-fire would be REFUSED — a re-fire after an
  infra failure requires the deliberate `rm -f /tmp/crossmath-74-p2-last.sha`
  with the reason recorded in the run-20 log header. Do not clear it for any
  other cause.
- **Modal invocation** (line 39): `cd "$STAGE" && /home/doz/dozenv/bin/modal run
  run_p1.py --dir "$STAGE"` — the doz CLI IS hardcoded and IS the primary route
  (AGENTS.md substrate note; same CLI as runs 12–19). **No fix needed.**
- Raw log: `tee /tmp/p2-run20-raw.log` — EPHEMERAL; the log-rescue step below is
  MANDATORY (the standing lesson).

Runner (`run_p1.py`, app `crossmath-pilot-74p1`) conformance:
- **SPEC**: `@app.function(image=image, **SPEC, …)` with `SPEC =
  {"cpu": 2.0, "memory": 4096}` from `modal_telemetry` — AGENTS.md defaults. ✓
- **LEAN_NUM_THREADS=2**: `CAP = [modal.Secret.from_dict({"LEAN_NUM_THREADS":
  "2"})]` (the nproc>cpu lesson). ✓
- **Telemetry**: `@telemetered` — `[tele]` samples every 60 s + final
  `[tele] SUMMARY`; any `[OVER]` line triggers the investigation step, never a
  bigger spec. ✓
- Ephemeral `modal run`, no volume, no secret beyond CAP, no deploy; image
  layers textually identical to the gprobe/pilot-73/74 lineage (warm, ~1 min
  walls on runs 17–19); mathlib `ff2494ea`, toolchain `v4.36.0-rc2`,
  `lake exe cache get` oleans (8710 at run 19; CACHE-MISS abort guard in the
  runner). `lake env lean` only — NO build phase, NO local lean ever.
- Verdict rule: `OK` iff rc=0 ∧ zero `": error"`/`error(…)` lines ∧ zero
  sorry-warnings; FULL error contexts printed (up to 120); axioms lines
  extracted (`'…' depends on axioms:` / `'does not depend on any axioms'`).
  `#check` output and the `Note: … linter` line are info-class — not errors,
  do not affect rc.

## 4. Expected verdict pattern (the GREEN shape to certify)

Based on run 19 (`logs/p2c-run19.log`, the direct baseline — same file minus
the end-move):

    [sha-guard] staged sha256(16) = 6c6a251f03eb0797        <- must read EXACTLY this
    [sha-guard] last-fired sha256(16) = <none>
    [p74p1] staging ['P2.lean']
    [tele] start run: spec cpu=2.0 mem=4096MB nproc=18 interval=60s
    [p74p1] mathlib rev ff2494ea5e43 / oleans present: 8710
    === P2.lean
    {'P2.lean': 'OK'}
    [p74p1] P2.lean: OK
    ---- axioms ----
    'CrossMath.Pilot74P1.t1a_floor'    … [propext, Classical.choice, Quot.sound]   (P1's 7, as run 19)
    … t1b, t1b_window, t1c, cert_pad, Bk_le_Bk_succ, t4_floor_ceiling …
    'CrossMath.Pilot74P1.mgfBound_var_sharp' … [propext, Classical.choice, Quot.sound]   (9 NEW —
    … t1c_sharp, famN_spectrum, famN_varK, famN_W, famN_Mdev, famN_inClass,          the Part P2
    … t4_floor_achieved, t4_not_littleO …                                              audit releasing)
    [p74p1] SUMMARY /   P2.lean: OK
    [tele] SUMMARY …

- ZERO `: error(` lines anywhere; sorry=0; wall ≈ 1 min warm.
- **Certification condition:** all nine Part P2 theorem lines present and
  TRIAD-ONLY (`[propext, Classical.choice, Quot.sound]` exactly — mgfBound_var_sharp
  and t1c_sharp were triad-verified at G2 run 11, so any deviation is a
  red flag). GREEN ⇒ the PENDING triad-audit status releases; fold row becomes
  "G2 GREEN + G3 PASS + P2-c triad-verified at run 20 (audit tail in-namespace)".
- The four `#check @…` lines elaborate as info (visible in the output tail, not
  in the axioms section) — surface confirmation only.

## 5. NOT-GREEN handling (binding: ONE fire, no loop)

Item 13 grants exactly ONE audit fire. If rc≠0 or any error line appears:
1. Classify every error line by location: (a) audit-tail lines again (the move
   did not take — check the staged sha printed by the guard vs `6c6a251f`);
   (b) body lines (would CONTRADICT run 19's zero-body-error finding — treat as
   a substrate/verification anomaly, escalate, do not fix-and-refire);
   (c) infra (TIMEOUT / CACHE-MISS / Modal error — no verdict; see the
   sidecar-clear contingency in §3 for a re-fire decision, which goes through
   the orchestrator, not unilateral).
2. Record the verdict honestly in the run-20 log header + P2-record addendum;
   the fold row stays "audit-pending" exactly as the charter's status of record.
3. Relay to the orchestrator; NO second fire without a fresh grant.

## 6. Post-fire steps (in order, worktree side; H commits per hold-all-commits)

1. Rescue the raw log with a provenance header (run-19 format) to
   `worktrees/agent-07/research/pilots/74/logs/p2c-run20.log` — header fields:
   raw modal run, pilot-74 P2-c AUDIT-TAIL FIRE (close-checklist item 13,
   verification-machinery class; the pre-staged end-move on the final park
   `531a9eb7`); date; producing lane R3 (worktree agent-07); command; staged
   sha `6c6a251f03eb0797`; VERDICT line; telemetry line; the standing
   no-sorry/axioms notes. /tmp copies are ephemeral — this step is not optional.
2. Append the run-20 addendum to `research/pilots/74/P2-record.md` (worktree):
   the audit-tail move executed + fired; the verdict; the released-or-held
   audit status; shas (`6c6a251f` fired, `531a9eb7` park of record, G2 state
   `49b808f3` preserved in `logs/p2-runs1-11.log`).
3. Relay the verdict to the orchestrator (the R1 fold + skeleton item-13 fill
   consume it; if GREEN, the dossier-74 amendment's "at honest proof-status"
   phrase for the tightness set flips to "landed" per the charter's
   fold-that-follows — H's splice, R3 only reports).
4. Stand down; no further fires this iteration.

## 7. GO/NO-GO checklist (state at 2026-11-20 prestage)

| # | check | verdict |
|---|---|---|
| 1 | Staged worktree P2.lean sha = `6c6a251f03eb0797` (matches §(g)4 + §CLOSE-TIME STANDBY) | **GO** (sha256sum verified) |
| 2 | Staged-vs-park diff = EXACTLY the end-move (2 hunks, 14 lines, zero math content) | **GO** (diff verified) |
| 3 | Namespace balance: opens 116/817, ends 815/1489; tail 1475–1487 inside Part-P2 ns | **GO** (grep-verified) |
| 4 | Main park `531a9eb7` untouched; run-19 log + record aaf521b8 landed (batch O `cc1c566`) | **GO** (verified) |
| 5 | Plan documented: charter `40eee946` item-2 block + P2-record §Unit-8/§CLOSE-TIME STANDBY + skeleton item 13 — edits, anchors, command, expected pattern all explicit | **GO** (all read) |
| 6 | Script: stage paths correct (`SRC` absolute→worktree; STAGE fresh); sha guard functional; sidecar state known (absent → `<none>`, passes; pre-write semantics + infra-fail contingency recorded §3) | **GO** (with the §3 caveat noted) |
| 7 | Modal CLI = `/home/doz/dozenv/bin/modal` hardcoded — the designated primary | **GO** (no fix needed) |
| 8 | SPEC cpu=2.0/mem=4096 + LEAN_NUM_THREADS=2 + @telemetered every run | **GO** (SPEC literal + CAP secret verified) |
| 9 | Log destination + provenance-header rescue path defined (§6.1) | **GO** |
| 10 | ONE-fire discipline + NOT-GREEN escalation path defined (§5) | **GO** |
| 11 | Close signal received from the orchestrator | **NO-GO until signal** (hold — the wave-close fold-once set R6 salvo / R5 eta pair / R8 M3 must drain first) |

Fire precondition at execution time (assert live, before accepting the run):
(a) orchestrator close signal in hand; (b) `sha256sum` of worktree P2.lean
still prints `6c6a251f03eb0797` AND the guard's staged-sha line agrees;
(c) `modal app list` (doz CLI) shows no orphan 74p1 run still alive (§(h)
restart hygiene). Abort on any mismatch — report, do not adapt.

— lane R3 (A6 lineage, worktree agent-07), 2026-11-20. PRESTAGE ONLY: zero
Modal calls, zero file edits (this runbook excepted), zero commits. Standing
by for the close signal.
