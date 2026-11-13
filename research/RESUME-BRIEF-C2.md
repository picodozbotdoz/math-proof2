# RESUME BRIEF — Cycle 2 relaunch (written at session wrap, 2026-11-14)

Context: the Cycle-2 orchestrator session was terminated by a network outage
(API connect timeouts to zcode.z.ai, ~2026-11-13 late); all 10 lanes (A1–A9 + H)
died mid-flight. All lane artifacts are committed in the snapshot commit
(see STATUS.md § Cycle 2 → wrap note). This brief is the complete handoff:
state per lane, exact next steps, gates. Read AFTER AGENTS.md + research/RESEARCH.md
(§ Cycle 2) + research/STATUS.md (§ Cycle 2). Lane ownership rules unchanged
(one writer per file; H commits; lanes report to the orchestrator).

## Protocol (carried over; keep both)

1. **Queue-loaded re-tasks** (user instruction AGENT_INSTRUCTION_1.md, repo root,
   untracked — leave it): give each lane a 2–3 item work queue; lanes work bottom-up
   and return only when the queue drains or a decision point hits. Re-task before prose.
2. **Concurrency probe** (H duty): `ps -eo comm --no-headers | grep -cx zcode-cli` at
   each batch close; report raw counts (user observed max 7 vs claimed 10 —
   steady ≈ lanes+1, transients overlap).
3. **Substrate**: Modal only, `MODAL_USER=doz` (doz CLI) — `sudo -n -u xyz` is blocked
   in this env; runner pattern per pilots/71/run_pilot.sh:11. NEVER local lake builds.
   NOTE: a Modal artifact-cache outage affected runs 17/18 of the G-series earlier;
   transient retries may be needed.

## Per-lane state at wrap

- **A1 (survey/feasibility/close-out machinery) — DONE through standby.**
  Landed: survey/axiommath.md, axiommath-pntplus.md (StrongPNT-amputation find:
  upstream `AlexKontorovich/PrimeNumberTheoremAnd` @ 938912bb PROVES StrongPNT
  triad-clean → dossier 22 T2b closed-by-upstream), axiommath-cft-vendor.md
  (vendor number-field-only; binder-route needs ZERO imports), qa/tauceti +
  openai-math spotchecks (legacy surveys QA'd; 1 WRONG fixed), novelty/
  liu1-hygiene-sweep.md (constant story resolved: B_new = README exactly; public
  entry uses proved rational B_r = 34999/40000; 0 sorry/22-22 names), pntplus-glue-
  as-donor.md (Γ-field map; V2's proportions transitively rest on the fork's
  RiemannZetaHadamard), feasibility/probe/FINAL-SWEEP-PLAN-C2.md (tested:
  36 sorry-tokens all justified, 0 unexplained), VERIFICATION-LEDGER.md §9
  (Cycle-2 fill-in skeleton). research/AGENTS-C2-DRAFT.md exists, held UNAPPLIED
  → apply at cycle close (standing authorization).
  NEXT: standby duty = sweep-trigger detection — update ledger §9 rows as pilots
  finalize; signal the orchestrator when every TARGETS row is final-or-declared-drop
  (then execute sweep Steps A–C). START HERE: re-read FINAL-SWEEP-PLAN-C2.md §0.

- **A2 (FF bridge/pilot 71+73) — MID-FLIGHT, closest to a landing.**
  Landed: bridges/function-field.md (5 zones; two-worlds-share-zero-definitions),
  pilots/71-prework.md, FF-sequencing-memo.md, 73-prework.md; pilot 71 **P0 OK
  (probe, 4 justified stubs) + P1 GREEN (7/7 kernel-clean, triad)** — logs run1–4.
  **P2.lean is written (~header "proof artifact: no sorry") but NEVER RUN** — the
  agent was verifying API lemmas when killed.
  NEXT: run P2.lean as-is on Modal (run_pilot.sh pattern), iterate to GREEN
  (W1 window incl. s≠1 pole exclusion → W2 → HW per 71-prework §c), full axcheck,
  logs; then 73-C skeleton (Q0 probe → Q1 class+series+71-glue → Q2 (i) → Q3 (ii);
  STOP before Q4 — separate gate). Overrun guard: P2 > ~0.7k LoC or 73-C > ~0.6k
  without GREEN ⇒ stop+diagnose. Then dossier-71 §Pilot-outcome addendum (A9 owns it —
  report verdict for relay).

- **A3 (donor map/pilot 42-M4/50-M2) — MID-FLIGHT.**
  Landed: novelty/axiommath-as-donor.md, pilots/42-M4-blueprint.md,
  50-M2-31-32-spec.md (routes R1 openai-in-corpus-7/8 / R2 DZDF-31/32 / R3
  Liu-1-binder); pilot 42 **M4a GREEN + axcheck-clean (1,194 LoC/52 thms, all
  triad; logs m4-run2, m4-axcheck-run1)**, M4a-note.md = M4c addendum draft.
  **M4b.lean on disk (1,557 LoC/66 thms) via fallback route (hV2d4/hV2d5 binders),
  run log NOT landed — the agent died fixing a search-string indentation bug
  ("Fix C" + a 1330-direction fix) in its own edit loop.**
  NEXT: verify M4b.lean state (read it; check for the half-applied Fix C edits —
  reconcile), run on Modal, iterate to GREEN + axcheck; then M4-note.md update.
  G2 verdict is EVIDENCE-BACKED (A5 Q7: 13 triad lines, 0 sorryAx) → the
  blueprint's primary-route upgrade (direct V2 import, ≤20-line delta) is
  CLEARED after fallback GREEN — execute it as the follow-up item.
  Then: 50-M2 remains gated on A7's G7b (not yet run — see A7).

- **A4 (AL bridge/dossier 74/pilot 72-C-neg) — MID-FLIGHT.**
  Landed: bridges/area-law.md (4 zones; Kuwahara-corrected + isometric-B erratum),
  pilots/72-prework.md (+ Kuwahara no-go Appendix A, effort S),
  feasibility/quantum-info-substrate.md, candidates/74 (u≠1 edit from A5's row
  was queued — VERIFY whether applied; H's Q5e says NOT carried at its check).
  Pilot 72 **C-neg.lean: honest FAIL-in-flight — run5: rc=1 errors=7, sorry=0**
  (descent 20→14→12→6→7 across runs 1–5; the agent died mid-fix, "getting the
  186 context"). Logs run1–5 lack provenance headers (owed at close-out).
  NEXT: fix the remaining ~7 errors to GREEN (N1 Rényi monotonicity + N2 rank
  bridge + N3 gate theorems per Appendix A), prepend provenance headers to all
  logs, axcheck triad-only, report. Then the u≠1 dossier-74 edit if unapplied.
  Overrun guard: past ~0.5k LoC without GREEN ⇒ stop+diagnose note.

- **A5 (novelty) — DONE through clocks; tracker audit MID-FLIGHT.**
  Landed: qa/make-decl-index-v2.sh + decl-index-v2.tsv(.zip) (13 corpora,
  2,940,110 rows), novelty/round-4.md (parts 1–2 + §5 QR-D precision + §6 FF +
  §8 clocks), VERDICTS.md (rows 70–75 ALL dossier-checked; reconciled), 
  CLAIMS-REGISTER.md + RELATED-WORK.md Cycle-2 sections, qa/donor-probes-spotcheck.md
  (Q7: 12 OK/0 WRONG; G2 fully evidence-backed; G7b OPEN pending run16).
  Clock sweep findings (fold into dossier 70 — A9 owed): Chang–Wang 2611.00924
  (conditional frontier 0.87446205 < B♭, conditional-only); Ji 2611.16665 (599/600,
  ζ_{Q(i)}+ζ); QR-D Lean ecosystem = 13 repos incl. Kontorovich/quasi-rh
  (README-claimed 11/12 ζ+Dirichlet, NO ζ_K) — **the ζ_K-strip per-class split
  SURVIVES (no ζ_K formal artifact anywhere)**. HKT chapter pin still [TBD].
  NEXT: finish the GTimG/QuasiRiemannTracker audit (JS-rendered site — use
  browser-use:control-browser skill; was mid-navigation to the protocol tab;
  pushed 2026-11-13 08:28, "every result verified" — determine kernel-vs-certificate
  verification + any ζ_K/Hecke entries) → §tracker-audit in round-4.md + row-70
  standing-note update if material.

- **A6 (pilot 10 L1/L2) — L1 LANDED GREEN; L2 MID-FLIGHT.**
  **L1: GREEN + axcheck-clean** (logs l1-run1..4; run4-final: AxPilot10_L1_full OK
  + Pilot10_L1 OK; L1.lean 529 LoC/25 thms per ledger skeleton). L2.lean on disk
  (2,595 LoC/126 thms per A1's ledger row) — **the agent died reviewing its own
  Part D draft for defects (rw directions, omega atoms, goal-side rewrites) BEFORE
  the first L2 run**. 10-blueprint.md modified (mid-flight notes).
  NEXT: read L2.lean + finish the Part-D defect fixes, run on Modal, iterate to
  GREEN + full axcheck (axcheck_full.py pattern), logs with provenance headers.
  Then report → A9 writes dossier-10 outcome note.

- **A7 (probes G1–G7) — doc COMMITTED; G7b UNFINISHED.**
  Landed: feasibility/axiommath-donor-probes.md + ProbeG files + logs-g (committed
  `24e8d93`); verdicts: G1a OK (DZDF statements elaborate), **G1b FAIL (DZDF full
  build: 62 errors/11 CFT modules — matches A1's prediction; 50-M2-R2 stays
  statement-level)**, G2 OK (V2 build 8262 jobs, 13 triad lines — 42-M4b-upgrade
  gate cleared), G3 binder-route OK, G4 5 Physlib imports measured, G6b
  tauceti-locator/no-bridge OK, G7 Liu-1 pins exact. **G7b (donor-pin axiom audit,
  run16) DIED IN THE OUTAGE — the log tail is the OSError itself, no verdict.**
  Also was applying A5's two Q7 minors (tauceti Zeta.lean path abbreviation;
  gprobe "sorry-warnings=0" labeling quirk) — gprobe.py modified mid-flight.
  NEXT: reconcile gprobe.py minors, re-run run16 (G7b) — note Modal artifact-cache
  outage risk (runs 17/18 died on it earlier; retry), finish run17 (G5a Physlib
  staging) + run18 (G6a Stacks pricing) if still pending. G7b verdict = the gate
  for 50-M2-R1's kernel-facing hygiene claim.

- **A8 (pilot 52/20 close-outs → 11-M2 → slot-3 72-M1) — MID-FLIGHT on 11-M2.**
  Landed: pilot 52 VERIFIED-GREEN close-out + pilot 20 runs-recorded (committed);
  pilots/11/P11T3.lean (1,100 LoC/88 thms) + RedTm2.lean (386 LoC/8 thms) on disk,
  **run verdict NOT landed — agent died applying "four pinpoint fixes" (explicit
  type params on stuck instance applications, branch-form machine in choice,
  induction-style sum_sf, missing hk argument in composed_sum_le)**.
  NEXT: apply/verify those four fixes in P11T3/RedTm2, run on Modal (run_pilot11.sh),
  iterate to GREEN + axcheck, logs with provenance headers. Then SLOT 3:
  72-M1 Tier-C per 72-prework §2 (M1 = the family-265 interface theorem,
  statement specs in prework §a; Tier C = transcription, zero import gates).

- **A9 (dossiers 70–75/records) — DONE through staging; 75-prework landed at death.**
  Landed: candidates/70/71/72/73/74/75 (ALL FINAL, A5-revised), TRIAGE-C2-ROWS.md
  (decision-ready staging, 44 ln), REPORT-INPUTS-C2.md (231 ln), articles/README.md
  Cycle-2 section. **pilots/75-prework.md LANDED (complete spec) — its final report
  never arrived; treat as done.** Owed items (queue them first): (1) fold the
  clock-sweep must-cites into dossier 70 (Chang–Wang, Ji, 13-repo landscape,
  tracker [pending A5 audit]) — the relay was sent but not yet executed;
  (2) dossier-75 §Novelty garbled mid-splice sentence (one-edit fix; full text
  survives in the header); (3) then pilot-completion watch: each landing pilot
  → its dossier §Pilot-outcome addendum (A9 owns 70/71/72/73/75; A4 owns 74).

- **H (board/commits/QA) — DONE through Q5f; standing cadence.**
  31+ commits through `978f074`; QA cumulative 0 WRONG (P1–P6 all executed);
  board/INDEX current through the wrap; AGENTS-C2-DRAFT held unapplied;
  AGENT_INSTRUCTION_1.md untouched/untracked. NEXT: resume standing cadence —
  process lane reports (commits + QA re-triggers), report back on ≥2 events or
  decision-needing events, probe count each report.

## Gate state (decisions already made; do not re-litigate)

- **Pilot slots DECIDED** (empirical record, 2026-11-13): slot 1 = 71-P2 + 73-C
  (A2, executing), slot 2 = (was 11-M2, A8), slot 3 = 72-M1 Tier-C (A8 after 11-M2);
  75 = wave-4 (spec landed, ready); 42-M4b-upgrade = gated continuation, now
  CLEARED by G2 evidence; 50-M2 = R1 (openai in-corpus 7/8) gated on G7b, R2
  (DZDF 31/32) statement-level only per G1b.
- **TRIAGE §Cycle-2 decision**: A9's TRIAGE-C2-ROWS.md is decision-ready; the
  orchestrator typesets the final §decision when pilot outcomes land (mirror the
  main-run §Top-3 format). Draft ranking inputs: lane proposals in the rows file;
  A5's VERDICTS N-adjusts landed; A7's effort grades remain [incoming] — use
  empirical costs (M4a ~180 LoC delta green; 71-P0+P1 243 LoC; substrate map
  S-cost) where grades are missing.
- **Sweep**: NOT triggered. Trigger = A1 signals all FINAL-SWEEP-PLAN-C2 §0 TARGETS
  final-or-declared-drop → A1 executes Steps A–C → ledger §9 fills → H commits.
- **Close-out chain** (after sweep): TRIAGE §decision typeset → REPORT.md §C2 fills
  (inputs in REPORT-INPUTS-C2.md) → articles per landed landings → AGENTS-C2-DRAFT
  applied (standing authorization) → STATUS cycle-close block.

## Network-outage note

The outage killed: all 10 agent turns (~simultaneously), A7's run16 Modal CLI
mid-call, and A5's browser session. Treat every log tail written after ~the outage
start as suspect until re-verified; the verdicts cited above were disk-verified at
wrap (10-L1 GREEN, C-neg FAIL-in-flight, M4a GREEN recorded earlier, P2.lean unrun).
