# QA — donor-probes spot-check (Q7 pass, unplanned-in-H's-table edition)

Lane A5 (novelty), 2026-11-13, per orchestrator authorization (H informed; qa/ area
authorized for this file). Object: `research/feasibility/axiommath-donor-probes.md`
(lane A7, landed 22:33). Recipe: H's Q4 donor-map recipe (`qa/cycle2-qa-plan.md` §(a))
adapted to probe verdicts — every elaboration/DISCHARGES-style verdict re-checked
against (i) the probe file on disk, (ii) the canonical log under
`feasibility/probe/logs-g/`, (iii) the donor source at the claimed locator; axiom
reports re-counted against the claimed hygiene. 10 claims sampled across §G1–§G7
(all headline-verdict rows except the three explicitly-pending G5a/G6a/G7b).

**Tally: 12 checks — 12 OK (2 carrying MINORs: 1 locator abbreviation, 1 log-summary
labeling quirk) + 1 OPEN sub-flag (G7b donor-pin axiom audit, run16 in flight), 0 WRONG.**

| # | Claim (source §) | Re-check against | Verdict |
|---|---|---|---|
| 1 | G1a "OK 0 errors, 4 sorry-warnings; four headline spellings + binder forms" | `logs-g/run13-probe-g7.log`: `[probe] ProbeG1_DZDF.lean: OK; errors=0` with exactly 4 `declaration uses 'sorry'` warnings (:43/:47/:58/:64 — the four transcribed statements); probe file spellings verbatim vs donor | **OK** |
| 2 | G1a locators `dedekindZeta_ne_zero` Main.lean:9-13 (`∀ s : ℂ`), `heckeL_ne_zero` HeckeCorollary.lean:12-19 | sed of donor files: both theorems exactly at those ranges, `31/32` + `∀ s : ℂ` + `𝓞 K` spellings as claimed | **OK** |
| 3 | G1b "FAIL rc=1, 62 unique errors (216 repeats) / 11 modules, all vendored CFT; 648/29261 jobs" | `logs-g/run4-g1b.log`: final line `build: FAIL rc=1 errors=216`; log's own summary "unique errors/11 vendored-CFT modules; 648/29261 jobs"; error lines sampled are all `Lean4/{ValuedFieldTheory,GaloisCohomology,…}` (vendored CFT) — no DZDF/TauCeti module failures visible | **OK** |
| 4 | G2 "build OK (8262 jobs)" | `logs-g/run3-g2.log`: `Build completed successfully (8262 jobs).` + `{'build': 'OK', …}` | **OK** |
| 5 | G2 "13/13 TRIAD-CLEAN; no native_decide" | run3 log: exactly 13 lines `'…' depends on axioms: [propext, Classical.choice, Quot.sound]` (the seven headline proportions + 3 numeric inputs + 3 RvM-bundle entries, names matching §G2's list verbatim); `sorryAx` count 0; `rg native_decide` over ZetaZerosV2 → no matches. The doc's disclosure of ProbeG2's own 2 errors (`unexpected token '#print'; expected 'lemma'` at :36/:43) matches the log — cosmetic doc-comment diagnosis CONFIRMED | **OK** |
| 6 | G2 "no `*_of_local` layer (rg negative)" | `rg -l '_of_local' axiommath/ZetaZerosV2/` → empty | **OK** |
| 7 | G3 "statement elaborates verbatim mathlib-only; all three geometric classes mathlib's on our pin" | mathlib checkout sed: `IsProper` at `Morphisms/Proper.lean:40`, `GeometricallyIrreducible` at `Geometrically/Irreducible.lean:42`, `SmoothOfRelativeDimension` at `Morphisms/Smooth.lean:126` — all three at the exact claimed lines; ProbeG3 carries the verbatim `weil_conjectures` transcription; run13 `ProbeG3_Weil.lean: OK; errors=0` | **OK** |
| 8 | G4 "Challenge layer verbatim minus 5 Physlib imports; one restated lemma; OK 0 errors after 3 fixes" | donor `Challenge/Basic.lean:25-29` = exactly the five `QuantumInfo.*` imports; `ProbeG4_AreaLaw.lean` mentions QuantumInfo only in comments (:6, :46) — no imports; restated `posSemidef_vecMulVec_self_star` at :51; run5 `ProbeG4_AreaLaw.lean: OK; errors=0` | **OK** |
| 9 | G6b "tauceti bridge exists: `projModel` at `Scheme/ProjModel.lean:98`; genus-1 RH at `Frobenius/Zeta.lean:244`; mathlib has NO bridge" | tauceti: `noncomputable abbrev projModel : Scheme.{u}` at `Scheme/ProjModel.lean:98` ✓; `Zeta.lean:244` = `theorem norm_eq_inv_sqrt_card_of_one_sub_frobeniusTrace_mul_add_card_mul_sq_eq_zero` ✓ (the doc's `norm_eq_inv_sqrt_card_…` name) — **MINOR**: the actual path is `…/EllipticCurve/Isogeny/Frobenius/Zeta.lean` (doc elides `Isogeny/`; same elision in bridge/survey); mathlib `AlgebraicGeometry/EllipticCurve/` rg for `instance … : Scheme`/`toScheme` → 0 matches ✓ | **OK (minor locator)** |
| 10 | G7 "Liu-1 pins v4.34.1 / mathlib d13f23b7; entry theorems :17-35 at 34999/40000; probe 0 errors; boundary improvement kernel-checked" | local clone `/home/doz/zcode-workdir/liu-zerofree`: toolchain `v4.34.1` ✓; manifest mathlib rev `d13f23b723b8a846827a245b89c10fc7d3f11612` (exact prefix ✓); `RHZeroFreeExtension.lean:17` `theorem beta_star_le : HeckeZeroSupremum.beta ≤ (34999/40000 : ℝ)` with `hecke_nonzero`/`dirichlet_nonzero`/`zeta_nonzero` following in-range ✓; run13 `ProbeG7_LiuZeroFree.lean: OK; errors=0` ✓; `liuBoundary_lt_seven_eighths … := by norm_num [liuBoundary]` at probe :30-31 ✓ | **OK** |

**MINOR 2 (not a claim miss — a labeling quirk):** run13's per-probe summary lines read
`sorry-warnings=0` while the raw log shows the expected probe-convention `sorry`
warnings (e.g., 4 for ProbeG1) — gprobe.py's summary counter evidently counts
something other than raw warnings. Verdict-shaping number (`errors=0`) is unaffected;
A7 may want to relabel that summary field.

**Pending-section status check (post-doc runs):** `logs-g/run16-g7.log` tail is
inconclusive (function-creation lines only — G7b still in flight); `run17-g5a.log` and
`run18-g6a.log` both still end in `error: mathlib: failed to fetch cache` (the §0
artifact-service outage) — the doc's "pending (see §G5a/§G6a/§G7b)" statuses are
ACCURATE as of these logs; no silent completions to reconcile.

**Consequence for consumers:** all consumption recommendations in donor-probes.md are
verdict-safe as stated — G1a/G3/G4/G5b/G5c/G7 statement-level verdicts, the G1b
blocker pricing, and the G2 full-consumability call are each log- and source-verified
by this pass. Nothing here changes any VERDICTS row; the Liu 34999/40000-vs-README
discrepancy noted by A7 §G7 matches liu1-as-donor.md §1 (independently confirmed).

## Addendum — coordinator-requested items (sample extended to 12; H's `24e8d93` copy is the audited object)

| # | Item (coordinator addendum) | Re-check | Verdict |
|---|---|---|---|
| 11 | **G1b vendored-CFT FAIL cross-checks A1's CFT-vendor §(c) prediction** | claim 3's evidence re-read against `survey/axiommath-cft-vendor.md` §(c)'s prediction (vendor = n-yamaguchi-0729 @ 77137952, v4.35-era code, no recorded post-bump rebuild): the 11 failing modules are all vendor `Lean4/*` (ValuedFieldTheory/GaloisCohomology/ClassFieldTheory/LocalField), with v4.35→v4.36 API-drift errors (`CategoryTheory.End.toModuleCatHom` gone, `CharP.subring` gone) — the failure layer and mode are exactly A1's prediction; **cross-check CONFIRMED** | **OK** |
| 12a | **G2 V2-import verdict (gates 42-M4b-upgrade) — import surface exists** | the three §G2-named import targets all exist in the donor tree: `ZetaZeros/Main.lean`, `ZetaZeros/NumericProportions.lean`, `ZetaZeros/Numeric/SimpleOrOnLine.lean` — combined with claim 4 (build OK, 8262 jobs) and claim 5 (13/13 triad), the 42-M4b-upgrade gate is fully evidence-backed | **OK** |
| 12b | **G7 openai in-corpus 7/8 verdict — exact wording + 50-M2-R1 gate flag** | §G7's verdict sentence: "the full-strength 7/8 route is **in-corpus** (OAI's Nonvanishing subtree, 0 sorry) — consume via binder forms at our pin (statement side verified)". The **axiom-audit half (G7b) is still PENDING** — headline table says "pending (see §G7)"; `run16-g7.log`'s tail is inconclusive (Modal function-creation lines only, no verdict payload). **Gate consequence for 50-M2-R1: statement-level consumption is evidence-backed today; the donor-pin `#print axioms` audit (run16) must land before any kernel-facing claim about the 7/8 route's hygiene.** My independent local check (liu1-as-donor §4) corroborates the subtree's 0-sorry grep status at the CURRENT corpus snapshot | **OK (statement) / OPEN (G7b audit)** |
