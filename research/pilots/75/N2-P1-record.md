# Pilot 75-N2 P1 — verification record (M1+M2 GREEN-triad; M3 deferred)

Lane A5, sessions 2026-11-17 (runs 1–8) + 2026-11-18 wave-3 restart (runs 9–15).
Charter: orchestrator P1 GO ruling of 2026-11-17 (dictionary glue, ≤6-run
fix-loop budget); restart charter 2026-11-18 (one owed closure run — discovered
ALREADY FIRED as run 8 before the network termination; then one
diagnostic+fix+rerun, then M2 per the dossier, M3 if budget remains). Dossier:
`research/candidates/75-N2-rayclass-dirichlet-consumer.md` §Pilot spec skeleton
(P1) + §Proof-strategy steps 1–2. A1 folds the §10-format block below into
`qa/iter4-review/r3-verification-tables.md` (one-writer discipline). Evidence of
record: `pilots/75/logs/n2-p1-run{1..15}.log` (per-run provenance headers with
verify-fire shas + error-class analyses; run 15 = the verified state).

## Milestone verdicts (verified state = run 15, sha 2e5217010e46…)

| milestone | content | verdict |
|---|---|---|
| M1-core (P1-a mathematics) | `chi_span_eq_one`, `chi_span_mul`, `chi_span_ne_zero`, **`chi_span_residue` (the c-trick — the well-definedness of DZDF characters on ray classes of ℚ)** | **GREEN-triad** (since run 7) |
| M1-packaging | `exists_nat_span` (ℚ ideal classification), `chiUnitHom` + `ratCharOf` (construction via `MulChar.ofUnitHom`), `ratCharOf_apply` (value dictionary, ALL k incl. 0 at 1 < q) | **GREEN-triad** (7/7 since run 10; the M1 milestone COMPLETE) |
| **M2 (P1-b, L-series identification)** | **`heckeTsum_eq_ratCharOf_LFunction`** — `∑' I : Ideal (𝓞 ℚ), χ I * (absNorm I : ℂ)^(-s) = DirichletCharacter.LFunction (ratCharOf hχ hq) s` on `1 < s.re` (component (ii) of `HasQDirichletDictionary`) | **GREEN-triad (run 15)** |
| M3 (P1-c/d: principality transfer, q = 1 degeneracy, half-plane → ℂ∖{1} identity-theorem extension, composed transfer) | not started | deferred (see budget note) |

## §10-format row block (verified state = run 15; axioms source `logs/n2-p1-run15.log`)

| decl | file:line | status | axioms print source | notes |
|---|---|---|---|---|
| `chi_span_eq_one` | `pilots/75/N2-P1.lean:190` | PROVED-UNCONDITIONAL | run 15 — triad | DZDF `map_span'` over ℚ (total positivity automatic for positive naturals) |
| `chi_span_mul` | `N2-P1.lean:219` | PROVED-UNCONDITIONAL | idem — triad | DZDF `map_mul'` on principal spans (`Ideal.span_mul_span` route) |
| `chi_span_ne_zero` | `N2-P1.lean:291` | PROVED-UNCONDITIONAL | idem — triad | DZDF `eq_zero_iff'` forward direction via the sup bridge; `1 < q` scope |
| `chi_span_residue` | `N2-P1.lean:323` | PROVED-UNCONDITIONAL | idem — triad | **the c-trick** (residue independence) — the dictionary's mathematical core |
| `exists_nat_span` | `N2-P1.lean:136` | PROVED-UNCONDITIONAL | idem — triad | ℚ ideal classification: `Rat.ringOfIntegersEquiv` + ℤ-PID; natAbs sign branches |
| `ratCharOf` | `N2-P1.lean:379` | PROVED-UNCONDITIONAL | idem — triad | dictionary character via `MulChar.ofUnitHom` (χ̂ on units = residue-independent ideal values; 0 off units) |
| `ratCharOf_apply` | `N2-P1.lean:386` | PROVED-UNCONDITIONAL | idem — triad | the value dictionary (ALL k : ℕ at 1 < q, incl. k = 0 via the hzero-⊥ corner) |
| `heckeTsum_eq_ratCharOf_LFunction` | `N2-P1.lean:448` | PROVED-UNCONDITIONAL | idem — triad | **M2**: Hecke tsum = mathlib L-function on ℜs > 1 (reindex `k ↦ span {k}` via `Equiv.ofBijective` + `Equiv.tsum_eq`; `absNorm (span {k}) = k` via `Ideal.absNorm_span_natCast` + `NumberField.RingOfIntegers.rank`; `LSeries.term_def₀`; `ZMod.LFunction_eq_LSeries`) |
| (engine, frozen) | `Pa.lean` | PROVED-HERITAGE | run 15 Pa block — triad | recompiled clean each run via the dep-order route |
| (P0 quotes, frozen) | `N2-P0.lean` (staged `N2P0`) | PROVED-HERITAGE | run 15 — triad | 15/15 per P0 record |

Zero sorry tokens written at any point in the loop (classifier: all grep hits
are header/audit prose); all intermediate sorryAx prints were elaboration-error
cascades, eliminated as fixes landed.

## Run ledger (15 runs; walls 67–190 s; telemetry per log; route: doz CLI,
`crossmath-pilot-75` warm lineage on semraker throughout; spec 2 cpu / 4 GB,
LEAN_NUM_THREADS=2)

- Runs 1–6 (≤6 budget): error descent 37→26→12→8.
- Run 7 (+1 documented closure deviation): M1-core GREEN-triad (the c-trick).
- Run 8 (the authorized closure run — FIRED at 2026-11-17 21:09 just before
  the network termination; the orchestrator wrap-up's "run 8 never verified
  post-edit" was a visibility gap, corrected at restart): 5 errors / 2 sorryAx;
  `exists_nat_span` GREEN-triad.
- Run 9 (the one post-closure diagnostic+fix+rerun): 1 error / 1 sorryAx;
  `ratCharOf` GREEN-triad (6/7). Root causes of the two persistent classes:
  an OfNat-instance diamond (`⊢ 1 = 1` — push_cast's closing rfl runs at
  reducible transparency) and a dependent-rewrite motive failure
  (`rw [← hk.unit_spec]` abstracts ↑k inside `hk.unit`'s elaboration).
- Run 10 (M2 append, first elaboration): M1 COMPLETE 7/7 (`ratCharOf_apply`
  GREEN-triad — the v10 `conv_lhs` fix verified); M2 3 errors (one brace
  typo cascading).
- Runs 11–14 (M2 fix-loop, four mechanical classes, each diagnosed from
  certificate-grade error messages): `.mp`→`.mpr`; `set_option` placement
  (docstring must attach to the theorem); `have he` OPAQUE (the retroactive
  root cause of the persistent show-defeq failures — tactic-`have` admits no
  zeta-unfold; fix `let he`); the `LSeries` δ-unfold vs an open tsum-metavar
  (fix: rw the δ first via an rfl-proven show-equation — the dossier's
  recorded F5(ii) fallback executed).
- Run 15: **OK — 8/8 triad-clean.**

## Engineering record (for M3 sizing and future ℚ-transport pilots)

Persistent friction classes, all root-caused at the mathlib source: instance
diamonds at reducible transparency (fix: TERM proofs / default-transparency
`show`, never simp/rfl-at-reducible closers); dependent rewrites through
`IsUnit.unit` (fix: `conv_lhs`-scoped rewrite or explicit-unit lemmas); rw
with metavariable `_` args (fix: explicit χ + `Eq.trans`-refine); opaque
`have`-bound structures (fix: `let`); per-command heartbeat exhaustion under
heavy import closures (fix: `set_option maxHeartbeats 600000 in`, placed
BEFORE the docstring). M2's reindex pattern (Equiv.ofBijective + Equiv.tsum_eq
with an un-beta'd `(fun I => …) (he k)` calc-step + transparent-let + full-form
show for the collapse) is reusable verbatim for any ideals-of-𝓞ℚ tsum.

## M3 deferral note (honest budget accounting)

The M2 descent consumed the session's post-closure run budget (6 M2 runs);
M3 (principality transfer via ℤ-prime-ideal factorization — the genuinely new
math of P1-c — plus the q = 1 degeneracy and the EntireAbelianQuotient-pattern
identity-theorem extension) is specced in the dossier §Proof-strategy steps
1(iii)/3 and priced ≈0.15–0.25k LoC in the P2/P3 note below. It was NOT
started. The M1+M2 unit is self-contained: components (i) and (ii) of
`HasQDirichletDictionary` are kernel-verified; (iii) principality transfer is
the first M3 item.

## P2/P3 recommendation (updated 2026-11-18)

- **M3: GO** — the identity-theorem extension reuses the donor pattern
  (`EntireAbelianQuotient.lean:34–49`, `AnalyticOnNhd.
  eqOn_of_preconnected_of_eventuallyEq`) with all types now concrete; the
  principality transfer's hard direction (χ̂ = 1 ⇒ ¬IsPrincipal) needs the
  ℤ-prime factorization route (routine over ℤ, medium friction expected —
  `Ideal.absNorm_span_nat`-style lemmas already in file help).
- **P2 (the hEχ port): GO, unchanged** — depends on M1/M2 outputs at the
  dictionary level only (value dictionary + L-series identification, both
  GREEN); `ThmEDyadicToCumulative`'s proof is independent of the P1 loop's
  friction classes.
- **P3 (V2 ζ-column + landing): GO, unchanged** — the M4b import pattern is
  settled; sequencing after M3.

— end record (A5, 2026-11-18; M1+M2 GREEN-triad at run 15).
