# Introduction-set landing runbook — the R6 half + INDEX flip (2026-11-21)

Author: the general helper lane (worktree agent-01). H executes from this file when
R6 drains. **State-annotated 12:36 +08 — partially overtaken by events, by design:**
the R7 half + registry + marker deletion ALREADY LANDED at `9cadcbe` (12:32:14; 5
fixed + 3 PASS + registry README `f264d6b0`; marker `README-INTRODUCTION_IS_POST_REVIEW.md`
superseded+deleted). What remains: **R6's verified fixes + the INDEX UNVERIFIED-clause
flip** (clause still present, grep-verified at 12:33).

## Ghost-writer interaction (read first)

The prior-session host's mirror is ACTIVE and tracks agent-06's outputs
(`h-ghost-writer-20261121.md`): as of 12:34:04 main's five R6 files are ghost-staged
byte-identical to agent-06's current bytes. Consequences for this runbook:

- The landing commit is ALSO the containment exit — once agent-06's bytes are in
  HEAD, the ghost's writes become idempotent no-ops (status stays clean).
- Do NOT trust main working-tree bytes as the source of record: copy from agent-06
  (step 2), then sha-verify. Currently the two coincide; that is evidence, not
  permission.
- Snapshot + hardened gate at every step (steps 1, 4); bursts observed at 12:24:43 /
  12:25:28 / 12:32:43 / 12:34:04, lagging agent-06 writes by ~1–8 min.

## Step 0 — Preconditions (on R6's drain report)

1. R6's report in (verdicts for every file it touched); agent-06's drain-time set
   enumerated fresh:
   `git -C /home/doz/zcode-workdir/worktrees/agent-06 status --porcelain`
   As-of-drafting (12:34): `01`, `41H3`, `42`, `50`, `71` (five modified; the queue
   brief's "9" anticipated growth — trust the drain-time enumeration, not either
   count). Any file NOT in R6's verified set must be worktree-restored by R6 first
   (H: `git -C worktrees/agent-06 restore <file>` if needed) so the copy list =
   verified fixes only.
2. Main gate: `git -C /home/doz/zcode-workdir/cross-math-fronttier status --porcelain`
   — expect intro-dirty files ONLY from the ghost-mirror set (all must sha-match
   agent-06, per the ghost note §2 sweep pattern). Anything else dirty ⇒ reconcile
   BEFORE starting.

## Step 1 — Snapshot the gate

`bash research/qa/ghost_snapshot.sh` (or with H's persistent log path). Every
`[DIRTY-VS-HEAD]` line must be an R6-stem file whose sha16 == agent-06's byte for
that file. If any DIRTY line mismatches agent-06 ⇒ restore it
(`git -C main restore research/articles/introduction/<file>`) and re-snapshot.

## Step 2 — Exact-file copy list (agent-06 → main, same relative path)

For each file F in R6's drain-time verified set (as-of-drafting illustration, five):

```
cp /home/doz/zcode-workdir/worktrees/agent-06/research/articles/introduction/01-inertial-defect-master-identity.md \
   /home/doz/zcode-workdir/cross-math-fronttier/research/articles/introduction/
cp .../41H3-two-fiber-rank-closure.md  .../42-quadratic-dedekind-zeta-zero-proportions.md \
   .../50-zero-free-regions-cannot-move-certificate-constants.md .../71-splane-zeta-curve-dictionary.md  (same pattern)
```

## Step 3 — INDEX row flip (row at INDEX.md:454, landed `aac8e20`)

Old field 3 (verbatim, the part that changes):

`(accessibility pass resumed post-referee-review; **UNVERIFIED at landing — R6/R7 lane verification in flight, fixes land on verdicts**)`

New field 3:

`(accessibility pass resumed post-referee-review; **VERIFIED 2026-11-21 — R6+R7 lane verification: R7's batch-B landed at `9cadcbe` (5 FIXED + 3 PASS + registry README `f264d6b0`, marker retired), R6's fixes landed at `<this commit>`**)`

Old field 1 tail (inventory, verbatim): `…+ `README-INTRODUCTION_IS_POST_REVIEW.md` (the one-line marker: introduction documents are generated after review, never during the research loop) + the 17 same-stem…`

New field 1 tail: `…+ `README.md` (the directory registry, `f264d6b0` — carries the standing policy verbatim: introduction documents are generated after review and are not created during the research loop; folded from the retired marker) + the 17 same-stem…`

## Step 4 — Verification gate (spot-sha + hardened staging)

1. Spot-sha every copied file: `sha256sum` on main's copy == agent-06's source
   (sha256-16; as-of-drafting expectations: `01`=51d461ee4038cab7,
   `41H3`=8d910ce623d9fae4, `42`=55846eb9b4b035bd, `50`=4c3c37cbf9fa27ac,
   `71`=30ed5d7f04d2edae — RE-DERIVE at drain, agent-06 may have revised).
2. Stage EXACTLY: the copied files + `research/INDEX.md` (never `git add -A`);
   `git diff --cached --stat` must show exactly that set — any foreign line ⇒
   `git restore --staged` it, re-verify (the ghost cannot stage, but a mid-batch
   ghost write to a copied file between copy and add WOULD show here as an
   unstaged-then-staged mismatch — the copy==sha check in 1 ran before; re-run the
   sha check if >2 min elapsed since).
3. `git status --porcelain` post-add: intro dir clean-modified only as staged.

## Step 5 — Commit + post-checks

Message template (fill N = file count, shas as verified):

```
Iter6: R6's introduction batch-A verified half landed (N FIXED + M PASS <verdict summary>) — fixes from agent-06 (spot-sha'd worktree copies; the ghost-mirror bytes idempotent from this commit: containment exit per h-ghost-writer-20261121) + INDEX row UNVERIFIED→verified (companion set fully verified: R7 half at 9cadcbe)
```

Post-commit: `bash research/qa/ghost_snapshot.sh` once more — expect ALL `[ok]`; a
`[DIRTY-VS-HEAD]` on an R6 stem with bytes ≠ HEAD means agent-06 revised again
(new output, normal flow) — otherwise the flap has self-extinguished.

## Already-executed steps (for the record; do not redo)

- R7 copy + registry README + `git rm` of the marker: done at `9cadcbe` (the
  registry's preamble carries the policy line verbatim and already documents the
  marker's supersession).
- The aac8e20 INDEX row creation, the drift reconciliation, and the R2 quota
  deliverables' missed-add closure (`5e4f173`).
