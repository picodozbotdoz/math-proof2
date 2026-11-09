# REPORT-INPUTS — §1-conclusion data pack (H, 2026-11-09 19:58; all numbers disk-verified, cite at each line)

**RE-PULL NOTE (final polish):** §B frozen at 19:58; `pilots/42/M2a.lean` still being edited
at 19:57, and R1's M2b completion will be relayed — **re-run the disk counts** (find/wc/rg
over `pilots/`, log count, axcheck tally, per-pilot statuses incl. 11-M1 COMPLETE now, and
the §D "now" line) after R9's final sweep, before the report closes.

## Headline numbers (10 lines)

- 4 corpora surveyed: 201,134 Lean files (mathlib 8,691 / tauceti 27,934 / openai-math 163,097 / anthropics 1,812); 2,888,273 declarations indexed (`qa/decl-index.tsv`).
- 5 bridge maps, 20 dossier files (19 candidates + TEMPLATE), 19 F4 grades — 19/19.
- Novelty program: 5 rounds; final verdicts SAFE 9 / RISKY 7 / DEMOTED 2 / KILLED 1 (`novelty/CLAIMS-REGISTER.md`, counted).
- QA: 230 citation items checked across 5 files — 193 OK / 37 minor / **0 WRONG** (recomputed below).
- Lean artifacts on disk: 30 pilot files / 16,150 LoC / 338 decls (+10-file port spine 11,075 LoC); 41 persisted Modal run logs.
- Proved + axioms-clean (standard three only): 22-M1, 42-M1 (15 thms), 50-M1, 11-T1/T2, 01 spine + (b)/(c); 38 axcheck theorem-printouts clean, 10 in-flight non-clean.
- Statement-port cost ≈ 0 corpus-wide (8 probe families, zero statement drift; `feasibility/FEASIBILITY-SUMMARY.md:35–38`).
- TOP-3 (decided 2026-11-09): 42 (rank ≈ 12.0), 10 (6.67), 01 (7.0, already unconditional-proof); alternates 41/11/30 (`TRIAGE.md` §Top-3).
- Wall-time: RESEARCH.md 11:00 → 19:58 ≈ **8 h 58 m** same-day; 3 strategic pivots, all 19:26–19:49.
- External race shaped the portfolio: Knausgård constants 0.67354/0.83900 formal 2026-10-09; our 42-family still first for ζ_K.

## §A Scale

| Item | Number | Source |
|---|---|---|
| mathlib files / decls | 8,691 .lean / 184,207 decls | `find`; `qa/decl-index.tsv` |
| tauceti files / decls | 27,934 .lean / 242,275 decls | idem (survey git `d92acc5c0`, `survey/tauceti.md:3`) |
| openai-math files / decls / manuscripts | 163,097 .lean / 2,439,960 decls (incl. vendored trees) / 721 manuscripts in 373 families, ≈29.7 M lines | `qa/decl-index.tsv`; `survey/openai-math.md:3–7` |
| anthropics files | 1,812 .lean (3sum-apsp 426 files ≈97 k lines; eth 1,047 ≈152 k; zeta23 316 ≈102 k — `survey/anthropics.md` §0 scale row) | `find`; survey |
| Declaration index | 2,888,273 decls, 6 roots, 8.7 s build | `qa/make-decl-index.sh`; INDEX entry |
| Bridge maps | 5 files; sections 5/6/6/9/9; table-rows 24/26/22/25/10 (complexity/linear-algebra/analytic-nt/tensor-algebra/tauceti-contributions) | `rg -c '^\| '` per file |
| Dossiers | 19 + TEMPLATE (= 20 files) | `ls candidates/` |
| Novelty program | rounds 1–3 files + VERDICTS (r4 sweeps inside) + r5 (VERDICTS §5.1/:108, 19:49) + CLAIMS-REGISTER + knausgaard-as-donor + RELATED-WORK | `novelty/` |
| Verdict tallies | SAFE 9 / RISKY 7 / DEMOTED 2 / KILLED 1 = 19 | `CLAIMS-REGISTER.md` last column, counted |
| F4 grades | 19/19 landed | `rg -l 'F4 grade' candidates/` = 19 |
| Feasibility headline | statement-port ≈ 0 corpus-wide; effort in proofs/new math; 3 toolchain patterns | `FEASIBILITY-SUMMARY.md:34–46` |

**QA recompute (from the 5 qa files' own per-part tallies):**

| QA file | Items | OK | Minor | WRONG |
|---|---|---|---|---|
| dossiers-spotcheck P1 (01-03,10-12) | 48 | 41 | 7 | 0 |
| dossiers P2 (20-22,40-42,50,60) | 64 | 55 | 9 | 0 |
| dossiers P3 (30-32) | 24 | 22 | 2 | 0 |
| dossiers P4 (51/52) | 16 | 12 | 4 | 0 |
| bridges-spotcheck P1 (complexity, linear-algebra) | 20 | 19 | 1 | 0 |
| bridges P2 (analytic-nt, tensor-algebra, tauceti-contrib) | 30 | 21 | 9 | 0 |
| anthropics-spotcheck | 12 | 11 | 1 | 0 |
| mathlib-frontier-spotcheck | 12 | 9 | 3 | 0 |
| (R9-file recheck inside mathlib-frontier file) | 4 | 3 | 1 | 0 |
| **Total** | **230** | **193** | **37** | **0** |

## §B Verification (final-disk 19:58; canonical tables: `feasibility/VERIFICATION-LEDGER.md` + `pilots/*/logs/`)

| Metric | Value | Source |
|---|---|---|
| Pilot .lean files (non-port / port) | 20 / 10 | `find pilots/` |
| Pilot LoC (non-port / port) | 5,075 / 11,075 (= 16,150) | `wc -l` |
| Pilot decls (thm/lemma/def, non-port) | 338 | `rg -c` |
| Ledger snapshot (19:38) | 12,978 LoC / 242 thms / 421 lemmas / 4 ex | `VERIFICATION-LEDGER.md:28` |
| Modal run logs persisted | 41 (31 in `pilots/*/logs/` + 12 in-repo `pilots/22/*.log` overlap → 31 pilot-side unique + 10 probe-side in `feasibility/probe/logs/`) | `find -name '*.log'` |
| Cold / warm run | ≈ 3 min 45 s / 68 s–2.5 min | `VERIFICATION-LEDGER.md` (Modal evidence) |
| Cache | 9,096 olens fetched for exact rev `ff2494ea`; ~8,710 in image | `port-probe.md:35–39` |
| axcheck clean theorem-printouts | 38 lines `[propext, Classical.choice, Quot.sound]`; 10 non-clean (in-flight files) | `pilots/42/logs/axcheck-run1.log` (replicated ×4) |
| sorry-token state | no actual `sorry` in any pilot file (13 header-mention hits only) | `VERIFICATION-LEDGER.md:96–97` |

Per-pilot one-liners (latest log on disk):

| Pilot | Status |
|---|---|
| 01 | PROVED-unconditional core: port spine green + axioms-clean (`rank_trace_ineq`/`rank_trace_mult`); (b) BindingSurface + (c) MasterIdentity GREEN (0 err/0 sorry, latest log); tightness companion landing |
| 11 | **M1 COMPLETE** (acceptance GREEN, Design B, faithfulness check, axioms standard-triad, ≈35 min); T1/T2 axcheck-clean; M2 next (RedComp A/B superseded by Design B acceptance) |
| 22 | M1 PROVED axioms-clean (run4); Tier1 in-flight (FAIL 10 err, run9); stop-at-M4 rule |
| 42 | M1 PROVED axcheck 15/15; M2a+M3 landed (602+444 LoC, 48 thms; M2a still editing 19:57); M2b next |
| 50 | M1 PROVED axcheck-clean (4 lines); Dirichlet M2a in-flight (4–5 err) |
| 52 | M1 in-flight (FAIL 13–15 err, 9 sorryAx) |
| 20 / 32 | M1 staged / landed-unrun |
| 30 | falsify milestone not landed |

## §C Decision (`TRIAGE.md` §Top-3 + decision log, 2026-11-09)

| Slot | Candidate | Rank | Note |
|---|---|---|---|
| #1 | 42 ζ_K proportions (cert-conditional landing) | ≈ 12.0 (4×3÷1, N→4 r5(c)) | M1 proved; M2a/M3 landed; M2b closes |
| #2 | 10 Z3 uniform ∧ min-rate ∧ poly-space | 6.67 | conditional-GO; G1 audit first |
| #3 | 01 inertial master identity + tightness | 7.0 (3.5×4÷2, E2 empirical) | already unconditional-proof |
| Alt | 41, 11, 30 | 7.0 / 6.67 / 5.33 | in order |
| Excl. | 22 (pilot-cat, strategically dead), 21 (absorbed), 51 (killed) | 8.0† / 1.5 / 1.0 | †discount flag |

Five decision inputs: H complete DRAFT ranking; R8 VERDICTS r1–5; FEASIBILITY-SUMMARY (19 F4s); VERIFICATION-LEDGER + rescued run logs; donor mapping (`knausgaard-as-donor.md`). Decision date 2026-11-09 (decision-log "final" entry, `TRIAGE.md`).

## §D Deltas / timeline

| Event | Time (mtime / log) | Source |
|---|---|---|
| Project start (RESEARCH.md) | 2026-11-09 11:00 | `stat RESEARCH.md` |
| Coordination board live (STATUS.md created) | 2026-11-09 ~18:24 (lane kickoff) | Task-1 record |
| **Pivot 1 — Knausgård race consolidated** (VERDICTS: HOT/WARM tiers, 01/02/21 demoted) | 19:26 → updated 19:49 (r5) | `stat novelty/VERDICTS.md` |
| **Pivot 2 — 22 strategic stop** (donor mapping: Tier-1 dead man walking, stop-at-M4) | 19:31 | `stat novelty/knausgaard-as-donor.md` §2d |
| **Pivot 3 — donor-swap for 42** (Hypζ via clean `*_of_local`, effort S→S−) | 19:31 (same file §2a); folded into TRIAGE 19:49–19:54 | idem + `TRIAGE.md` |
| Top-3 decided + typeset | 19:54 | `stat TRIAGE.md` |
| Now (pack freeze) | 19:58 | `date` |

Wall-time ≈ 8 h 58 m. Lane task counts: not recorded per-lane on disk; H executed 12 orchestrator
tasks (T1 board/index/QA → T12 top-3 typeset); R9 rounds 1–9 (ledger/probe headers); R8 rounds
1–5 (VERDICTS). 42/M2a.lean still being edited at 19:57 — final numbers to re-pull at polish.
