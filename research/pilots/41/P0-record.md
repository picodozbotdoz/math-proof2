# Pilot 41 — P0 record: GREEN (statement rung; Iteration-5 opener fired)

*Dossier `research/candidates/41-q-deformed-eight-square-temperley-lieb.md` (G_q display
errata stamped 2026-11-18, lane A6) · pre-charter `research/qa/iter4-review/a6-41-p0-precharter.md`
§1 (the P0 spec), §3 (runner plan), §4 (gates + descope ladder) · lane R4 (worktree
agent-08), fired 2026-11-19, wave 4 day-1 fire list. H owns commits; none made here. All
files below live in this worktree (`worktrees/agent-08`); H commits post-K.*

## Verdict

**P0 GREEN — statement-elaboration rung PASSED** on the pin (mathlib `ff2494ea5e438f…`,
toolchain `leanprover/lean4:v4.36.0-rc2`, warm app `crossmath-probe`, doz CLI profile
semraker): **0 errors, 0 sorry-warnings, 0 other-warnings, rc=0**; all four `#check`
targets print — `MainIdentity`, `Nondegenerate`, `@HostTransport`, `bridge_pin`.

Per the probe conventions this is an **elaboration verdict, never a proof claim**: the
(M)/(N) targets and (H) binder remain dossier hypotheses until the pilot core lands
kernel-clean. Zero-sorry by construction (Prop-valued defs + `#check`; the only proof
token in the file is the eth-verbatim definitional `rfl` at `phi_parts`).

## Runs (2 total; budget was 1–2 warm runs + the budgeted fix-loop — used exactly that)

| run | file bytes | sha256(16) | verdict | wall | log |
|---|---|---|---|---|---|
| 1 | verbatim `e3d984b:research/pilots/41/P0.lean` (190 LoC) | `3ba649fa12cca395` | **NOT-GREEN** — 1 codegen-class error (below); all statements elaborated | 96 s | `logs/p0-run1.log` |
| 2 | run-1 + one mechanical pin-adjustment (`noncomputable def Gq`, D3 note in header; 202 LoC) | `b177acdbf0346bf1` | **GREEN** (this file = the worktree `P0.lean` going forward) | 65 s | `logs/p0-run2.log` |

Modal runs: run 1 `https://modal.com/apps/semraker/main/ap-Ff7T9BWeQPUGijytDT50oF`;
run 2 `https://modal.com/apps/semraker/main/ap-aVPWsYZdxVvzKx5GqaYOlb`. Spec both runs:
cpu=2.0, memory=4096 (soft), LEAN_NUM_THREADS=2, telemetry @60 s, no taskset/`-j`
(single-file elaboration, no lake build phase).

## Gate scoring (precharter §4)

- **G-P0(a) faithfulness — GREEN.** The verbatim eth port block (`Block`, `bxor`, `phi`,
  `sigma`, `Signs` from `EightSquareStatement.lean:37–53`; `phiQ`, `phi1/2/3`,
  `phi_parts := rfl` from `SecCrossing_Identity.lean:126–136`) elaborates 0-errors
  on-pin. Zero churn at the statement level — the measured corpus record
  (statement-port cost ≈ 0, FEASIBILITY-SUMMARY B1–F) holds for this donor too. The
  run-1 defect was NOT a port defect (it was codegen marking of a new def, below).
- **G-P0(b) shape — GREEN.** `sigmaQ`/`Gq`/`MainIdentity`/`Nondegenerate`/
  `HostTransport` all typecheck with the exact intended types (printed in both logs;
  run-2 types byte-identical to run 1). This confirms the **polynomial-home pin**
  (`Gq : Block⁴ → ℤ[X]` via `Polynomial ℤ` + `aeval`; no Laurent polynomials anywhere —
  all exponents ℕ-valued) and the dossier's quantifier order for (M).
- **G-P0(c) anchors — GREEN.** `bridge_pin` (the concrete (B) instance
  `sigmaQ 1 (t,f,t) (f,t,f) = sigma (t,f,t) (f,t,f)`) elaborates and prints.
- **GO to core** = (a)+(b) GREEN with (c) included — **GO declared**. The core executes
  the dossier milestone ladder 1–4; plan at `S-M-plan.md` (this directory).

## Findings

1. **The one run-1 defect was codegen-class, not statement-class** (mechanical fix-loop
   consumed as budgeted): `P0.lean:117:4 error(lean.dependsOnNoncomputable)` — mathlib's
   `AddMonoidAlgebra.instMul` (the `Polynomial ℤ` multiplication instance) is
   `noncomputable`, and `Gq`'s body multiplies polynomials, so the *data* definition
   fails codegen unless marked. Fix: `noncomputable def Gq` (one word), recorded in-file
   per the D3 pin-adjustment precedent. No statement drift: run 2 re-printed the four
   `#check` types identical to run 1, and the Prop-valued consumers (`MainIdentity`,
   `Nondegenerate`, `HostTransport`, `bridge_pin`) need no codegen. Note for the core:
   **every core def whose body evaluates/multiplies `Polynomial ℤ` elements will need
   the same `noncomputable` marking** — expected instances: any evaluated-defect helper
   beyond Prop level; theorems are unaffected.
2. **Both precharter-flagged mechanical spots passed clean with zero churn**: the
   ℤ→ℤ[X] coefficient coercion in `Gq` (the `((-1 : ℤ) ^ e : Polynomial ℤ)` ascription)
   and the `aeval` ℤ-algebra instance in `MainIdentity`/`HostTransport` both elaborated
   first try — the §1.8 fallbacks (`Polynomial.C`-wrap, map-form restatement) were not
   needed.
3. **Errata verification (pre-fire, as instructed)**: the fired statements were checked
   against the dossier's ERRATUM-corrected G_q display (2026-11-18), not the stale
   (M)-display — correction 1 (geometric summand positive: `∑ X^j`, not `(−X)^j`) and
   correction 2 (`2k+1 = gapOdd − 2·τmin`, i.e. `kDef = (gapOdd − 2·tauMin − 1)/2`) are
   both carried in the fired `Gq`/`kDef`. The fired file matches the authoritative
   corrected display. (Dossier itself is R9's to verify — not touched here.)
4. **Telemetry (AGENTS §Modal guidelines 3)**: each run logged one OVER-mem sample
   (4312 MB / 8005 MB vs the 4096 spec) — the documented inherent artifact for
   `import Mathlib` modules: the `mem` figure (MemTotal−MemAvailable) includes the
   memory-mapped Mathlib olean pages/page cache (AGENTS measured fact 5). anon = 0 MB
   both runs, max cpu 0.60/0.53 (cap 2.0), procs = 2. Investigation conclusion: no
   runaway tactic, no rebuild, no wrong-sized work — single-file statement elaboration,
   minutes-scale as speced. No resource escalation sought or needed. Findings recorded
   in both run logs.
5. **Probe-tooling observation (for the probe-infra owner, not this lane's file)**:
   `lean_probe.py`'s error matcher (`": error:"`) does not match the parenthesized
   `error(lean.dependsOnNoncomputable)` form — run 1's summary line read `errors=0`
   while rc=1 (the FAIL verdict was carried by rc, so no wrong verdict escaped, but the
   counter under-reports). Worth broadening the matcher to `": error"` or
   `error(…)` at the next probe-infra touch.
6. **No statement-math defects found** — nothing to route back to the dossier beyond
   item 3's confirmation that the corrected display is the coherent one.

## Next milestone pointer

**Core S–M** (dossier F4: (M)+(N), ≈ 0.5–1k LoC, milestones 1–4 = re-prove `Eight.signs`
anchor → parity split (P1)(P2) → (M)+(B) → (N) decide) — plan drafted at
`research/pilots/41/S-M-plan.md`. **(H) phase is WAVE-TAIL CONDITIONAL** per the
orchestrator's DECISION-4 ruling (2026-11-19) — not scheduled here; its binder-tier
statement (`HostTransport`) is already GREEN in this P0.

## Files (this worktree; sha256(16) each)

- `research/pilots/41/P0.lean` — `b177acdbf0346bf1` (fired run 2; supersedes the
  e3d984b staged candidate `3ba649fa12cca395` — header carries the dated FIRED +
  pin-adjustment record)
- `research/pilots/41/logs/p0-run1.log` — run-1 log, provenance header + verbatim
  transcript
- `research/pilots/41/logs/p0-run2.log` — run-2 log, same convention
- `research/pilots/41/P0-record.md` — this record
- `research/pilots/41/S-M-plan.md` — core S–M milestone plan (post-GO artifact)

— lane R4, 2026-11-19.
