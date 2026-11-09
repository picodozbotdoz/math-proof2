# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

@AGENTS.md

The import above is the primary instruction set (objective, sibling repos, conventions,
Modal verification setup). This file adds only what AGENTS.md does not cover.

## Standing user instruction (`AGENT_INSTRUCTION.md`)

Once discoveries are complete, write a **complete, separate research article for each
discovery** (theorems, proofs, context), one per file. Do not combine discoveries.

## How the research is organized

Pipeline (per `research/RESEARCH.md`): `survey/` (Phase 1, one per corpus) →
`bridges/` (Phase 2, one per cluster: analytic-nt, complexity, linear-algebra,
tensor-algebra, tauceti-contributions) → `candidates/NN-slug.md` (Phase 3 dossiers, from
`candidates/TEMPLATE.md`) → `TRIAGE.md` (Phase 4 ranking; top-3 decided: 42, 10, 01) →
`pilots/` (Lean pilots). `REPORT.md` is the final write-up, fed by `REPORT-INPUTS.md`;
`articles/` holds one standalone research article per discovery (index `articles/README.md`).

Dossier numbers group by cluster: 0x linear algebra, 1x complexity, 2x/4x/5x analytic NT
(zeta / ζ_K / quasi-RH), 3x tensor, 6x connectors. A pilot for dossier NN lives at
`pilots/NN-blueprint.md` + `pilots/NN/` (milestone files `M1.lean`, `M2a.lean`, …).

Cross-cutting lanes: `novelty/` (literature checks, `VERDICTS.md`, `CLAIMS-REGISTER.md`),
`feasibility/` (`VERIFICATION-LEDGER.md` = canonical per-pilot Lean status;
`FEASIBILITY-SUMMARY.md` = canonical effort table; `probe/` = Modal tooling),
`qa/` (citation spot-checks, cross-corpus declaration index).

Coordination files — keep them current when you add or change outputs:
- `research/STATUS.md` — lane table and pilot pipeline; single source of truth for status.
- `research/INDEX.md` — one line per file (path | phase | status | content).
- File ownership: the creating lane owns a file; don't rewrite another lane's file without
  reason. `RESEARCH.md` and `TRIAGE.md` are orchestrator-owned.

## Commands

All Lean checking runs on Modal (see AGENTS.md); there is no local `lake` build.

```bash
# Elaborate every Probe*.lean in feasibility/probe/ against pinned mathlib
research/feasibility/probe/run_probe.sh

# Axiom audit: #print axioms for every top-level theorem of the pilot files listed in make_axcheck.py
research/feasibility/probe/run_axcheck.sh

# Check a single pilot (stages that pilot's .lean files); others: pilots/11/run_pilot11.sh, pilots/32/run_pilot.sh
research/pilots/22/run_m1.sh

# Cross-corpus declaration index (qa/decl-index.tsv, 273 MB) is gitignored; the repo tracks
# only qa/decl-index.tsv.zip. Either unzip it or rebuild it, then query it for novelty checks:
unzip -o research/qa/decl-index.tsv.zip -d research/qa/   # or: bash research/qa/make-decl-index.sh
cut -f4 research/qa/decl-index.tsv | grep -xF 'NAME'
```

To check a new Lean file, copy an existing pilot runner, point its stage at the new
files, and save the Modal output to `research/pilots/NN/logs/<name>-runK.log` with a
provenance header. A miss in `decl-index.tsv` is weak evidence: it skips unicode names and
prefixed headers (`noncomputable def`, `private theorem`, …), so for important novelty
claims `rg` the sibling corpora directly. The script header lists the caveats.
