# Pilot 41 — Core S–M record: GREEN (milestones 1–4 landed; the corrected discovery identity kernel-proved)

*Lane R4 (worktree agent-08), 2026-11-19, unit 2 per the re-task. Files live in this
worktree; H commits post-K. P0.lean untouched (see §E). Dossier-41 amendment draft for
H at `dossier41-amendment-draft.md` (same directory).*

## Verdict

**CORE GREEN** — `research/pilots/41/Core.lean` elaborates on the pin (mathlib
`ff2494ea`, toolchain `v4.36.0-rc2`, warm app `crossmath-probe`, doz CLI/semraker):
**0 errors, 0 sorry-warnings, 0 sorryAx** (the in-file `#print axioms` audit lists all
30 top-level theorems; 2 cosmetic unused-simp-arg warnings only). P0.lean green
alongside in every run (regression pin).

Kernel-only discipline held: finite checks are kernel `decide` (12-Bool-binder raw
statements + explicit witnesses); no `native_decide`, no external CAS; statements
Prop-valued; `noncomputable` pre-marked on all data defs touching `Polynomial ℤ` mul.

## The mathematics that landed (milestones 1–4)

| milestone | theorem(s) | content | axioms |
|---|---|---|---|
| 1 anchor | `signs_anchor` | eth's Signs re-proved via the parity route eth itself uses (four_phi_odd → (−1)^m+(−1)^n=0), decide replacing the chg/lin chain | [propext, Quot.sound] |
| 2 parity split | `ethParity`, `stratumComplement` | the TOTAL-parity engine + the F3 stratum characterization (odd-gap ⟺ antipodal p′ = ¬p), both decide-certified over the 4096-quadruple space | **zero axioms** |
| F1 refutations | `P1_refuted`, `P2_refuted`, `MainIdentity_refuted` | the P0's over-strengthened universals are FALSE (witness p=000,q1=100,p′=100,q2=000; (M) reads 0=2 at ℤ, q=−1) | zero/triad |
| 3 (B)+(M) | `bridge_axiom`, `bridge_pin_proof`, `mainCor`, `Gq_eq_GqGen_on_stratum`, `mainStratum` | the bridge; **the corrected unified defect identity A+B = (1−q)·aeval(GqGen) at EVERY parallelogram quad**; the dossier's G_q recovered exactly on the antipodal stratum | [propext, Quot.sound] / triad |
| 4 (N) | `nondegenerate`, `qRigid`, `alternation_fails_at_q_minus_one`, `SigmaQ_Signs_all_q_refuted` | (N) true; q-rigidity off-stratum at τ1=τ2; **nondegeneracy: value 2 ≠ 0 at q = −1 (antipodal quad 110/110/001/001); the degenerate branch (N′) CLOSED** | triad / [propext] |
| packaging | `mainCor_one_implies_signs`, `mainImpliesSigns` | the honest ℤ-fiber regression (uses the corrected identity + bridge) and the P0's shape (via the anchor, vacuity documented in-file) | triad |

**Statement-math findings for the dossier** (F1–F4, detailed in `Core.lean`'s header
and the amendment draft): the P0's P1/P2/MainIdentity-as-universals are false; the
corrected content is the unified GqGen identity + the antipodal stratification; the
dossier's conditional reading survives as `MainIdentityStratum`; N′ is refuted.
Provenance ruling: (a) precharter universal-shaping — NOT an eth defect (three-way
quote in the amendment draft §B).

## Runs (9 raw firings = 5 milestone stages + 4 fix-loop refires; budget was 3–5 + reserve — OVERAGE documented)

| run | bytes sha256(16) | verdict | wall | log |
|---|---|---|---|---|
| 1 (core-1, §0–§4 truncation) | `c582eb90b59182fb` | NOT-GREEN 6 err (P1/P2 refutation decides PASSED here) | 77 s | `logs/core-run1.log` |
| 2 (core-1 refire) | `7a5fb6d1315f36d5` | NOT-GREEN 2 err ("no goals": norm_num auto-closed) | 59 s | `logs/core-run2.log` |
| 3 (first full file) | `27b005da0a93e3ff` | NOT-GREEN 5 err (if-as-simp dead; Gq base-coercion discovery; signs_anchor/bridge/main_abstract CLEAN already) | 53 s | `logs/core-run3.log` |
| 4 | `c525de8915d9b713` | NOT-GREEN 1 err — **mainCor/mainStratum/qRigid/nondegenerate triad-clean FROM HERE** | 59 s | `logs/core-run4.log` |
| 5–8 | `bb338fb4992fc097` / `428bbd8dbb1c22dc` / `ed38ec77697bdda9` / `77ff652439aa63f2` | NOT-GREEN 1 err each — one elaboration issue (auto-bound `Type*` universe of the P0 def `SigmaQ_Signs_all_q`, frozen rigid by a polymorphic ¬) | 53–69 s | `logs/core-run5..8.log` |
| 9 | `921bc43cbd06d252` | **GREEN** (0 err, 0 sorry; audit triad-or-leaner, zero sorryAx) | 53 s | `logs/core-run9.log` |

Budget accounting, honestly: the ladder's 3–5 stages were exceeded by raw-firing
count — runs 5–8 all chased the SAME single theorem's universe plumbing
(`SigmaQ_Signs_all_q_refuted`) while the mathematical content was certified from run
4 (its witness `alternation_fails_at_q_minus_one` = [propext] at run 3). Aggregate
Modal cost ≈ 9 × 60 s warm, single container each, 2cpu/4GB spec held throughout;
telemetry in every log (the only OVER flags are the documented olean-mapping
artifact: mem = MemTotal−MemAvailable incl. mapped Mathlib oleans; anon = 0 MB,
cpu ≤ 0.86). No resource escalation was sought or needed.

## Elaboration lessons (recorded in-file too, for future lanes)

1. Kernel `decide` does NOT whnf `aeval` through Classical decidability instances —
   witness computations that touch aeval/Gq must use norm_num with explicit def +
   `intCast_eq_C`/`aeval_C` lemma sets (run-1 vs run-2 lesson).
2. `if_pos`/`if_neg` do not fire as SIMP arguments on this pin (deprecated) — use
   `split` (or rw-forms, which still work but warn) (run-3 lesson).
3. The P0 `Gq` ascription `((-1:ℤ)^e : ℤ[X])` elaborates with the coercion on the
   pow-BASE — C-conversions are `intCast_eq_C` then `← Polynomial.C_pow` (run-3).
4. A def whose body binds `{R : Type*}` auto-bounds a UNIVERSE; refuting it with a
   polymorphic ¬ freezes that universe rigid — instantiate (`.{0}`) at the refutation
   and document the fibers as universe-cosmetic (runs 4–9).
5. `Polynomial.intCast_def` does not exist on this pin; `Polynomial.C_eq_intCast`
   (Basic.lean:981) + `Int.cast_id` is the bridge; `Polynomial.C_pow` at
   Basic.lean:366.

## Files (this worktree; sha256(16) each)

- `research/pilots/41/Core.lean` — `733b4a2d93a84689`* — the core artifact: §0 P0
  surface verbatim, §1 refutations, §2 finite facts, §3 helpers, §4 anchor, §5
  bridge, §6 corrected main identity, §7 nondegeneracy, §8 packaging + audit.
- `research/pilots/41/logs/core-run1..9.log` — nine run logs, provenance headers +
  verbatim transcripts (shas of each fired byte-set in the headers; b4920c2a56cd755e,
  20d07a059efc57dc, 9f5de5893afe27f8, 7e1d9a357ce22dc4, 3c175fed19e36564,
  b4920c2a56cd755e, 20d07a059efc57dc, 9f5de5893afe27f8, 7e1d9a357ce22dc4, 3c175fed19e36564,
  1661db4176ae53ac, eb862a1d586c28be, 065a15805591ffa7, f0d44d4cf31f899e resp.)
- `research/pilots/41/dossier41-amendment-draft.md` — for H/R9 (dossier is not this
  lane's file).
- `research/pilots/41/Core-record.md` — this record.

\* sha note: the GREEN-run bytes are sha256-16 `921bc43cbd06d252` (full
`921bc43cbd06d252dbc796c79b734529a1dd1e02d7097b0e8efb3fdc41adf269`, logged in
core-run9.log); after GREEN, a dated FIRED block (run history + lessons) was added to
the file header — elaboration-inert comment-only change — so the on-disk file's sha
differs; both are recorded here (P0-record precedent: fired sha + documented
post-green metadata).

## (H) phase

WAVE-TAIL CONDITIONAL per DECISION-4 — NOT started; `HostTransport` binder carried in
§0 (elaborates green; no (H) content anywhere in the core).

## Next

Per the orchestrator: the round-6-41 novelty battery (R9) targets the CORRECTED
identity; (H) awaits its wave-tail decision; the article-eligibility gate (kind
DISCOVERY, nearest-miss table ≥ 2 rows, verification blocks) takes the corrected
statement set from this record + the amendment draft.

— lane R4, 2026-11-19.
