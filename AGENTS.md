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
- `axiommath/` — AxiomMath Lean formalizations (added 2026-11-13; shallow clones,
  `--depth 1`, of `github.com/AxiomMath/<name>`; all sorry-free, standard axioms):
  - `DedekindZetaZeroFree/` (`09afbb4c`, v4.35.0-rc3, deps mathlib + TauCeti) —
    Cureton–Thorner quasi-RH: ζ_K ≠ 0 for Re s > 31/32, every number field K;
    same for finite-order Hecke L-functions. Donor for dossiers 20/22/40/42/50.
  - `ZetaZerosV2/` (`1d7edeb4`, v4.34.0-rc2, deps mathlib + PNT+ `c19697c7`) and
    `ZetaZeros/` (`4bcaf70e`, v4.34.0-rc2) — Lamzouri: > 2/3 of ζ zeros simple and
    on the line, > 83.6% distinct. Novelty check / donor for 01/21/42.
  - `PrimeNumberTheoremAnd/` (`d71f7b41`, v4.35.0-rc2) — Axiom's PNT+ fork (HEAD;
    ZetaZerosV2 pins the older `c19697c7`). Overlaps tauceti Perron (dossier 22).
  - `Weil/` (`27cdb204`, v4.34.0-rc2, deps mathlib + AxiomMath/Stacks `012108f6`)
    — all four Weil conjectures incl. RH over 𝔽_q (Deligne). Function-field
    analog for the quasi-RH cluster. Stacks itself is NOT cloned (~63k modules);
    consult it on GitHub for reference only.
  - `AreaLaw2D/` (`7768136b`, v4.33.0) — formalizes openai-math family 265
    (2D area law from a global spectral gap); bridges openai-math ↔ linear algebra.
- `liu-zerofree/` — shallow clone (`--depth 1`, rev `7d10420`, toolchain `v4.34.1`,
  registered 2026-11-13) of
  github.com/liubaiying101/Slightly-improved-zero-free-half-planes-for-the-quasi-Riemann-hypothesis
  — companion to Liu arXiv:2610.12234 (round-4 §5): zero-free Re s >
  B_new = 0.874957019… for finite-order Hecke L over ℚ(√−3), with Cor. 14.1 transfer
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

## Lean verification via Modal (established 2026-11-09)

No lake scaffolding in this repo yet; pilots/probes elaborate against a pinned mathlib on
Modal (math-proof1's account and staging pattern). Canonical evidence:
`research/feasibility/port-probe.md`, `feasibility/VERIFICATION-LEDGER.md`,
`feasibility/probe/FINAL-SWEEP-PLAN.md`.

- CLI: ephemeral `modal run` app `crossmath-probe` (no volume/secret/deploy), run as the
  `xyz` user (math-proof1's account). Runner scripts resolve the binary via
  `MODAL_BIN=$(getent passwd xyz | cut -d: -f6)/xyzenv/bin/modal` and invoke
  `sudo -n -u xyz bash -lc "… modal run <app>.py --dir <stage>"`
  (`/home/doz/dozenv/bin/modal` also exists for the doz user; scripts use xyz's).
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
