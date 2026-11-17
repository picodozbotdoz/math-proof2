# A8 — 22-T2a G9 preflight: validation of the staged probe + charter recommendation

Lane A8 (R8-successor), 2026-11-17, worktree agent-09. Decision input for the
orchestrator (week-1 agenda row 8 tail / backlog §14 row 10; R9 §6f assigned the
22-T2a G9 preflight to A8, statement-only, T1 NOT fired). No runs launched; no files
outside this lane's outputs touched.

## 1. State of record: G9 is ALREADY STAGED (main repo) — validated here, not re-staged

`research/feasibility/probe/ProbeG9_StrongPNT.lean` **exists in the main checkout**
(staged 2026-11-16 by lane R8; INDEX.md:214 records it) and was already tracked in
this worktree's snapshot (53c1548) — byte-identical to the main-repo original
(sha256(16) `6284bfd4dfcf2cc4` both sides; an earlier A8 `ls | head` truncation
briefly suggested otherwise — corrected here). A8 did not duplicate it; this section
is the A8 validation of the landed file, and the run-36/37 executions below were made
against the worktree copy (post-fix sha carries the 5-line `open Filter` correction).

**Validation — all cite-claims independently re-verified in the encore checkout
(read-only, this session):**

| Claim in ProbeG9 header/er | Verified at pin ff2494ea | Verdict |
|---|---|---|
| ψ-object mathlib-native: `Chebyshev.psi` | `Mathlib/NumberTheory/Chebyshev.lean:70` — `noncomputable def psi (x : ℝ) : ℝ := ∑ n ∈ Ioc 0 ⌊x⌋₊, Λ n` | PASS |
| scoped `ψ` notation | `Chebyshev.lean:74` — `scoped notation "ψ" => Chebyshev.psi` | PASS |
| Λ = vonMangoldt | `Mathlib/NumberTheory/ArithmeticFunction/VonMangoldt.lean:66` — `noncomputable def vonMangoldt : ArithmeticFunction ℝ` | PASS |
| `Pow ℝ ℝ` global instance (rpow, for `^ ((1:ℝ)/2)`) | `Mathlib/Analysis/SpecialFunctions/Pow/Real.lean:37` — `noncomputable instance : Pow ℝ ℝ := ⟨rpow⟩` | PASS |
| rides the probe auto-glob (no new g-mode) | `gprobe.py:683–691` — comment "G9 is mathlib-only and rides this auto-glob by design"; skip set = {G2, G5a, G10, G11, G12} only | PASS |
| probe-convention header + STAGED-NO-RUN + orchestrator approval | main-repo file `:2–6` ("run only on orchestrator approval"; sorries are probe scaffolding) | PASS |
| binder form per conventions | `HypStrongPNT` Prop-def (`:50–52`), trivial `conditional_shape` consumer (`:65`), explicit-`M` asymptotic wrapper (`:58–62`) — EnclOK/ProbeE/G1a `HypDZDF` precedent as claimed | PASS |
| FB-2 rule's landing target exists on pin | `Mathlib/NumberTheory/LSeries/PrimesInAP.lean` present (headline `infinite_setOfPred_prime_and_eq_mod` :431) | PASS (context) |

**One additive gap (recorded, not fixed — the file is main-repo-owned):** the probe
covers the DONOR side only; the 22-T2a consumer statement itself — dossier/blueprint
T2a shape `∀ ε > 0, ∃ C, ∀ x ≥ 2, |ψ x − x| ≤ C · x ^ (7/8 + ε)`
(`pilots/22-blueprint.md:285`, "openai-math quasi-RH band as input") — is NOT in the
file. Recommendation: at charter time the executing lane appends one Prop-def
(`stmt_T2a`) plus the quasi-RH 7/8 input binder (G7b's
`OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re`-class statement-binder, Liu-1
convention) to `ProbeG9_StrongPNT.lean` — a ~10-line additive edit, same probe
conventions; do not touch the file before then.

## 2. Charter recommendation — 22-T2a this cycle

**Recommendation: GO at task-slot tier, conditional on (i); never displaces a chartered
slot.**

GO conditions (all required):
- **(i) G9 GREEN — RESOLVED GREEN 2026-11-17** (runs 36/37, orchestrator-approved):
  run 36 FAIL (`unknown identifier atTop` at :51 — `Filter.atTop` needs `open Filter`;
  the binder-spelling class the §14 row-10 card anticipated, fixed by the one-line
  `open Filter` + authorized retry) → **run 37 GREEN: OK rc=0, errors=0,
  sorry-warnings=2 = exactly the file's declared probe-convention class; statement-port
  ≈ 0 CONFIRMED on ff2494ea**. Evidence: `feasibility/probe/logs-g/run36-g9.log`,
  `run37-g9-fix.log` (walls 88 s / 29 s; telemetry OVER=1 mem on run 36 = the inherent
  mmapped-olen class, anon flat). Fold note: the MAIN-REPO `ProbeG9_StrongPNT.lean`
  original still lacks `open Filter` — the identical one-liner is owed there at
  H-commit (A8's executed copy in worktree agent-09 carries it, with the dated
  in-file fix comment).
- **(ii) Lane-free as drain-filler**: backlog L8 slots 22-T2a as a task-slot pair with
  FF-EZ4 ("22-T2a rides the same lane as a small binder task", backlog :110). It is an
  S-grade statement-first task (statement-port ≈ 0; S3 row) — it runs only on a free
  lane, after the wave's chartered items (LP-P2 extension, AL-P2-c/d/e — P2-d is the
  flagged risk concentration, 75-N2).
- **(iii) Statement-first scope held**: the pilot STATES T2a (blueprint :285 shape) with
  the quasi-RH binder as input and `HypStrongPNT` available as the ψ-machinery donor
  binder; no proof of T2a this cycle (R9 §6f: "A8, statement-only, T1 NOT fired").
  Proving T2a = an explicit-formula build (L-grade) — out of scope by design.
- **(iv) Billing discipline**: 22 is a §7 RELABEL; the T2a tranche never receives
  discovery billing (backlog :349) — technical-record class only; no article-kind quota
  consumption (REPORT-INPUTS-ITER4 §3).

NO-GO / re-evaluate conditions:
- G9 FAIL (above); or upstream pin moves to v4.36-class (T3 fires) — then re-choose the
  route (statement-binder vs register-and-port vs the OAI-manifest import route, §3
  addendum) before chartering; or no lane frees up in the wave — carry, do not force.

**Cost class.** G9 itself: C1 statement probe, warm probe-mode batch 3–4 min
(backlog §14 row 10; plan §3 card — "DO when the 22-T2a slot is chartered"; the batch
also re-runs the G1/G3/G4/G5b/G5c/G7 regression set at no extra staging cost). The T2a
task-slot: minutes-class single-file elaboration on a warm per-pilot app (73/75 clone
pattern); ZERO Modal surface beyond the existing kit (plan §5c).

## 3. FB-2 / PNT+ T2-ignition: the pre-registered rule, verbatim

From `research/RESEARCH.md` §Iteration 4 (:149–160):

> **FB-2/PNT+ T2 ignition rule (pre-registered; NOT fired this cycle):** IF an FB-2
> PNT-AP pilot charters (the G7b-audited 7/8 tree as zero-free binder, error
> x^{7/8+δ}, landing on mathlib's `NumberTheory/LSeries/PrimesInAP.lean`), THEN T2
> FIRES and the PNT+ watchlist upgrades DEFER → REGISTER-AND-PORT (upstream statement
> as binder; G9 preflight staged). R6's deciding rg resolved the effort class: **FB-2 =
> L-grade explicit-formula build** (zero PNT-AP statements in the OAI tree; the
> DirichletL endgame stops at the two zero-free theorems) — FB-2 stays **iteration-5
> unless chartered as an explicit L**; T2 does not fire this cycle and the PNT+ entry
> stays DEFER (T3 also unfired: upstream still v4.35.0, fetched 2026-11-16; a future
> FB-2 build IMPORTS StrongPNT-grade ψ-machinery at the donor pin — OAI's
> lake-manifest already declares PrimeNumberTheoremAnd/StrongPNT + TauCeti as deps —
> rather than porting it).

**What T2-ignition WOULD trigger:** exactly the antecedent's consequence — the PNT+
watchlist entry upgrades DEFER → REGISTER-AND-PORT, with the upstream statement
consumed as a binder and the (already staged) G9 as the preflight record. Nothing else:
no obligation to port the Borel–Carathéodory chain (T1's subject, stays unfired), no
effect on the 22-T2a task-slot's billing, no change to the article quota.

**What it would NOT trigger (explicitly, against three plausible misreadings):**
- **Chartering 22-T2a does NOT fire T2.** T2's antecedent is an FB-2 PNT-AP pilot
  (7/8-tree binder, x^{7/8+δ} error, `PrimesInAP.lean` landing) — not the ψ-error-term
  task-slot. Plan §3 records T1 as NOT FIRED precisely because the carried slot is
  statement-binder-postured; the same reading applies a fortiori to T2.
- **Running (or GREENing) G9 does NOT register PNT+** and pulls no upstream code — the
  plan §3 card's own words: "it is NOT a registration"; the probe is Liu-1
  external-formal-prior-art transcription (statement citation, zero upstream imports).
- **T2 firing would not necessarily mean porting either**: per the §3 addendum
  (:207–217) and the rule's own tail, OAI's lake-manifest already declares
  PrimeNumberTheoremAnd + TauCeti — a fired T2 can be discharged by importing
  StrongPNT-grade ψ-machinery inside an OAI donor-pin build (donor-hygiene gate at the
  OAI pin) instead of register-and-porting upstream; and the mathlib-PR clock
  (#43238-family, S3 row) may dissolve the donor question entirely by absorption.

**T1/T3 stay unfired** independent of T2: T1 (BC-chain port) fires only if a pilot
wants `StrongPNT.lean:76–1536` as ported proof content; T3 (v4.36-class upstream pins)
re-checked 2026-11-16 = still v4.35.0.

— lane A8, 2026-11-17. Sources: main-repo `ProbeG9_StrongPNT.lean` (read-only);
encore-mathlib checkout (read-only rg at ff2494ea); `RESEARCH.md` §Iteration 4;
`feasibility/iter4-donor-unblock-plan.md` §3 + §8 card 10; `qa/iter4-review/
r5-iteration4-backlog.md` S3/L8/§14-row-10; `pilots/22-blueprint.md` :285;
`pilots/72-M1/logs` not touched. No Modal runs.
