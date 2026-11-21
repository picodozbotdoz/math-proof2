# R1 — G2-pool pre-staging for the Iteration-6 close (2026-11-21; PRE-STAGE ONLY, NO RUNS)

**Unit:** pre-stage the close act's G2 gate (Step-B-style axcheck batch over the
iteration's fire set). Basis: main `7d7fcdd` (worktree agent-02 ff-refreshed
`ef1e7bd → 25879dd → 7d7fcdd`, clean; local dry-run staging only — zero Modal
fires; the close act fires the batch). Feeds R7's close skeleton
`qa/iter4-review/r7-iter6-close-skeleton.md` §1 G2 (landed `2184aea`) — this note
discharges its scope/class-map [PENDING-INPUT]s. Fire-ledger base:
`qa/REPORT-INPUTS-ITER6.md` §2 (landed `8c1f305`) + the two post-ledger state
moves (eta-r4 GREEN @ `25879dd`; H4 E1 granted/in-flight per `8849ac9`).

**Ground truth at pre-stage (local dry-run, `make_axcheck.py` → /tmp stage dir):**
60 TARGETS tuple rows → **70 emitted stages** (order.txt dependency order); ALL
guards pass — the `AxPilot75_N2P1` GIT_BYTES override staged from git bytes
`7caddb3` with the sha check GREEN (override == HEAD == verified `396d8710`,
disk-verified). The skeleton's "58 rows at prep" is reconciled: 60 tuples at
`9cadcbe` too (no make_axcheck commits since) — 60 tuples ⇒ 70 stages; **the
stage count at close governs** (skeleton's own rule).

---

## 1. The iter-6 fire set (enumerated; REPORT-INPUTS §2 + post-ledger moves)

| # | fire family | state @ `7d7fcdd` | G2 surface |
|---|---|---|---|
| 1 | 12-core day-1 runs 1–3 + S-tranche runs 4–9 | GREEN of record @ CORE.lean `7e40dff4dc12b6a6` (disk == milestone sha) | **NEW row** (§3.1) — CORE.lean 13 top-level theorems, `import Mathlib` only ([WARM]); carries the DECLARED 8-sorry interface set |
| 2 | 12-core closing batch (≤5-fire GO: ChoiceSumInputs discharge + route16_MMgeneral) | **UNFIRED — R3 in flight** | re-pin hook (§4 flag F1): if it lands, the AxPilot12_CORE guard binds the landing sha (sorry-count may drop; class upgrades) |
| 3 | AL-M3 run-9 triple (P0/A1/A2) | SPLIT ⇒ PERMANENT PARK @ P0 `c6752422b49555af` / A1 `a8feb25bcd60722f` / A2 `221eb30b6debba75` (all disk-verified, unchanged post-fire) | existing rows; class map per §2 rows 3–5 |
| 4 | N2P1 re-bind axcheck (75_N2P3/N2P3e/N2P2c + chain) | ALL OK @ `6303aab` (log `axcheck-iter6-n2p1rebind-run1.log`) | existing rows re-run in the batch; override re-verified at close (skeleton's explicit check) |
| 5 | eta-r4 grant-fire-2 (+ r2/r3 regression anchors) | **GREEN strict-OK** @ eta-r2 `a9c6b59f8a769335` / eta-r3 `21fb0c4e45f88b92` / eta-r4 `285a411e48c3ad1e` (log `eta-r2-run10-eta-r3-run7-eta-r4-run5.log`, port ledger CLOSED 14-of-12–13) | **DONOR-TREE custody sub-batch** (§3.3) — `import ZetaZeros` (eta-r{2,3,4}:44/68/54) ⇒ plain stage FAILS BY DESIGN (the 42_M4b/N2-P3V2 class); verdict of record = the zzv2 log; full-coverage custody owed (skeleton G2 names it) |
| 6 | 41H3 S-rung + ship | standing GREEN @ `833dcff84309c986` | existing row AxPilot41_H3; the stage prints all 27 publics ⇒ **DISCHARGES the 16-helper AxFC custody** (0 privates per census) — note in the G2 tally |
| 7 | H4 E1 fire (R4, granted `5c7fac7`, ≤3 runs, self-contained) | **IN FLIGHT — payload not landed** (probe `H4-probe.lean` `bef92692230690f5` on main; H4.lean exists worktree-side agent-08 only at pre-stage) | **NEW row [PENDING-PAYLOAD-SHA]** (§3.2) |
| 8 | seed-prep statement sets (R4 seed-2 E2/F/G; R8 N2-completion) | banked to iter-7; NO `.lean` stubs landed beyond the probe | **NONE** — H4-probe.lean is probe-convention (NEVER a Step-B stage, plan §0); the G1 +17 class covers stubs only if landed |
| 9 | 41H3 pre-solve custody re-run (`2ea25a9`) | numpy-only, host-side | **OUT OF SCOPE by construction** (no Lean stage; skeleton G1 note concurs) |
| 10 | 72-M1 L3 re-charter | doc-only verdict BANK (`460a04bc`); no fire | **NONE** — P72M1T3 stays the declared honest-partial class @ `aed631015beb38d6` (disk-verified) |

## 2. Part (i) — the plain batch (run_axcheck.sh full set): expected class map

70 stages at HEAD. Iter-6-relevant rows (disk shas verified @ `7d7fcdd`):

| stage | file @ disk | expected class at close |
|---|---|---|
| AxPilot75_N2P1 | `396d8710` (override `7caddb3`/`396d8710`; == HEAD == verified) | OK (re-verify the triple-equality at close — the skeleton's explicit item) |
| AxPilot75_N2P3 / N2P2c / N2P3e | `f9bd28c5` / `2cca447d` / `6f6beb20` | OK (trio re-discharged `6303aab`; N2-P3V2 stays OFF-TARGETS — donor-tree, verdict of record `axcheck-n3v2-run1.log`) |
| AxPilotAL3D_P0 | `c6752422` | compile-only dep (never a verdict row; stages HEAD verbatim — the row comment's `33c75942` citation is HISTORY, the run-9 state supersedes; compiles clean per run-9) |
| AxPilotAL3D_A1 | `a8feb25b` | **CLASS UPGRADE: OK expected** (was the iter-5 close's declared cascade-FAIL; run-9 = the FIRST full A1 GREEN, all printed decls triad) — the skeleton's class-map move |
| AxPilotAL3D_A2 | `221eb30b` | **DECLARED-FAIL (M3 run-9 permanent-park class)**: stage will not elaborate (10 errors) / the 3 pureState-typed theorems print sorryAx; verdict-of-record for the clean part = `alp2-m3-run9-variant1fire.log` (`fibre_eq_of_column_closed` triad + the M0→M2 89/89 @ `61af175a` stands) |
| AxPilot41_H3 | `833dcff8` | OK — 27 prints incl. the 16 unprinted helpers (custody discharge, §1 row 6) |
| AxPilot77_T1 | `70d7e9f7` | DECLARED donor-pin FAIL (tauceti @ `d92acc5c`; verdict of record = the donor-pin run log) — unchanged |
| AxPilot42_M4b | `4499e790` (byte-stable since `4323178`) | DECLARED donor-tree FAIL by design (`import ZetaZeros`; verdict of record = `stepB-c2-m4b-donor.log`) — unchanged |
| AxPilot72_M1_T3 | `aed63105` | DECLARED honest-partial (L3 v16 park; the print-level corrected set governs) — unchanged |
| AxPilot74_P2 | `6c6a251f` = artifact-at-fire (park-of-record `531a9eb7`; row says sha-at-sweep governs) | OK expected; **record the sweep guard as the disk sha at close** (§4 flag F2) |
| AxPilot41_Core | `733b4a2d` | OK (inert-delta class, no override — fired bytes `921bc43c` documented in-row) |
| all other standing rows | byte-stable (H1 `283503ad`, H2 `3bc81701`, 77_T2 `e70baf22`, 75 Pa `d61eb048` / N2-P0 `1cf5cbe2`, …) | GREEN classes unchanged from the iter-5 close map |

Part (ii) custody (per-row): PASS = `OK; axiom-lines=N, sorryAx-lines=0`, records ⊆ triad.

## 3. NEW rows owed (paste-ready for H at close; NO make_axcheck edit now — rows land with their payloads)

**3.1 AxPilot12_CORE** — add to the Iteration-6 TARGETS block at the close commit:

```python
("AxPilot12_CORE",    PILOTS / "12/CORE.lean"),  # 12-core day-1+S-tranche GREEN of record @ 7e40dff4dc12b6a6 (core-runs1-3+4-9; MMgeneral_total_sum kernel-clean); [WARM] import Mathlib only; 13 top-level theorems; **DECLARED-SORRYAX CLASS**: the 8-sorry ChoiceSumInputs interface set is BY-DESIGN (§12 rows) — stage prints expose exactly which decls carry the interface sorries vs triad-clean; booked declared-FAIL in the G2 tally, NEVER a greenness claim. GUARD: re-bind to the closing-batch landing sha if R3's ≤5-fire GO lands first (sorry-count may drop; class upgrades to OK iff sorryAx-lines=0)
```

**3.2 AxPilot41_H4** — [PENDING-PAYLOAD-SHA; the relayed E1 fire is in flight]:

```python
("AxPilot41_H4",      PILOTS / "41/H4.lean"),    # [PENDING-PAYLOAD-SHA — fill at the GREEN landing] H4 E1 no-go (R4 seed-2 E1, granted 5c7fac7, <=3 runs, self-contained); probe H4-probe.lean bef92692230690f5 = probe-convention (NEVER a stage); [WARM] expected (verify imports at landing); guard = landed sha; expected OK all-triad
```

**3.3 eta donor-tree custody trio — REGISTERED, NOT plain rows** (the N2-P3V2
pattern; `import ZetaZeros` ⇒ never a plain stage). Registration comment for the
TARGETS tail + the Part (ii) sub-batch spec:

- Verdict of record (gated surface): `pilots/zzv2-lam/logs/eta-r2-run10-eta-r3-run7-eta-r4-run5.log` — eta-r4 10/10 gated triad (rungs T2/T3/R5-1/R5-2/R6-3/R6-4 + the four λ=1/2 anchors), eta-r2 4/4, eta-r3 2/2, strict-OK, 0 sorryAx, EXIT=0.
- **Full-coverage custody owed (the skeleton G2 item): one donor-tree axcheck fire** staging eta-r2 (6 publics) + eta-r3 (5) + eta-r4 (16) with the appendum (#print axioms on all top-level theorems) inside the BUILT ZetaZerosV2 tree — 27 expected prints, all ⊆ triad, 0 sorryAx. Pattern precedent: `axcheck-n3v2-run1.log` (app crossmath-pilot-75-v2, appendum inside the donor tree) and `m4b2-axcheck-run1.log`.
- Guards: eta-r2 `a9c6b59f8a769335`, eta-r3 `21fb0c4e45f88b92`, eta-r4 `285a411e48c3ad1e` (all disk-verified; the run-14 fired bytes == disk == verified).

## 4. Payload-moved flags (unit item 3)

| flag | stage | moved? | disposition |
|---|---|---|---|
| **F1** | 12-core CORE.lean | `9c213eb7` (run-3 baseline) → `7e40dff4` (milestone, disk) → **the closing batch pending** | the descent shas are guard-verified history; the AxPilot12_CORE guard binds the CLOSE-TIME disk sha; if R3's batch lands, re-pin + re-class (§3.1) |
| **F2** | 74/P2.lean | park-of-record `531a9eb7` ≠ disk `6c6a251f` (artifact-at-fire) | NOT drift (row pre-registers "sha-at-sweep governs, both cited"); record `6c6a251f` as the sweep-time guard |
| **F3** | eta-r4.lean | parked-record `06ad527f` → fired GREEN `285a411e` | the RESUME-PAYLOAD pattern the unit names: **re-verified at the new bytes by the confirmation fire itself** (strict-OK at `285a411e`); the §11 cross-note already carries the move; custody sub-batch stages `285a411e` |
| — | AL3D P0/A1/A2, N2-P1 chain, 41 family, 77 pair, M4b, P72M1T3, 75 Pa/N2-P0 | NO (all disk shas == shas of record, §2 table) | byte-stable; nothing to re-verify beyond the close-time re-run |

## 5. Batch runner command lines, READY for the close act (doz CLI; SPEC cpu=2.0/mem=4096; LEAN_NUM_THREADS=2; telemetry in-log)

**Part (i) — the plain batch (after H lands the §3 rows):**

```bash
# full set (70 + AxPilot12_CORE + AxPilot41_H4 = 72 stages expected; count at close governs)
bash research/feasibility/probe/run_axcheck.sh
# subset re-check syntax (if a stage needs a solo re-verify):
bash research/feasibility/probe/run_axcheck.sh AxPilot75_N2P1 AxPilot75_N2P3 AxPilot75_N2P2c AxPilot75_N2P3e
```

- Runner facts (read from `run_axcheck.sh`): MODAL_USER=doz default →
  `/home/doz/dozenv/bin/modal`; stages via `make_axcheck.py` to
  `/tmp/crossmath-axcheck-stage` + `axcheck_probe.py` (dependency order from
  order.txt); ephemeral `modal run` (crossmath-probe image pattern; no
  volume/secret). Persist the transcript WITH provenance header to
  `research/feasibility/probe/logs/axcheck-iter6-close-run1.log` (the
  `axcheck-iter5-close-run1.log` naming/log-rescue precedent; iter-5 reference
  wall 897 s, cpu 1.78 IN-SPEC).
- Expected tally shape to pre-register: OK stages all `sorryAx-lines=0` ⊆ triad;
  declared-FAIL classes = {AL3D_A2 (M3 run-9 park), 77_T1 (donor-pin), 42_M4b
  (donor-tree), P72M1_T3 (L3 park), **AxPilot12_CORE (declared-sorryAx interface
  set)**} — 5 declared classes; ANY other FAIL = a real finding (the iter-5
  precedent: 9 FAIL / 61 OK, all declared).

**Part (ii) — the eta donor-tree full-coverage custody fire (one scoped run):**

```bash
# pattern: the n3v2/m4b2 donor-tree axcheck; app = the zzv2 lineage (crossmath-pilot-zzv2-lam),
# extend run_zzv2.py with the appendum mode (stage eta-r{2,3,4} + #print axioms on ALL
# top-level theorems inside the BUILT ZetaZerosV2 tree; ZetaZerosV2 build via the
# existing update/cache/build sequence, taskset -c 0,1 build, LEAN_NUM_THREADS=2):
/home/doz/dozenv/bin/modal run research/pilots/zzv2-lam/run_zzv2_axcheck.py   # (mint at close; app crossmath-pilot-zzv2-lam-axcheck, ephemeral, no volume/secret)
# log → research/pilots/zzv2-lam/logs/axcheck-eta-fullcoverage-run1.log (provenance header;
# expected: 27 prints (6+5+16), all ⊆ triad, 0 sorryAx; wall ~10-12 min class, telemetry in-log)
```

Do NOT fire either part before the close signal (this note pre-stages only).

## 6. Feeds to R7's skeleton (§1 G2 discharges)

- Batch scope: this note §1–§2 (the skeleton's "iter-6 fire set" fully mapped).
- Class-map updates: §2 (AL3D_A1 upgrade, AL3D_A2 park class, N2P1
  triple-equality check, donor-pin classes stay) + §3.1's declared-sorryAx class
  for the new CORE row.
- Custody: eta trio sub-batch spec (§3.3/§5); H3 16-helper custody discharges AT
  the plain batch (AxPilot41_H3 prints all 27 publics); P0 stays compile-only
  (probe-convention statement layer — the §0/§7a never-a-verdict-row class; its
  sorry-free GREEN is the run-9 verdict + classifier custody).
- `[STEPB-STAGES]` fill: 72 expected (70 + 2 new rows; count at close governs) +
  the eta custody fire booked separately as the donor-tree sub-batch.

— lane R1 (verification-integrity), worktree agent-02 @ `7d7fcdd`, 2026-11-21.
Pre-stage only; no Modal fires; no commits (H lands). make_axcheck.py untouched
(rows land with their payloads per the on-landing rule).
