# 12-core M-class evaluation — prepared for the orchestrator (lane R3, 2026-11-21)

Evidence base: the S-tranche close at CORE.lean `940bc9eabe82d5e0` (run 13 GREEN,
`PROBE-OK rc=0 errors=0 sorry=7`; run 14 axcheck 14/14 triad-only;
`CORE-record.md` §TRANCHE CLOSE). No fires were spent on M-class items (per the
standing order — this note is preparation only). Sharas below refer to that state.

## 0. The central finding (new, this batch): the γ-freeze caps ALL in-corpus parametric savings at 0.00175

The donor's one-call instance cost is FROZEN at the 0.437/0.063 exponent split
(`Claim.Corollary_16`'s `wantedBound` literals): with `|W| ≤ n²/√D` query pairs at
`D^{0.437}` each plus reading, one call costs `n²/D^{0.063}` — γ = 0.063 of D-savings.
The route's total is then MM-INDEPENDENT: instances `n³·D^{η−γ}` and scans `n³·D^{−η}`
balance at `η = γ/2 = 0.0315` (the donor's Remark 20), giving `n^{3−γ/(2·18)}` =
`n^{3−0.00175}` for EVERY W in the band. A better MM (smaller ω_b) only slackens the
termPrime balance (`ωb + 1/12 ≤ 3 − η/18`), which is never binding — **no choice of
(D, g, η) inside this corpus can deliver total savings > 0.00175, because η > γ/2
unbalances toward the instances term and γ itself is a Corollary-16 literal.**

Consequences (formal manifestations already in the landed file):

- `route16_MMgeneral`'s ε-fiber binder `hδ : E.ε W.ωb ≤ 0.0315/18` is not a
  convenience — it is the exact in-corpus cap. Dischargeable iff `W.ωb ≥ log₂ 7`
  (from `EpsData.strict_anti` + `frozen_fiber`).
- `route16_symbolic`'s stub has the SAME latent defect: its `hchoice` binder frees
  (D, g, η) but keeps `h16 : Corollary_16 M` frozen — the conclusion at
  `(E.ε W.ωb, E.e W.ωb)` for `ε > 0.00175` is not derivable from those hypotheses.
  The honest symbolic interface needs a RE-SPLIT one-call-cost binder (a
  Corollary-16'-shape at exponent pair `(1/2 − 2η', 2η')`, hypothesis-explicit).
- **`flagship_shape` is corpus-blocked as stubbed**: `hF3b` produces W with
  `ωb ≤ 9/4 + ε' < log₂ 7`, where the decreasing ε has `E.ε W.ωb > 0.00175` —
  exactly the regime the γ-freeze blocks. The flagship cannot close in-corpus even
  with the hδ/he binders added to `hcore`; its honest in-corpus forms are
  (i) hypothesis-explicit: ride the re-split instance cost as a binder (the
  dossier's ship-without clause pattern), or (ii) re-scope the headline to the
  ω_b ≥ log₂ 7 half-band (where nothing beats the frozen fiber, i.e. no headline).
  This is a NEGATIVE-kind finding candidate (the corpus cannot express
  better-than-Strassen parametric savings) — R2/R7's call whether it enters the
  article family as a discovery-grade negative; it is reported here as evaluation.

## 1. Item-by-item M-class status (7 stubs at `:201/:209/:244/:259/:387/:409/:932`)

| item | class | verdict / next action | price |
|---|---|---|---|
| `route16_frozen` :209 | now S | FREE corollary of `route16_MMgeneral_frozen` (a strassen-fiber `WordRamMMData` instance; only glue = the numeric band facts `2 < logb 2 7 ≤ 2.9`, provable via `Real.logb_le_iff_le_rpow` + `7^10 ≤ 2^29` rational check) | 1 fire |
| `route15_MMgeneral` :244 | S–M | mirror of the route-16 close over the Corollary-15 route: port `sq_div_sqrt_le_thinBound` (`TimeClaims/Sec3/Arithmetic.lean`, the helper chain) + `choice_theorem_5` (`Sec3/Theorem19.lean:84`, `paramD₅_largest_pow_four` included — larger than choice_corollary_26) + `MMgeneral_total_sum` at (1/36, 4); SAME ε-fiber binder amendment applies | 2–3 fires |
| `route15_frozen` :201 | S | after route15_MMgeneral: free (same numeric-band glue) | rides |
| `route16_symbolic` :259 | M↑ | re-state per §0: add the re-split one-call binder + hδ/he; then it is the composition engine for the ε-construction batch | 2–3 fires after re-statement |
| `epsParam_data` :932 | S or M | two routes: (a) ANALYTIC ε (e.g. linear in ω with the fixed fiber and limit) — S-class construction, `strict_anti`/`limit_three`/`frozen_fiber` all routine, BUT the dossier's "Sec-4-built" fidelity weakens to "Sec-4-calibrated"; (b) SEC-4 ε (the Rc/gammaOf/qOf composition) + `balancePoint_monotone_shape` — M-class, fidelity kept. EITHER way the hδ cap of §0 binds its use to ω_b ≥ log₂ 7. | (a) 1–2 fires; (b) M (see below) |
| `balancePoint_monotone_shape` :409 | M (unchanged open) | the F5 question verbatim (do `hAnti`/`hZero` suffice for the c-coordinate's movement with ω_b?) — no new evidence this batch; NOTE §0 makes it NOT on the flagship's critical path in-corpus (it only matters for route (b) of epsParam_data) | unpriced (open) |
| `flagship_shape` :387 | M / blocked | see §0 — binder-form or negative-kind re-scope; NOT closable as stubbed | needs a grant + a decision |

## 2. Recommended next-batch shape (for the orchestrator's grant decision)

1. **S-residue sweep (cheap, closes the frozen routes)**: route16_frozen (+ the
   numeric-band glue lemma) and, if granted, the route-15 mirror. Expected end
   state: 4 stubs (symbolic, epsParam_data, balancePoint, flagship).
2. **The ε-construction decision** (the fork): analytic (a) vs Sec-4 (b). If the
   article's must-cite block can carry "Sec-4-calibrated", route (a) closes the
   ε stub in 1–2 fires and `parametric_main`'s hδ/he become dischargeable on the
   ω_b ≥ log₂ 7 half-band — the core's standalone ship.
3. **The flagship decision** rides R2/R7 (negative-kind candidate per §0) — not a
   lane decision.

## 3. Budget accounting for this batch

5 of 5 fires spent (runs 10–13 descent + run 14 axcheck), GREEN + certified;
sha chain and per-fire verdicts in `CORE-record.md` §TRANCHE CLOSE and
`logs/core-runs10-13.log` / `logs/core-run14-axcheck.log`.

— lane R3 (A6 lineage, worktree agent-07), 2026-11-21.
