# D1 record — pilot-10 assembly tranche, D1-only landing (the counter padding machine)

**Verdict: GREEN 2026-11-17** — `research/pilots/10/L3.lean` OK (rc=0, 0 errors,
0 sorry-warnings), 4 runs / 3 fix iterations (the ≤3 budget exactly; every error class
in the log header). Evidence: `research/pilots/10/logs/d1-run1.log` — provenance
header (charter, shas, all four run URLs, telemetry) + full descent. Substrate:
mathlib `ff2494ea`, v4.36.0-rc2; new ephemeral app `crossmath-pilot-10`
(`run_pilot.py` = the pilots/32 generic-runner clone, byte-identical image block —
shared warm layers), doz CLI route (PRIMARY per the 2026-11-17 orchestrator ruling),
lane-unique stage `/tmp/crossmath-10-d1-a6` (the preflight's 3-line wrapper fix, now
landed as `pilots/10/run_pilot.sh`). GREEN run wall=51 s warm, telemetry OVER=0.

**Billing line (charter-fixed):** plumbing / completion-value — never novelty. This
landing adds NO discovery claim; the machine-layer headline
(`exists_tm_padded_space`, D4) stays unchartered.

## What landed (L3.lean, sha 34534c1c…, 2,805 LoC)

48-line D1 header + **L2.lean verbatim** (2,625 lines, sha 845ce129… — itself M1
Parts A–C verbatim + Part D; regression re-verified triad in the same run:
`exists_tm_space` family + the whole `Counted` block) + **Part E** (132 new lines,
namespace `Groundwork.PadC`):

| decl | content | axioms (in-file print) |
|---|---|---|
| `size_bool'`/`size_list'`/`size_nat'` | the anonymous `HasSize` instances as simp/rfl lemmas (eth Groundwork carried these; the M1 embedding does not) | rfl |
| `size_bools` | eth Pad.lean:53 verbatim (`size x = 2·|x|+1` for `List Bool`) | `[propext, Quot.sound]` |
| `size_two_pow` | `size (2^k) = k + 2` via `Nat.size_pow` | `[propext, Quot.sound]` |
| `padM'` | **the counter padding machine** (eth `padM`, Pad.lean:35–40, with the pad list replaced by the counter: state `(List Bool × ℕ) ⊕ Bool`, doubling until `e p.1 ≤ Nat.log 2 p.2`, then `A'`) | def |
| `padM'_reaches` | the doubling induction — eth `padM_reaches` (Pad.lean:68–88) verbatim shape; `Nat.log_pow` for `Nat.log 2 (2^k) = k` (eth's `Nat.log2_two_pow` name does not exist at this pin) | `[propext, Classical.choice, Quot.sound]` |
| `padM'_runs` | ends after `e x + 1` steps with `A' (x, 2^(e x))`, states ≤ `2|x| + e x + 4` — **strictly smaller than eth's `2|x| + 2·2^(e x) + 3` at every node** (the exponential enters only through the NUMBER of doublings, never the state) | triad |
| `padM'_state_poly_pair` | UNCONDITIONAL: states polynomial in `|x| + e x` (degree 2) — the honest D1-native form | triad |
| `padM'_state_poly` | the D4-consumable S-hypothesis (`exists_tm_space` consumes `S ≤ (|x|+2)^d` per run) **under an explicit value-polynomiality binder** | triad |

## SPEC CORRECTION carried by this landing (for the charter owner + D2/D4)

`next-tranche-spec.md` §2 D2 states `padM'_state_poly (he : PolyT e) :
∃ d, ∀ x, 2|x| + e x + 4 ≤ (|x|+2)^d` — **FALSE as written** under the substrate's
binary `Enc ℕ` (`instance : Enc ℕ := ⟨fun n => toV (Nat.bits n)⟩`, L2 :1017):
`PolyT` bounds the WORD of `e x` (`len (e x) ≤ c·(len x + 1)^c`), never its value —
`e x = 2 ^ (|x| ^ 2)` is word-polynomial, value-exponential, and refutes the
displayed inequality. Part E lands the two true forms (the unconditional pair-form
and the conditional with `(hv : ∃ k, ∀ x, e x ≤ (|x|+2)^k)` explicit). D4's assembly
must supply `hv` (or derive it Solver-side where `e` is value-polynomial by
construction). Suggested spec edit (owning lane H/A6-with-charter): replace D2's
`padM'_state_poly` statement with Part E's two forms and the one-paragraph reason.

## D2 inputs untouched (per charter)

No `IsPolyT (padM' …)` content, no `fun_prop` attribute changes, no `Carried`
transcription (eth `EncLemmas.lean:106–127` gap stands), no D3 `pad_bound`, no D5/D6.
The Route A/B decision remains exactly where the spec left it ("decided by the first
run" of a D2 charter). Part E's size lemmas are additive and D2 may reuse them.

## Fix-loop lessons (all recorded in the log header)

1. Header doc-comments must close (authoring slip, caught by the runner's parse
   error at EOF).
2. `nlinarith` cannot unfold `(l+2)^3`; the monotone chain
   (`Nat.pow_le_pow_left` on the base + `mul_le_mul_left` + omega) does.
3. `rw [Nat.pow_succ]` over-rewrites (the LHS exponent matches too); and
   `Nat.pow_succ` at this pin is succ-typed (`a ^ n.succ`), so type-ascribed
   applications do not unify against `k+4`. The robust idiom:
   `have h4 : k + 4 = (k + 3) + 1 := by omega; rw [h4, Nat.pow_add]; ring`.

## Close-out duties

- H commits: `pilots/10/{L3.lean, run_pilot.py, run_pilot.sh, logs/d1-run1.log,
  D1-record.md, tranche-D1-preflight.md}`.
- A1 folds the §10 row (this record is the source; class = engineering/plumbing
  landing, C2 coverage — the six in-file prints cover all Part E theorems; Step-B
  `AxPilot10_L3` TARGETS append at sweep per the spec's §6 protocol, full-coverage
  `axcheck_full.py` standard).
- Blueprint `10-blueprint.md` §M4 line update (charter owner): D1 landed
  2026-11-17; D2's Route A/B and the M-arc still pending charter.

— lane A6, 2026-11-17.
