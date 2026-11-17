# AGENTS-ITER4-DRAFT — proposed Iteration-4 addendum for AGENTS.md (E-block)

**DRAFT-FOR-REVIEW — nothing here applies until the orchestrator approves at launch; H
applies under launch authorization (AGENTS.md is not edited by this lane).**

Lane R8, 2026-11-16 (review-phase queue 4). Modeled on `research/AGENTS-C2-DRAFT.md`
(same discipline: placement notes in brackets, AGENTS.md's terse style, every fact cited
to an on-disk artifact). Backing record: `research/feasibility/iter4-donor-unblock-plan.md`
(§5 runner kit, §8 first-48h approval packet).

---

## Block E1 — [append to "Lean verification via Modal":]

- Substrate update (2026-11-16): the xyz route is viable again but lands on the Modal
  workspace `donniexyz888`, which is **cache-less** (no shared image-layer history); the
  doz CLI (`/home/doz/dozenv/bin/modal`, workspace `semraker`) is the **continuity
  default** — all Cycle-2 layers, volumes and warm apps live there. All wrappers patched
  2026-11-16 to `MODAL_USER=doz` default with the xyz override kept
  (`feasibility/probe/run_probe.sh`, `pilots/32/run_pilot.sh`; dual-branch shape of
  `run_axcheck.sh`). New apps must keep image `run_commands` TEXTUALLY IDENTICAL to the
  shared recipe so layers stay shared across apps (R8 §5b).
- Iteration-4 runner template (staged-unrun, jointly owned H+R8, R8-reviewed PASS):
  `feasibility/probe/run_iter4_probe.sh` + `iter4_probe.py`, app `crossmath-iter4-probe`
  — the pilots/71 pattern with the probe-convention prefix broadened to
  `("P0", "Probe")`, env-overridable `MODAL_BIN`, SPEC 2cpu/4GB + `@telemetered` +
  `LEAN_NUM_THREADS=2`, staged-dir `modal_telemetry` import. No new axcheck app: the
  existing kit (`axcheck_probe.py`/`make_axcheck.py`, `m4b_donor_axcheck.py`) covers
  iteration-4 (no new donor is chartered to be BUILT).
- First-48h runs go through the per-run approval cards in
  `feasibility/iter4-donor-unblock-plan.md` §8 (command, app, class, duration @SPEC,
  telemetry path, abort condition; approval is per-run and does not carry over).
- Modal incident protocol (outages/overruns): ≤4 artifact-cache retries then
  seed-and-build (`_seed_mathlib`, `gprobe.py`); `[tele]` OVER on `mem` with flat `anon`
  on mathlib-heavy elaboration is the inherent mmapped-olen reading (G7b measured fact),
  not an escalation trigger — investigate `anon` growth first (AGENTS.md guideline 3);
  log tails from outage windows are suspect until re-verified; long builds >~40 min run
  detached (`setsid nohup` + `modal run --detach`), >~2 h use the `g7_layers.py` chunk
  recipe. Pointer: R8 §5b + `RESUME-BRIEF-C2.md` §Protocol.

## Block E2 — [extend the G-series bullet in "Cycle-2 conventions" (or its Iteration-4 successor):]

- G-series staged (2026-11-16, ALL approval-gated, none run)
  *[SUPERSEDED 2026-11-17, wave-2 events: G9 RAN — elaborated 0 errors (REPORT-INPUTS-ITER4
  §1 22-T2a row; its 2 probe-stub sorries are the G1 checkpoint's +3 re-baseline class
  with G10's 1); G11/G12 RAN — PASS triad-clean, statement-binder class RELEASED
  (`logs-g/run35-g11-fix.log`; §10.7 + donor-map §"G11/G12 verdict"); G10 remains
  SHELF/unrun as designed]*: **G9**
  `ProbeG9_StrongPNT.lean` (R8) — upstream StrongPNT binder transcription, mathlib-only,
  rides the `run_gprobe.sh probe` auto-glob; **G10** `ProbeG10_PhyslibRefresh.lean` (R8)
  — physlib-refresh shelf-probe, in-tree via the new `g10` mode, skip-set-excluded from
  probe mode; **G11/G12** `ProbeG11_OAI_SiegelZeros.lean` /
  `ProbeG12_OAI_PiExponent.lean` (lane R6) — OAI donor-pin probes (G7b precedent),
  skip-set-excluded, **their runner modes are owed by R6** (g7-style; until wired they
  must not ride any batch) *[SUPERSEDED 2026-11-17: the `g11` mode IS wired —
  `run_gprobe.sh g11` + `gprobe.py`, volume `crossmath-g11-tree`; runs 33–35 executed]*.
  Numbering coordination: G9/G10 = R8, G11/G12 = R6.

## Block E3 — [amend the `PrimeNumberTheoremAnd` watchlist bullet in "Sibling resources":]

- T2-trigger evaluation note (2026-11-16): mathlib AT OUR PIN already carries
  `Chebyshev.psi` + the scoped `ψ` notation (`Mathlib/NumberTheory/Chebyshev.lean:70/:74`),
  `ArithmeticFunction.vonMangoldt`
  (`Mathlib/NumberTheory/ArithmeticFunction/VonMangoldt.lean:66`), and PNT-AP-class
  content (`Mathlib/NumberTheory/LSeries/{PrimesInAP,Dirichlet}.lean`) — so (i) the 22-T2a
  StrongPNT binder transcription is pure-mathlib (G9; upstream `ChebyshevPsi` maps onto
  mathlib's own `Chebyshev.psi` — the only delta), and (ii) mathlib itself absorbing
  PNT-AP/Dirichlet-L content WEAKENS the upstream-registration case when T2 is next
  evaluated (evaluate against mathlib-on-pin first, upstream second).
- Donor-map correction (R6 rg + R8-verified, 2026-11-16): openai-math's
  `lake-manifest.json` declares **PrimeNumberTheoremAnd** (@ `c39a7511`, :64–:73) AND
  **TauCeti** (@ `3bed7e37`, :194–:203) as dependencies — importable inside OAI
  donor-pin builds. New route class **"PNT+ via OAI manifest import"** for any FB-2-class
  explicit-formula consumer; weakens the upstream register-and-port case further (third
  datapoint). Neither entry was in `novelty/pntplus-glue-as-donor.md` /
  `novelty/axiommath-as-donor.md` — correction of record:
  `feasibility/iter4-donor-unblock-plan.md` §3 addendum.

## Block E4 — [extend the donor-hygiene bullet in "Cycle-2 conventions":]

- Donor-hygiene gate — iteration-4 application: the two NEW OAI donors (Siegel-zeros,
  π-exponent; R6's G11/G12) pass through the SAME gate as ZetaZerosV2/G7b did — on-pin
  `#print axioms` of the consumed chain at the donor's own pin is the proof; comparator
  configs/READMEs are claims. G11/G12's audit verdicts ARE the gate records; no
  consumption of either donor before its verdict line lands
  *[discharged 2026-11-17: both verdicts LANDED PASS — consumption gate open at the
  statement-binder class (run35; §10.7; build-dependency ban stands)]*. Same rule for
  any future built donor (hEχ/zeta23 Theorem-E included — see R8 §8 card 9's abort
  condition).

---

*Sources backing every line of E1–E4: `feasibility/iter4-donor-unblock-plan.md` §5/§8;
`feasibility/probe/{run_probe.sh,pilots/32→run_pilot.sh}` (patched 2026-11-16);
`feasibility/probe/{run_iter4_probe.sh,iter4_probe.py,gprobe.py,run_gprobe.sh}` and
`ProbeG{9,10}*.lean`; R6's `ProbeG{11,12}_*.lean` headers; encore mathlib checkout
(`Mathlib/NumberTheory/{Chebyshev.lean:70/:74,ArithmeticFunction/VonMangoldt.lean:66,
LSeries/PrimesInAP.lean,LSeries/Dirichlet.lean}`); upstream raw fetch 2026-11-16
(`PrimeNumberTheoremAnd/StrongPNT.lean`, toolchain v4.35.0); `RESUME-BRIEF-C2.md` §Protocol;
`qa/iter4-review/r5-iteration4-backlog.md` §14.*

---

# Wave-2 amendments (apply at close, user-gated) — lane A1, 2026-11-17

**DRAFT-FOR-REVIEW, same discipline as E1–E4: nothing here applies to AGENTS.md until
the user approves; these five were MINTED BY USE during wave 2 (2026-11-17) and the
wave's records are the authority cited. Terse apply-candidate text, not prose.**

## Block E5 — Modal route ruling chain (2026-11-17) [append to E1's substrate bullet]

- Route ruling (orchestrator, 2026-11-17, + H relay): **doz CLI PRIMARY** for
  warm-layer apps — all shared image layers/volumes live on workspace `semraker`;
  **xyz for new/fallback only** (`donniexyz888` is cache-less; `sudo -n -u xyz`
  re-verified live but carries no layer history). Runners record the ruling in their
  provenance header line. Records: `pilots/32/logs/run12-crossing-existence.log:1`,
  `pilots/ff-ez4/logs/p0-run1.log:1`, `pilots/zzv2-lam/logs/p1-run3.log:2` ("xyz
  fallback verified live, unused"); `RESUME-BRIEF-ITER4.md` §Substrate (env-fact
  correction 2026-11-16/17).

## Block E6 — the taskset rule [supersedes any `-j` guidance in Modal guidelines]

- **lake @ v4.36.0-rc2 has NO `-j` flag**; the working CPU cap for build phases is
  **`taskset -c 0,1 lake build …`** — supersedes the earlier "-j 2 on future build
  runs" note (zeta23e §10.5). LEAN_NUM_THREADS=2 still caps elaboration only; the
  lake fetch/update phases remain uncapped (their git+zstd bursts are the documented
  OVER class when they exceed one interval — investigate, never upgrade). Records:
  `pilots/zzv2-lam/logs/p1-run3.log:2` (the finding, run-1) and `:180` (burst
  classification); `qa/iter4-review/r3-verification-tables.md` §10.16 telemetry
  class note (the supersession statement).

## Block E7 — file-funnel rulings [extend "Cycle-2 conventions" successor]

- **`qa/iter4-review/r3-verification-tables.md` edits funnel through the verification
  lane ONLY** — landing lanes deliver §10-format row blocks in their own pilot
  records; the verification lane re-verifies every citation on disk, renumbers to the
  live lineage, and folds (three wave-2 mis-appends to stale baselines/wrong files
  were recovered this way: §10.10, §10.11, §10.16 merge-provenance notes).
- **REPORT-INPUTS files are H-shepherded surgical hand-edits**: lanes audit and
  deliver itemized correction lists on disk (e.g.
  `qa/iter4-review/a1-reportinputs-corrections.md`); H applies verbatim, dated. No
  lane edits REPORT-INPUTS-* directly.

## Block E8 — worktree/staleness protocol [extend "Layout"/protocol block]

- One detached worktree per lane (`worktrees/agent-NN`); **lanes never commit — they
  report, H commits exact-file batches** (RESUME-BRIEF §Protocol 2, unchanged).
- **Check-before-verbatim-copy**: before copying a lane's copy of a SHARED file
  (tables, ledgers) into the lineage, H checks it against the owning lane's live
  version — a stale-baseline copy is never pasted over the live file; the owning lane
  takes the block, re-verifies, renumbers, folds. **Fast-forward exception**: if the
  worktree copy is byte-identical to the live file's last-committed state plus purely
  additive tail content, H may fast-forward the tail. (Authority: the §10.10/§10.11/
  §10.16 recovery chain + H's commit log 2026-11-17.)

## Block E9 — probe-convention classes (as actually used, wave 2) [extend G-series bullet]

- **Statement rungs: zero-sorry-by-construction PREFERRED** — Prop-def convention
  (`MasterIdentity.lean` idiom), the elaboration IS the evidence (wave-2 exemplars:
  74-P0 "sorry class EMPTY"; 75-N2-P0 "ZERO-SORRY BY CONSTRUCTION"; ff-ez4-P0 zero
  tokens). **Declared sorry class ONLY for donor-transcription probes** (statements
  copied from a donor tree that cannot be imported; wave-2 exemplars: G9/G10's
  sorry'd donor transcriptions — the 2026-11-17 G1 checkpoint's +3 re-baseline
  class). **P0/probe files are NEVER Step-B axcheck stages and never get TARGETS
  rows** (C2 precedent, re-affirmed by the zzv2-P0 ruling adopted at
  FINAL-SWEEP-PLAN-ITER4 §7a + §10.10/§10.14/§10.15).
- Records: `pilots/74/74-P0-record.md`, `pilots/75/N2-P0-record.md`,
  `pilots/ff-ez4/P0-record.md`, `ProbeG{9,10}_*.lean` headers,
  `qa/iter4-closeout-gates.md` §MID-WAVE CHECKPOINT (G1 delta itemization),
  `feasibility/probe/FINAL-SWEEP-PLAN-ITER4.md` §7a.

*Wave-2 amendments cite their originating records inline (per block); no separate
footer. — lane A1, 2026-11-17.*
