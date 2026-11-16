# 00-DIGEST — review-deliverable digest (Iteration 4, phase A)

One entry per landed review deliverable, appended by H at its commit batch. This is the
post-outage quick-read and R9's integration feed (R9 re-issues its plan §§1–3 as v2 on
each [MERGE: Rx] resolution). Entry order = landing order.

| # | Lane | File | One-line verdict |
|---|---|---|---|
| 1 | R9 | `r9-iteration-plan-draft.md` | Splice + lane-plan + quality-gate draft complete at ZERO review inputs (all review cells [MERGE: Rx]-marked); ready for orchestrator typeset pending merges |
| 2 | R2 | `r2-discovery-strength.md` | 18 articles ≈ 4–5 genuine discoveries; strength bar S1–S4 proposed; 11 demotion/relabel items |

## R9 — r9-iteration-plan-draft.md (landed 2026-11-16, batch 5)

- **Verdict:** complete first-pass deliverable, self-declared "proposes; orchestrator
  typesets"; no review inputs existed at draft time, so §§1–3 are R9-independent with
  explicit [MERGE: Rx] cells for R1/R2/R3/R5 inputs.
- **Top-3 findings:**
  1. The filled §Iteration-4 splice is ready (subtitle "raising the discovery bar…";
     slots 1 LP-layer / 2 AL-3D B.2 / 3 ZZV2-λ technical-record) and corrects A1's
     skeleton in two honesty-relevant places: (†1) "50-M2-R1 awaiting [G7b]" was stale —
     G7b PASS'd and R1 landed GREEN in Cycle 2, so only R2/R3 carry; (†2) 72-M1 L3 +
     the 10 assembly tranche D1–D6 were missing from the carried list.
  2. A one-page quality gate (§3): six discovery-strength criteria (incl. dossier-final
     NEW-LEAN verdict floor — pre-dossier triage never sufficient), a mandatory article
     template (kind declaration, verification-status table, nearest-miss block,
     limitations), and a two-strike rule (cap 2 non-discovery articles/cycle; ≥50%
     discovery-grade KPI). Retroactive calibration: Cycle 2 shipped ≤3 discovery-grade
     vs 6+ knowledge-level articles — the exact failure mode the bar targets.
  3. §2 assigns phase-B launch queues for all 10 lanes (A1→A5→A9 first, H last; A4
     flagged heaviest — slot 2 + 75-Pb + 74-T3; cheapest re-balance = move 75-Pb to
     A8/A3).
- **Open asks for the orchestrator (§5, six):** (1) slot 3 keep ZZV2-λ as
  technical-record vs swap to FF-EZ2 survivor — decide at R5/R2 merge; (2) two-strike
  cap N=2 vs 1 (R2-dependent); (3) B.2 vs B.3 for slot 2 — B.2 recommended, launch-day
  call; (4) where §3's gate text is typeset (RESEARCH.md conventions block vs AGENTS
  iteration-4 addendum); (5) 75-Pb lane placement (A4 vs A8/A3); (6) carried-item depth
  — 22-T2a has no executing lane before A8 queue item 2; confirm or re-assign.
- **Watchdog note (H):** R9's cited inputs all exist on disk and are git-tracked
  (incl. `pilots/{lp-layer,al-3d,zzv2-lambda}-prework.md`).

## R2 — r2-discovery-strength.md (landed 2026-11-16, batch 6)

- **Verdict:** cold classification of all 18 articles (both cycles) into classes (i)
  new theorem / (ii) formalization / (iii) donor-swap / (iv) glue / (v) knowledge-level:
  **≈ 4–5 genuine discoveries** (01 > 30 > 32 > 52; 75 the only new *statement class*,
  capped "corollary-level, load-bearing inputs are open binders"); every claim
  re-queried direct-source in the sibling trees (§5, 13 query families).
- **Top-3 findings:**
  1. Article-count inflation: 18 article files for ~4–5 genuine items — donor-swaps
     (42-M4), binder discharges (50-M2), vocabulary layers (73), certified numerics (21)
     each got standalone equal-format billing; "the packaging invited the verdict it
     got."
  2. The Cycle-2 "discovery headline" (42→42-M4) is an ecosystem upgrade whose own
     article says "There is no new analytic mathematics" — flagged as the single most
     likely trigger of the bad feedback; plus conditional-on-open-core shells marketed
     as discoveries (75's Theorem B is exactly as strong as its undischargeable
     hypotheses).
  3. Proposed **strength bar S1–S4** (statement-level novelty w/ named nearest-miss;
     essential multi-corpus bridge; non-trivial proof OR surprising statement;
     discharge discipline) + 11 demotion/relabel items (50-M2 retract; 21 fold into
     dossier 02; 73 demote until Q4; 42-M4 keep-but-relabel; kind fixes for
     11/42-README/10-slug/72/20/52/50-Part-I).
- **Open asks for the orchestrator:** adopt S1–S4 as the iteration-4 gate (supersedes
  R9 §3a criteria via its [MERGE: R2] cell — floor semantics say R2 can only raise);
  decide the two-strike cap N (R2's bar implies ≤ R9's N=2, possibly 1 — R9 open
  decision #2); approve/assign the 11 demotion-relabel actions (interlock with R1's
  template + rewrite proposals); the 42 README "zero-density" terminology mislabel.
