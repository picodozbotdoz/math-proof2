# 12-core charter input — the P0-based S–M scoping for Iteration 6

Lane R3 (worktree agent-07), 2026-11-20, per the orchestrator's ruling (12-core
charters in Iteration 6; NOT fired this wave). Sources: the P0 GREEN record
(`research/pilots/12/P0-record.md` sha `3f88feb8…`, run-2 artifact `P0.lean`
`3d924056ed4c3e2c`, logs `46abd882…`), the preflight (`research/pilots/12/preflight.md`
`14f776c7…`), and the corrected dossier (v-next sha `1e8a50d3acae30e9` — the
monotonicity-direction correction applied on main 2026-11-20, bracket in-file citing
this record's lineage). This note feeds R9's charter v-next; the census/charter drafts
take their 12-slot from it.

## 1. Statement surface — as the P0 pinned it (all elaborated, 0 errors, on-pin)

The charter's statement set IS `P0.lean` `3d924056ed4c3e2c` minus its 7 stubs — the
P0 is the statement-of-record for the core:

- **Verbatim donor ports** (3sum-apsp v4.33 → our v4.36 pin; ProbeB3 class, port cost
  0): `DetTimeModel`, `Claim.Theorem_17 M MM D g` (the freed `MM` slot),
  `Claim.Corollary_15_first`, `Claim.Corollary_16`, `Claim.Theorem_19_explicit`,
  `termScans`/`termPrime`/`termBuild` (termPrime = the flagged check's anchor),
  `strassen`, `paramD₅/paramG₅/paramD₂₆/paramG₂₆`, `queryCap`/`splitCap`/
  `thinBound`/`splitBound`/`wantedBound`/`logU`, the Sec-4 trade-off block
  (`entropy`/`lnΛ`/`Rc`/`epsStar`/`rhoC`/`gammaOf`/`qOf`), `Theorem19.Choice`.
- **The generalized set** (hypothesis-binder pattern; donors only as Prop binders,
  zero cross-project import): `WordRamMMData` (MM + ωb ∈ (2, 2.9] + growth), `EpsData`
  (ε as data; frozen fiber `ε (logb 2 7) = 0.00175`; `strict_anti : StrictAntiOn ε
  (Set.Ioc 2 2.9)` — the CORRECTED form, see rider below; `limit_three`),
  `route15_MMgeneral` / `route16_MMgeneral` (abstract MM ⇒ `Theorem_19_explicit M
  (E.ε W.ωb) (E.e W.ωb)`), `route16_symbolic` (abstract D g + the `Choice` family as
  an explicit binder), `flagship_shape` (ε(9/4) corollary; F3b as binder over the OAI
  `AdmissibleExponent`/`omega` API carried verbatim, closure depth 0).
- **The F5 consumer**: `balancePoint_monotone_shape` — `hAnti` (`sec4_Rc_strictAntiOn`
  general form) + `hZero` (`sec4_Rc_zero_tendsto` shape) as binders; balance realized
  in the corpus's switching-order vocabulary (`gammaOf c θ = κ − qOf θ`); conclusion
  `StrictAntiOn εf (Set.Ioc 2 2.9)`. ELABORATES — statement-shape evidence positive.

## 2. The open step-2 question (the core's only flagged mathematical risk)

Whether the Sec-4 general inputs (`hAnti`/`hZero`) SUFFICE to prove
`balancePoint_monotone_shape`, or the balance-point argument needs a stronger
monotonicity input than the corpus's general `Rc` lemmas give (the F5 risk as
preflight :60–68 frames it: "if `total_corollary_26`-style sums were tuned to the
frozen D choice, the symbolic choice may need a stronger monotonicity input"). The
stub's shape makes the gap inspectable: the composition `εf ωb = RcF (c ωb) (gammaOf
…)` is not automatically monotone from `hAnti` alone — the c-coordinate's movement
with ω_b is the crux (the dossier's step-2 "derivative sign computation on `Rc`").
**Rescope trigger** (preflight :89–92, still binding): if step-2 needs stronger
inputs, ship the MM-parametric route lemma + the frozen-fiber instance only, and drop
the ε-function headline to hypothesis-explicit form (the `EpsData`-binder statements
already support exactly that fallback).

## 3. Pricing estimate (P0-refined)

- **S–M confirmed** (preflight F4 band ~0.5–1.5k LoC; P0 adds: the full statement
  surface already elaborates at sha `3d924056`, so ALL of the S part is
  statement-side-done — the core's LoC is proofs + the ε closed-form construction).
- Component pricing: (a) route-lemma MM-generalization — S, pure re-instantiation of
  the two donor proofs at `W.MM` (the statements are the P0's `route15/16_MMgeneral`);
  (b) symbolic Sec-4 re-instantiation + the ε construction — S–M, the calculus on the
  ported trade-off block; (c) step-2 balance monotonicity — S if `hAnti`/`hZero`
  suffice, M with a stronger input (the one priced unknown); (d) frozen-fiber numeric
  match `ε(log₂ 7) = 0.00175` via `sec4_epsStar_numeric`-class validators — S,
  routine; (e) F3b — EXCLUDED at core scope (M–L, honesty risk on openai coefficient
  integrality); rides as the `flagship_shape` binder per the dossier's
  ship-without-F3b clause.
- Fire-run estimate: the 74/72 descent-class pattern on a statement-complete base —
  expect single-digit warm fires (P0 itself: 2, incl. one cosmetic-only fix batch).

## 4. Charter rider — the corrected monotonicity form (BINDING on all core prose)

The dossier's v1 "strictly increasing ε(ω_b)" was stated backwards; corrected on main
2026-11-20 (sha `1e8a50d3acae30e9`, dated bracket in-file, citing P0-record
`3f88feb8`). The form of record: **ε strictly DECREASING on (2, 3)** — better
(smaller) MM exponent ⇒ larger savings; `ε(log₂ 7) = 0.00175` (claim level; 0.0017 at
the EndStatement level) unchanged; `ε → 0` as `ω → 3`; headline `ε(9/4) > 0.00175`
STANDS (9/4 = 2.25 < log₂ 7 ≈ 2.8074 on the decreasing branch). The Lean form of
record is `EpsData.strict_anti : StrictAntiOn ε (Set.Ioc 2 2.9)` in P0.lean — any
charter text, must-cite block, or article prose must match this direction; the
preflight :20 inherits the v1 slip and should be read through the correction.

## 5. Must-cites for the charter (donor pins, exact)

- 3sum-apsp: `TimeClaims/Sec3/Definitions.lean:75` (DetTimeModel), `:178–199`
  (Theorem_17), `:277` (Corollary_15_first), `:295` (Corollary_16), `:305–308`
  (Theorem_19_explicit); `Sec3/Parameters.lean:66` (termPrime), `:73` (strassen),
  `:78–89` (params); `Sec3/Theorem19.lean:85/:107` (the two route lemmas), `:110/:130`
  (total_theorem_5/total_corollary_26 — the F5-tuned sums), `Sec3/Theorem19/Choice.lean:38`;
  root `PaperStatements.lean:876` (queryCap), `:2006–2027` (trade-off block), `:2068`
  (the switching-order equation); `Sec4/Corollary31/Limit.lean:132/:148`
  (`sec4_Rc_strictAntiOn` / `sec4_Rc_zero_tendsto`).
- openai-math: `Model.lean:88–101` (`AdmissibleExponent`, `omega`) — citation-quality
  only at core scope; `AuxiliarySeparation/Main.lean` (`omega_le_nine_quarters`)
  enters only through the F3b add-on, not the core.

## 6. Iteration-6 sequencing facts for R9's charter v-next

- Precedence: 41's lineage shipped; 12 was the 6.0 runner-up (TRIAGE row 12: N4 S3
  E2) whose only pilot-time flag (the monotonicity-via-termPrime statement-shape
  risk) is now DISCHARGED at the statement level by the P0 (the F5 consumer
  elaborates); the remaining unknown is proof-level only, with a priced rescope
  fallback.
- The P0's two process findings ride the charter: (i) the dossier correction (done,
  `1e8a50d3`); (ii) the probe-runner sorry-filter class (backtick form — any iter-6
  probe runner must match both message forms; `run_p0.py` `a3976f96` is the fixed
  template).
- Budget hygiene template: sha-guarded fires (sidecar `/tmp/crossmath-12-p0-last.sha`
  currently at `3d924056`), 1–2-run P0 spend as executed, telemetry OVER=0 throughout.

— lane R3 (A6 lineage, worktree agent-07), 2026-11-20.
