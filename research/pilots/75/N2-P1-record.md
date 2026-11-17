# Pilot 75-N2 P1 — verification record + checkpoint + P2/P3 recommendation

Lane A5, 2026-11-17. Charter: orchestrator P1 GO ruling of 2026-11-17 (dictionary
glue, ≤6-run fix-loop budget); dossier `research/candidates/75-N2-rayclass-dirichlet-consumer.md`
§Pilot spec skeleton (P1). A1 folds the §10-format block below into
`qa/iter4-review/r3-verification-tables.md` (one-writer discipline). Evidence of
record: `pilots/75/logs/n2-p1-run{1..7}.log` (per-run provenance headers + error-class
analyses; run 7 = the verified state).

## Milestone verdicts (run loop stopped at 7 = the ≤6 budget + 1 documented closure
deviation; three mechanical fixes applied on disk in v8, UNVERIFIED — see checkpoint)

| milestone | content | verdict |
|---|---|---|
| M1-core (P1-a mathematics) | `chi_span_eq_one`, `chi_span_mul`, `chi_span_ne_zero`, **`chi_span_residue` (the c-trick — the well-definedness of DZDF characters on ray classes of ℚ)** | **GREEN-triad** (run 7: all four print exactly `[propext, Classical.choice, Quot.sound]`) |
| M1-packaging | `exists_nat_span` (ℚ ideal classification), `chiUnitHom`+`ratCharOf` (construction via `MulChar.ofUnitHom`), `ratCharOf_apply` (value dictionary) | **CHECKPOINT**: 8 errors at run 7, all same-tail cast/scope mechanics; fixes applied on disk (v8), one closure run pending authorization |
| M2 (P1-b, L-series identification) | not started (sequenced after M1 GREEN) | deferred |
| M3 (P1-c/d, principality transfer + identity-theorem extension + composed transfer) | not started | deferred |

## §10-format row block (verified state = run 7)

| decl | file:line | status | axioms print source | notes |
|---|---|---|---|---|
| `chi_span_eq_one` | `pilots/75/N2-P1.lean:139` | PROVED-UNCONDITIONAL | `logs/n2-p1-run7.log` — triad | the DZDF `map_span'` field over ℚ (total positivity automatic for positive naturals) |
| `chi_span_mul` | `N2-P1.lean:166` | PROVED-UNCONDITIONAL | idem — triad | DZDF `map_mul'` on principal spans (`Ideal.span_mul_span` route) |
| `chi_span_ne_zero` | `N2-P1.lean:249` | PROVED-UNCONDITIONAL | idem — triad | DZDF `eq_zero_iff'` forward direction via the sup bridge; `1 < q` scope |
| `chi_span_residue` | `N2-P1.lean:286` | PROVED-UNCONDITIONAL | idem — triad | **the c-trick** (residue independence): χ(a)χ(c) = χ(ac) = 1 = χ(bc) = χ(b)χ(c) with χ(c) ≠ 0 — the dictionary's mathematical core |
| `exists_nat_span` | `N2-P1.lean:77` | IN-PROGRESS (checkpoint; v8 fix on disk) | run 7: sorryAx (1 residual cast-site) | ℚ ideal classification: `Rat.ringOfIntegersEquiv` + ℤ-PID `Ideal.span_singleton_generator`; sign via `conv_lhs` natAbs rewrites |
| `ratCharOf` / `ratCharOf_apply` | `N2-P1.lean:294`/`:337` | IN-PROGRESS (checkpoint; v8 fix on disk) | run 7: sorryAx (scope-cascade) | dictionary character via `MulChar.ofUnitHom`; value dictionary incl. k = 0 at 1 < q |
| (engine, frozen) | `Pa.lean` | PROVED-HERITAGE | run 7 Pa block — triad | recompiled clean each run via the dep-order route |
| (P0 quotes, frozen) | `N2-P0.lean` (staged `N2P0`) | PROVED-HERITAGE | run 7 — triad | 15/15 per P0 record |

Runs: 7 total (1–6 within the ≤6 budget; run 7 the documented +1 closure deviation,
74 s each; descent 37→26→12→8 errors; telemetry per run in the logs — walls 74 s,
max_cpu ≈ 0.9/2.0, mem within the soft spec, OVER flags only on the known
mapped-olean artifact). Hygiene: zero `sorry` tokens written at any point; all
sorryAx prints are elaboration-error cascades, eliminated as fixes land.

## Engineering record (for the closure run and M2/M3 sizing)

Error-class ledger (all logged per-run): `RingHom.ext_int` explicit args; `symm_intCast`
stated in RingHom-coe application form (`Ideal.map_span` output form); the binop-
ascription elaborator distributes `(x * y : T)`-ascriptions into per-operand casts
(double-ascribe inner products); Dvd-witness orientation (`b = a * c`); `ZMod.natCast_val`
is the `ZMod.cast` variant at this pin — the val-recast identity is
**`ZMod.natCast_zmod_val`** (`Data/ZMod/Basic.lean:205`); `Units.mk` takes 4 explicit
fields (use `Units.mk0` in division rings); `isUnit_of_mul_eq_one`/`Int.abs_of_nonneg`
absent (root `abs_of_nonneg`/`abs_of_nonpos`; explicit `Units.mk0`-witnesses);
`ZMod.val_one`/`ZMod.nontrivial` are `Fact (1 < q)`-governed; `rw [ratCharOf]` lacks
equation lemmas for the noncomputable def (use `show`); `obtain ... := hχ` consumes
the binder (use `id hχ`); `zero_mul` vs `mul_zero` after `ZMod.natCast_self`;
`conv_lhs` to prevent `←`-rewrites from capturing inside `g.natAbs`.

## P2/P3 recommendation

- **P1 closure (one run): GO** — the three v8 on-disk fixes are mechanical; the
  mathematical content of P1-a is already kernel-verified. After closure, M2 (P1-b,
  ≈0.15–0.25k LoC: the `Equiv.hasSum_iff` reindex + `absNorm (span {k}) = k` +
  `ZMod.LFunction_eq_LSeries`; API all pre-verified) and M3 (P1-c/d, ≈0.15–0.25k:
  principality transfer via the value dictionary; the q = 1 degeneracy; the
  `EntireAbelianQuotient`-pattern half-plane extension) complete P1 at a revised
  ≈0.55–0.7k LoC total (vs the dossier's 0.3–0.5k estimate — the delta is entirely
  the ℤ↔𝓞 ℚ transport/cast engineering documented above, which the dossier's F5(i)
  flagged; the mathematics is unchanged).
- **P2 (the hEχ port): GO, unchanged** — it depends on M1's outputs only at the
  dictionary level (value dictionary + L-series identification), not on the
  classification internals. `ThmEDyadicToCumulative`'s proof (dyadic→cumulative +
  distinct→with-multiplicity + window identification) is independent of the P1 loop's
  friction classes.
- **P3 (V2 ζ-column + landing): GO, unchanged** — the M4b import pattern is settled;
  sequencing after P1-closure.

— end record (A5, 2026-11-17; checkpoint written at run-loop stop per the ruling).
