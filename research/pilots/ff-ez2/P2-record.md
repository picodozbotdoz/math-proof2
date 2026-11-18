# FF-EZ2 P2 — descope-closure rung: the guarded squarefree-iff translation layer, proved

**Billing: descope-closure of the FF-EZ2 survivor (P1 record §"Recorded descope";
charter 2026-11-17/18: squarefree-iff guarded form governs, optional proportion add-on,
≤3 Modal runs).** Formalization-first, S-class; the mathematics is elementary
translation-layer work (the battery's "warm-up grade" verdict stands — nothing here is
discovery-grade). The informal neighbors and falsity-trap pins are cited and dated in
P2.lean's header (unchanged from P0/P1).

## Verdict

**GREEN — run 2 of the ≤3 fix-loop** (`logs/p2-run2.log`, 2026-11-18; run
`ap-whLVzO59yfom77UjbrPP58`). `P2.lean: OK` under the runner's **sorry-strict**
branch (rc=0, 0 errors, 0 Lean sorry-warnings). Artifact `research/pilots/ff-ez2/P2.lean`:
207 LoC (≤ 0.3k guard), sha256 `24926ac4cbbcdd50…`, mathlib `ff2494ea` /
v4.36.0-rc2, mathlib-only, warm app `crossmath-pilot-ffez2` (doz CLI / semraker
PRIMARY route per the 2026-11-17 ruling; SPEC 2 cpu / 4 GB soft; walls 41 s FAIL-run,
70 s GREEN-run). **The FF-EZ2 P0→P1→P2 charter is now fully closed** — the P1 descope
was the only open item.

**Full print surface 9/9 triad-only, FULL spelling:** public `guard_of_purity`,
`stmt_lpoly_squarefree_iff_holds` (the headline), `zeros_simple_iff_squarefree_of_purity`,
`stmt_simple_proportion_le_holds` + private `factor_ne_zero`, `roots_one_sub`,
`inv_injective`, `nodup_map_inv`, `nodup_of_map_inv` — each
`[propext, Classical.choice, Quot.sound]`. Zero sorryAx, zero native_decide.
**Axiom-spelling note (charter item 5): the P1 open-Classical finding did NOT recur —
by design:** P2 needs no classical decidability (no filters), so it does not
`open Classical`; the triad prints in the full spelling `Classical.choice` rather than
the open-relativized `choice` (P1 record's reproduction stands as the characterization
of that display artifact).

## What was proved (the descope, closed)

1. **The guarded squarefree-iff (the P1 descoped item, headline).**
   `stmt_lpoly_squarefree_iff A m := 0 ∉ baseChange A m → (Squarefree (lPolyM A m) ↔
   ZerosSimpleAt A m)`, PROVED for all A, m. The unguarded P0 form is false (P1
   amendment: `A = {0, 0}` gives the unit numerator, squarefree, over a non-nodup
   powered multiset); the guard `0 ∉ baseChange A m` governs, exactly as the P1 record
   prescribed. Route (the P1 census resolved): the Finset `separable_prod_X_sub_C_iff'`
   blocker is bypassed via the roots route — `roots_multiset_prod` + `bind_map`/
   `bind_congr`/`bind_singleton` + per-factor `roots (1 − C β·X) = {β⁻¹}` (unit
   reshuffle to `X − C β⁻¹` via `roots_C_mul` + `roots_X_sub_C`), then
   `nodup_roots_iff_of_splits` (ℂ alg-closed ⇒ splits) +
   `PerfectField.separable_iff_squarefree` (ℂ perfect via `IsAlgClosed.perfectField`),
   with the nodup transfer along `inv` (an involution of ℂ incl. 0⁻¹ = 0, hence
   injective — `inv_injective`, no case analysis on zero).
2. **The purity discharge** `guard_of_purity`: `HypFrobeniusSpectrum q A` (the Weil-side
   statement-binder, G3/G6b class) ⇒ the guard, for every m — hypothesis-binder
   convention intact: the donor-side purity clause discharges the translation layer's
   own guard (`pow_eq_zero_iff`; the m = 0 arm via `pow_zero`).
3. **The binder-consuming corollary** `zeros_simple_iff_squarefree_of_purity`: under
   the purity binder alone, `Squarefree (lPolyM A m) ↔ ZerosSimpleAt A m` — the
   EnclOK-precedent conditional shape (guard + discharge + iff in one public theorem).
4. **The optional proportion rung (chartered add-on, landed in-budget):**
   `stmt_simple_proportion_le_holds` — unconditionally, `simpleProportion A m ≤ 1`
   (distinct powered values / spectrum size never exceeds 1; `dedup_le` + `card_map`,
   the honest per-level statement behind the P0-corrected ≤ monotonicity).

## Guard-compliance line

Battery guards held unchanged: every statement is exclusion-guarded, a bound, or
carries its own guard; no uniform-in-family claim; Weil side statement-binders only
(zero donor imports — `import Mathlib` alone); claims dated 2026-11-17; the m = 0 arm
of the guard discharge is honest (`pow_zero`, no silent positivity assumption).

## Runs (2 of ≤3 used)

1. `p2-run1.log` — FAIL (41 s): 2 elaboration errors, both the `hroots` step —
   `Multiset.bind_singleton`'s explicit arguments are `(s, f)` in section-variable
   order; the lambda was elaborated against the multiset slot. Error recovery inserted
   sorryAx into ONLY the two downstream theorems; the other 7 already printed
   triad-clean. Mechanical fix (expected-type-driven `hbind` have + `rw [← hbind]`);
   zero mathematical content change.
2. `p2-run2.log` — GREEN (70 s). Telemetry: 1 sample `OVER mem` (7641 MB — the
   documented mmapped-Mathlib-olean RSS class, AGENTS.md §5 / P0 run-2 precedent;
   cpu max 0.56, procs 2, nothing wrong-sized; investigation recorded in the log,
   no upgrade sought). Run-1 telemetry: 0 samples (41 s < 60 s interval), noted in its
   log.

Logs with provenance headers at `research/pilots/ff-ez2/logs/p2-run1.log`,
`p2-run2.log`.

## Zone close-out input (per charter)

The FF-EZ2 unit set (battery + P0 + P1 + P2) is complete; billing if anything ships
stays TECHNICAL-Record-class, never discovery (P1 record's grade unchanged — the
survivor statements are elementary with formal-first value; the family-proportion rung,
the true Lamzouri analog, remains HARD and unchartered). The P2 addition gives the
zeta-side reading (`Squarefree`) a proved guarded bridge to the load-bearing
`ZerosSimpleAt` definition plus the honest unconditional proportion bound — exactly the
two loose ends P1 left. Article question (technical-record note vs no article) belongs
to the iteration-4 close review; the record set is complete for either outcome.

— lane A3, 2026-11-18 (worktree agent-04 @ 53c1548; REPORT ONLY — H commits, A1 folds)
