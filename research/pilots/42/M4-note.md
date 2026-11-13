# M4 landing note — dossier 42, milestones 4a + 4b (+ M4c addendum)

Lane A3, 2026-11-13/14 (A3-relaunch). **M4c addendum text for `research/candidates/
42-zeta-k-two-thirds-product-assembly.md` §Pilot outcome** (append-only; to be committed
by the orchestrator — not folded into the dossier by this lane). Companions:
`research/pilots/42-M4-blueprint.md` (the executed spec), `research/novelty/
axiommath-as-donor.md` §(c) (the donor map), `research/pilots/42/M4a-note.md` (the M4a
record — superseded by this file only in its "Next" section), logs under
`research/pilots/42/logs/`.

## What landed (final state)

**M4b PRIMARY ROUTE GREEN — `research/pilots/42/M4b.lean` is the FINAL artifact**
(1,571 LoC / 68 theorems): the ZetaZerosV2 donor swap by DIRECT IMPORT
(`import ZetaZeros` + `import Mathlib`), elaborated INSIDE the built ZetaZerosV2 tree on
our pin (mathlib `ff2494ea`, toolchain v4.36.0-rc2, PNT+ path-redirected per the
axbump/G2 pattern). Modal app `crossmath-pilot-42-m4b2` (`run_m4b2.sh`/`run_m4b2.py`,
new this session): run 1 FAIL (4 mechanical `noncomputable` markers missing on the
donor-vocabulary abbrevs — `error(lean.dependsOnNoncomputable)`), run 2 **OK, 0 errors /
0 sorry-warnings** (`logs/m4b2-run2.log`, app `ap-agl8zxeLxLZbzJ7LK9UlAR`). The FALLBACK
route (hV2d4/hV2d5 binders, mathlib-only, no donor import) was landed FIRST and stays
GREEN byte-exact at `logs/M4b-fallback-GREEN.lean` (run 1 FAIL 5 error sites → 12-line
fix → run 2 OK `logs/m4b-run2.log`; full-coverage axcheck `logs/m4b-axcheck-run1.log`:
68 theorems, every one exactly `[propext, Classical.choice, Quot.sound]`, zero
sorryAx/native_decide) — runnable by anyone via `run_m4.sh` without the V2 tree. The
upgrade delta fallback→primary: net +10 LoC; ~30 added / ~26 removed lines of code
(V2-vocabulary block 20→13 lines as donor abbrevs; +2 endpoint bridges; −3 binders, 3
call-sites rewired; +4 axiom prints), remainder docstring prose — within the work-queue
guard's spirit (file did not balloon; every proof except 2 touched lines unchanged).

**Axiom hygiene (M4c(i), hard gate — PASSED).** From the primary run itself
(`#print axioms` at file end): the three M4b landings
(`zetaK_two_thirds_landed_of_V2`, `zetaK_distinct_five_sixths_strip_landed_of_V2`,
`…_of_negligible`), the two bridges (`V2d4_endpoint`, `V2d5_endpoint`), AND the donor
endpoints on-pin from the consumer side (`ZetaZeros.simple_proportion_d4`,
`ZetaZeros.distinct_proportion_d5`) = exactly `[propext, Classical.choice, Quot.sound]`.
The C₀/C₁-form donors (`ZetaZeros.simple_proportion_lower`, `distinct_proportion_lower`)
plus 9 more donor theorems (13 total) were printed triad-clean on-pin by A7's G2 run3
(`feasibility/probe/logs-g/run3-g2.log`). Full-coverage axcheck of the final artifact:
`logs/m4b2-axcheck-run1.log` — **GREEN, triad-only: 70 instrumented theorems (+ the 2
donor prints), 0 errors / 0 sorry, no non-triad axiom identifier anywhere, zero
sorryAx/native_decide.** The "unconditional ζ-side" wording is justified.

## The record for the dossier (M4c)

- **Donor swap executed per `novelty/axiommath-as-donor.md` §(c).** The ζ-side
  proportion inputs of the M2b certificate-binder architecture are now ZetaZerosV2's
  Lamzouri endpoints, consumed directly: `hCert` + `hK673` (2/3) and `hCert` + `hK839`
  (5/6-distinct) are **DROPPED entirely** — no Knausgård certificate machinery, no
  `native_decide` path anywhere on the ζ side (the donor is sorry-free/native_decide-free
  and triad-clean on our pin). The χ-side stays conditional (`hEχ` / `hEχdStrip` — zeta23
  ThmE port remains the only route; V2/PNT+/DZDF have no Dirichlet-L proportion content).
- **Post-M4b binder inventory of the landings** (blueprint §d confirmed):
  2/3 landing carries exactly `hEχ` + the M2a structural set (`hχ hK hK1 hP1 hfac
  hfinK/ζ/χ`, at `fζ := riemannZeta`, with `hζ` discharged inline via
  `analyticAt_riemannZeta`) + `hntopζ` + `hntopχ`; the distinct landing adds `hEχdStrip`;
  the negligible form adds `hCZStrip` (strip-common negligibility — the honest C_D
  obstruction, `20-hCZ-NOTE.md` analysis transfers verbatim). The new ζ-side content is
  zero-hypothesis: `V2d4_endpoint`/`V2d5_endpoint` ARE the imported donor theorems.
- **Re-vocabulary (M4a, unchanged):** the distinct family counts STRIP-distinct zeros
  (`distinctCountCum` over `stripWindow 0 T` = zeta23 `Ndist` = Knausgård `Ndist 0 T` =
  V2 `distinctZeroCount` — the glue `distinctCountCum_eq_distinctZeroCount` now literally
  proves the pilot count = the donor count). M2b's on-line-distinct transcription
  (superseded, undischargeable as written) and M3's dyadic distinct layer (heritage)
  remain frozen; see M4a-note.
- **Constants unchanged — constant-race caveat unchanged:** 2/3 and 5/6 are delivered at
  the donor's margins (0.6725 − 2/3 ≈ 0.0058; 0.83625 − 5/6 ≈ 0.0029, both `norm_num`).
  Knausgård's 0.67354 / 0.83900 remain the stronger *conditional* constants (still
  certificate-carried); the unconditional-vs-stronger trade is exactly the dossier's
  recorded posture.
- **Provenance chain (A1, `novelty/pntplus-glue-as-donor.md`):** the discharged ζ side
  transitively consumes the fork's unique glue — `simple_proportion_d4` /
  `distinct_proportion_d5` ← `simple/distinct_proportion_lower` (`ZetaZeros/Main.lean`)
  ← `pairCorrelationFormula` (`PairCorrelation/FromLandau.lean:52`) ← Landau
  log-derivative (`Landau/Formula.lean:170`) ← `RiemannZetaHadamard`
  (`Landau/Formula.lean:9`); `RiemannZetaConvexity` at `Analytic/ZetaBounds.lean:12`.
- **Primary-route engineering notes (for reproducibility):** the donor vocabulary is
  re-exposed as `abbrev V2.*` (noncomputable where the donor defs are — run-1 finding);
  two proof spots needed the donor-def unfold layer made explicit (the
  `simp only […, ZetaZeros.nontrivialZeros]` second unfold; `unfold V2.simpleOnLineCount`
  → defeq `show` of the set-builder form). Everything else — all glue
  (`multOf_riemannZeta_ne_zero_iff`, `supp_inter_strip_eq_nontrivialZeros`,
  `countCum_eq_zeroCount`, `simpleOnLineCount_le_countOnCum`, …) — carried verbatim from
  the fallback.

## Out of scope (unchanged from the blueprint)

`hEχ`/`hEχdStrip` discharge (zeta23 ThmE port — separate line item); `hntopζ`/`hfinζ`
softeners (M2a residue); any dyadic-window restatement (no cumulative↔dyadic bridge on
the V2 side); the 70-series feeders (average / simple-or-on-line ζ_K analogues).

## Remaining routed items (not this lane's)

dossier-42 §Pilot-outcome addendum (orchestrator → A9 commits this note's content);
STATUS/INDEX row updates (H; INDEX row 139 already records the fallback GREEN + snapshot
942828c — the primary GREEN supersedes its "next" clause). 50-M2-R1 remains HELD pending
A7's G7b (donor-pin axiom audit of the openai 7/8 tree).
