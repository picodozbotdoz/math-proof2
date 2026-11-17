# 22-T2a P0 record — statement-first tranche, GREEN (lane A8, 2026-11-17)

**Verdict (one line):** T2a-P0 **GREEN** — `pilots/22/logs/t2a-p0-run1.log`: OK rc=0,
errors=0, **sorry-warnings=0** (artifact sorry-free by construction — pilot-22 house
style: Prop-defs + `#check` pins, per `pilots/22/ProbeP1_PNT.lean`; no probe-convention
sorry class declared because none exists in the file). Wall 31 s, warm
`crossmath-gprobe` probe route, telemetry OVER=0. Decl pins printed live:
`Chebyshev.psi : ℝ → ℝ`, `ArithmeticFunction.vonMangoldt : ArithmeticFunction ℝ`,
`riemannZeta : ℂ → ℂ`. No fix-retry spent (GREEN on the first elaboration; the
pre-charter invocation `ap-ly9Pm…` was a zero-compute local SystemExit — the stage
auto-glob matches `ProbeG*.lean` only, so the artifact staged as `ProbeGT2aP0.lean`,
byte-identical; mapping recorded in the log header).

**Artifact:** `pilots/22/T2a-P0.lean` — four Prop-defs + three pins:
`HypQRHzeta` (the Liu-1 verbatim quotation of `OAI.riemannZeta_ne_zero_of_
seven_eighths_lt_re` — mathlib's own `riemannZeta`, so verbatim-on-pin); `HypStrongPNT`
(G9's binder, verbatim); `stmt_T2a` (blueprint :285 shape: ∀ ε > 0, ∃ C : ℝ, ∀ x ≥ 2,
`|Chebyshev.psi x − x| ≤ C * x ^ (7/8 + ε)`, rpow via the global `Pow ℝ ℝ` instance);
`stmt_T2a_of_QRH : HypQRHzeta → stmt_T2a` (the conditional P1 target).

## The G9 → T2a chain (how this GREEN was reached)

1. **G9 preflight** (`feasibility/probe/ProbeG9_StrongPNT.lean`, R8-staged, A8-executed
   2026-11-17): run 36 FAIL (`atTop` spelling — `open Filter` missing, the §14 row-10
   card's anticipated class) → run 37 **GREEN** (`logs-g/run37-g9-fix.log`: OK, 2
   sorry-warnings = the declared G9 probe class exactly). Statement-port ≈ 0 for the
   upstream StrongPNT binder CONFIRMED on ff2494ea; the ψ-object
   (`Chebyshev.psi`, `vonMangoldt`, `Pow ℝ ℝ`, `=O` notation) validated by rg in the
   encore checkout (cites in the T2a-P0 header).
2. **GO condition (i) resolved** in `qa/iter4-review/a8-22t2a-g9-recommendation.md`;
   orchestrator charter ruling 2026-11-17: statement-first 22-T2a GO, minutes-class,
   technical-record billing, T2 rule stands.
3. **T2a-P0 authored + run** (this record): the consumer statement, the quasi-RH input
   binder, and the StrongPNT comparison binder all elaborate on-pin, zero sorries.
   Fold note for H: the MAIN-REPO `ProbeG9_StrongPNT.lean` still lacks the one-line
   `open Filter` fix (A8's executed copy in worktree agent-09 carries it, dated).

## What P1 would need (not this charter)

- **The proof surface:** `stmt_T2a_of_QRH` — an explicit-formula argument routing the
  7/8 zero-free band to the ψ-error term. Effort class **L-grade explicit-formula
  build** (R6's deciding rg; RESEARCH.md §Iteration 4) — deliberately out of scope;
  this charter is statement-first and the L is an iteration-5-or-explicit-charter
  question.
- **Machinery candidates** (recorded side by side at P0, no implication claimed):
  (a) the upstream PNT+ ψ-engine — consumable ONLY as statement binder
  (`HypStrongPNT`) while T2/T3 stay unfired, or via the OAI-manifest import route
  (OAI's lake-manifest declares PrimeNumberTheoremAnd + TauCeti; donor-hygiene gate at
  the OAI pin applies); (b) mathlib's own `WienerIkehara` + the pilot-22 M2
  log-derivative extension layer (`ProbeP1_PNT.lean` pins
  `WienerIkehara.tendsto_sum_range_div` and
  `ArithmeticFunction.LSeries_vonMangoldt_eq_deriv_riemannZeta_div` — the weak-PNT
  route; T2a's 7/8+ε strength needs more than Wiener–Ikehara gives, so P1 would build
  the contour side itself); (c) pilot-50's G7b binder-consumption pattern as the
  interface discipline for `HypQRHzeta`.
- **Statement amendments** go through dossier 22 / blueprint :285 (the T2a shape is
  frozen as quoted; `∃ C : ℝ` per the blueprint's "∃C").

## T2-NOT-FIRED declaration

Chartering and GREENing 22-T2a does **not** fire the pre-registered FB-2/PNT+ T2 rule
(quoted verbatim in `T2a-P0.lean`'s header and in
`qa/iter4-review/a8-22t2a-g9-recommendation.md` §3): the rule's antecedent is an FB-2
PNT-AP pilot (7/8-tree binder, error x^{7/8+δ}, landing on
`Mathlib/NumberTheory/LSeries/PrimesInAP.lean`) — not this ψ-error-term statement
tranche. **PNT+ stays UNREGISTERED** (external formal prior art, Liu-1 statement
citation only, zero upstream imports); T1 (BC-chain port) and T3 (v4.36-class upstream
pins) also remain unfired. Billing: technical-record; the T2a tranche never receives
discovery billing (r3 §7 relabel; r5 backlog :349); no article-kind quota consumed.

— lane A8, 2026-11-17. H commits; A1 folds (ledger §1 slot row + REPORT-INPUTS as
needed). Sources: runs 36/37 (`logs-g/`), `t2a-p0-run1.log`, the artifact + this
record; no other files touched by this tranche.

---

**Dated correction (2026-11-17, H, at commit):** the fold note above ("the MAIN-REPO
`ProbeG9_StrongPNT.lean` still lacks the one-line `open Filter` fix") is STALE — main's
copy CARRIES the fix (lines 39–42: the dated A8 fix comment + `open Filter`), landed at
commit `68be1a2` when H copied A8's fixed version with the G9/G13 verdict batch.
Verified at this batch's pre-commit gate: `grep -n 'open Filter'
research/feasibility/probe/ProbeG9_StrongPNT.lean` → `:42`. A8's prose above is
otherwise untouched.
