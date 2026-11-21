# R2 — M-class share-arithmetic pre-computation (the disposition R-B(b1) execution table)

Lane R2 (worktree agent-03), 2026-11-21, per the wave-2 re-task item 1. Purpose:
make the iter-6 close stamp `[QUOTA-STATE]`/`[QUOTA-OUTCOME]` and any R-B ruling
MECHANICAL — every cell below cites the disposition clause it executes
(`qa/iter4-review/r2-iter6-quota-disposition.md` @ `356cff317dcbb666`, landed).
Basis: worktree ff-refreshed to main `25879dd`. Evaluation only; no fires.

**Basis of record (byte-verified at `25879dd`):** N = 9 discovery-grade /
D = 17 article rows (`articles/README.md` §A 9 + §B 7 + §C row-10; header
"extended 2026-11-20" unchanged at HEAD) — share **9/17 ≈ 52.9%**. The bar:
≥ half of shipped articles discovery-grade, **equality passes** (ruled at the
iter-5 close, 8/16; `RESEARCH.md` §Iteration 5 close record).

**Scope — the two live ship variables at the iter-6 close, nothing else:**

- **V1 = the 12-core M-class evaluation** (R3's post-GREEN follow-on:
  `flagship_shape` `:378` + `balancePoint_monotone_shape` `:400` + the step-2
  open question; `RESUME-BRIEF-ITER6.md` §SESSION END (b)2), pending behind
  R3's closing batch.
- **V2 = the FB-2 spend** (the R-B override; +1 knowledge-level article row).

**Fixed points (verified at `25879dd`; no denominator effect):** eta-r4
grant-fire-2 landed GREEN **record-billed, no article row** (commit `25879dd`
itself — the eta-port ledger closed 14-of-12–13); M3 PERMANENT PARK (run-9,
`5e4f173`-family); L3 re-charter BANK (`0a15ec0`); H3 combination-word tier
OPEN-but-not-queued; 41H3 already inside the 9/17. Any NEW article variable
entering before close re-runs this table (§5 recompute rule).

## §1 The M-class billing map (three outcome classes; (b) splits)

| class | billing | article-row effect |
|---|---|---|
| **(a)** discovery-grade | §A row (S1–S4 pass at article time) | +1 N, +1 D |
| **(b1)** record-billed / engineering deliverable, **no article row** | dossier/ledger only (README §C note: "statement layers … live in dossiers/ledger rows") | D unchanged |
| **(b2)** engineering **technical-record ARTICLE** | §B row (quota-free engineering article class — the 7 §B rows' class) | +1 D only |
| **(c)** park / no landing this cycle | honest-park record | no change |

## §2 The decision table (every cell cites its executing clause)

| V1 ↓ · V2 → | **FB-2 UNSPENT** (R-A default) | **FB-2 SPENT** (R-B override) |
|---|---|---|
| **(a) discovery-grade** | 10/18 ≈ 55.6% — PASS with margin; R-A stamp clean | 10/19 ≈ 52.6% — PASS with margin; **R-B(b1) first disjunct verbatim** ("discovery-grade landing ⇒ ≥10/18 headroom"); FB-2 need NOT be last ship — even one further non-discovery article stays ≥half at 10/20 = 50.0% equality |
| **(b1) record-billed, NO article row** | 9/17 ≈ 52.9% — PASS; R-A clean | 9/18 = 50.0% — **PASS AT EQUALITY; R-B(b1) second disjunct verbatim** ("record-billed landing ⇒ 9/18 at equality with FB-2 as the cycle's LAST ship") — the last-ship clause binds |
| **(b2) technical-record ARTICLE (§B row)** | 9/18 = 50.0% — PASS at equality; the margin is consumed by M-class ITSELF (last-ship discipline transfers to the M-class article) | 9/19 ≈ 47.4% — **FAIL, the bar breaks; R-B(b1) NOT satisfied — the SPEND IS BLOCKED in this branch.** The clause's "record-billed ⇒ 9/18" arithmetic assumed no article row; unblock paths: (i) a further discovery article first (⇒ 10/20 = 50.0% equality), or (ii) M-class re-billed to the (b1) no-row class |
| **(c) park / no landing** | 9/17 ≈ 52.9% — PASS; R-A clean | 9/18 = 50.0% — PASS at equality; arithmetic identical to (b1); **R-B(b1) second disjunct applies with "resolved" = the park record**; last-ship clause binds |

## §3 The "last ship" ordering effect (spelled)

1. The bar is a **close-time stock ratio**: the final N/D is order-independent.
   Ordering matters only through the decision-time checks (R-B(b1), C3) and the
   last-ship clause.
2. **At any equality branch (50.0%), the equality-creating article must be the
   cycle's LAST article ship** — or every later ship must be discovery-grade or
   the no-row record class. Concretely: an FB-2 spent EARLY in a (b1)/(c) world
   constrains the M-class outcome ex post to no-row-record or discovery-grade;
   a (b2) M-class article after an early FB-2 spend manufactures the 9/19 break.
   The reverse order breaks identically. This is exactly why the disposition
   sequences the ruling AT CLOSE, after V1 resolves — this table is the
   mechanical execution of that sequencing.
3. The (a)-row asymmetry: only a discovery-grade M-class creates headroom that
   SURVIVES a later non-discovery ship (10/19 ≈ 52.6%, then 10/20 at equality);
   every other V1 outcome makes FB-2 equality-critical at best, blocked at
   worst.

## §4 Close-stamp mechanics (which cell the orchestrator stamps)

- R-A rows stamp `[QUOTA-STATE] UNSPENT` / `[QUOTA-OUTCOME] third consecutive …`
  with the structural finding (`r2-iter6-quota-disposition.md` §2) — cells
  (a)/(b1)/(b2)/(c) × unspent, all clean.
- R-B ruling gate, one line: **(b2) always blocks the spend; (b1)/(c) allow it
  only with the last-ship clause; (a) allows it free.** R-B(b2) (lane capacity)
  is unchanged by this table — separate precondition.
- Clause-precision note for the stamp (one parenthetical, H's option):
  R-B(b1)'s "record-billed landing" reads **"record-billed = no article row"**
  (class (b1)); an engineering ARTICLE is class (b2) — the blocked branch.

## §5 Recompute rule (scope guard)

If any NEW article variable enters before close (none is live at `25879dd`),
re-run on the final stock: **bar = 2·N ≥ D at close**, evaluated once on the
landed README rows; the R-B(b1) disjuncts map onto the same three billing
classes above. No other arithmetic is owed.

— lane R2 (worktree agent-03), 2026-11-21. No fires, no commits (H commits on
main; REPORT ONLY). Companion lineage: `r2-iter6-quota-disposition.md`
(`356cff31`) → this table; `r2-iter7-quota-structural-draft.md` (`4955ac91`)
consumes the trajectory, not these cells.
