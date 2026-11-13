# TRIAGE-decision staging brief — H input for the orchestrator's TRIAGE § Cycle-2 §decision typeset

Written 2026-11-14 (H, at orchestrator request). Purpose: one-screen distillation for the
close-out typeset. **Not the decision** — score arithmetic, ranking, and portfolio calls are
the orchestrator's (main-run discipline). Sources: `TRIAGE-C2-ROWS.md` (A9, verbatim quotes),
`RESUME-BRIEF-C2.md` § Gate state, `REPORT-INPUTS-C2.md`, empirical pilot record on disk.

## Decision frame (already DECIDED 2026-11-13 — do not re-litigate; typeset only)

- Slot 1 = **71-P2 + 73-C skeleton** (A2, executing). Executing queue behind it:
  **11-M2** (A8, authorized A8-3) then **slot 3 = 72-M1 Tier-C** (A8). *Numbering note for
  the typeset:* STATUS pilot-row 72 says "slot 2" while the decision block and the resume
  brief say slot 3 = 72-M1 (11-M2 ahead of it) — normalize at typeset.
- **75 = wave-4** (spec complete, `pilots/75-prework.md`); **42-M4b-upgrade = gated
  continuation now CLEARED by G2** (direct V2 import, ≤20-line delta); **50-M2-R1 = gated on
  G7b** (re-run run19 in flight); 50-M2-R2 statement-level only (G1b FAIL); R3 Liu-1
  statement-level until G7/G7b.
- Ecosystem paragraph input (n1): 22's Tier-2 T2b CLOSED-BY-UPSTREAM (StrongPNT proved
  triad-clean upstream `938912bb`); T2a survives as 22's only open content.

## Candidate rows (lane proposal → A5 landed tier → empirical cost; grades [incoming A7])

| Cand. | Lane N/S/E proposal (rank) | A5 verdict (landed) | Empirical cost / gate |
|---|---|---|---|
| 70 Part A | 2 / 3 / 1–2 S (≈ 3–4) | artifact-grade (no discovery N); ζ_K-strip OURS, ζ/Dirichlet 7/8 CONCURRENT; HOT-cluster / WARM-artifact | pilot 50-M2: R1 gated **[G7b]**; R2 statement-level (G1b); substrate S-cost where grade missing |
| 71 | primary 2–3 / 3–4 / 1–2 S–M (≈ 3–5); secondary (S) 4/4/4–5 not-pilot | primary formalization-first; WARM (Suzuki month-clock) | **P0+P1 243 LoC GREEN** (4 Modal runs); P2 ≈ 0.35–0.55k LoC M — executing (relaunch run1: 6 errs, 0 sorry) |
| 72 | AL-EZ1 3–4 / 3–4 / 2–3 M (+S decider); M1=AL-EZ3 2 / 3 / 1–2 | P1 formal-new; C-neg precedent-backed (50/30 lineage); WARM; hard NO-GO honored | C-neg in flight (run5: 7 errs, 0 sorry; N1–N3 fix path); M1 Tier-C **zero import gates** (G5a provenance-only, run20 in flight) |
| 73 | Tier-C 3 / 4 / 2–3 (≈ 4.8); Tier A E5 = priced ceiling, not a slot | formalization-first; WARM; "first formal Tate-type" SUPPORTED in FF scope **with WenrongZou softening + clock (n5)** | 73-C skeleton ≈ 0.4–0.6k LoC, zero gates — executing (A2, after P2); G6a Stacks pricing in flight (run21) |
| 74 | 3.5 / 3 / 2 (≈ 5.25 conditional on T1+T2+T4) | transport-grade (02-pattern); WARM; `EntropyMoments.lean:93` id VERIFIED; **u≠1 required in T3** (glue note queued to A4) | no pilot this cycle |
| 75 | 4 (DLRT flip resolved) / 4 / 2–3 M (≈ 4–8) | N stays 4 (DLRT SCOPED: fixed K, GRH, T→∞); WARM; DLRT erratum must-cite | wave-4; spec complete; rides 42-M4/V2 machinery |
| 42-M4 (main-run carry) | donor-swap continuation | (main-run row 42 final) | **M4a ~180 LoC delta GREEN + axcheck-clean**; M4b fallback 1,560 LoC in flight; upgrade ≤20-line delta CLEARED (G2: 8,262 jobs, 13 triad lines, 0 sorryAx) |
| 10-L2 (main-run carry) | top-3 completion | (main-run row 10 final) | L1 529 LoC GREEN; L2 2,595 LoC / 126 thms awaiting first run |
| 11-M2 (main-run carry) | alternate revival | (main-run row 11 final) | P11T3 1,100 LoC / 88 thms + RedTm2 392 LoC; four pinpoint fixes mid-application; no run yet |

## Gate → verdict map for the typeset

G1a OK / **G1b FAIL** (DZDF full build, 62 err / 11 vendor-CFT modules) → 50-R2
statement-level; **G2 OK** → 42 upgrade cleared; G3 OK (Weil binder-route); G5 import real,
staging S (G5a re-run run20 in flight); G6b OK / G6a pricing in flight (run21); G7 pins
exact / **G7b = run19 in flight** (gates 50-M2-R1 + Liu-1 promotion). A7 grades remain
[incoming] — substitute the empirical column above where missing (M4a ~180 LoC delta green;
71-P0+P1 243 LoC green; substrate map S-cost).

## Fill order at close-out (per RESUME-BRIEF-C2 § Gate state)

Pilot outcomes land → A1 sweep signal → [SWEEP] + ledger §9 → orchestrator typesets
TRIAGE §decision (mirror main-run §Top-3 format; this file + TRIAGE-C2-ROWS.md are the
inputs) → REPORT.md §C2.6 [TRIAGE-DECISION] fills → articles per landed landing →
AGENTS-C2-DRAFT applied → STATUS cycle-close block.
