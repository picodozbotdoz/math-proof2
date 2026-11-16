# ITER4-DONOR-UNBLOCK-PLAN — route designs, G-probe specs, runner kit (lane R8, 2026-11-16)

Iteration-4 review phase, lane R8 (donor/feasibility engineering). **Paper studies +
record reads only — NO Modal runs, NO builds this queue** (per the queue rule; everything
in §Probe-spec blocks executes only after orchestrator approval). Siblings read-only;
every repo-state claim carries file:line. New measurements made this session by local
import-graph BFS (no builds): §1b closure numbers. Two external reads (GitHub API / raw,
2026-11-16): upstream PNT+ toolchain, physlib master surface.

**Verdict table (one line each):**

| Route | Verdict | One line |
|---|---|---|
| (a) DZDF/CFT | **DO binder tier (already validated); DROP direct build for iter4** | The shim cannot work (≤4 of 62 first-wave errors are name-aliasable; the rest is proof-body drift), the statement extraction ALREADY landed (G1a binders), and the direct route's unique coverage has no iteration-4 consumer — pilot 50's hQRH discharge is DONE via R1 (OAI 7/8, GREEN run32) |
| (b) Physlib/G5a | **DROP direct route for iter4 (no consumer); DO nothing — AL-3D is unblocked mathlib-only** | al-3d-prework needs ZERO Physlib (imports banned by its own gates); the 17-error fix is S–M but pointless without a donor-proof consumer; refresh route re-verified live (modern physlib still carries `QuantumInfo/ForMathlib/Matrix.lean`) |
| (c) PNT+ upstream | **DEFER (watchlist stands); optional G9 preflight for the carried 22-T2a slot** | T1/T2/T3 all unfired on 2026-11-16 (T2a slot is *statement-binder*-postured, no PNT-AP/Chebotarev consumer, upstream toolchain still v4.35.0 — fetched today) |
| (d) Weil/Stacks | **DROP direct import (permanent); statement tier already LANDED** | G6a negative stands; the statement-only extraction path is not a proposal — it executed (G3 0-errors + pilot 71 Tier C, P2 axcheck 0 sorryAx) |

---

## 1. Route (a) — DZDF / vendored CFT: shim vs extraction vs build

### 1a. The 62 first-wave errors, classified (from `research/feasibility/probe/logs-g/run4-g1b.log`)

Histogram over the 62 unique errors (11 modules, all vendor-side; counts by grep of the
tee'd log, lines 70–847):

| Error class | Count | Shim-addressable? |
|---|---|---|
| Type mismatch | 19 | NO — mathlib API *shapes* changed inside proof bodies |
| failed to synthesize instance (10 + 1 variant) | 11 | NO (mostly) — instance graph changed; an alias file cannot re-synthesize |
| Application type mismatch | 9 | NO |
| `'change' tactic failed, pattern` | 8 | NO |
| unsolved goals | 3 | NO |
| Not a definitional equality | 3 | NO |
| Invalid field `toModuleCatHom` (env lacks `CategoryTheory.End.toModuleCatHom`) | 3 | YES — rename/alias (TateComparison.lean:40/67/103, log :70–76) |
| Tactic `rewrite` failed (+1 equation-lemma failure) | 3 | NO |
| Unknown constant `CharP.subring` | 1 | YES — alias (DiscreteValuationField/Basic.lean:41, log :81) |
| Unknown identifier `G` | 1 | NO (cascade) |

**Shim verdict: DEAD as an unblock.** A compat file can alias at most 2 declarations
covering 4 of 62 first-wave errors (~6%); the other ~58 are elaboration failures inside
vendor *proof bodies* (`Type mismatch`/`Application type mismatch`/`change`/instance
synthesis), fixable only by editing the vendor tree — a staged-copy patch campaign, not a
shim. Concentration: `ValuedFieldTheory/Valuation/AbsoluteValue/Completion.lean` ×31
(log :351–551) is a single-API-surface rewrite (completion/`AbsoluteValue` refactor), the
worst single module.

### 1b. What the direct route actually has to build (NEW: local BFS this session)

Import-graph BFS over the sibling tree (`axiommath/DedekindZetaZeroFree/`, read-only;
module names indexed from `DedekindZetaZeroFree/` + `vendor/class-field-theory/Lean4/`;
1,658 vendor modules found = exactly A1's retained count, `survey/axiommath-cft-vendor.md`
:7–8 — cross-validation):

| Build target | DZDF modules | Vendor transitive | TauCeti | Notes |
|---|---|---|---|---|
| `DedekindZetaZeroFree.Main` (`dedekindZeta_ne_zero`, `Main.lean:5`) | 3,842 | **1,658 (ALL of it)** | 0 | **all 11 failing modules are in this closure** (checked name-by-name) |
| `DedekindZetaZeroFree.HeckeCorollary` (`heckeL_ne_zero`) | 3,850 | 1,658 | 0 | + `RayClassFieldReciprocity`/`FiniteAbelianLocalExtension` entries |
| `…LFunctions.Dedekind.EntireAbelianQuotient` (pilot-75 route) | 136 | 10 entry modules | 0 | matches A1's §(b) numbers exactly (136/12/10) |

Consequences: (i) the "just build Main" narrow-target dodge does not exist — the ζ_K 31/32
headline drags the entire vendor tree; (ii) TauCeti is a lakefile requirement but NOT in
Main's module closure, so a *targeted* `lake build DedekindZetaZeroFree.Main` closure is
≈6.3k modules (vs 29,261 jobs for the full-lib G1b run, `axiommath-donor-probes.md` :82);
(iii) G1b's measured rate (648 modules/≈10 min at 16 CPU, :105–106) prices the narrow
target at ≈12–16 h **at 2 CPU** even with zero errors — which is excluded (62-error first
wave + unknown later waves behind saturation), so the real route is an M-effort fix
campaign (≈10 rounds by the ZetaZerosV2 cadence, :101–104) THEN a cached-layer build
campaign.

### 1c. Cheapest viable consumer path (the design)

**Statement-level extraction — already executed and on record.** G1a
(`ProbeG1_DZDF.lean`, runs 1–2): `dedekindZeta_ne_zero` (`Main.lean:9-13`) and
`heckeL_ne_zero` (`HeckeCorollary.lean:12-19`) transcribe verbatim mathlib-only, 0 errors;
binder forms `HypDZDF`/`HypHeckeL` elaborated (`axiommath-donor-probes.md` :63–74). The
pilot-50 M2 spec already names this the executable-today fallback: `hDZ` binder +
`strip_confinement_31_32_of_hDZ` (`pilots/50-M2-31-32-spec.md` :82–90), and its §3 route
table records that "the BINDER route needs ZERO vendor imports" (:117–119).

**G7b precedent comparison (why the direct route loses).** The OAI 7/8 donor closure was
2,924 files / 486,490 LoC, 0 errors to fix, built as 28 cached image layers over runs
19–32 (≈2 days, one user-approved 8 GB memory bump) — `axiommath-donor-probes.md`
:407–423. The DZDF direct route is ≈2× that module count **after** an M-effort 62+-error
fix campaign in someone else's vendored tree (patching a staged copy; the sibling itself
is read-only). And its unique coverage (ζ_K zero-free for EVERY number field + ray-class
Hecke characters, `50-M2-31-32-spec.md` :109-110) has **no iteration-4 consumer**: pilot
50's hQRH discharge is complete via R1 (`R1.lean: OK rc=0 errors=0 sorry-warnings=0`,
`logs-g/run32-g7-elab.log` :137 — the unconditional `strip_confinement_seven_eighths`
landing), and pilot 75's P-b consumes `dedekindAbelianQuotient`-shaped facts as binders by
design (`pilots/75/Pb-design.md` hypotheses; `survey/axiommath-cft-vendor.md` §(d) :178–184).

**Recommendation (a): DO the binder tier (no new infrastructure — consume G1a evidence);
DROP the direct build for iteration 4.** Keep R2's binder-tier landing
(`strip_confinement_31_32_of_hDZ`) as the pilot-level expression of the route whenever a
slot wants it; the direct-import discharge stays a priced-out future tranche.

### 1d. Probe spec — G8 (OPTIONAL; only if the orchestrator wants the direct route kept warm)

- **G8 — DZDF narrow-target pricing probe** (build-mode, not statement-mode; NOT
  chartered by this plan). Form: new `g8` mode in `run_gprobe.sh` cloning the `g1b`
  pattern (`run_gprobe.sh` :37–42) with `lake build DedekindZetaZeroFree.Main` (NOT the
  full lib), same tarball/staging, bounded window, seed-and-build substrate.
  **Pass criterion** (as a *measurement*): scheduled jobs ≈6.3k ±10% (validates the §1b
  BFS on-Modal) and the failing-module set ⊆ the 11 known vendor modules. Expected
  outcome: FAIL-saturation (the 62 errors are in the closure), i.e. G8 *confirms* the
  DROP; its only product is a measured job count for any future re-price. Cost class:
  ≈20 min at 16-CPU-equivalent shape in the G1b precedent — at the 2-CPU spec expect the
  bounded window (2700 s default) to elapse first; use `--build-timeout 3600` and treat
  the job-scheduler line as the datum. **This plan does not recommend running G8 in
  iteration 4.**

---

## 2. Route (b) — Physlib/G5a and the AreaLaw2D surface

### 2a. What al-3d-prework actually needs from Physlib: NOTHING

`pilots/al-3d-prework.md` is explicit: "the pilot NEVER imports `OpenAI.*` or
`AreaLaw*` from the donor" (:216–218, G5a consequence), donor imports and Physlib are
BANNED list items (:275 iv/v, :309 R5), and the GO verdict is "mathlib-only statement
layer + donor-architecture port, zero donor imports, zero donor builds" (:22–24) on the
strength of G4 (statement layer re-derives mathlib-only, 0 errors,
`axiommath-donor-probes.md` :190–207; template = `feasibility/probe/ProbeG4_AreaLaw.lean`).
The `PlanarAreaLawVar` binder deliberately defers discharge (:174–178 honesty ledger).
So the only thing that ever needed the vendored Physlib-staged build is the
**donor-proof import route** (`area_law`, the B.1 pair) — and no iteration-4 slot
consumes that.

Note the name-collision trap stands (`novelty/physlib-surface.md` §3.4 :100–106): the
AreaLaw2D dep is `leanprover-community/physlib @ a50684a1`; `novelty/physlib-surface.md`
is about the SAME repo's modern PerturbationTheory wing (dossier 52 / seed-11 territory),
not about the AreaLaw2D dependency surface.

### 2b. The 17 errors, and a correction to the record

All 17 first-wave errors are in ONE module, Physlib's own
`QuantumInfo/ForMathlib/Matrix.lean` (`logs-g/run25-g5a.log` :199, errors at :287–:647):
`simp`/`simp_all` no-progress ×4 (:287,:293,:309,:1013), `unsolved goals` ×2 (:315,:377),
Type mismatch ×3 (:439,:474,:1575), `Function expected at` (:289), invalid `cfc` rewrite
(:536 — the continuously-functional-calculus API moved), `ring_nf` no-progress (:646),
Application type mismatch (:528). Same taxonomy verdict as DZDF: a shim cannot fix
tactic-failure/type-mismatch classes; the fix is patching one module (S–M per G5a's own
analogy pricing, `axiommath-donor-probes.md` :280–283).

**Record correction (external read, 2026-11-16):** the G5a disposition's refresh route is
sound after all. `physlib-surface.md` §3.4 calls the AreaLaw2D Physlib "a different
project" — but `leanprover-community/physlib` @ `master` STILL carries
`QuantumInfo/ForMathlib/Matrix.lean` (HTTP 200 via raw.githubusercontent; directory
listing via API shows top-level `QuantumInfo/` with `ForMathlib/` intact; repo pushed
2026-11-16T09:37Z, default branch `master`). The repo grew the PerturbationTheory wing
without dropping the QuantumInfo wing. Consequence: `lake update` on a staged AreaLaw2D
tree can still resolve a post-a50684a1 Physlib rev containing the needed modules — but
modern Physlib is v4.35.0-toolchain (`physlib-surface.md` :18), so a refreshed build
against our ff2494ea pin re-opens the v4.35→v4.36 drift window on a LARGER tree; the
error count is unknown either way. (A5's §2 "no entropy/density matrices anywhere" claim
also predates this check — QuantumInfo/ForMathlib exists at master; flag to A5, not
load-bearing for this plan.)

### 2c. Probe spec — G10 (G5a-successor; DEFER, fire only on a consumer)

- **G10 — AreaLaw2D+Physlib refreshed retry.** Form: re-run `run_gprobe.sh g5a`
  turnkey (`run_gprobe.sh` :33–36) ONCE the mathlib artifact service is confirmed healthy
  (the clean route was BLOCKED-INFRA on a 14+ h outage, `axiommath-donor-probes.md`
  :262–266); the runner's `lake update` then refreshes Physlib past a50684a1 (§2b
  correction makes this viable). **Pass criterion:** `lake build OpenAI.Statements`
  completes with 0 errors and `ProbeG5a_AreaLaw_Physlib.lean` elaborates inside the tree
  (its checks are already written: HasGlobalGap/pureState/regionEntropy/AreaLaw binder
  forms + axiom prints, :252–257). **Fail handling:** if the refreshed Physlib drifts
  against ff2494ea, fall back to pinning a50684a1 + patching the 17 errors in the staged
  copy (S–M). **Cost class:** run25 processed 15,539+/18,274 jobs in a bounded window at
  16 CPU/64 GiB (:269–272); at the 2-CPU spec the same closure is ≈6–12 h → **cached
  image-layer campaign** (§5 recipe), not a single function call.
- **Trigger to fire G10:** a chartered consumer of the donor's PROVED theorems
  (`area_law`/B.1 imports) or of the Physlib-staged statement layer. No such consumer
  exists in the iteration-4 backlog → **DROP for iteration 4; G10 stays specced on the
  shelf.**

**Recommendation (b): DROP the direct route this iteration (no consumer); the AL-3D slot
is unblocked TODAY on the G4 mathlib-only template.**

---

## 3. Route (c) — PrimeNumberTheoremAnd upstream: trigger re-check (2026-11-16)

Triggers as pre-registered (`novelty/pntplus-glue-as-donor.md` §c :130–134):

- **T1 (a dossier-22 T2a pilot wants the upstream Borel–Carathéodory chain,
  `StrongPNT.lean:76–1536`): NOT FIRED.** The carried 22-T2a slot
  (`feasibility/ITERATION4-CHARTER-DRAFT.md` :50, :97; `ITERATION4-SCAN.md` :82–86) is
  *statement-binder*-postured — "upstream PNT+ statement as binder", "donor statement now
  EXISTS proved and triad-clean upstream" — it consumes the StrongPNT CONCLUSION, not the
  BC bootstrap chain as ported proof content. Transcribing the statement is the Liu-1
  external-prior-art convention (no clone, no rebase).
- **T2 (a 70-series dossier needs PNT-AP/Chebotarev-class statements): NOT FIRED.** The
  selected seeds are AL-3D / LP-duality / ZZV2-λ (`ITERATION4-SEED-DOSSIERS.md` §0 :26–41);
  nothing in the scan's 13 seeds or the charter's slot/watch lists names a PNT-AP or
  Chebotarev consumer (scan seed 7 = quasi-rh 11/12 is a ζ/Dirichlet zero-free binder
  donor, `ITERATION4-SCAN.md` :107–110 — different class).
- **T3 (upstream reaches v4.36-class pins): NOT FIRED.** External read 2026-11-16:
  `raw.githubusercontent.com/AlexKontorovich/PrimeNumberTheoremAnd/master/lean-toolchain`
  = `leanprover/lean4:v4.35.0` — unchanged from the §c record (:108–110).

**Recommendation (c): REMAIN DEFERRED (watchlist), cite as external formal prior art.**
Optional cheap preflight serving the carried slot:

- **G9 — StrongPNT statement-binder transcription probe** (statement-elaboration-only,
  mathlib-only, DO when the 22-T2a slot is chartered). Form: new `ProbeG9_StrongPNT.lean`
  beside the G-series — transcribe upstream `StrongPNT`'s conclusion (ψ = x +
  O(x·exp(−c√log x)); upstream `StrongPNT.lean:2900`, triad `#print axioms` in-file
  :2906–2908, per `pntplus-glue-as-donor.md` :113–116) as (i) the verbatim statement and
  (ii) a `HypStrongPNT` hypothesis-binder form + binder-consuming wrapper (EnclOK /
  ProbeE precedent), probe-convention header, `sorry` only inside it. **Pass criterion:**
  0 errors on mathlib ff2494ea (expected — corpus-wide statement-port ≈ 0,
  `FEASIBILITY-SUMMARY.md`). **Cost class:** probe-mode warm 3–4 min. This validates the
  T2a pilot's binder shape BEFORE the slot runs; it is NOT a registration and pulls no
  upstream code.

---

## 4. Route (d) — Weil / Stacks: confirm stay-out

- **G6a negative stands un-repriced:** 59,222-job closure, 11,477 jobs then 7,493 drift
  errors (run21), ≈15 h at 16 CPU for a zero-error build that is excluded
  (`axiommath-donor-probes.md` :310–348). Nothing in the iteration-4 backlog changes the
  arithmetic; direct Stacks import stays DEAD (L-and-worse).
- **The statement-only extraction path did not need designing — it executed.** G3
  transcribed `LeanEval…weil_conjectures` verbatim mathlib-only (0 errors; all three
  geometric classes are mathlib's on our pin, :149–174); pilot 71 consumed exactly that
  as the `WeilData`/`hWeil` binder (`pilots/71-prework.md` §2.2 :78–99, Tier C :247–248)
  and landed FINAL-GREEN with a clean full-coverage audit (`AxPilot71_P1/P2: OK,
  sorryAx-lines=0`, `pilots/71/logs/axcheck-c2-final.log` tail). The zeta-series RH form
  remains non-portable statement-side (donor-internal `zetaSeries`, :170–172) — unchanged.
- **Residual Weil-adjacent iteration-4 content routes around Stacks by design:** FF-EZ4
  (scan seed 5, watchlist) goes through tauceti's `EllipticCurve/Scheme/OfWeierstrass`
  bridge (G6b verdict, :354–379) — tauceti is same-pin direct-dep territory, no probe
  needed.

**Recommendation (d): DROP the direct-import route (re-price only if Stacks itself lands
v4.36-class pins — add that as a watchlist clock line); the landed statement tier IS the
consumption path.**

---

## 5. Modal runner kit for iteration 4

### 5a. Compliance audit of the standing patterns (2026-11-16, spec = AGENTS.md Modal guidelines)

The shared trio — `SPEC = {"cpu": 2.0, "memory": 4096}` + `@telemetered` decorator +
`LEAN_NUM_THREADS=2` secret (`feasibility/probe/modal_telemetry.py` :29, :87; the CAP
pattern) — is correctly applied in **all ten current Modal apps**:

| App file | App name | Spec | Telemetry | Threads |
|---|---|---|---|---|
| `feasibility/probe/gprobe.py` (:32,:165–486) | crossmath-gprobe | **SPEC** all 7 fns | yes | yes |
| `feasibility/probe/lean_probe.py` (:65) | crossmath-probe | SPEC | yes | yes |
| `feasibility/probe/axcheck_probe.py` (:53) | crossmath-probe | SPEC | yes | yes |
| `feasibility/probe/g7_layers.py` (:130–141, :150) | crossmath-g7-layers | SPEC + **8 GB chunks/elaborate** | yes | yes (env + :97) |
| `feasibility/axiommath-bump/axbump.py` (:59) | crossmath-axbump | SPEC | yes | yes |
| `pilots/71/run_pilot.py` (:57) | crossmath-pilot-71 | SPEC | yes | yes |
| `pilots/73/run_pilot.py` (:56) | crossmath-pilot-73 | SPEC | yes | yes |
| `pilots/75/run_pilot.py` (:53) | crossmath-pilot-75 | SPEC | yes | yes |
| `pilots/50/run_r1.py` (:118) | crossmath-pilot-50-r1 | SPEC | yes | yes |
| `pilots/42/run_m4b2.py` (:78) | crossmath-pilot-42-m4b2 | SPEC | yes | yes |
| `pilots/32/run_pilot.py` (:53), `pilots/11/pilot11_probe.py` (:54) | crossmath-pilot-32 / crossmath-probe | SPEC | yes | yes |

The g7_layers 8 GB deviations are exactly the guideline-#4 shape: user-approved
2026-11-14 for those runs only, with telemetry evidence recorded in-file (:134–137,
:149) — **approval does not carry over**; any iter4 build needing >4 GB re-asks with fresh
telemetry. Known inherent caveat (guideline #5): Mathlib-importing modules mmapped-olean
residency reads 5–6.5 GB in `mem` (run30/31 telemetry; run32 `max_mem=6497MB OVER=1`,
`logs-g/run32-g7-elab.log` :177) — treat as inherent, investigate only anon-RSS growth.

**Gaps found (fix at first use, none blocking):**
1. **Two stale shell wrappers default to the blocked xyz path**: `pilots/32/run_pilot.sh`
   (:15–16, `MODAL_USER=xyz` + `sudo -n -u xyz`, superseded by the substrate note,
   AGENTS.md) and `feasibility/probe/run_probe.sh` (:15–16, same). Everything post
   2026-11-13 (`run_gprobe.sh` :18, `run_axcheck.sh` :21, `pilots/71/run_pilot.sh`
   :10–11, `pilots/20/run_m1.sh` :21, `pilots/50/run_r1.sh` :13,
   `run_m4b_donor_axcheck.sh` :13) defaults `doz` + `/home/doz/dozenv/bin/modal`. Any
   iter4 reuse of the two stale wrappers must pass `MODAL_USER=doz` or patch the default.
2. **gprobe.py's sys.path hack** pins the absolute repo path (:30) — harmless, but new
   apps should copy the `modal_telemetry` import via stage-directory copy instead (the
   runners already stage; keep the import local to the staged dir).
3. No app violates the resource defaults; no run28-style over-provisioning pattern
   remains in any current file (checked `cpu=`/`memory=` greps above).

### 5b. Iteration-4 runner needs (checklist)

- **App naming**: keep the established series — G-series probes continue in
  `crossmath-gprobe` (new modes `g8/g9/g10` in `run_gprobe.sh`'s case block, :25–57);
  per-pilot ephemeral apps `crossmath-pilot-<slot>` following the 73/75 single-file
  pattern (`pilots/75/run_pilot.py` is the cleanest clone source: 25 lines of setup);
  AL-3D = `crossmath-pilot-al3d` as its prework already specifies
  (`pilots/al-3d-prework.md` :237–239). App name does not affect layer sharing — the
  image `run_commands` must stay TEXTUALLY IDENTICAL (elan v4.2.4 URL, toolchain
  v4.36.0-rc2, mathlib ff2494ea fetch + `lake exe cache get`; `gprobe.py` :41–58) so the
  layer cache is shared across all apps.
- **Donor-tree axcheck for any NEW built donor** (none chartered by this plan; the
  pattern for e.g. a future G10 pass): full-coverage variant `pilots/10/axcheck_full.py`
  (dotted names + `@[simp]`, dependency-order olean compile) per the AGENTS.md standard;
  in-donor-tree precedent `feasibility/probe/run_m4b_donor_axcheck.sh` +
  `m4b_donor_axcheck.py` (executed: `pilots/42/logs/m4b-axcheck-run1.log`). Donor hygiene
  gate: triad-only at statement level, on-pin `#print axioms` — never trust comparator
  configs/READMEs.
- **Artifact-cache retry protocol** (from the G5a/G6a outage record,
  `axiommath-donor-probes.md` §0 :44–52): ≤4 attempts on `mathlib: failed to fetch cache`
  per run; then fall back to **seed-and-build** (`_seed_mathlib`, `gprobe.py` :78–120 —
  patch manifest revs to the image pins, pre-copy `/opt/mathlib` olens, redistribute dep
  olens, no `lake update`/cache step). Pilot transients: retry once or twice
  (`pilots/al-3d-prework.md` :253). Always confirm service health before a clean-route
  build (one cheap probe-mode run doubles as the ping).
- **Cached-image-layer recipe thresholds**: build > ~40 min → `modal run --detach` from a
  `setsid nohup` wrapper (G7b lesson, AGENTS.md substrate note); build > ~2 h or any
  preemptible multi-hour closure → `Image.run_function` chunk layers per
  `feasibility/probe/g7_layers.py`: plan JSON of topological ~20k-LoC chunks
  (`g7_layers_plan.json`), `_sh` raises on failure so a failed layer never caches (:47–56,
  :60–72), chunk = one lost unit on preemption. Chunk memory >4 GB needs a fresh
  user approval with telemetry evidence (the 8 GB G7b approval is spent).
- **Cost classes at 2cpu/4GB** (wall estimates; anchors: probe warm 3–4 min / cold ≈3¾ min
  (`axiommath-donor-probes.md` §0 :40–43); G1b rate 648 mods/10 min at 16 CPU (:105);
  G2 V2 build 8,262 jobs ≈15 min warm at 16 CPU (:22–23)):

| Workload | Jobs/modules | At 16 CPU (record) | At SPEC 2cpu | Class / recipe |
|---|---|---|---|---|
| Statement probe (G1a/G3/G4/G7/G9-class) | 1 file | 3–4 min warm | unchanged (CPU-light) | minutes; plain function |
| Pilot milestone (71/73/75-class) | 1–3 files | 1–2.5 min warm | unchanged | minutes; plain function |
| V2-class donor build (G2) | 8,262 jobs | ≈15 min | ≈1–2 h | single SPEC function, 3 h timeout (gprobe g2 shape) |
| G10-class seeded build (G5a retry) | ≈18,274 jobs | bounded window, incomplete | ≈6–12 h | detach + layer chunks; memory watch |
| DZDF narrow target (G8, post-fix) | ≈6.3k mods + fix campaign | ≈1.6 h zero-error | ≈12–16 h | layer campaign + M fix rounds first |
| DZDF full lib (G1b) | 29,261 jobs | ≈7–8 h zero-error (excluded) | ≈2.5–3 days | priced out this iteration |
| Stacks closure (G6a) | 59,222 jobs + 7,493 errors | ≈15 h (excluded) | dead | DEAD (route (d)) |

### 5c. What re-uses what (no new infrastructure required by any recommended route)

Routes (a-binder), (c-binder/G9), (d-statement), and AL-3D all run on the EXISTING kit:
`crossmath-gprobe` probe mode (G9), `crossmath-probe`/per-pilot apps (pilot files), the
G4 template for AL-P0. The only designs needing new Modal surface are the shelf items
(G8/G10) — explicitly not chartered.

---

## 6. Dependency note for R5 (backlog consolidation)

| Iteration-4 item | Unblocked by this plan | Needs |
|---|---|---|
| Slot 2 AL-3D (B.2 staged ladder) | YES — mathlib-only; G4 template + `ProbeG4_AreaLaw.lean` as AL-P0 base; zero Physlib, zero donor build | new app `crossmath-pilot-al3d` (clone 73/75 pattern) |
| Carried 50-M2 R2 (31/32) | binder tier YES (hDZ fallback spec'd, `50-M2-31-32-spec.md` §3); direct tier NO (DROP, §1) | nothing new for binder tier |
| Carried 22-T2a | YES at binder tier; G9 preflight when chartered | G9 probe (3–4 min) |
| Carried 75 continuation (P-b) | YES — binder tier by design (CFT survey §(d)) | nothing new |
| Carried 73-Q4 / FF-EZ4 (watch) | YES — tauceti direct dep (G6b), no Stacks | nothing new |
| Seed 3 ZZV2-λ | YES — V2 is a BUILT consumable donor (G2, 13/13 triad) | existing apps |
| Pilot 20 M2 (if resumed) | YES — Card20.gamma via fork's `hasSum_digamma` substrate (`pntplus-glue-as-donor.md` §a :74–77); ζ_K zero-free side via `HypHeckeL` binder (G1a) | nothing new |
| Scan seed 7 quasi-rh 11/12 (watch) | statement-binder donor, Liu-1 convention; transcribe-on-charter (a future G-probe, number then) | none now |

**Files written by this lane:** `research/feasibility/iter4-donor-unblock-plan.md` (this
file). Nothing else modified; siblings untouched.

## 7. Sources (this session)

Repo: `AGENTS.md`; `research/feasibility/axiommath-donor-probes.md` (§0, §G1a/G1b, §G2,
§G3, §G4, §G5a, §G6a/G6b, §G7/G7b); `research/survey/axiommath-cft-vendor.md` (all);
`research/novelty/pntplus-glue-as-donor.md` (§0–§d); `research/novelty/physlib-surface.md`
(§0–§5); `research/pilots/al-3d-prework.md` (all); `research/pilots/71-prework.md`
(§2.2, §3); `research/pilots/50-M2-31-32-spec.md` (§1–§4); `research/pilots/50/R1.lean` +
`R1-prework.md`; `research/pilots/75/Pb-design.md`; `research/pilots/22/M1.lean`;
`research/feasibility/ITERATION4-SCAN.md` (§2 seeds); `ITERATION4-SEED-DOSSIERS.md` (§0);
`ITERATION4-CHARTER-DRAFT.md` ((a)–(d)); logs `feasibility/probe/logs-g/run4-g1b.log`
(:70–847 error set), `run25-g5a.log` (:109–:705), `run32-g7-elab.log` (:137, :174–177);
`pilots/71/logs/axcheck-c2-final.log`; `pilots/50/logs/combined-run14-green.log`. Runner
kit: `modal_telemetry.py`, `gprobe.py`, `lean_probe.py`, `axcheck_probe.py`,
`g7_layers.py` (+`g7_layers_plan.json`), `run_gprobe.sh`, `run_probe.sh`, `run_axcheck.sh`,
`run_m4b_donor_axcheck.sh`, `axbump.py`, `pilots/{71,73,75,32,11,42,50,20}/run_*`.
Sibling (read-only): `axiommath/DedekindZetaZeroFree/DedekindZetaZeroFree/{Main,HeckeCorollary}.lean`
(import blocks) + full import-graph BFS (§1b). External (2026-11-16):
`raw.githubusercontent.com/AlexKontorovich/PrimeNumberTheoremAnd/master/lean-toolchain`
(v4.35.0); `api.github.com/repos/leanprover-community/physlib` (+ contents at master:
`QuantumInfo/ForMathlib/` present, pushed 2026-11-16).

— end plan (R8).

---

## §8 FIRST-48h APPROVAL PACKET (added 2026-11-16, queue 3 — the orchestrator's per-run sheet)

One card per staged run of R5's §14 queue (`qa/iter4-review/r5-iteration4-backlog.md` §14,
resolutions + hEχ fold-in applied). Standing rules for every card: SPEC `cpu=2.0,
memory=4096` + `@telemetered` + `LEAN_NUM_THREADS=2`; approval is PER-RUN and does not
carry over (AGENTS.md guideline 4); **no run in this window requests >4 GB** — the two
donor-build runs (8–9) carry the known *inherent* mmapped-olen `mem` readings (≈5–6 GB,
guideline 5 / G7b measured fact): telemetry OVER on `mem` with flat `anon` is expected
and NOT an escalation trigger; `anon` growth is the investigate signal. Telemetry rides
the `[tele]` lines inside each run's tee'd log (the decorator prints them at interval +
summary). **Cache-ping marking: runs 1a (LP-P0), 8 (ZZV2-P0), 9 (hEχ)** — 1a IS the ping
(run it FIRST); 8–9 are ping-gated (execute only if 1a's cache step was healthy).
Runners marked AUTHOR-AT-EXEC do not exist on disk yet (R5's queue is staged-no-run; the
lane authors runner + file at execution per the cited spec).

### 1a. LP-P0 — statement probe + ARTIFACT-CACHE HEALTH PING (run FIRST)
- **Command**: `research/pilots/lp/run_pilot.sh P0.lean` — AUTHOR-AT-EXEC (clone
  `pilots/73/run_pilot.sh`+`run_pilot.py` verbatim; app `crossmath-pilot-lp`; spec =
  R5 §9c LP-P0, file `research/pilots/lp/P0.lean` ≤0.15k LoC, probe-convention header).
- **App / class**: `crossmath-pilot-lp` (NEW) · C1 warm probe — image layers shared by
  construction (recipe textually identical; do not reword fetch lines).
- **Duration @SPEC**: 3–5 min. **Resources**: SPEC default.
- **Ping duty**: the app's mathlib `cache get` step IS the service health check for the
  window — record its rc in the log header; runs 8–9 read it.
- **Telemetry path**: `research/pilots/lp/logs/p0-run1.log` (provenance header + `[tele]`).
- **Abort**: probe FAIL on import set (the `to_additive` twin names / `Sum` glue) ⇒ lane
  diagnoses before any re-run; 2 failed runs ⇒ stop, diagnose-note (fix-round discipline).

### 2. 75-Pb run 1 — Pb.lean v1 (day-1 top-billed; A3-pattern lane)
- **Command**: `research/pilots/75/run_pilot.sh Pb.lean` (runner EXISTS, warm; `Pb.lean`
  authored at execution = Pa.lean carried verbatim + E1–E3, R5 §8d).
- **App / class**: `crossmath-pilot-75` (Cycle-2 run6-final WARM) · C2 mathlib-only pilot.
- **Duration @SPEC**: ≈3–5 min (single ≈1.8k-LoC file). **Resources**: SPEC default.
- **Telemetry path**: `research/pilots/75/logs/pb-run1.log`.
- **Abort**: R5 §8d hard stops — 0.45k LoC new content without GREEN ⇒ stop; F1/F2 > 3
  runs each ⇒ §8e fallback or park. (Descent-guard below applies runs 2+.)

### 3. AL-P0 — 3D statement-layer port probe (charter-gated: slot-2 typeset)
- **Command**: `research/pilots/al3d/run_pilot.sh P0.lean` — AUTHOR-AT-EXEC (clone 73
  pattern; app `crossmath-pilot-al3d`; `pilots/al-3d-prework.md` §4; file `P0.lean` =
  G4-template core + 3D encoding cluster + new defs, ≤0.45k LoC).
- **App / class**: `crossmath-pilot-al3d` (NEW) · C1/C2 heavy-import (entropy core).
- **Duration @SPEC**: ≈5–15 min. **Resources**: SPEC default (mmapped-olen `mem`
  readings inherent on mathlib-heavy elaboration; `anon` is the signal).
- **Telemetry path**: `research/pilots/al3d/logs/p0-run1.log`.
- **Abort**: probe-convention FAILs on the 3D lattice spellings ⇒ fix and re-run (≤2);
  any need for donor imports / Physlib ⇒ HARD STOP (al-3d §5 gates iv–v) — design error.

### 4. LP-P1 — the layer theorem (day 2; after 1a pins spellings)
- **Command**: `research/pilots/lp/run_pilot.sh L1.lean` (same AUTHOR-AT-EXEC runner).
- **App / class**: `crossmath-pilot-lp` (warm after 1a) · C2.
- **Duration @SPEC**: ≈3–5 min. **Resources**: SPEC default.
- **Telemetry path**: `research/pilots/lp/logs/l1-run<N>.log`.
- **Abort**: GO/NO-GO (R5 §9c) — proof reaching for convexity/separation/`Matrix`
  machinery or >0.25k LoC ⇒ STOP (contradicts the bridge's S-grade); 3 runs without
  GREEN ⇒ stop + diagnose-note. (LP-P2 `L2.lean` = run 11, same card shape, ≈5–10 min.)

### 5. 72-M1 L3a — hermPart block first elaboration (carried list)
- **Command**: `research/pilots/72-M1/run_pilot72m1.sh` (runner EXISTS; stages the dir's
  `*.lean` sorted = dependency order; `P72M1T3.lean` authored at execution per
  `pilots/72-M1/L3-spec.md`).
- **App / class**: `crossmath-probe` (WARM — 72-M1/11-revival family) · C2.
- **Duration @SPEC**: ≈3–5 min. **Resources**: SPEC default.
- **Telemetry path**: `research/pilots/72-M1/logs/` (L3 run file, provenance header).
- **Abort**: L3-spec §7 fix-round discipline — no re-run without a written error-class
  hypothesis; 3 runs without descent ⇒ stop, diagnose-note (72-M1 precedent).

### 6. 75-Pb descent — runs 2–5 (E4 Bonferroni; expected 2–4 further runs to GREEN)
- **Command**: `research/pilots/75/run_pilot.sh Pb.lean` (per fix round).
- **App / class / duration / resources**: identical to card 2 (3–5 min each).
- **Telemetry path**: `research/pilots/75/logs/pb-run<N>.log`.
- **Abort**: 6 consecutive runs without clear error-class descent ⇒ stop (R5 §8d);
  F2 (offDiag) resisting past sub-guard ⇒ §8e iterated-2-factor fallback, honestly
  labeled; acceptance = GREEN + full-coverage inline axcheck triad-only (R5 §8f).

### 7. AL-P1 — fibre-geometry core (after AL-P0 GREEN)
- **Command**: `research/pilots/al3d/run_pilot.sh A1.lean` (AUTHOR-AT-EXEC same runner).
- **App / class**: `crossmath-pilot-al3d` (warm after 3) · C2.
- **Duration @SPEC**: ≈5–10 min. **Resources**: SPEC default.
- **Telemetry path**: `research/pilots/al3d/logs/a1-run<N>.log`.
- **Abort**: GO/NO-GO (al-3d §5) — P1-b boundary lift needing fibre-generic donor-lemma
  restatement (B.2-full territory) ⇒ STOP, diagnose, report; ≤0.4k LoC guard.

### 8. ZZV2-λ P0 — donor-tree probe [PING-GATED: needs 1a healthy] (LAST; parallelizable with 9)
- **Command**: `research/pilots/zzv2-lam/run_pilot.sh P0.lean` — AUTHOR-AT-EXEC
  (`zzv2-lambda-prework.md` :105–114: copy `pilots/42/run_m4b2.py` verbatim → app
  `crossmath-pilot-zzv2-lam`, tarball = ZetaZerosV2 + redirected PNT+ (axbump patch),
  keep the elan mirror line; probe elaborated INSIDE the built tree; ≤2 runs).
- **App / class**: `crossmath-pilot-zzv2-lam` (NEW, donor-tree) · C3 [LAYERS-class
  profile, single function] — the 8.2k-job V2+PNT+ build happens IN-RUN (not
  image-cached), the window's longest item.
- **Duration @SPEC**: ≈1–2 h (3-h function timeout; if it outgrows, the g7_layers
  chunk recipe is a launch-day option, NOT a default — and chunk memory >4 GB would need
  its own approval). **Resources**: SPEC default; **pre-flag**: `mem` OVER ≈5–6 GB is
  the inherent mmapped-olen reading — record, do not escalate; `anon` growth ⇒
  investigate (guideline 3) before any re-run.
- **Telemetry path**: `research/pilots/zzv2-lam/logs/p0-run<N>.log`.
- **Abort**: cache-fetch failure after the §14 retry protocol (≤4 attempts) ⇒ seed
  fallback (`_seed_mathlib`) or defer (infra, not donor verdict); probe errors on the
  pinned statement facts ⇒ ≤2 runs then stop (P0 is statement-only).

### 9. hEχ — zeta23 Theorem-E donor-pin build + audit [PING-GATED: needs 1a healthy] (day-2/3, beside 8)
- **Command**: `research/pilots/<zeta23E>/run_pilot.sh <consumer.lean>` — AUTHOR-AT-EXEC
  (R5 §14 run 8: clone `pilots/50/run_r1.py`+`run_r1.sh` (the donor-pin pattern) → app
  `crossmath-pilot-zeta23E`; build zeta23's small v4.33 tree at ITS pin, transitive
  `#print axioms` of the Theorem-E chain, elaborate the consumer file in-tree; the
  statement ports back as discharged 2/3 binders — R2 mini-spec
  `r2-discovery-strength.md` :535–553).
- **App / class**: `crossmath-pilot-zeta23E` (NEW) · C3 hour-class · **v4.33 pin — own
  image lineage, shares NOTHING with the v4.36 family** (cold start is structural).
- **Duration @SPEC**: hour-class low end expected (small tree; measured at run 1; 3-h
  timeout). **Resources**: SPEC default; same inherent-`mem` pre-flag as card 8.
- **Telemetry path**: `research/pilots/<zeta23E>/logs/he-run1.log`.
- **Abort**: donor build errors beyond the 50-M2-pattern fix loop (≤3 rounds) ⇒ stop,
  record error taxonomy (Knausgård-tree alternative is R2's named fallback); Theorem-E
  chain axioms ≠ triad ⇒ donor-hygiene FAIL — do NOT consume; report for the claims
  register. **Donor-hygiene gate applies here** (new built donor ⇒ on-pin `#print
  axioms` is the proof, comparator configs are claims).

### 10. G9 — StrongPNT binder probe (CONDITIONAL: 22-T2a chartered)
- **Command**: `research/feasibility/probe/run_gprobe.sh probe` (runner EXISTS, warm) —
  elaborates ALL mathlib-only `ProbeG*.lean` in one batch (G1a/G3/G4/G5b/G5c/G7
  regression + **G9**; G2/G5a/G10/G11/G12 are skip-set-excluded by design). There is no
  single-file mode; the batch IS the mode (run13 precedent).
- **App / class**: `crossmath-gprobe` (WARM) · C1.
- **Duration @SPEC**: 3–4 min. **Resources**: SPEC default.
- **Telemetry path**: `research/feasibility/probe/logs-g/run<N>-probe.log` (tee'd copy
  canonical — log-rescue lesson).
- **Abort**: none needed (statement probe); FAIL ⇒ the 22-T2a binder spelling needs the
  mapping table updated before the slot runs — record, no re-run burn.

**Packet note (R5 §14 folds):** LP-P2 (run 11, `L2.lean`, ≈5–10 min, same LP card shape)
is omitted above only because it sits outside the requested ten; the two cold-class runs
(8–9) are tail-ordered, lane- and pin-disjoint, and stay single SPEC functions with 3-h
timeouts unless the orchestrator elects layer-chunking at launch.

---

## §9 RUN-LOG REVIEW CHECKLIST (added 2026-11-16, queue 5 — the between-runs card)

The orchestrator/supervisor reads this over EVERY §8 run's persisted log before the next
run is approved. It operationalizes AGENTS.md guideline 3 (overrun ⇒ investigation, not
upgrade) as a pass/fail checklist; any ✗ blocks the next approval until resolved or
waived on-record. Log = the tee'd copy in the pilot's `logs/` dir (canonical; /tmp
transcripts are ephemeral — log-rescue lesson).

**A. Custody (before anything else)**
1. ☐ Log persisted at the §8 card's telemetry path, and ONLY there is it read.
2. ☐ Provenance header intact: date, file + LoC, exact command line, verdict, Modal run
   URL (the `pilots/75/logs` header convention; missing header ⇒ re-derive before use).
3. ☐ Verdict line present and matches the artifact state (`OK`/`FAIL rc=… errors=N
   sorry=M`/`TIMEOUT`/`CACHE-MISS`; probe files: `OK (probe, sorry allowed)`).

**B. Telemetry (the guideline-1/2 evidence)**
4. ☐ `[tele] start …` line present (spec stated: cpu=2.0 mem=4096) and `[tele] SUMMARY`
   line present (wall, max_cpu, max_mem, max_anon, samples, OVER count). Cadence: at
   least one interval sample per ~10 min of wall — a run >10 min with `samples=1` is a
   telemetry outage ⇒ re-run telemetry before trusting the resource story.
5. ☐ CPU vs SPEC: `max_cpu ≤ ~2` sustained. CPU OVER ⇒ check LEAN_NUM_THREADS actually
   applied (the secret is in the app config, but verify no ad-hoc `lake build -j` crept
   into a command line) — that is a code defect, not a resource need (guideline 3).
6. ☐ Memory vs SPEC **with the inherent-mem rule** (§8 standing rules): `max_mem` OVER
   4096 MB with `max_anon` flat/small on mathlib-heavy elaboration or donor builds =
   the expected mmapped-olen class (G7b measured ≈5–6.5 GB; card 8–9 pre-flag) —
   record, proceed, NO escalation. `anon` growth past ~2 GB ⇒ STOP: investigate (build
   closure size, rebuild churn, mis-scoped import) before any re-run; more resources
   only via a fresh per-run user approval (never carry-over).

**C. Build/elaboration discipline**
7. ☐ Error-class descent (fix rounds): this round's errors classified by CLASS
   (type-mismatch / instance-synth / unsolved-goals / name-drift …), and the count of
   DISTINCT classes is ≤ the previous round's — raw error counts may rise while classes
   fall (valid descent). No written error-class hypothesis for the round ⇒ the re-run
   was undisciplined: stop, write it, then decide.
8. ☐ Guard numbers: LoC and run-count vs the spec's guard (§8 card abort line; e.g.
   75-Pb 0.45k LoC / 6-run descent cap; LP 0.25k / 3 runs; AL-P1 0.4k; ZZV2-P0 ≤2
   runs). Breach without GREEN ⇒ the card's abort fires — no discretionary extra run.
9. ☐ Axiom lines: `depends on axioms:` records present where the artifact claims them;
   every consumed/new decl's set ⊆ {propext, Classical.choice, Quot.sound}; any
   `sorryAx` in a kept artifact ⇒ FAIL regardless of rc (donor-hygiene gate; for new
   donors see D2).
10. ☐ Donor runs only: the resolved donor/mathlib rev(s) quoted in the log (update-step
    `checking out revision` lines) and match the card's substrate claim; a silently
    different rev ⇒ re-read the card before consuming anything from the run.

**D. Substrate/infra events**
11. ☐ No `mathlib: failed to fetch cache` beyond the §14 retry protocol (≤4 attempts →
    seed fallback recorded, or deferred). Post-outage log tails are suspect until
    re-verified (RESUME-BRIEF-C2 §Protocol).
12. ☐ Cache-ping verdict (LP-P0 first run ONLY — the supervisor's call): the run's
    cache steps (image `lake exe cache get` + any `lake update`) healthy ⇒ **PING
    GREEN** — cards 8–9 (ZZV2-P0, hEχ) are released; unhealthy ⇒ cards 8–9 hold, the
    window continues on warm-image runs only. Record the verdict in the LP-P0 log
    header + the orchestrator relay.

**E. Decision (the between-runs output)**
13. ☐ One line per reviewed run into the orchestrator relay: `run <card> — verdict
    <OK/FAIL/…>, telemetry <nominal/OVER-inherent/OVER-anomalous>, descent <n classes,
    ↓/↑>, guard <ok/breach>, next <approve card N / hold / abort per card>`.
