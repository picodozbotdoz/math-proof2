# FF-EZ2 P0 — the surviving base-change simplicity statement: statement-rung record

**Billing: statement rung of the FF-EZ2 survivor (r5 §2 S4 / §14 row 13), chartered
on the battery's CHARTER-GO (2026-11-17; `bridges/function-field.md` §4 FF-EZ2
"Battery (2026-11-17)").** Formalization-first, exclusion-guarded zone per the bridge
design rule; the informal neighbors are cited in the file header and dated
(Bui–Florea 1605.07092 family-average bounds; Suzuki 2610.41115 method-neighbor,
month-clock clean 2026-11-17; the falsity-trap pins Fuhrmann arXiv:alg-geom/9610023 +
Tafazolian–Torres 2012). NOT a discovery claim; the mathematics of the eventual P1 is
elementary (the bridge's own "warm-up grade" assessment).

## Verdict

**GREEN — run 3 of ≤3-fix-loop** (`logs/p0-run3.log`, 2026-11-17; run
`ap-oJqhRkVM8NrfVv5e350zvL`). `P0.lean: OK (probe)` under the runner's probe branch,
**0 errors and 0 Lean sorry-warnings** — the zero-sorry goal achieved (Prop-def
statement convention, FF-EZ4 sibling pattern). Wall 36 s on warm layers (the new
ephemeral app `crossmath-pilot-ffez2`, image block byte-identical to ffez4/71/probe
family; stage `/tmp/crossmath-ffez2-a3/`, discarded after the run). Artifact:
`research/pilots/ff-ez2/P0.lean` — 162 LoC, sha256 `396f7183e73b3d23…`, mathlib
`ff2494ea` / v4.36.0-rc2, mathlib-only (no donor imports; Weil side statement-level
binders only).

## What landed (statement surface, all elaborated)

- **Weil-side binders (G3/G6b statement-level class, never build deps):**
  `HypFrobeniusSpectrum` (the purity/RH clause of `LeanEval/WeilConjectures.lean:
  185–194` as binder data: elements nonzero, integral, |α| = √q) and
  `HypBaseChangePower` (the conclusion of `Weil.rationalFrobeniusCharpolyReverse_
  eq_comp_of_comp_specAlgebraMap_eq`, `FieldOfConstantsFrobenius.lean:163` — the
  base-change eigenvalue power law), plus `baseChange` (the law as data:
  `baseChange A m = A.map (· ^ m)`).
- **Combinatorial simplicity layer:** `ZerosSimpleAt` (all zeros of the H¹ numerator
  of Z_{C_m} simple ⟺ the powered spectrum is nodup), `lPolyM` (the numerator,
  carried from `pilots/71/P2.lean:57`), `simpleProportion`, and
  `stmt_lpoly_squarefree_iff` (the zeta-side reading; P1's first lemma).
- **The battery's binding guards, in-file:** `NoRootOfUnityCollisions` (the exclusion
  hypothesis: nodup + no root-of-unity ratios) and
  `stmt_maximal_violates_exclusion` (the falsity trap as a NEGATION: the
  maximal-curve spectrum shape — all eigenvalues equal, Fuhrmann/Tafazolian–Torres
  pins dated — violates the exclusion; no uniform-in-family statement appears in the
  file, per the design rule).
- **The survivor statements:** `stmt_ff_ez2_base_change_density` (the bridge §4
  candidate headline: under purity + exclusion, the extension degrees with
  all-simple base-changed zeta have natural density 1) and its transport form
  `stmt_ff_ez2_family_form` (via the Weil :163 binder); plus the trivial
  binder-consumption wrapper `conditional_shape` (FF-EZ4/ProbeG3 precedent).
- **STATEMENT-RUNG CORRECTION (recorded):** the bridge §4 sketch claims the
  unconditional per-level proportion satisfies "distinct powers ≥ distinct values";
  the true direction is **≤** (powering can only merge values; e.g. {1, −1} at
  m = 2). Carried corrected as `stmt_power_merge_le`; what the exclusion hypothesis
  buys is (at least) all-m simplicity, hence density exactly 1.

## Guard compliance (the battery's binding list)

1. Exclusion/family-quantified shapes only — **complied**: every statement carries
   the exclusion hypothesis or is a negation/bound; no "every curve" claim.
2. Maximal-member exclusions per the Fuhrmann/Tafazolian–Torres pins — **complied**:
   the pins are cited in the header and formalized as the trap negation
   (`stmt_maximal_violates_exclusion`).
3. Weil side statement-binder only — **complied**: two `Hyp*` binders, zero donor
   imports, file:line citations only (G3/G6b class).
4. Claims dated — **complied**: header dates all literature claims (2026-11-17,
   month-clock clean per the battery's sweep).
5. Falsity-trap design rule — **complied** (see 1–2).

## Runs

1. `p0-run1.log` — FAIL (44 s): 3 mechanical errors — Multiset `.val` projection
   (→ `Multiset.prod` of `Multiset.map` spelling), `simpleProportion`
   `dependsOnNoncomputable` (the recurring ℝ-division class), and classical
   decidability needed for the density filters.
2. `p0-run2.log` — FAIL (70 s): 2 parse errors — `open Classical in` must precede
   the docstring (the mathlib idiom), fixed at both density statements.
3. `p0-run3.log` — GREEN (36 s). Route all runs: doz CLI / semraker; SPEC 2 cpu /
   4 GB soft, LEAN_NUM_THREADS=2, telemetry (all runs minutes-class; run-2 mem
   7272 MB = the documented mmapped-olean RSS class, OVER soft). Runner note: the
   error counter's `error(lean.*)` blind spot (documented m4b2 class) — rc=1 fails
   correctly regardless; no runner edit made.

## P1 GO/NO-GO input

**GO (S-class, warm runner, zero new mathematics).** The P1 proof surface, in
difficulty order: (a) `stmt_power_merge_le` — image-card ≤ domain-card for multiset
dedup under any map (mathlib `Multiset.dedup`/`map` card lemmas); (b)
`stmt_maximal_violates_exclusion` — Nodup vs all-equal with card ≥ 2 (trivial); (c)
`stmt_lpoly_squarefree_iff` — squarefree product of linear factors ⟺ nodup powers
(over ℂ; `Multiset.prod_eq_zero_iff`-class factorization, the 71-P2 `lPoly_eval`
route); (d) the headline: under `HypFrobeniusSpectrum` (α ≠ 0) and
`NoRootOfUnityCollisions`, the collision bridge `α_i ^ m = α_j ^ m ↔ (α_i / α_j) ^ m
= 1` gives `ZerosSimpleAt A m` for **every** m ≥ 1 — so the density-1 form follows
with `M = 1` (the honest all-m theorem should land alongside the density statement;
the density form is the weaker corollary, and the record should say so). Estimated
≤ 0.3k LoC, 2–4 warm runs on `crossmath-pilot-ffez2`. Guards unchanged and binding
at P1; the statement-rung correction (≤) is P1-provable as stated.

— lane A3, 2026-11-17 (worktree agent-04 @ 53c1548; REPORT ONLY — H commits, A1 folds)
