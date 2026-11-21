# R2 — Iteration-6 quota-disposition DRAFT (the D1 close-time record; ruling input)

**DRAFT — the orchestrator rules at the iter-6 close; this file is the
citation-exact input for the close-block quota items (`[QUOTA-STATE]` /
`[QUOTA-OUTCOME]`), successor to `r9-quota-disposition-draft.md` (the iter-5
record, same skeleton).** Lane R2 (worktree agent-03), 2026-11-21, per the wave-2
queue item 2 (the FB-2 precharter follow-on `4cf78ce1` + the D1 disposition).
Basis: worktree `carry-20261121-agent-03` @ `ef1e7bd`; every claim carries its
citation. Companion: `candidates/fb2-followon-evaluation.md` (the full evaluation;
this file is its one-page decision core).

## 1. Facts of record (byte-verified at `ef1e7bd`)

1. **D1 (ruled 2026-11-20, at iter-6 open):** the N=1 knowledge-level slot opens
   UNSPENT — spend-only-if-executed; the contest is FB-2 vs FB-4 vs unspent
   (`RESEARCH.md` §Iteration 6, ruling D1 :553–556; the quota paragraph :635–641).
2. **No FB execution exists at HEAD:** `candidates/` carries only the FB-2
   precharter (`fb2-pntap-precharter.md`, bytes `4cf78ce19992353f` — the queue's
   named version); no FB-2/FB-4 article file or `articles/README.md` row exists;
   no charter decision [DECISION-Q] has been ruled. T2 UNFIRED (the ignition rule
   `RESEARCH.md:151–154`; PNT+ stays DEFER-watchlist).
3. **Trigger liveness (live-checked 2026-11-21):** T1 NOT LIVE (no dossier-22-T2a
   pilot in the bench); T2 CONDITIONALLY LIVE (fires iff FB-2 charters — the
   contest itself); T3 NOT LIVE (upstream PNT+ `lean-toolchain`@master =
   `v4.35.0`, fetched this session; HEAD `a4fb6989` 2026-11-15 "blueprint
   updates" — minor motion from `938912bb` 2026-11-12).
4. **KPI cells:** shipped set 17 article rows (README §A 9 + §B 7 + §C row 10);
   **discovery share 9/17 ≈ 52.9% — ABOVE the ≥half bar** (the 41H3 ship moved
   8/16 → 9/17; R1's §12 fold records the cell-move). One non-discovery ship of
   margin: any FB article ⇒ 9/18 = 50.0% AT equality (passes; margin consumed);
   a second unmatched non-discovery article ⇒ 9/19 — BELOW the bar. The pending
   12-core M-class evaluation (kind unknown) is the contingent co-consumer of
   that margin.
5. **FB-4 is not charter-ready:** no precharter / citation block / pricing exists
   (record = `r2-discovery-strength.md:752` + `iter4-fresh-bridges.md` §3); M-effort
   on the warm 71/73 substrate; an R9-class precharter is owed before any fire —
   an iter-7 posture, not a wave-tail one.

## 2. The recommendation row (input for the ruling)

**[QUOTA-STATE] = UNSPENT (default holds; the close-time ruling executes the
pre-registered test below). [QUOTA-OUTCOME] = expected THIRD consecutive unspent
cycle (iter-4, iter-5, iter-6) — with the structural finding recorded: the
contest's wave-tail / no-slot-by-default placement systematically biases unspent;
if the loop intends the knowledge-level lane to be exercised, the iter-7 charter
either moves the contest to a DAY-1 decision with a drained lane (re-using the
precharter + `fb2-followon-evaluation.md`, both age well) or re-classifies the
slot as opportunistic. Per-cycle rule: no quota arithmetic carries into
Iteration 7 (health indicator only).**

**Close-time ruling test (pre-registered; fires only on explicit orchestrator
ruling, never by lane action):**

- **R-A (default — UNSPENT confirms):** no R-B condition holds at close.
- **R-B (override — SPEND-ON-FB-2; never FB-4 this cycle):** BOTH (b1) the
  12-core M-class evaluation has resolved AND the share arithmetic is
  non-breaking (discovery-grade landing ⇒ ≥10/18 headroom; record-billed
  landing ⇒ 9/18 at equality with FB-2 as the cycle's LAST ship); AND (b2) ≥2
  post-resume sessions of drained-lane capacity remain for the L-grade tranche
  (or the orchestrator explicitly accepts a descope-tier outcome as the cycle's
  knowledge-level article). On R-B the charter rides the four strength
  conditions C1–C4 (`fb2-followon-evaluation.md` §5: statement-tier checkpoint;
  donor hygiene; KPI headroom; citation discipline) and T2 FIRES as the
  charter's consequence (PNT+ REGISTER-AND-PORT; G9 evidence on file
  `run37-g9-fix.log:30`; upstream facts per §1.3).

## 3. The ruling request (what the orchestrator stamps at close)

- Stamp `[QUOTA-STATE]`/`[QUOTA-OUTCOME]` per §2 (or rule R-B with its
  conditions named) — no hidden FB execution exists that could change §1.2.
- Carry the §2 structural finding into the iter-7 charter's quota section (the
  day-1-placement option; the census §3 framing is its predecessor).
- Record-hygiene rider: if any FB-2 tranche executes post-resume but ships no
  article (descope tier 1, record-billed), the disposition wording is
  "executed, descoped, no article" — NOT "not executed" (the iter-5 §1.3 test
  conflates them only because iter-5 never executed).

— lane R2 (worktree agent-03), 2026-11-21. DRAFT; no fires, no commits (H commits
on main; REPORT ONLY). This file gates nothing until the close; it must be
current at close (re-verify §1.3's upstream facts if the close slips past
~2026-11-28).
