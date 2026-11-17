# 10-assembly tranche D1 preflight — decision input for week-2 slotting

Lane A6, 2026-11-17 (reading only — no run, no new Lean; sources read this session:
`research/pilots/10/next-tranche-spec.md` (the D1–D6 spec, PROPOSAL
[CHARTER-PENDING] 2026-11-14, this same lane's authorship), `research/qa/iter4-review/
r5-iteration4-backlog.md` §2 row 8 + §14 run-queue row 8 + §12 benched-lines,
`research/pilots/10-blueprint.md` §milestones/:186–189, `research/pilots/10/logs/`).
Owner of the decision: orchestrator week-2 slotting; this note prices D1 specifically
(the r5 row prices the whole D1–D4 arc at M).

## 1. What D1 is and needs

**D1 = the counter padding machine** (`next-tranche-spec.md` §2 D1): `padM'`
(`List Unit ↦ ℕ` — the pad state carries the counter as a `ℕ` that doubles until
`2 ^ e x`, then applies `A'`) and its run theorem `padM'_runs` (ends after `e x + 1`
steps with `A' (x, 2 ^ e x)`, every state ≤ `2|x| + e x + 4` — strictly smaller than
eth's `padM` states at every node).

Inputs D1 consumes (all GREEN/in-place per spec §3 inventory):

| need | source | state |
|---|---|---|
| `Stepped` machine calculus, `Runs`, in-file `HasSize` size instances | M1 Parts A–C (embedded block, L2.lean:49–2090) | GREEN — re-embed verbatim |
| nothing from L2 Part D actually (D1 is machine-level; the clock/discipline enter at D4) | L2.lean:2092–end | GREEN — embeds anyway with the substrate |
| proof shape `padM_reaches` (doubling induction) | eth `PaddedDescent/Pad.lean:68–88` | transcribe (≈30 of the spec's ≈60 eth-Pad LoC; "transcribed eth proofs elaborate verbatim on the pin" — M1 run-1 evidence) |
| `Nat.log2_two_pow`, `2 * 2^k = 2^(k+1)`, `Nat.size_le` | Mathlib + in-file | in place |
| σ-shape `(List Bool × ℕ) ⊕ Bool` HasSize/Enc plumbing | in-file HasSize instances; the `Carried`-instance gap (eth `EncLemmas.lean:106–127`) is a **D2** need (Route A's set), NOT D1's — D1's size bound uses the in-file `HasSize` arithmetic only | in place |

Co-located small item the spec attaches to D1's landing ("also needed either way"):
`padM'_state_poly` (pure arithmetic: `∃ d, 2|x| + e x + 4 ≤ (|x|+2)^d` from `PolyT e`)
— S-class, no fragments.

**D1 LoC:** spec §4 budgets ≈ 120 new LoC (+ the D2-arithmetic lemma, small) on top of
≈ 2.6k verbatim-embedded substrate. **D1 alone is S-class**; the M grade belongs to
the full D1–D4 arc (≈ 1.0–1.6k new LoC, 3–6 expected Modal runs to GREEN).

## 2. Warm-route availability (verified this week, not assumed)

- The tranche rides the **`crossmath-pilot-32` runner family** (spec §3; single
  self-contained `L3.lean`, `import Mathlib`, `lake env lean` per file). That app is
  **WARM on the doz workspace (semraker)** — proven by this lane's run-12 session
  (2026-11-17): back-to-back warm runs, wall 45–152 s, image layers cached. Route:
  doz CLI `/home/doz/dozenv/bin/modal` (PRIMARY per the 2026-11-17 orchestrator
  ruling). No new app, no volume, no secret.
- **One wrapper caveat for the executing lane:** spec §6 still cites the historical
  shared stage `/tmp/crossmath-pilot-stage`; `pilots/32/run_pilot.sh:14` was renamed
  this session to the lane-unique `/tmp/crossmath-pilot-32-a6` (H commits). A 10-lane
  run should NOT reuse pilot-32's wrapper as-is (fixed stage name = concurrent-lane
  collision hazard): stage a `pilots/10/run_pilot.sh` clone with
  `STAGE=/tmp/crossmath-pilot-10-<lane>` (three-line change, pilot-71/ff-ez4
  pattern). The `run_pilot.py` upload is ephemeral per run — the warm image is keyed
  to the byte-identical image block, which the clone preserves.
- Elaboration cost class: `import Mathlib` umbrella + ≈ 2.7k LoC file — same class as
  L2's GREEN runs (minutes-class warm; L2's five-run descent is in
  `pilots/10/logs/l2-run*.log`).

## 3. Effort class and blockers

- **D1: S (≈120–200 new LoC incl. `padM'_state_poly`), 1–2 warm runs expected** — it
  is the cheapest single deliverable in the whole tranche; every proof step has a
  GREEN or verbatim-transcribable precedent (spec §5 no-wall trail items 1–2).
- **Blockers: NONE hard.** The spec's named residual risks do not touch D1:
  (a) `fun_prop` over the re-declared `PolyT` (Route A) is a **D2** decision point
  ("decided by the first run", guard iii = pre-authorized Route-B switch);
  (b) the pair-split scan is **D6**; (c) the `Carried`-instance transcription gap is
  **D2**. D1's only external input is the eth Pad proof shape, and M1's experience
  (transcribed eth proofs: 0 churn on the pin) prices it at ≈ 0.
- **Charter status:** the tranche is [CHARTER-PENDING] and benched week-1 ("activates
  week 2 on lane-drain or charter scope decision" — r5 §12); r5 §14 row 8 books the
  D1–D4 arc. The blueprint's standing split option (D4 landable without D5/D6;
  dependency order D2-arithmetic + D1 → D3 → D4, D5 → D6 independent) means a week-2
  charter can size the landing anywhere from **D1(+arith) alone (S, ~1 run)** to the
  full arc (M).
- Billing guard (r5 §2 row 8 / §14 note): the tranche is **declared plumbing —
  completion value, never novelty billing** (R2's "certified-progress engineering"
  class); no article-kind implications.

## 4. Slotting recommendation (input only)

D1 is a natural **lane-drain filler of run-12 class** (S, warm, riskless, GREEN
substrate): if week-2 wants the 10-tranche opened without committing to the M-arc,
charter "D1 + `padM'_state_poly`" as the first landing (headline stays OPEN per the
REPORT-INPUTS 10-tranche row; no D2 route decision forced). The first REAL decision
point the tranche owes is D2's Route A/B (fun_prop over re-declared `PolyT`), which
D1's run does not pre-empt — keep them as separate charter lines if split.

— lane A6, 2026-11-17. No files changed by this note beyond itself; no Modal run.
