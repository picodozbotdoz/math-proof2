# AGENTS.md — cross-math-fronttier

Greenfield research project (git repo, no commits yet). Goal: **discover new
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
- Axiom audit: `feasibility/probe/make_axcheck.py` builds stage copies = pilot file +
  appended `#print axioms <thm>` for every top-level theorem (repo file untouched);
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
