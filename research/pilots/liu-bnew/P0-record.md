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
