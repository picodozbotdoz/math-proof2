# R9 — Iteration-5 quota-disposition DRAFT (the DECISION-1 close-time record; ruling input)

**DRAFT — the orchestrator rules at close; this file is the citation-exact input for
close-block skeleton checklist item 7 (`[QUOTA-STATE]` / `[QUOTA-OUTCOME]` — "UNSPENT
stands unless an FB executed; DECISION-1 cites") and the G6 quota-ruling record named
by R2's dry-run (`qa/iter5-closeout-gates-dryrun.md` §G6 + BLOCKERS item 7).**
Lane R9 (worktree agent-09), 2026-11-20. Read basis: main `a33c319` (batch T landed
the dry-run `4e5b4854` + R3's item-13 prestage); every claim below carries its byte
citation — R2's dry-run KPI section already verified the cells against the bytes
(`a6ad33d` basis; unchanged by batch T).

## 1. Facts of record (byte-verified)

1. **DECISION-1 (ruled 2026-11-19, at iter-5 open):** the N=1 knowledge-level quota
   opens UNSPENT by default — spend-only-if-executed; the contest is FB-2 vs FB-4 vs
   unspent (`RESEARCH.md` §Iteration 5 :272–274). **DECISION-3 (confirmed):** the cap
   is per-cycle — FB-2 and FB-4 compete for the SAME single slot (:277–278).
2. **Both iteration-5 shipments are quota-free ON THE BYTES:**
   - **article-41** — splice `cb87a67`, kind DISCOVERY, quota-free per the
     orchestrator ruling 2026-11-19 (`articles/README.md` row 41 :24; §9 12/12,
     box-11 SATISFIED in-commit; no post-splice drift — R2 dry-run G5).
   - **article-41H** — splice-2 `cc71841`, file sha16 `fcbcd812`, kind NEGATIVE,
     discovery-grade, BANK-AS-NEGATIVE ruling 2026-11-19 (the 78 precedent,
     2026-11-17): quota NOT consumed (README row 41H :25; §9 :267 12/12 incl. row-1
     quota wording — R2 dry-run G5).
3. **The FB contest was NOT executed this wave:** no FB-2/FB-4 article file or README
   row exists (`articles/` census, R2 dry-run KPI item 2);
   `qa/REPORT-INPUTS-ITER5.md` §1 FB row = UNCHARTERED (contest standing, never
   chartered). No member of the re-fired set (R6 salvo / R5 pair / R8 M3) can produce
   an article (engineering/technical-record class — R2 dry-run G5 gated-by line).
4. **KPI cells (R2 dry-run §KPI, verified against bytes not memory):** shipped set 2;
   flow 2/2 = 100% discovery-grade; stock **8/16 = exactly 50%** — the ≥half bar
   PASSES at equality (`RESEARCH.md` :296–297; the 41H splice moved numerator and
   denominator by 1, per the splice-2 commit `cc71841` itself).

## 2. The recommendation row (input for the ruling)

**[QUOTA-STATE] = UNSPENT; [QUOTA-OUTCOME] = second consecutive unspent cycle under
the two-strike FINAL rule (the rule was minted at Iteration 4: iter-4 N=1 unspent on
article-78's NEGATIVE-kind quota-free billing; iter-5 N=1 unspent on two quota-free
shipments) — the spend-only-if-executed default held both times; an Iteration-6
unspent cycle would be the THIRD and is itself a signal (the census §3 note); per
DECISION-3 the cap is per-cycle, so the unspent status carries NO quota arithmetic
into Iteration 6 (health indicator only, the iter-4 precedent's own reading:
"unspent again is a healthy outcome").**

## 3. The Iteration-6 contest framing (carried verbatim from the seed census
`novelty/iter6-seed-census.md` rows #6/#7 — v2 @ `e8efb8876b0cc4c8`, the
L3-correction re-write; **rows #6/#7 unchanged by that correction**; v1 landed
`e202244b`)

Fresh N=1 at Iteration-6 open (per-cycle rule); contestants, NONE pre-decided:

1. **FB-2 — PNT-AP explicit-L at x^{7/8+δ}** (QRH-paper2 Cor 1.2 verbatim;
   FORMALIZATION-OF-RECENT, never a discovery headline): donors registered (G7b
   7/8 tree as zero-free binder; G11 SiegelZeros `hLS` fallback); the T2-ignition
   rule carries verbatim (an FB-2 charter fires PNT+ REGISTER-AND-PORT, G9 preflight
   staged); the mathlib WeakPNT-AP landing (PR #43238, bors-merged 2026-11-11; pin
   stays `ff2494ea` per the orchestrator pin ruling 2026-11-19) enters the citation
   block as external-math class — the x^{7/8+δ} error-term target is NOT preempted.
2. **FB-4 — FF-PNT** (tauceti Wiener–Ikehara × Weil rationality): M-effort
   formalization-first technical record; "must not consume a discovery slot" per R2.
3. **Unspent** (default).

Constraint carried verbatim from the raised bar: the knowledge-level slot NEVER
displaces a discovery lead (DECISION-1's own wording); the census's Tier-1 seeds
(N2-completion, H3, AL-M3) have first claim on lanes regardless of the quota
outcome.

## 4. The ruling request (what the orchestrator stamps at close)

- Stamp `[QUOTA-STATE]`/`[QUOTA-OUTCOME]` in the close block per §2 above (or rule
  otherwise — no hidden FB execution exists that could change §1.3).
- The G6 close form (`REPORT-INPUTS-ITER5.md` §3 refreshed + this record + the KPI
  line) consumes §1.4's cells mechanically.
- Optionally: pre-register the Iteration-6 contest posture (§3) in the Iteration-6
  charter's quota section — the census already carries it; the charter draft
  (`qa/iter4-review/r9-iter6-charter-draft.md`, this session) re-states it as a
  [DECISION] slot, not a ruling.

— lane R9 (worktree agent-09), 2026-11-20. DRAFT; no commits (H commits on main;
REPORT ONLY). This file gates nothing this wave; it must be ready at close.
