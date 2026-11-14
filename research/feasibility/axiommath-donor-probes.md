# AxiomMath (and Cycle-2 external) donor probes — empirical elaboration verdicts on our pin

Lane A7 (feasibility), Cycle 2, 2026-11-13 (task A7-1 + coordinator relays G5/G6/G7).
Companion to `research/feasibility/port-probe.md` (rounds 1–4, the anthropics/OAI corpus)
and `research/feasibility/axiommath-bump/` (the dev/claude bumps whose logs feed §G1/G2).
Method unchanged: Modal-hosted elaboration probes — **statement elaboration only, never
proofs**; every probe `sorry` is scaffolding inside probe-convention files headed "not a
proof artifact"; hypothesis-binder forms follow the EnclOK / ProbeE precedent.

Environment (all runs): mathlib `ff2494ea5e438f8a8452db803068acd711fa0059`, toolchain
`leanprover/lean4:v4.36.0-rc2` (image = lean_probe.py's recipe, layers shared), 8710 mathlib
oleans present. App `crossmath-gprobe` (`research/feasibility/probe/gprobe.py`), runner
`research/feasibility/probe/run_gprobe.sh`, logs `research/feasibility/probe/logs-g/`
(run numbers below). Probe files: `ProbeG{1,2,3,4,5a,5b,5c,7,7b}_*.lean` alongside.

**Headline verdicts (one line each):**

| Probe | Verdict |
|---|---|
| G1a DZDF statements | **OK, 0 errors** — all four headline spellings + binder forms elaborate on mathlib-only |
| G1b DZDF direct build | **FAIL** — vendored CFT breaks vs ff2494ea (62 unique errors / 11 modules), 648/29261 jobs before saturation; DZDF = statement-level donor only |
| G2 ZetaZerosV2 | **build OK (8262 jobs, ≈15 min warm) + 13/13 audited theorems triad-clean** — fully consumable as lake dep or binder source |
| G3 Weil statement | **OK, 0 errors** — the LeanEval `weil_conjectures` statement elaborates verbatim on mathlib-only; all three geometric classes are mathlib's on our pin |
| G4 AreaLaw2D statement | **OK, 0 errors** after 3 probe-side fixes — the full Challenge statement layer (incl. entropy) re-derives mathlib-only; Physlib not needed at statement level |
| G5a AreaLaw2D+Physlib | **BLOCKED-INFRA (clean route: artifact-cache outage 14+ h, 4 attempts) — DEFER-TO-ITERATION-4**; seed route works (15,539+/18,274 jobs) and isolates the real blocker: Physlib a50684a1 not ff2494ea-compatible (17 errors / 1 module, first-ever build of the pair) |
| G5b AL-EZ3 bridge shapes | **OK, 0 errors** — ptrace-Gram, boundary-match, interface conditional, gap dictionary all elaborate |
| G5c AL-EZ1 dictionary | **OK, 0 errors** — `reducedDensity = Pmat` (W Wᴴ ↔ atom-sum) + trace bookkeeping + binding surface |
| G6a Stacks pricing | **CONFIRMED NEGATIVE (priced out)** — 59,222-job closure; 11,477 jobs then 7,493 drift errors (run21); ≈15 h compute MINUS a 59k-job-scale v4.34→v4.36 fix campaign; direct Stacks import dead this cycle |
| G6b EllipticCurve→Scheme | **break confirmed on mathlib; bridge exists in TAUCETI** (`EllipticCurve/Scheme/OfWeierstrass.lean`) — not in mathlib, not in Weil-without-Stacks |
| G7 Liu-1 statements | **OK, 0 errors** — zeta/Dirichlet near-verbatim (mathlib has `DirichletCharacter.LFunction`), Hecke in binder form |
| G7b OAI 7/8 axioms | **PASS** (2026-11-14, run31/run32: both headlines + both delegation roots = [propext, Classical.choice, Quot.sound]) |

---

## §0 Infra notes (new, beyond port-probe §1)

- **CLI**: `sudo -n -u xyz` is unavailable in the lane shells ("no new privileges" flag),
  so `run_gprobe.sh` uses the doz CLI directly (`/home/doz/dozenv/bin/modal`) — the same
  CLI axiommath-bump's v2 runs used. Staging to `/tmp/crossmath-gprobe-stage/` kept anyway.
- **Costs (wall)**: probe-mode warm runs 3–4 min end-to-end; g2 (tarball upload + update +
  cache + full ZetaZerosV2/PNT+ rebuild) ≈ 15 min; g1b (140 MB DZDF+tauceti tarball +
  update + cache + bounded build) ≈ 19 min. All 4 CPU/32 GiB for probes, 16 CPU/64 GiB
  for builds; nothing stressed.
- **Outage + fix**: from ≈22:05 the mathlib artifact service / Reservoir began failing
  (`mathlib: failed to fetch cache`, `Reservoir lookup failed … invalid JSON`) — 4+
  retries did not clear it. Fix adopted for the build modes: **seed-and-build** — patch the
  repo's `lake-manifest.json` mathlib rev to our pin, pre-copy `/opt/mathlib` (with its CI
  olens) into `.lake/packages/mathlib`, and run `lake build` with no `lake update`/cache
  step at all (`_seed_mathlib` in gprobe.py). Git deps (Physlib/Stacks) still materialize
  from their manifest pins. Earlier runs (g2, g1b) used plain update+cache while the
  service was up.

---

## §G1 DedekindZetaZeroFree (dossiers 20/22/40/42/50; gates pilot 50-M2-31/32)

Donor: `/home/doz/zcode-workdir/axiommath/DedekindZetaZeroFree` @ dev/claude `4f6208b`
(= GitHub `09afbb4c` + the bump lane's re-pin commit; lakefile: mathlib ff2494ea,
TauCeti `d92acc5c`, vendored CFT path-dep). Library = 3,867 modules / 757k LoC; the
dependency stack adds TauCeti (27,934 modules / 5.9M LoC, local clone at the exact pinned
rev `d92acc5c0`) + vendored class-field-theory (1,658 modules / 532k LoC).

### G1a — statement transcription (mathlib-only): CLEAN

`ProbeG1_DZDF.lean` (run1/run2 = logs-g runs 1–2): `RayClassCharacter` structure + CoeFun
instance + `IsPrincipal` verbatim from `Challenge/DedekindZetaChallenge.lean:14-28`; the
challenge-layer `main` (:30) and `heckeCorollary` (:34-41); the **library headline
spellings** `dedekindZeta_ne_zero` (`DedekindZetaZeroFree/Main.lean:9-13`, typed `∀ s : ℂ`)
and `heckeL_ne_zero` (`DedekindZetaZeroFree/HeckeCorollary.lean:12-19`, `𝓞 K` spelling);
and the hypothesis-binder forms `HypDZDF` / `HypHeckeL` + a binder-consuming wrapper.
**Verdict: OK — 0 errors** (4 sorry-warnings, the four transcribed statements). This
re-proves on our probe infrastructure what axiommath-bump run1 had shown for the Challenge
file alone, and extends it: the ζ_K ≠ 0 (Re s > 31/32) and finite-order-Hecke-L statements
port to mathlib ff2494ea with **zero drift**.

### G1b — direct-import route (bounded lake build): BLOCKED at the vendored CFT

`run_gprobe.sh g1b` (run4): DZDF + local tauceti tarballed (TauCeti lakefile-dep redirected
to `../tauceti`, path patch of the git require), `lake update` rc=0 (mathlib resolved
ff2494ea; the mismatched-pins warning appears as in axbump v2 runs), `lake exe cache get`
rc=0 (9096 oleans), then `lake build DedekindZetaZeroFree` bounded at 2700 s.
**Verdict: FAIL rc=1** — lake scheduled **29,261 jobs** (the full DZDF+TauCeti+CFT closure),
completed **648** and saturated: every remaining job is blocked behind **62 unique errors
(216 with repeats) in 11 modules — ALL in the vendored class-field-theory**
(`Lean4/ValuedFieldTheory/Valuation/AbsoluteValue/Completion.lean` ×31,
`…/Reciprocity/Construction/TransferNaturality.lean` ×8, `…/LocalField/Analytic/Arithmetic.lean`
×6, `Lean4/GaloisCohomology/{GroupTheory/Augmentation,Cyclic/TateComparison,GroupTheory/Finite}.lean`,
`Lean4/ValuedFieldTheory/{Valuation/DiscreteValuationField/Basic,…Ostrowski,…PowerSeriesComposition}.lean`,
`Lean4/ClassFieldTheory/…/Idele/PrincipalCore.lean`). First breaks are API drift of
v4.35-era code vs v4.36 mathlib: `CategoryTheory.End.toModuleCatHom` gone,
`CharP.subring` gone, instance-synthesis failures. **No TauCeti or DZDF module has failed
so far — the blocking layer is exactly the vendor A1's survey identified**
(`research/survey/axiommath-cft-vendor.md`: vendor = n-yamaguchi-0729/ClassFieldTheory @
77137952, v4.35.0-rc2 / mathlib 06535612, adapted by DZDF for the PRE-bump pair
(v4.35.0-rc3 / 0493595e), `-j1` serialized, no artifact cache, no recorded rebuild after
the ff2494ea bump).

**Pricing (folded with A1's inputs):** the import closure of
`dedekindAbelianQuotient`-class CFT entry points = 136 DZDF files + 12 vendor-importers +
10 vendor modules (A1's BFS); the failing surface measured here is 11 vendor modules.
Extrapolating the bump lane's fix cadence (ZetaZerosV2: 9 runs to fix 38 errors in a
v4.34→v4.36 bump of comparable shape), the CFT repair is an **M-effort fix campaign
(≈10 fix rounds, mostly mechanical API renames in 11 modules) followed by a full-stack
build that is compute-dominated by TauCeti** (5.9M LoC; 648 modules in ≈10 min of the
bounded window on 16 CPU → ≈1.1 modules/s → the full 29,261-job closure ≈ 7–8 h at that
rate, BEFORE error-blocked saturation). With `-j1` and no artifact cache (the vendor's own
constraints, A1 §(e)) it is worse. **Consumption recommendation: DZDF is a STATEMENT-level
donor on our pin — consume `HypDZDF`/`HypHeckeL` binder forms (G1a, elaboration-validated);
the direct lake-dep route is blocked by the vendored CFT and priced at ≥ an M fix campaign
+ a multi-hour build; do not gate pilot 50-M2-31/32 on it.** (Pilot 50's full-strength
route should instead use G7b's in-corpus 7/8 theorem or Liu-1's 34999/40000 boundary via
binders — see §G7.)

## §G2 ZetaZerosV2 (Lamzouri; dossiers 01/21/42; gates pilot 42-M4b)

Donor: `/home/doz/zcode-workdir/axiommath/ZetaZerosV2` @ dev/claude `a86af1a`
(`lake build ZetaZeros` = axiommath-bump v2-run9's exactly-bumped tree).
`run_gprobe.sh g2` (run3): tarball ZetaZerosV2 + PrimeNumberTheoremAnd (PNT+ redirected to
the bumped local clone, axbump's lakefile patch), update rc=0, cache rc=0, **build OK
(8,262 jobs — reproduces v2-run9; ≈15 min warm end-to-end)**, then `ProbeG2_ZetaZerosV2.lean`
elaborated INSIDE the built tree.

- **Direct-import surface (the modules to import):** `ZetaZeros.Main` (headline
  proportions), `ZetaZeros.NumericProportions` (average + simple-or-critical decimal
  forms), `ZetaZeros.Numeric.SimpleOrOnLine` (numeric constants layer). The counting defs
  (`nontrivialZeros`, `zeroMultiplicity`, `zeroCount`, `simpleOnLineCount`,
  `distinctZeroCount`, …) live in the challenge layer re-exported through the lib.
- **Axiom report (donor hygiene) — 13/13 TRIAD-CLEAN** (`[propext, Classical.choice,
  Quot.sound]`): `simple_proportion_lower`, `distinct_proportion_lower`,
  `simple_proportion_d4`, `distinct_proportion_d5`, `average_proportion_d5`,
  `simpleOrOnLine_proportion_d4`, `simpleOrOnLineProportion_gt` (all seven headline
  proportions), the numeric input layer `sqrt_two_gt`, `cos_inv_sqrt_two_gt`,
  `montgomeryTaylorConst_gt`, the Riemann–von Mangoldt bundle `riemannVonMangoldt` +
  `RiemannVonMangoldt.tendsto` + `RiemannVonMangoldt.zeroCount_pos_eventually`.
  No `native_decide` anywhere in the repo (rg; the numeric layer is norm_num/nlinarith —
  `cos_inv_sqrt_two_gt` runs `norm_num [Finset.sum_range_succ, cosTerm, Nat.factorial]`).
- **Binder forms:** `HypLamzouriSimple` / `HypLamzouriDistinct` (+ numeric + wrapper)
  stated verbatim against the donor's own defs elaborated clean inside the tree
  (the file's only 2 errors were doc-comments attached to `#print` commands — probe-file
  cosmetics, fixed in-tree; the substantive outputs are unaffected).
- **Note for A3's donor map:** there is **no `*_of_local` layer** in ZetaZerosV2 (rg
  negative); the mathlib-only clean layer is `Challenge/Basic.lean` (statements with
  `sorry`, elaborated OK in axbump run1) — the *proved* clean layer is the lib itself.
- **Consumption recommendation: fully consumable** — either as a lake dependency
  (v2-run9/g2 build on our pin, PNT+ patched to the bumped clone) or via the
  hypothesis-binder forms. Triad-only + zero native_decide ⇒ no bind-to-clean-layer
  caveat at all. Port cost of the STATEMENTS ≈ 0 (challenge file verbatim, axbump run1).

## §G3 Weil (Weil conjectures / RH over 𝔽_q; FF cluster)

Donor: `/home/doz/zcode-workdir/axiommath/Weil` @ dev/claude `c1c8983` (mathlib ff2494ea
pinned; Stacks `012108f6` git dep — **not cloned, ~63k modules**). Direct import therefore
impossible here; per task instruction the STATEMENT transcription route was probed.

`ProbeG3_Weil.lean` (run1/run2): the full LeanEval statement
`LeanEval.AlgebraicGeometry.WeilConjectures.weil_conjectures`
(`Weil/LeanEval/WeilConjectures.lean:185-194`) transcribed **verbatim** against
`import Mathlib`, plus `HypWeilConjectures` (conclusion as a binder Prop) and a
binder-consuming wrapper. **Verdict: OK — 0 errors** (1 sorry-warning).

**Load-bearing structural finding:** all three geometric classes in the statement's
binder line are **mathlib classes on our pin** — `AlgebraicGeometry.IsProper`
(`Morphisms/Proper.lean:40`), `AlgebraicGeometry.GeometricallyIrreducible`
(`Geometrically/Irreducible.lean:42`), `AlgebraicGeometry.SmoothOfRelativeDimension`
(`Morphisms/Smooth.lean:126`; the #check output `SmoothOfRelativeDimension : ℕ → {X Y : Scheme}
→ (X ⟶ Y) → Prop` is in the run log). `Over (Spec (.of F))`, `Nat.card (.mk … ⟶ X)`,
`IsIntegral ℤ α`, `‖α‖ = √(Nat.card F ^ i)` — all mathlib. **The Stacks dependency is
proof-side, not statement-side**: the Weil-conjectures STATEMENT ports to mathlib-only
with zero drift (consistent with the corpus-wide statement-port≈0 finding).
The zeta-series RH form (`Weil.exists_zetaSeries_mul_prod_even_eq_prod_odd`,
`WeilRiemannHypothesisForm.lean:206`) is NOT transcribable this way — its body mentions
the donor-internal `zetaSeries` (Stacks-side) — so the LeanEval multiset form is the
portable statement. **Consumption: binder-form only** (`HypWeilConjectures`), or await
§G6a pricing for the direct route.

## §G4 AreaLaw2D statement layer (bridge area-law.md §0)

Donor: `/home/doz/zcode-workdir/axiommath/AreaLaw2D` @ dev/claude `c0f6d96`
(mathlib ff2494ea pinned; GitHub HEAD `7768136` was v4.33.0 — the README's "v4.33" is
stale; the manifest still says `db584cd6`, pre-re-pin).

`ProbeG4_AreaLaw.lean` (runs 1→2→5): the donor's `Challenge/Basic.lean` (262 lines —
the near-self-contained statement layer of openai-math family 265) transcribed verbatim
MINUS its five Physlib `QuantumInfo.*` imports, with the one Physlib load-bearing lemma
(`posSemidef_vecMulVec_self_star`, used by `pureState`) restated with a probe `sorry`.
Coverage: `Arealaw.{Reg, restr, glue, ptrace, extendId, vonNeumann, SubState, MState,
regionEntropy}` + `OpenAI.{domainEDist, domainEDiam, graphNbhd, edgeBoundary, Qudits,
supports, hamiltonian, IsAdmissible, HasGlobalGap, pureState, AreaLaw, VertexAreaLaw,
AreaLawCorollary}` + `OpenAI.Challenge.area_law` + a `HypAreaLaw` binder form.
**Verdict: OK — 0 errors (run5)** after three probe-side fixes, each a measured lesson:

1. `Matrix.PosSemidef` over `[RCLike 𝕜]` needs `open scoped ComplexOrder` — `RCLike`'s
   order/star-order instances are **scoped** in `ComplexOrder`
   (`Mathlib/Analysis/RCLike/Basic.lean:87-88`). My restated lemma sat before any such
   open → `failed to synthesize PartialOrder 𝕜`. The donor's own sections always open it.
2. The `*ᵥ` (mulVec) notation is scoped in `Matrix` (`Data/Matrix/Mul.lean:723`); my
   hypothesis-binder block sat in a namespace AFTER `end OpenAI` (outside the donor's
   `open Matrix`) → `Mathlib.Tactic.subscriptTerm` parse error. The donor-transcribed
   statements were clean all along.
3. Dropping the five Physlib imports loses their transitive closure —
   `Mathlib.Data.Matrix.Mul` had to be imported explicitly (added).

**Statement-port cost ≈ 0 modulo those three mechanicals; the entire statement layer
(lattice, boundaries, Hamiltonian, Loewner gap, entropy) re-derives mathlib-only.**
Physlib is NOT a statement-level dependency (its one statement-layer contribution is the
8-line `posSemidef_vecMulVec_self_star`, whose statement also elaborates on our pin).
**Consumption: statement layer via transcription (ProbeG4 file is the template); proof
layer and Physlib-staged statement layer see §G5a.**

## §G5 area-law bridge probes (A4's `research/bridges/area-law.md` §6)

### G5b — AL-EZ3 interface shapes (ProbeG5b_PEPS_Bridge.lean, run10): CLEAN

PEPS side (openai-math `PEPSFilters/Basic.lean:7-147`, donor @ v4.34.1) transcribed
verbatim (`Vertex`, `Edge`, `Configuration`, `State = EuclideanSpace`, `Operator`,
`RegionConfiguration`, `Hamiltonian`, `IsGridHamiltonian`, `UniqueGround`, `FullSystemGap`,
`joinConfigurations`, `coefficientMatrix`, `reducedDensity`, `vonNeumannEntropy`,
`boundaryCard`, `UniformAreaLaw` — the last is the assumption openai-math's PEPS chain
rests on) + the AreaLaw2D region core (`Reg/glue/ptrace/HasGlobalGapMat`, ProbeG4 shapes)
+ the four bridge statements:
(i) `ptrace_gram_identity` (generic: partial trace of `vecMulVec Ω (star Ω)` = coefficient
matrix Gram) and `ptrace_gram_identity_peps` (at the PEPS encoding, with the `glue` =
`joinConfigurations` reindexing and normalization as explicit binders);
(ii) `boundary_match` (`edgeBoundaryBox` count = `boundaryCard` on the L×L grid via
`boxEmb`); (iii) `uniformAreaLaw_of_areaLaw` (the interface theorem, hypothesis-binder);
(iv) `fullSystemGap_iff_hasGlobalGap` (quadratic-form ↔ Loewner gap dictionary, inner-product
dictionary as binder). **Verdict: OK — 0 errors.** The two Reg↔RegionConfiguration
type identifications unify (defeq up to beta); `Reg loc univ ↔ Configuration L q` does
NOT (subtype vs full function type) — carried by the `hequiv` binder, exactly the
"encoding gap" the bridge names. Probe-side fixes en route (recorded in-file):
`noncomputable section` needed (Fintype.ofFinite/toEuclideanCLM/Complex.exp are
noncomputable); the donor's `instDecidableRelAdjSquareLattice` had to be transcribed for
`interedges`; `Matrix.isHermitian_mul_conjTranspose_self` does not unify inline at
`vonNeumannEntropy` on our pin — restated via a sorried `reducedDensity_isHermitian`
(the donor proves it by that mathlib lemma at v4.34; lemma exists at
`LinearAlgebra/Matrix/Hermitian.lean:286` on our pin, the failure is elaboration-order,
not absence).

### G5c — AL-EZ1 dictionary (ProbeG5c_PEPS_Dictionary.lean, run10): CLEAN

Pilot-01's `Wmat`/`Pmat`/`xsq` (`research/pilots/01/port/09_MasterIdentity.lean:1508-1517`,
kernel-verified on our pin) transcribed verbatim + PEPS `coefficientMatrix/reducedDensity`
+ the dictionary statements: `reducedDensity_eq_Pmat` (weight-1 atom family = complement
configurations), `gram_eq_Pmat` (general `W * Wᴴ`), `rdm_trace_eq_sum_xs`
(`tr ρ_A = Σ_z ‖W_{·z}‖²` — the bridge §2 L2 bookkeeping), and the binding-surface
wrapper `cert_sees_rdm_atoms` (any certificate functional of `(m, v)` sees the RDM
through the dictionary). **Verdict: OK — 0 errors** (only fix: `noncomputable section`
for `Real.sqrt` in `Wmat`). **Consumption: dossier-72 milestone-1 / AL-EZ1 part-2 input
shapes are elaboration-validated; the encoding gap is confined to the `hequiv`-binder.**

### G5a — AreaLaw2D statement layer with Physlib staged: DISPOSITION BLOCKED-INFRA (artifact-cache outage, clean route) — DEFER-TO-ITERATION-4; seed route now works and isolates the real blocker (Physlib a50684a1 is NOT ff2494ea-compatible)

`ProbeG5a_AreaLaw_Physlib.lean` (checks `OpenAI.HasGlobalGap`, `pureState`,
`Arealaw.SubState.regionEntropy`, `AreaLaw`, `AreaLawCorollary`, `VertexAreaLaw`,
`IsAdmissible`, `hamiltonian`, `domainEDist`, `edgeBoundary` + axiom prints of the two
proved subset facts + `HypAreaLaw` binder forms + the `areaLaw_to_corollary` conditional)
was to be elaborated inside the AreaLaw2D tree after `lake build OpenAI.Statements` —
which fetches Physlib from the donor's own pin (`leanprover-community/physlib` @
`a50684a1`, correctly resolved by lake in run6; Physlib additionally pulls MD4Lean,
acmepjz/md4lean @ 31907cc1) and builds the vendored region core against ff2494ea.
**Disposition (2026-11-14, attempts exhausted per queue rule):**
- **Clean route (lake update + cache) = BLOCKED-INFRA.** The mathlib artifact service
  has been down from ≈22:05 Nov 13 through ≥04:00 Nov 14 (14+ h): `mathlib: failed to
  fetch cache` on every attempt — 4× in run25 alone (attempt 4 = the final retry), same
  in runs 23/20/17, and the outage shape also killed runs 6/8/9/12 (g5a) and 11/18
  (g6a). No retry burn beyond attempt 4, per protocol.
- **Seed route = infra now SOLVED, donor-stack drift exposed instead.** The improved
  `_seed_mathlib` (dep-olen redistribution, the run21 g6a seed) fixed runs 14/20's
  foundering: run25's seeded build processed **15,539+/18,274 jobs** — Physlib's
  `ClassicalInfo.*` and the vendored `AreaLawForMathlib.QuantumInfo.Region.*` core
  BUILD against ff2494ea — then failed with **17 errors in exactly ONE module,
  `QuantumInfo.ForMathlib.Matrix` (Physlib's own)**: drift-shaped (`simp made no
  progress` ×4, `unsolved goals` ×2, type mismatches ×3, an invalid `cfc` rewrite —
  mathlib's continuously-functional-calculus API moved, `Function expected at`, …).
  Root cause is pin archaeology, not our flow: the donor's manifest records its last
  real upstream resolution as mathlib `db584cd6` + Physlib `a50684a1`; the bump lane's
  commit `c0f6d96` re-pinned the lakefile to ff2494ea WITHOUT a manifest refresh (lake
  update = artifact service = down). **Run25 is therefore the first-ever build of the
  (ff2494ea + Physlib a50684a1) pair, and Physlib @ a50684a1 does not build against
  ff2494ea.** Fix options for a future iteration: refresh Physlib to a ff2494ea-era rev
  (needs `lake update`, i.e. the artifact service) or patch the 17 errors in that one
  Physlib module (S–M effort by G1b/G2 analogy: 1 module / 17 errors vs CFT 11/62 and
  V2's 9-round/38-error campaign).
- **Probe verdict: DEFER-TO-ITERATION-4** — re-run `run_gprobe.sh g5a` turnkey once the
  artifact service recovers (the runner refreshes the manifest and gets Physlib's
  compatible rev automatically); statement-level consumption is NOT blocked (G4).

**What IS measured (definitive, textual + run evidence):**
- **Import-boundary map (local BFS + run6 log):** the statement layer
  `OpenAI/Statements.lean` imports `AreaLawForMathlib.QuantumInfo.Region.{State,
  TraceDistance}`; `Region/State.lean` → `ClassicalInfo/Entropy` + `Region/PartialTrace`,
  both importing Physlib (`QuantumInfo.ForMathlib.Matrix` etc.);
  `Region/TraceDistance.lean` imports three Physlib modules directly. **12 vendored files
  carry 13 Physlib import statements.** So the headline statements (`HasGlobalGap`,
  `pureState`, `regionEntropy`, `AreaLaw`) sit ABOVE the Physlib boundary in the donor's
  own tree — but G4 proves the SAME statements re-derive mathlib-only (the one Physlib
  statement-layer contribution is the 8-line `posSemidef_vecMulVec_self_star`).
- The proof theorem `AreaLaw.areaLaw` (Transfer.lean:361) sits far above (S01–S09 +
  replicas + scanner + Schur–Weyl library mathlib lacks entirely, bridge §0.2).
- Donor pins: lakefile mathlib = our ff2494ea exactly; the stale manifest (db584cd6) is
  refreshed by `lake update` when the service is up (run6 got as far as resolving both
  mathlib and Physlib revs).
- **Consumption: statement level via the G4 mathlib-only transcription (validated);
  the Physlib-staged direct-import route is DEFER-TO-ITERATION-4 (see disposition above
  — one `run_gprobe.sh g5a` once the artifact service recovers, which also refreshes
  Physlib past a50684a1; runner + probe are on disk, turnkey).**

## §G6 function-field cluster (A2's `research/bridges/function-field.md`)

### G6a — partial StacksFrontier build pricing: CONFIRMED NEGATIVE (priced out — 59,222-job closure, 7,493 drift errors at saturation)

Facts established (runs 11/15/18/**21** + raw GitHub reads + local BFS):

- **Stacks @ `012108f6` pins toolchain v4.34.0-rc2 and mathlib `16edf57d`** (its
  `lean-toolchain` / `lakefile.toml` read off raw.githubusercontent). Building it as
  Weil's dependency forces the root pins (v4.36.0-rc2 / ff2494ea) — i.e. a v4.34-era
  ~60k-module corpus against v4.36 mathlib, the same class of bump that took ZetaZerosV2
  **nine fix rounds at 1/20th the size**.
- **The closure is measured, not guessed:** the seed-runs reached lake's job scheduler —
  **59,173 total jobs** (run15) / **59,222** (run21) for
  `lake build Weil.LeanEval.WeilConjectures` — the Weil-side statement closure is only
  **69 modules with 68 direct StacksFrontier imports** (local BFS), so ≈59k jobs are the
  StacksFrontier transitive closure + deps. At the measured healthy-build rate on this
  Modal shape (g1b: 648 modules / ≈10 min ≈ 1.1 modules/s on 16 CPU) a zero-error build
  would run **≈ 15 hours** — and zero-error is now EXCLUDED, see next bullet.
- **Drift CONFIRMED at scale (run21, the clean seed run — mathlib ff2494ea olens
  pre-seeded + dep olens redistributed, so failures are genuinely Stacks-side, not
  dep-rebuild noise):** the build compiled **11,477 / 59,222 jobs** and then saturated
  with **7,493 errors** across 50+ `StacksCore.*` / `StacksFrontier.*` modules — starting
  in the corpus's own foundations (`StacksCore.Algebra.Algebra.Subalgebra.Basic`,
  `StacksCore.Algebra.Homology.ShortComplex.SnakeLemma`,
  `StacksCore.Algebra.Homology.SpectralSequence.EdgeStep`,
  `StacksCore.CategoryTheory.Basic`, dozens of
  `StacksFrontier.Algebra.Category.ModuleCat.Sheaf.*`, …; representative first break:
  `StacksFrontier/CategoryTheory/Sites/Continuous.lean:164` — instance-synthesis failure
  `PreservesLimitsOfShape I (sheafToPresheaf J (Type w) ⋙ u.op.lan ⋙
  presheafToSheaf K (Type w))`, i.e. v4.36 mathlib category-theory API drift). Run15's
  143,641 errors (259 jobs done) were dominated by Aesop/Batteries rebuilding from source
  without traces — infra noise, superseded by run21's cleaner seed.
- The clean update+cache route additionally hit the artifact-service outage (runs 11/18/
  21-update ×4 attempts each) — infra, not donor verdicts.
- **Pricing verdict (FF-EZ3/FF-EZ4 consumption): buildable-in-principle = yes (lake
  resolves Stacks @ 012108f6 from Weil's lakefile; toolchain answer = root v4.36.0-rc2
  overrides Stacks' v4.34.0-rc2 lean-toolchain), but the real cost is ≈ 15 h of 16-CPU
  compute PLUS a v4.34→v4.36 drift fix campaign that run21 proves is needed at
  7,493-errors-in-the-first-12k-jobs density on a ~59k-job corpus (ZetaZerosV2 needed
  nine fix rounds at 1/20th the size). Direct Stacks import is DEAD for this cycle and
  priced L-and-worse for any cycle; the G3 statement route and pilot-71's no-Stacks
  baseline are the consumption paths.** Baseline note: A2's pilot-71 P0 (statement
  probe, no Stacks) doubles as the FF no-Stacks baseline — cite
  `research/pilots/71-prework.md` + `research/pilots/71/logs/` (not re-run here, per
  coordinator de-duplication).

### G6b — EllipticCurve→Scheme instance path (FF-EZ4): BREAK on mathlib; bridge exists in tauceti

- **mathlib ff2494ea: NO bridge.** The elliptic-curve layer is equation-form
  (`WeierstrassCurve` + typeclass `WeierstrassCurve.IsElliptic`,
  `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean`; projective form
  `WeierstrassCurve.toProjective` is another equation-form abbrev,
  `Projective/Basic.lean:114`). No `instance … : Scheme`, no Proj model, no
  `toScheme` anywhere in `Mathlib/` (rg). The file's own docstring says it "only gives a
  type which can be beefed up to a category which is equivalent to the category of
  elliptic curves over `Spec(R)`" — the beefing-up is not in mathlib.
- **tauceti (same toolchain as us, `d92acc5c0`): the bridge EXISTS** —
  `TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/` (≈30 files):
  `WeierstrassCurve.projModel : Scheme` (`Scheme/ProjModel.lean:98`,
  `noncomputable abbrev projModel`), `WeierstrassCurve.toEllipticCurveGeom`
  (`Scheme/OfWeierstrass.lean` — "smooth of relative dimension one and proper over
  `Spec R`", with `exists_iso_toEllipticCurveGeom` over local rings, base-change
  compatibility, group-law identification).
- **Verdict for FF-EZ4:** the genus-1 identification `zetaSeries(E) = W.zetaFunction`
  cannot even be STATEd against Weil's `Over (Spec F)` encoding without either Stacks
  or tauceti's `projModel`/`EllipticCurveGeom` layer (tauceti is the cheap route: same
  toolchain, direct lake dep — the "tauceti → direct dependency" consumption pattern).
  tauceti's own `WeierstrassCurve.zetaFunction` + RH genus-1
  (`norm_eq_inv_sqrt_card_of_one_sub_frobeniusTrace_mul_add_card_mul_sq_eq_zero`,
  `EllipticCurve/Isogeny/Frobenius/Zeta.lean:244`) + Hasse bound live on the
  equation-form side, so the pilot is: transport along `toEllipticCurveGeom` ↔ LeanEval
  statement (mathlib-only, G3-validated) instantiated at `projModel`.

## §G7 Liu-1 zero-free donor + OAI 7/8 in-corpus audit (gates pilot 50 full-strength)

### G7 statement level (ProbeG7_LiuZeroFree.lean, run13): CLEAN

Donor: `/home/doz/zcode-workdir/liu-zerofree` (H's read-only clone of
github.com/liubaiying101/Slightly-improved-…, companion to arXiv 2610.12234).
**Pins read:** toolchain `v4.34.1`, mathlib `d13f23b7` (the openai-math lineage exactly);
deps rellich-kondrachov + PrimeNumberTheoremAnd (AlexKontorovich's) + PrimeCert + leancert,
with v4.34.1-compat patches applied to deps by a `post_update` hook (`upstream/*.patch`).
Headlines (`RHZeroFreeExtension.lean:17-35`): `beta_star_le`
(`HeckeZeroSupremum.beta ≤ 34999/40000`), `hecke_nonzero`, `dirichlet_nonzero`,
`zeta_nonzero` — Re s > 34999/40000 = **0.874975**, a clean-rational relaxation of the
paper's 0.874957069799 (README), improving OAI's 7/8 = 0.875; the entry file carries its
own `#print axioms` (self-reported triad-clean).

Probe (mathlib-only on OUR pin): `zeta_nonzero` **verbatim** (mathlib `riemannZeta`);
`dirichlet_nonzero` **near-verbatim** — `DirichletCharacter.LFunction` exists in mathlib
on our pin (`NumberTheory/LSeries/DirichletContinuation.lean:60`, `= ZMod.LFunction χ s`),
including the donor's `letI : NeZero q := ⟨hq⟩` spelling; `HypLiuHeckeZeroFree` /
`HypLiuBetaStar` binder forms for the OAI-corpora-internal `Character`/`LFunction`/
`HeckeZeroSupremum`; plus `liuBoundary_lt_seven_eighths` (proved by `norm_num` — the
improvement constant is kernel-checked in-probe). **Verdict: OK — 0 errors.**
**Discrepancy note for A5:** README's 0.874957069799 vs the Lean rational 34999/40000 =
0.874975 — the formal statement is the weaker rational; consume 34999/40000, not the
README number.

### G7b (primary) — OAI's own 7/8 theorems, axiom audit at the donor pin: **PASS (2026-11-14)**

**Verdict.** `logs-g/run32-g7-elab.log` (`ProbeG7b_OAI_SevenEighths.lean: OK rc=0, 0 errors,
0 sorry`): `OAI.DirichletCharacter.LFunction_ne_zero_of_seven_eighths_lt_re`,
`OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re`,
`OAI.SevenEighths.ProbeFinalAssemblyUnconditional.dirichlet_nonzero` and `.zeta_nonzero`
all depend on exactly `[propext, Classical.choice, Quot.sound]` (no `sorryAx`, no
`native_decide`-class axiom). The headline prints were already triad in run31; that run's
two probe errors were wrong delegation-root names in the probe text (`SevenEighths.*` →
`OAI.SevenEighths.*`), fixed for run32. **Substrate:** the closure was built as 28 cached
Modal image layers (`feasibility/probe/g7_layers.py`: prep + chunk0 + 25 topological
~20k-LoC chunks + target; 2 cpu, LEAN_NUM_THREADS=2; chunk memory 8 GB user-approved after
telemetry showed 5.3–6.5 GB of mmapped Mathlib oleans). Attempt history: run19 FAIL
(unpatched), run22/24 killed, run26 TIMEOUT, run28 cancelled by the user (over-provisioned
64 cpu / 128 GB), run29/30 stopped for telemetry fixes, run31 built all layers, run32
re-elaborated on the cached top layer with no rebuild.



`OAI/NumberTheory/DirichletL/Nonvanishing.lean:19/:29`
(`DirichletCharacter.LFunction_ne_zero_of_seven_eighths_lt_re`,
`riemannZeta_ne_zero_of_seven_eighths_lt_re`) — proved in-corpus, proof delegates to
`SevenEighths.ProbeFinalAssemblyUnconditional`. The audit builds the pruned
Nonvanishing closure (**2,924 files / 486,490 LoC — exactly port-probe §7.2's numbers; a
4 MB tarball**) at the donor's own pin (v4.34.1 / d13f23b7; axioms are pin-independent),
then `#print axioms` on both headlines + the assembly layer. The v4.34.1 toolchain is
installed in-container by `_elan_ensure`. Port-cost side (statement): already
elaboration-validated at ff2494ea by port-probe C1 (challenge form) — corpus-wide
statement-port≈0 applies; the axioms report is the open question run16 answers.

**Consumption recommendation for pilot 50-M2 (folding A5's re-target):** the full-strength
7/8 route is **in-corpus** (OAI's Nonvanishing subtree, 0 sorry) — consume via binder
forms at our pin (statement side verified); Liu-1's 34999/40000 is the sharper boundary
available as STATEMENT-level binder only (per A5: DO-NOT-CONSUME as a build dep — its
stack is v4.34.1 + four patched git deps + the OAI corpus; no repo build attempted here,
per coordinator).

---

## §8 Run index (logs-g/)

run1-probe (G1a/G3/G4 first pass) · run2-probe (G4 fix round 1, G5b/G5c first pass) ·
run3-g2 (ZetaZerosV2 build + ProbeG2 axiom audit) · run4-g1b (DZDF bounded build) ·
run5-probe (G4 OK) · run6/8/9-g5a (AreaLaw2D update failures — outage evidence) ·
run7-probe (G5c OK) · run10-probe (G5b OK) · run11-g6a (Stacks update failure — outage) ·
run12-g5a (retry, outage) · run13-probe (all six mathlib-only probes OK incl. G7) ·
run14-g5a (seed-and-build) · run15-g6a (seed-and-build) · run16-g7 (OAI donor-pin build).
All logs carry the Modal run URL in the transcript; /tmp copies are ephemeral (log-rescue
lesson) — the tee'd copies under `logs-g/` are canonical.
