# FF-EZ2 P1 — proof rung: the survivor statements, proved

**Billing: proof rung of the FF-EZ2 survivor (charter GO 2026-11-17, S-class per the
battery + P0 record).** Formalization-first, exclusion-guarded; the mathematics is
elementary (the bridge's own "warm-up grade" assessment — the density statement under
the exclusion hypothesis reduces to the collision bridge); the informal neighbors and
the falsity-trap pins are cited and dated in P0.lean's header (unchanged).

## Verdict

**GREEN — run 4 of the ≤4 fix-loop** (`logs/p1-run4.log`, 2026-11-17; run
`ap-qv58gL9O9MTT4CVdpYBQ6G`). `P1.lean: OK` under the runner's **sorry-strict**
branch (rc=0, 0 errors, 0 Lean sorry-warnings). Artifact `research/pilots/ff-ez2/P1.lean`:
186 LoC (≤ 0.3k guard), sha256 `9d8a7b1981faabce…`, mathlib `ff2494ea` /
v4.36.0-rc2, mathlib-only, warm app `crossmath-pilot-ffez2` (doz CLI / semraker;
SPEC 2 cpu / 4 GB soft; walls 44–66 s per run).

**Full print surface 7/7 triad-only:** `ratio_rootOfUnity_of_pow_eq`,
`zeros_simple_all` (the honest ALL-m headline), `stmt_maximal_violates_exclusion_holds`,
`stmt_power_merge_le_holds`, `density_of_all` (private),
`stmt_ff_ez2_base_change_density_holds`, `stmt_ff_ez2_family_form_holds` — each
`[propext, choice, Quot.sound]` (log :14–:20 area, 14 lines = 7 × 2). **Axiom-spelling
note (verified this session):** the bare `choice` is `Classical.choice` relativized by
the file's `open Classical` — reproduced with the v4.36.0-rc2 core toolchain
(`open Classical; #print axioms Classical.em` prints exactly `[propext, choice,
Quot.sound]`; without the open, `Classical.choice`). Token-level log sweep: only
propext / choice / Quot.sound appear; zero sorryAx, zero native_decide.

## What was proved (the difficulty-ordered surface, executed as specced)

1. **The collision bridge** `ratio_rootOfUnity_of_pow_eq`: `x ^ m = y ^ m` with `y ≠ 0`
   gives `(x / y) ^ m = 1` (`div_pow` + `div_self`).
2. **The honest all-m theorem** `zeros_simple_all` (the headline): purity
   (`α ≠ 0` from `HypFrobeniusSpectrum`) + the exclusion hypothesis ⇒ `ZerosSimpleAt A m`
   for EVERY `m ≥ 1`. Proof: `nodup_iff_count_le_one` + `Multiset.count_map` — each
   value's fiber is a filter that is nodup and singleton-dominated
   (`le_iff_subset` + `card_le_card`), with the bridge supplying the contradiction.
3. **The trap negation** `stmt_maximal_violates_exclusion_holds`: an all-equal spectrum
   of size ≥ 2 (the maximal-curve shape; Fuhrmann alg-geom/9610023 +
   Tafazolian–Torres 2012 pins) violates the exclusion hypothesis (`A ⊆ {c}` +
   `le_iff_subset` + `omega`).
4. **The merge inequality** `stmt_power_merge_le_holds` (the statement-rung
   correction's carrier): powered dedup ≤ mapped source dedup (`le_iff_subset` +
   `nodup_dedup`, membership via `mem_map`/`mem_dedup`).
5. **The density statements**: `density_of_all` (private mechanism — `filter_eq_self`,
   `Nat.card_Ioc`, `div_self`) discharges BOTH `stmt_ff_ez2_base_change_density`
   (M = 1; the filtered set is everything) and the transport form
   `stmt_ff_ez2_family_form` (via `HypBaseChangePower`, the Weil :163 binder).

## Recorded descope (one item, to P2)

`stmt_lpoly_squarefree_iff` (the zeta-side `Squarefree` packaging of `ZerosSimpleAt`)
is NOT proved at P1 — deferred to P2 as its own translation-layer item, with the
census findings in P1.lean's header: the Finset lemma `separable_prod_X_sub_C_iff'`
(FieldTheory/Separable.lean:316) does not transfer to multiset products without a
cons-step needing a `separable_mul`-class API absent on this pin, and the roots route
needs `nodup_roots_iff_of_splits` + the IsAlgClosed splits invocation. The def also
carries the amendment note: the P0 form is false for repeated-zero spectra
(`A = {0, 0}`: numerator the unit `1`); the guarded form (`0 ∉ baseChange A m` —
implied by purity) governs when P2 picks it up. `ZerosSimpleAt` is the definition
every load-bearing statement consumes; the Squarefree form is packaging.

## Guard-compliance line

All five battery guards held unchanged through P1: exclusion/family-quantified shapes
only (every theorem carries the exclusion hypothesis or is a negation/bound); the
trap negation formalized with dated pins; Weil side statement-binders only (zero
donor imports — `import Mathlib` alone); claims dated; no uniform-in-family claim.

## Runs

4 runs, all minutes-class (44/43/53/66 s), warm layers; friction was entirely
mathlib-name resolution (13 mechanical fixes over runs 1–3: `card_pos_iff` →
`exists_mem_of_ne_zero`, `Nonempty.exists` absence, `Finset.card_Icc` → `Nat.card_Ioc`,
`dedup_nodup` → `nodup_dedup`, `mem_dedup`/`mem_map` rewrite order, an And-projection
count, a `by_contra`-under-unification elaboration, a cast direction, an `∉ {a}`/`≠`
mismatch). Zero mathematical content changes after authoring. Logs with provenance
headers + closing blocks at `research/pilots/ff-ez2/logs/p1-run1..4.log`.

## P2 / article input

- **P2 (if chartered):** the descoped squarefree-iff translation layer (guarded form;
  two API routes pre-census'd); optionally the unconditional per-level simple-proportion
  statement in honest form (`= distinct-powers / card`, with the ≤ monotonicity now
  proved). S-class again; same warm runner.
- **Article input (for the close review, per charter):** the zone's honest grade —
  the survivor statements are elementary mathematics with formal-first value (the
  battery's "warm-up grade"); nothing here is discovery-grade. The article question
  (technical-record note vs no article) belongs to the iteration-4 close review;
  the record set (P0 + P1 + battery) is complete for either outcome. Billing if
  anything ships: TECHNICAL-Record-class, never discovery; the family-proportion
  rung (the true Lamzouri analog) remains HARD and unchartered.

— lane A3, 2026-11-17 (worktree agent-04 @ 53c1548; REPORT ONLY — H commits, A1 folds)
