# AGENTS.md — cross-math-fronttier

Research project (git repo; main run closed 2026-11-09, pilot 10 resumed 2026-11-10). Goal: **discover new
mathematics** — new theorems — by connecting classical results with recent
formal/discovered results across several source projects. This is NOT a
"formalize known math in Lean" project. Lean is the *verification vehicle* for
candidate discoveries, not the research object.

The canonical research plan is `research/RESEARCH.md` — objective, Phases 1–4
(survey → bridge map → candidate dossiers → triage), and ground rules
(discovery-first; kernel-only verification; exact citations for every claim).
Follow it for all research work and write phase outputs under `research/`
(e.g. `research/survey/` for Phase 1).

## Sibling resources (all outside this repo — treat as read-only references)

Relative to `/home/doz/zcode-workdir/`:

- `math-proof1/` — the predecessor this project is modeled on: an autonomous
  Lean 4 + Mathlib research loop (Langlands / modular forms). Its `AGENTS.md`
  documents the established Lean build/check workflow (Modal-based
  `lean_build.py` / `lean_check.py`, `tools/modal_run.sh`). Read it before
  setting up any Lean verification here.
- `encore-mathlib/repo/mathlib4/` — local mathlib4 checkout (classical-math
  base; toolchain `v4.36.0-rc2`).
- `tauceti/` — Lean formalization project with its own `AGENTS.md`,
  `COORDINATION.md`, `formalization.yaml` (toolchain `v4.36.0-rc2`).
- `openai-math/` — OpenAI math research: `preprints/`, `lean/`,
  `reasoning_traces/`, `overview.tex`.
- `anthropics_formal-math/` — Anthropic formal results: `3sum-apsp/`, `eth/`,
  `zeta23/`.
- `axiom-lean-engine/` — AXLE: Python client/CLI (`axle`) for the AXLE Lean
  verification API; uv-based (see its `pyproject.toml` / `Makefile`).
- `axiommath/` — six AxiomMath repos, **all bumped 2026-11-13 to our pin** (branch
  `dev/claude`: toolchain `v4.36.0-rc2`, lakefiles pin mathlib `ff2494ea`; per-repo bump
  commits in each git log). Donor status per `feasibility/axiommath-bump/` +
  `feasibility/axiommath-donor-probes.md` §G: `ZetaZeros` (V1) and `ZetaZerosV2` **BUILT**
  (V2 incl. its PrimeNumberTheoremAnd path, 8262 jobs; 13/13 audited theorems triad-clean,
  probe G2); `DedekindZetaZeroFree` **statement-level only** (G1a OK; G1b direct build
  FAILS — vendored CFT breaks vs ff2494ea, 62 errors/11 modules; vendors
  `FiniteAbelianGlobalReciprocityv2` = n-yamaguchi ClassFieldTheory @ `77137952`, 1658
  files, `vendor/class-field-theory`, surveyed in `survey/axiommath-cft-vendor.md`);
  `Weil` (deps AxiomMath/Stacks `012108f6`, NOT cloned) statement-level OK (G3); direct import
  priced out (G6a CONFIRMED NEGATIVE: 59,222-job closure, 7,493 drift errors);
  `AreaLaw2D` (deps Physlib `a50684a1`) statement-level OK (G4; Physlib not needed at
  statement level; G5a BLOCKED-INFRA — Physlib `a50684a1` is not `ff2494ea`-compatible,
  17 errors in 1 module; deferred to Iteration 4). Surveys:
  `survey/axiommath.md`, `survey/axiommath-pntplus.md`, `survey/axiommath-cft-vendor.md`;
  donor map `novelty/axiommath-as-donor.md` + `novelty/pntplus-glue-as-donor.md`.
  Original shallow-clone revs (`--depth 1`, `github.com/AxiomMath/<name>`): DZDF `09afbb4c`,
  ZetaZerosV2 `1d7edeb4` (PNT+ dep `c19697c7`), ZetaZeros `4bcaf70e`, PrimeNumberTheoremAnd
  `d71f7b41`, Weil `27cdb204`, AreaLaw2D `7768136b`.
- `liu-zerofree/` — shallow clone (`--depth 1`, rev `7d10420`, toolchain `v4.34.1`,
  registered 2026-11-13) of
  github.com/liubaiying101/Slightly-improved-zero-free-half-planes-for-the-quasi-Riemann-hypothesis
  — companion to Liu arXiv:2610.12234 (round-4 §5): zero-free Re s >
  B_new = 0.8749570698… for finite-order Hecke L over ℚ(√−3), with Cor. 14.1 transfer
  to every Dirichlet L **including ζ** (principal character); exact-arithmetic
  certificates. B_new < 7/8, so its zero-free half-plane strictly contains the 7/8
  region — it discharges pilot 50's `hQRH`/`hQRHχ` binders as written (no weakening,
  unlike DZDF's 31/32). **Constant story (resolved by A1's full-tree sweep,
  `novelty/liu1-hygiene-sweep.md`, 2026-11-13):** README's 0.874957069799 IS Lean's
  `B_new = (1507 − 2√921)/1653` exactly (`CombinedPaperVerification.lean:19`; the ~5e-10
  delta was the paper's decimal); the public entry deliberately uses the weakened exact
  rational `B_r = 34999/40000`, with `boundary_order : B_new < B_r < 7/8` PROVED (:44) and
  the headline theorems consuming it (:103). Full-tree hygiene: 0 sorry, 0 axiom
  declarations, 22/22 expected names. **Replay prerequisite:** no `vendor/` tree ships —
  `verify.py` needs manual population of 2,925 `vendor/OAI` modules @ openai/math
  `adc7f124` if ever run (closure_manifest pins them; no in-repo fetch script). Treat as
  statement-level only until probed on our pin (A7/G7). 220 .lean files; textually
  sorry-free and native_decide-free
  (grep-level only — NOT yet built on our pin; probe owned by A7/G7). Second external
  formal donor of the QR-D cluster, after `axiommath/DedekindZetaZeroFree`. Read-only.
- `PrimeNumberTheoremAnd` upstream (AlexKontorovich, NOT cloned) — **DEFER-watchlist**,
  not registered: HEAD `938912bb` (2026-11-12) proves StrongPNT
  (ψ = x + O(x·exp(−c√log x)), triad via in-file `#guard_msgs #print axioms`) on
  v4.35.0/mathlib `56a00585`; IEANTN porting out to teorth/IEANTN; 39/75 of the fork's
  `Mathlib/` subtree files drift from upstream. Register-and-port triggers
  (`novelty/pntplus-glue-as-donor.md` §c): T1 a dossier-22-T2a pilot wants the upstream
  Borel–Carathéodory chain; T2 a PNT-AP/Chebotarev consumer appears; T3 upstream reaches
  v4.36-class pins. Until then cite as external formal prior art (Liu-1 convention).

Never edit or commit inside the sibling repos; work only in this workspace.
Toolchain family across the ecosystem: Lean `v4.36.0-rc1`/`-rc2` — match it
when a `lean-toolchain` is added here.

## Layout

- `research/RESEARCH.md` — the research charter (objective, phases, ground
  rules); phase outputs live alongside it (`research/survey/`, …).
- `external-doc/` — gitignored scratch/reference material (currently only
  `backup/INIT_PROJECT.md`, the original init brief). Don't commit its
  contents.

## Conventions (until the project grows its own)

- Standard of proof follows `math-proof1`: no `sorry`, no `native_decide`,
  no external CAS — Lean kernel verification only.
- When Lean scaffolding (lakefile, CI, check scripts) is first added here,
  mirror `math-proof1`'s patterns and record the commands in this file.

## Cycle-2 conventions (applied at Cycle-2 close, 2026-11-14)

- Donor hygiene gate: before consuming any external theorem, run the triad check
  (propext/Classical.choice/Quot.sound) at statement level — comparator configs and
  READMEs are claims, on-pin `#print axioms` is proof (G2 did this for ZetaZerosV2's
  13 audited theorems; executed for a consumer at `pilots/42/logs/m4b-axcheck-run1.log`;
  DZDF/Liu-1 remain claim-level).
- Decl index: novelty/absence work uses `qa/decl-index-v2.tsv` (+ labels
  `axiommath-{dzzf,vendor-cft,zetazeros-v2,zetazeros,pnt,weil,arealaw2d}`); **caveat
  block** as pre-registered in `qa/cycle2-qa-plan.md` §(b): AxiomMath repos re-export
  mathlib/TauCeti content — a TSV hit is never evidence of provability; openai-math
  vendors mathlib-like trees; preprints are never indexed. Direct-source (`rg` in the
  tree, namespace check) before any "corpus X has Y" claim.
- G-series probes (`feasibility/axiommath-donor-probes.md`, logs
  `feasibility/probe/logs-g/`): statement-elaboration-only probes, numbered G1…, one
  verdict line each, probe `sorry` only inside "not a proof artifact" headers;
  hypothesis-binder forms per the EnclOK/ProbeE precedent.
- Queue-loaded-lane protocol: lanes receive bottom-up task queues from the orchestrator
  and answer with one consolidated report per batch; mid-task relays are answered
  (RespondToCoordinator) without derailing the current task. Protocol recorded at
  `research/RESUME-BRIEF-C2.md` §Protocol.

## Modal usage guidelines (MANDATORY — user directive 2026-11-14)

1. **Default resources: `cpu=2.0, memory=4096` (4 GB).** Every Modal function starts here.
   Modal treats these as soft limits (a container may burst above them), so a small
   request does not break a run that briefly needs more.
2. **Telemetry logging during every Modal run.** Each run logs its own resource use
   (CPU load, memory from `/proc/meminfo` / cgroup `memory.current`, concurrent worker
   count, elapsed time) at regular intervals into the run log. The log is persisted with
   its provenance header, so actual usage is always on record.
3. **Exceeding the defaults triggers an investigation, not an upgrade.** If telemetry
   shows the run going beyond 2 CPU / 4 GB, first investigate the code, logic or math:
   - Is the build closure larger than needed?
   - Is there an unnecessary rebuild, a runaway tactic, or a mis-scoped import?
   - Is the work wrong-sized? Can it be split, cached or pruned?

   Record the findings in the run log.
4. **More resources only with specific user approval.** If the investigation shows more
   resources are genuinely unavoidable, ask the user first. State the exact
   CPU/memory/timeout requested, the telemetry evidence, and why it cannot be avoided.
   Launch only after an explicit yes for *that* run. Approval does not carry over to
   other runs.
5. **Measured facts (G7b investigation, 2026-11-14):**
   - Modal containers report `nproc` far above the requested CPU (nproc=18 at cpu=2).
     Lake and lean size their thread pools from it, so always set `LEAN_NUM_THREADS` to
     the CPU spec. The shared runners do this (`CAP` secret); `g7_layers.py` does it in
     its commands.
   - The sandbox exposes no cgroup memory files and no `RssAnon`. The telemetry `mem`
     figure is MemTotal−MemAvailable, which includes the memory-mapped Mathlib `.olean`
     pages (≈5–6 GB for Mathlib-importing modules). That is inherent to elaborating
     Mathlib-importing modules.
   - Long builds go into **cached image layers** (`Image.run_function` chunks, as in
     `feasibility/probe/g7_layers.py`), never one ephemeral container. Finished layers
     persist and are reused at no rebuild cost. A stop or preemption loses one chunk.
6. Never reserve resources "to be safe". Run28 (G7b, 2026-11-14) reserved 64 CPU /
   128 GB while using about 19 workers and little RAM. It was cancelled by the user as a
   budget breach. Do not repeat it.

## Lean verification via Modal (established 2026-11-09)

No lake scaffolding in this repo yet; pilots/probes elaborate against a pinned mathlib on
Modal (math-proof1's account and staging pattern). Canonical evidence:
`research/feasibility/port-probe.md`, `feasibility/VERIFICATION-LEDGER.md`,
`feasibility/probe/FINAL-SWEEP-PLAN.md`.

- CLI: ephemeral `modal run` app `crossmath-probe` (no volume/secret/deploy), run as the
  `xyz` user (math-proof1's account). Runner scripts resolve the binary via
  `MODAL_BIN=$(getent passwd xyz | cut -d: -f6)/xyzenv/bin/modal` and invoke
  `sudo -n -u xyz bash -lc "… modal run <app>.py --dir <stage>"`
  (`/home/doz/dozenv/bin/modal` also exists for the doz user; scripts used xyz's through
  2026-11-13 — superseded by the substrate note below).
- Substrate: `leanprover-community/mathlib4` @ `ff2494ea…` (exact encore checkout rev),
  toolchain `leanprover/lean4:v4.36.0-rc2`, image elan v4.2.4; CI oleans via
  `lake exe cache get` — 9,096 olens fetched for the exact rev (run 1, `port-probe.md:35`);
  ~8,710 mathlib olans cached in the image. Cost: cold run ≈ 3 m 45 s, warm ≈ 68 s–2.5 min.
- Runners on disk: `research/feasibility/probe/run_probe.sh` (probes; env `MATHLIB_REV`,
  default `ff2494ea…`, fallback `master-2026-11-08`) and the per-pilot copies
  `research/pilots/{20,22}/run_m1.sh` (same pattern, stage per pilot). Stage pattern: the
  Modal user cannot read `/home/doz` — copy `lean_probe.py` + the `.lean` files to a
  world-readable `/tmp/crossmath-*-stage/`, `chmod -R a+rX`, run, discard.
- Generic multi-file runner: `research/pilots/32/run_pilot.sh <file.lean> …` (app
  `crossmath-pilot-32`; each staged file elaborated independently, errors shown with 25 lines
  of context). Final-sweep axiom audit over every pilot's final files:
  `research/feasibility/probe/run_axcheck.sh` (TARGETS in `make_axcheck.py`; pass stage names
  as extra args to `make_axcheck.py` to re-check a subset).
- Axiom audit: `feasibility/probe/make_axcheck.py` builds stage copies = pilot file +
  appended `#print axioms <thm>` for every top-level theorem (repo file untouched);
  `pilots/10/axcheck_full.py <file> <out>` is a full-coverage variant (dotted names and
  `@[simp]` theorems, which make_axcheck's regex misses; no `section` tracking).
  `axcheck_probe.py` elaborates them in dependency order, one `lake env lean -o
  /tmp/axstage/<mod>.olean` per file (compiles + prints the axioms report).
- Conventions: statement-elaboration probes may carry `sorry` only in probe-convention
  files with headers ("not a proof artifact"); results are elaboration verdicts, never
  proof claims. Conditional theorems use the hypothesis-binder pattern (donor statements
  as explicit Prop binders, e.g. `hQRH`, `Hypζ`; EnclOK precedent). Run logs are persisted
  to `research/pilots/*/logs/` with provenance headers — /tmp transcripts are ephemeral
  (the log-rescue lesson). Close-out audit per `FINAL-SWEEP-PLAN.md`: sorry-token
  classifier (real proof-body tokens vs prose) + the axcheck sweep.
- Toolchain split: anthropics v4.33.x (zeta23 pins Mathlib `51e6992e`; Knausgård repo same
  lineage) / openai-math v4.34.1 / mathlib+tauceti v4.36.0-rc2. Empirical finding
  (`FEASIBILITY-SUMMARY.md`, probes B1/B2/B3/C1/C2/D/E/F): statement-port cost ≈ 0
  corpus-wide — donor *statements* elaborate verbatim on v4.36; proofs and new math are
  the cost. Consumption patterns: zeta23 → binder types (ProbeE); OAI → interface
  hypotheses (closure-heavy trees); tauceti → direct dependency (same toolchain).
- Substrate note (recorded 2026-11-13): `sudo -n -u xyz` is blocked in this environment;
  runners fall back to the doz CLI directly — `MODAL_BIN=/home/doz/dozenv/bin/modal`
  (in use by `pilots/71/run_pilot.sh:11`); `run_axcheck.sh` DEFAULTS to `MODAL_USER=doz`
  (canonical protocol: `research/RESUME-BRIEF-C2.md` §Protocol 3). The xyz staging pattern
  (world-readable `/tmp/crossmath-*-stage/`) still applies when xyz is available. Long builds
  (> ~40 min) use `modal run --detach` from a `setsid nohup` wrapper so they survive the
  session (G7b lesson; `feasibility/probe/run_gprobe.sh g7`, Volume `crossmath-g7-tree`).
- Cycle-2 ephemeral apps (same no-volume/no-secret recipe as `crossmath-probe`):
  `crossmath-axbump` (`feasibility/axiommath-bump/axbump.py`), `crossmath-gprobe`
  (`feasibility/probe/gprobe.py`, the G-series), `crossmath-pilot-71`
  (`pilots/71/run_pilot.py`), `crossmath-pilot-42-m4` (`pilots/42/run_m4.py`),
  `crossmath-pilot-42-m4b2` (`pilots/42/run_m4b2.py:23`), `crossmath-pilot-72`
  (`pilots/72/run_pilot.py:17`); the pilot-11 revival reuses `crossmath-probe`
  (`pilots/11/pilot11_probe.py:19`).
- Full-coverage axiom audit: the pilot-10 `axcheck_full.py` pattern (dotted names +
  `@[simp]` theorems, dependency-order olean compilation, per-file axioms report) is now
  the standard for donor-swap pilots (`pilots/10/axcheck_full.py`; make_axcheck's regex
  misses remain documented above). First executed instance:
  `pilots/42/logs/m4b-axcheck-run1.log` (AxPilot42_M4b_full, triad-only, 0 sorryAx).
