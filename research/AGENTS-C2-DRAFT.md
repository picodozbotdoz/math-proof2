# AGENTS-C2-DRAFT — ready-to-apply Cycle-2 addendum for AGENTS.md

Lane A1, 2026-11-13 (queue item 2). **Draft only — H applies at cycle close under the
orchestrator's authorization; AGENTS.md itself is not edited by this lane.** Placement
notes in brackets; body text written in AGENTS.md's terse style; every fact cited to an
on-disk artifact.

---

## Block 1 — [replace the `axiommath/` bullet list in "Sibling resources" with:]

- `axiommath/` — six AxiomMath repos, **all bumped 2026-11-13 to our pin** (branch
  `dev/claude`: toolchain `v4.36.0-rc2`, lakefiles pin mathlib `ff2494ea`; per-repo bump
  commits in each git log). Donor status per `feasibility/axiommath-bump/` +
  `feasibility/axiommath-donor-probes.md` §G: `ZetaZeros` (V1) and `ZetaZerosV2` **BUILT**
  (V2 incl. its PrimeNumberTheoremAnd path, 8262 jobs; 13/13 audited theorems triad-clean,
  probe G2); `DedekindZetaZeroFree` **statement-level only** (G1a OK; G1b direct build
  FAILS — vendored CFT breaks vs ff2494ea, 62 errors/11 modules; vendors
  `FiniteAbelianGlobalReciprocityv2` = n-yamaguchi ClassFieldTheory @ `77137952`, 1658
  files, `vendor/class-field-theory`, surveyed in `survey/axiommath-cft-vendor.md`);
  `Weil` (deps AxiomMath/Stacks `012108f6`, NOT cloned) statement-level OK (G3);
  `AreaLaw2D` (deps Physlib `a50684a1`) statement-level OK (G4; Physlib not needed at
  statement level). Surveys:
  `survey/axiommath.md`, `survey/axiommath-pntplus.md`, `survey/axiommath-cft-vendor.md`;
  donor map `novelty/axiommath-as-donor.md` + `novelty/pntplus-glue-as-donor.md`.
- `liu-zerofree/` — Liu-1, "Slightly improved zero-free half-planes for the quasi-RH"
  ([Liu26] of arXiv:2610.12234): formal ζ/Dirichlet/Hecke-ℚ(√−3) zero-free at exact surd
  `B_new = (1507−2√921)/1653 ≈ 0.8749570700` and rational `B_r = 34999/40000 = 0.874975`,
  both < 7/8 (`CombinedPaperVerification.lean:16–44`, `boundary_order`). Clone @
  `7d10420` (2026-10-08), toolchain v4.34.1; full-tree hygiene clean (0 sorry /
  0 native_decide / 0 axiom decls, 220 own files; `novelty/liu1-hygiene-sweep.md`).
  **Cautions:** hot-cluster constants — cite, never claim; the clone ships NO
  `vendor/` tree (the pinned 2925-module openai/math closure @ `adc7f124` must be
  materialized manually before verify.py can replay); the README decimal equals the Lean
  surd (the paper's decimal differs at the 10th place); public entry uses the weakened
  rational. DO-NOT-CONSUME as a build dependency — statement-level citation only
  (`novelty/liu1-as-donor.md` §5, confirmed at full-tree scale).
- `PrimeNumberTheoremAnd` upstream (AlexKontorovich, NOT cloned) — **DEFER-watchlist**,
  not registered: HEAD `938912bb` (2026-11-12) proves StrongPNT
  (ψ = x + O(x·exp(−c√log x)), triad via in-file `#guard_msgs #print axioms`) on
  v4.35.0/mathlib `56a00585`; IEANTN porting out to teorth/IEANTN; 39/75 of the fork's
  `Mathlib/` subtree files drift from upstream. Register-and-port triggers
  (`novelty/pntplus-glue-as-donor.md` §c): T1 a dossier-22-T2a pilot wants the upstream
  Borel–Carathéodory chain; T2 a PNT-AP/Chebotarev consumer appears; T3 upstream reaches
  v4.36-class pins. Until then cite as external formal prior art (Liu-1 convention).

## Block 2 — [append to "Lean verification via Modal":]

- Substrate note (recorded 2026-11-13): `sudo -n -u xyz` is blocked in this environment;
  runners fall back to the doz CLI directly — `MODAL_BIN=/home/doz/dozenv/bin/modal`
  (in use by `pilots/71/run_pilot.sh:11`). The xyz staging pattern (world-readable
  `/tmp/crossmath-*-stage/`) still applies when xyz is available.
- Cycle-2 ephemeral apps (same no-volume/no-secret recipe as `crossmath-probe`):
  `crossmath-axbump` (`feasibility/axiommath-bump/axbump.py`), `crossmath-gprobe`
  (`feasibility/probe/gprobe.py`, the G-series), `crossmath-pilot-71`
  (`pilots/71/run_pilot.py`), `crossmath-pilot-42-m4` (`pilots/42/run_m4.py`).
- Full-coverage axiom audit: the pilot-10 `axcheck_full.py` pattern (dotted names +
  `@[simp]` theorems, dependency-order olean compilation, per-file axioms report) is now
  the standard for donor-swap pilots (`pilots/10/axcheck_full.py`; make_axcheck's regex
  misses remain documented above).

## Block 3 — [new section "Cycle-2 conventions" after "Conventions":]

- Donor hygiene gate: before consuming any external theorem, run the triad check
  (propext/Classical.choice/Quot.sound) at statement level — comparator configs and
  READMEs are claims, on-pin `#print axioms` is proof (G2 did this for ZetaZerosV2's
  13 audited theorems; DZDF/Liu-1 remain claim-level).
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
  (RespondToCoordinator) without derailing the current task.

---

*Sources backing every line above: `feasibility/axiommath-bump/{axbump.py,logs/}`;
`feasibility/axiommath-donor-probes.md` (§G verdicts incl. G1b FAIL); the survey/novelty
files cited inline; pilot app names verified in
`pilots/71/run_pilot.py:21`, `pilots/42/run_m4.py:17`; MODAL_BIN fallback at
`pilots/71/run_pilot.sh:11`; Liu-1 facts per `novelty/liu1-hygiene-sweep.md`;
StrongPNT/watchlist per `novelty/pntplus-glue-as-donor.md` §(c).*
