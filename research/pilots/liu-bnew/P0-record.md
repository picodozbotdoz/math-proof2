# Pilot liu-bnew — P0 record (W2-5: the Liu B_new statement-level port)

Lane R7 (A9 lineage), fired 2026-11-19 (iteration-5 wave 2, day-1-class item held for
K). Billing: **ENGINEERING statement-port — never discovery-billed; no article**
(`qa/iter4-review/a9-iter5-article-watchlist.md` §1 row 8). This record is the
citable artifact for the rung; nothing here upgrades Liu-1's claim-level hygiene
status.

## What the artifact is

`P0.lean` (168 LoC, sha256(16) `20ac66718a932e6c`) restates Liu-1's public zero-free
entries as **hypothesis binders** on our pin (mathlib `ff2494ea…`, Lean
v4.36.0-rc2), per the Liu-1 convention (`novelty/liu1-as-donor.md` §5:
statement-level citation ONLY; DO-NOT-CONSUME as build dep — the sibling repo at rev
`7d10420` is never imported; the file's only import is `Mathlib`). Donor statements
enter as explicit Props (EnclOK/ProbeE precedent): the port assumes exactly what
Liu-1 proves, never more.

Statement inventory (all Prop-valued defs; #check-verified in-run):

| def | shape | Liu-1 referent (read-only sibling) |
|---|---|---|
| `B_r` | `noncomputable def : ℝ := 34999/40000` | CombinedPaperVerification.lean:16 (verbatim value) |
| `B_new` | `noncomputable def : ℝ := (1507 − 2√921)/1653` | :19 (verbatim value; ≈ 0.8749571) |
| `LiuBoundaryOrder` | `B_new < B_r ∧ B_r < 7/8` | :44 `boundary_order` — PROVED there; **stated here as the hypothesis-binder pair** (the mandated weakening pattern) |
| `LiuHeckeZeroFree H LF residue b` | `∀ η s, b < s.re → (s ≠ 1 ∨ residue η ≠ 1) → LF η s ≠ 0` | RHZeroFreeExtension.lean:17–19 `hecke_nonzero`; H/LF/residue abstract the OAI HeckeFamily vocabulary |
| `LiuBetaBound β b` | `β ≤ b` | :16 `beta_star_le` (β ↔ `HeckeZeroSupremum.beta`, docstring anchor) |
| `LiuDirichletZeroFree b` | `∀ q inst χ s, b < s.re → ¬(χ = 1 ∧ s = 1) → @DirichletCharacter.LFunction q inst χ s ≠ 0` | :20–25 `dirichlet_nonzero`; OUR mathlib L-function vocabulary, explicit-instance route per the pilot-50 delta note |
| `LiuZetaZeroFree b` | `∀ s, b < s.re → s ≠ 1 → riemannZeta s ≠ 0` | :27–29 `zeta_nonzero` (pole clause carried verbatim, unused in Liu-1's own proof) |
| `LiuZetaZeroFree' b` | `∀ s, b < s.re → riemannZeta s ≠ 0` | ActualDirichletTransfer.lean:31–35 conclusion form (pole-free) |
| `LiuCor14_1Transfer H LF residue` | `∀ b, 0 < b → HeckeZeroFree b → DirichletZeroFree b ∧ ZetaZeroFree' b` | ActualDirichletTransfer.lean:13–40 — the Cor. 14.1 transfer shape; ζ via the principal character at q = 1 |
| `LiuEntryTiers H LF residue β` | both tiers bundled (B_r rational tier + B_new algebraic tier, 7 entries) | CombinedPaperVerification.lean:60–102 |

**Consumer bridges (proved in-file, the artifact's point):** given
`hOr : LiuBoundaryOrder`,

- `discharge_hQRH_of_liu : LiuZetaZeroFree' B_r → (∀ s : ℂ, 7/8 < s.re → riemannZeta s ≠ 0)` — pilot 50's `hQRH` binder (M1.lean:45) **as written**;
- `discharge_hQRHχ_of_liu : LiuDirichletZeroFree B_r → (pilot 50's `hQRHχ` type, Dirichlet.lean:41–43) **as written**.

Both are pure order composition (`lt_trans hOr.2 ·`, the same weakening step as
Liu-1's own `original_*_nonzero`); no Liu content is used. This is the formal record
of the AGENTS.md constant-story claim: Liu's B_r = 0.874975 (gap 1/40000 below 7/8)
beats the in-corpus openai 7/8 donor constant — so a consumer assuming the Liu
binders discharges the 7/8-class binders with **no weakening** (unlike DZDF's
31/32); the informal-frontier context (B♭ 0.8748866 / B_new 0.8749570) is charter
§2 rung 4's.

## Run history (app `crossmath-probe`, EXISTING; doz CLI; warm)

| run | bytes sha256(16) | verdict | notes |
|---|---|---|---|
| 1 (`logs/p0-run1.log`) | `df0b60db65daea6d` (166 LoC) | FAIL rc=1, 2 errors, 0 sorry | 2 × `lean.dependsOnNoncomputable` on `B_r`/`B_new` (`Real.instDivInvMonoid`); fix = `noncomputable def` both (Liu-1's own file opens `noncomputable section` for the same reason). Telemetry: 1 OVER-mem sample = the documented Mathlib-olean mmap artifact (5331 MB within the ≈5–6 GB band, anon = 0 MB; investigation note appended in-log) |
| 2 (`logs/p0-run2.log`) | `20ac66718a932e6c` (168 LoC) | **OK rc=0, 0 errors, 0 sorry-warnings, 0 other-warnings** | wall 42 s warm, OVER=0. In-run `#print axioms`: both bridges exactly `[propext, Classical.choice, Quot.sound]` (triad-clean). All 8 statement defs #check at the intended shapes |

Budget: 2 runs (1 green + 1 fix-retry) — inside the charter's 1–2 warm runs + fix
convention. Spec discipline: cpu=2.0 / mem=4096 defaults, `LEAN_NUM_THREADS=2`
(CAP secret), telemetry via `modal_telemetry` on both runs (lines preserved in the
logs with provenance headers).

## Conventions + hygiene

- Probe-class P0 file: NEVER a Step-B stage (FINAL-SWEEP-PLAN §7a zzv2-P0 ruling
  class); statement rung, zero `sorry`, zero `native_decide`; the two bridges are
  complete proofs.
- Donor hygiene gate: NOT triggered — nothing is consumed or imported; Liu-1's
  triad status remains CLAIM-level (the related openai 7/8 tree was G7b-audited at
  openai's own pin; Liu-1 itself was never built here). Any future consumer of
  these binders carries them as hypotheses (the EnclOK posture) — consumption would
  be a new decision, not a consequence of this port.
- Replay prerequisite does not apply (no vendor tree involved; single-file
  statement artifact, `import Mathlib` only).
- Hold-for-K: all files in this directory land in H's post-K batch; no commits by
  the lane.

## Files

| file | LoC | sha256(16) |
|---|---|---|
| `research/pilots/liu-bnew/P0.lean` | 168 | `20ac66718a932e6c` |
| `research/pilots/liu-bnew/run_pilot.sh` | 23 | (runner; stages `lean_probe.py` + `P0.lean`, `/tmp/crossmath-liu-bnew-stage`, doz CLI) |
| `research/pilots/liu-bnew/logs/p0-run1.log` | — | run 1 record incl. the OVER-mem investigation note |
| `research/pilots/liu-bnew/logs/p0-run2.log` | — | run 2 GREEN record (the verdict of record) |
| `research/pilots/liu-bnew/P0-record.md` | — | this record |

— Lane R7 (A9 lineage), 2026-11-19. Worktree agent-10; H pulls. No commits (H
commits, after K).

## Post-restart verification + the OWED/MOOTED determination (R7, 2026-11-20)

The 2026-11-19 session was externally terminated after this rung's two fires; the
iter-5 restart queue (2026-11-20) re-asked the OWED-or-MOOTED question before any
re-fire. Determination, desk-verified against main @ `a6ad33d` (read-only):

**VERDICT: OWED — and DELIVERED by the preserved pre-termination execution above.
Not MOOTED. No re-fire needed** (the queue's "write the binder artifact + fire 1–2
warm confirmation runs" is discharged by `P0.lean` `20ac66718a932e6c` + runs 1–2,
whose logs survived the termination with provenance headers, verdict lines, axiom
prints, and telemetry intact — re-firing would spend budget for zero new
information).

The moot-test (each leg desk-checked):

1. **Does the landed pilot-50 R1 openai-7/8 route (G7b) cover this?** No. R1
   discharged `hQRH`/`hQRHχ` at EXACTLY 7/8 = 0.875, definitionally from the openai
   donor (`pilots/50/R1-prework.md` §1; README row-50: "at donor pin (openai 7/8
   donor, G7b-audited)"). It provides no constant upgrade and lives at the donor
   pin. The port's premises are strictly stronger (B_r = 34999/40000 = 0.874975,
   B_new = (1507 − 2√921)/1653 ≈ 0.8749571; both < 7/8, so the Liu half-planes
   strictly CONTAIN the 7/8 half-plane) and the artifact is on OUR pin
   (mathlib `ff2494ea`, `import Mathlib` only).
2. **Does anything landed cover a B_r/B_new-class binder?** No — `rg` over main's
   `.lean` files for `34999|1507|921|B_new`: zero artifact hits; the only mentions
   are prose (RESEARCH.md charter item, TRIAGE/REPORT constant-story rows,
   AGENTS.md). This pilot remains the only Lean-side object carrying the constants.
3. **Is the port still the chartered shape?** Yes — `RESEARCH.md` §Iteration-5 item
   (4): "the never-fired named-cheap item … statement-binder port, Liu-1 convention
   — statement-level citation ONLY, DO-NOT-CONSUME as build dep; warm, 1–2 runs,
   <250 LoC binder artifact" (168 LoC, 2 runs, convention respected — see §hygiene
   below). `liu1-as-donor.md` §5 anticipated exactly this artifact ("if a
   0.874975-class binder is ever wanted: stage the four RHZeroFreeExtension entry
   statements as binders — never import"); §6.2's flagged port cost (the OAI
   `Character`/`LFunction`/`HeckeZeroSupremum` definitional layer) is dodged by the
   abstract `H`/`LF`/`residue` stand-ins.
4. **"As written" binder alignment re-verified on main @ `a6ad33d`:** bridge 1's
   conclusion is character-for-character `pilots/50/M1.lean`'s `hQRH`
   (`strip_confinement` binder, :41–45); bridge 2's is `pilots/50/Dirichlet.lean`'s
   `hQRHχ` (:41–43, explicit-instance `@`-form incl. the `¬(χ = 1 ∧ s = 1)` pole
   clause). A consumer assuming the Liu tiers therefore discharges both pilot-50
   binders with NO weakening — the AGENTS.md constant-story claim now has its
   formal record.
5. **Artifact-chain re-verification post-restart (2026-11-20):** `P0.lean` =
   `20ac66718a932e6c` (168 LoC, unchanged); `logs/p0-run1.log` `1d7ffea901a2ea4c`
   (FAIL rc=1 2×`dependsOnNoncomputable`, fix documented; the OVER-mem
   investigation note present per the Modal guideline-3 discipline — 5331 MB in the
   documented Mathlib-olean band, anon = 0); `logs/p0-run2.log` `30cb5a563b7645d3`
   — **GREEN, errors=0, sorry=0, other-warnings=0, wall 42 s, OVER=0**, both
   bridges `[propext, Classical.choice, Quot.sound]` (triad), 8/8 `#check`s —
   stands as the verdict of record.

Landing state: the hold-for-K naming is superseded by the termination — the
directory stays worktree-side, H pulls it in H's next main batch (splice-class
bookkeeping: engineering rung, no article, never discovery-billed; nothing here
upgrades Liu-1's claim-level hygiene status).

— Lane R7 (A9 lineage), 2026-11-20 addendum, worktree agent-10. No commits (H
commits).
