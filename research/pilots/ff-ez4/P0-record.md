# FF-EZ4 P0 record — genus-1 identification statement-first probe

**Verdict: GREEN 2026-11-17** (iteration-4 week-1 relay; r5 backlog §3 rank 9 / §14
row 9 — the FF-EZ4 + 22-T2a task-slot pair, FF-EZ4 half). `P0.lean` elaborates
**OK, 0 errors, 0 sorry-warnings, ZERO `sorry` tokens in file** (Prop-def statement
convention, `pilots/01/MasterIdentity.lean` idiom — probe class "not a proof
artifact" declared in the file header; per FINAL-SWEEP-PLAN conventions P0 files are
NEVER Step-B axcheck stages). Evidence:
`research/pilots/ff-ez4/logs/p0-run1.log` — provenance header + full 4-run descent
(15 → 8 → 3 → 0 errors; three fix iterations, all error classes recorded in the
header). Substrate: mathlib `ff2494ea`, v4.36.0-rc2, warm image family, doz CLI
route (PRIMARY per the 2026-11-17 orchestrator ruling), new ephemeral app
`crossmath-pilot-ffez4` with the byte-identical image block of pilots/71 (shared
layers; probe-convention verdict logic), stage `/tmp/crossmath-pilot-ffez4-a6`.
Telemetry: wall=76s, cpu 0.71, mem 6146 MB = the inherent mmapped-olean RSS class
(AGENTS.md §Modal note), OVER=1 soft.

## Spec compliance (why no gate fired)

- r5 backlog §3 rank 9: "the identification statement `tauceti zetaFunction (E) =
  Weil zetaSeries (E)` elaborated on-pin with the tauceti instance path (G6b)" —
  **S-effort, [WARM]** ✓ executed as specced. The G6b instance path enters as the
  binder architecture (below) exactly as G6b prescribes ("transport along
  `toEllipticCurveGeom` ↔ LeanEval statement (mathlib-only, G3-validated)
  instantiated at `projModel`").
- Gates unfired? NONE: G9 (the pair's other half, 22-T2a) is GREEN per the queue
  message; G6b's Stacks alternative is DEAD but tauceti-route is the designed path;
  no charter condition gates this P0 (rank 9 is a standing task-slot row).
- Not above S-class: 216 LoC statement file, 4 warm minutes-class runs.

## Statement architecture landed (P0.lean, sha b34f0f70…, 216 LoC)

Eleven `#check` anchors (all elaborated; signatures in the log tail) + 13 defs:

| decl | role | source convention |
|---|---|---|
| `HypWeilConjectures` | Weil side, LeanEval conclusion as binder Prop | verbatim carry of `ProbeG3_Weil.lean` (G3: 0 errors on this pin) |
| `WeilBody1`, `stmt_leanEval_d1_iff` | the d = 1 instantiation + its definitional equivalence | G3 body specialized at d := 1 |
| `genus1A`, `HypWeilGenus1`, `stmt_leanEval_to_genus1` | genus-1 multiset family, pure count form, multiset→count bridge | new (FF-EZ4 dictionary node) |
| `tracePowSum`, `HypTaucetiCounts` | tauceti count bookkeeping (`N m = q^m + 1 − s_m(a)`) | binder restatement of tauceti `Frobenius/PowTrace`+`Zeta.lean:153` coefficient shape |
| `zetaNum`/`zetaDen`, `HypTaucetiZetaRat` | rational normal form `ζ·(1−T)(1−qT) = 1−aT+qT²` | restatement of tauceti `zetaFunction_eq_mul_inv` (`Zeta.lean:203`, `zetaRatFunc` :94) — multiplicative form avoids the inverse API |
| `HypTaucetiZetaDef` | `ζ = exp.subst (mk fun n => N n / n)` | restatement of tauceti `zetaFunction_def` (`Zeta.lean:161`) |
| `HypTransport` | the count transport (tauceti isogeny-degree counts = scheme morphism counts) — THE G6b projModel content, opaque binder at P0 | G6b |
| `stmt_ff_ez4_identification`, `stmt_ff_ez4` | the headline: both defining systems ⟹ the zeta data AGREE (α+β = a, αβ = q, N m = q^m+1−(α^m+β^m), ζ = rational form) | the charter's dictionary node |
| `stmt_ff_ez4_rh_g1` | tauceti genus-1 RH restated (`Zeta.lean:244`) | verbatim-shaped |
| `stmt_ff_ez4_hasse_g1` | Hasse restated (`HasseBound.lean:44`, `frobeniusTrace_sq_le_four_mul_card`) | verbatim-shaped |
| `stmt_ff_ez4_norm_from_hasse`, `stmt_ff_ez4_rh_transfer` | FF-EZ1(iii) at g = 1 (trace form ⟹ Weil norm clause) and the RH transfer tauceti↔Weil | the bridge doc's "consequently" clauses |
| `conditional_shape` (theorem, proved `h`) | binder-consumption wrapper | ProbeG3 precedent |

tauceti/projModel/toEllipticCurveGeom are NEVER imported (G6b: not transcribable;
mathlib has no EllipticCurve→Scheme bridge at this pin) — every tauceti object is a
binder pinned by its defining equation, the EnclOK/ProbeE discipline.

## Fix-loop lessons (for the P1 charter; recorded in the log header too)

1. `CommRingCat.ofHom (algebraMap F L)` forces the extension field into F's universe
   (CommRingCat is universe-monomorphic): the extension binder must be G3's
   `(L : Type _)` — `Type` and `Type*` both fail.
2. Pin-idiom `PowerSeries`: `X`/`C` have implicit `R` (`PowerSeries.X (R := ℚ)`;
   `C` is a `R →+* R⟦X⟧` applied via coe: `PowerSeries.C (R := ℚ) a`); `exp`'s `A` is
   explicit (`PowerSeries.exp ℚ`).
3. Applications of body-only-`F` statements (`HypTaucetiCounts N a`,
   `stmt_ff_ez4_hasse_g1 a`, `stmt_ff_ez4_rh_g1 a`) need explicit `(F := F)`.
4. Docstrings cannot precede `set_option … in` at this pin (parse error).

## P1 outlook (not chartered by this P0)

The eventual proof pilot needs: (i) tauceti as a real lake dep (same toolchain —
the "tauceti → direct dependency" consumption pattern; image adds a tauceti clone +
build layer), instantiating `S := projModel E` and `a/N/ζ := frobeniusTrace/…/
zetaFunction`; (ii) the count transport (tauceti
`coeff_finrank_logOf_zetaFunction` + mathlib morphism-count bridge) — the one
genuinely new lemma; (iii) power-sum bookkeeping `tracePowSum` vs the LeanEval
multiset sums (elementary induction). Billing stays as specced: glue-grade
formalization-first, never discovery; consumed by every FF seed (FF-EZ1/EZ2/EZ5).

— lane A6, 2026-11-17. A1 folds the §10 row from this record.
