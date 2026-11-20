# Pilot 41-H3 record — S-RUNG GREEN (the two-fiber strand-free rank closure, Theorem C S-part)

*Lane R4 (worktree agent-08), 2026-11-20, under the S-RUNG FIRE ORDER (coordinator,
2026-11-20; novelty cleared per R9 round-7 `87659f58`). Precharter:
`research/pilots/41/H3-precharter.md` sha256(16) `60278bd4b6e824bf`. Files here; H
commits. This record is the precharter §5 S-tranche's close-of-tranche record.*

## Verdict

**S-RUNG GREEN, first shot** — `H3.lean` (465 LoC; S pricing 0.35–0.55k ✓): 0 errors,
0 sorry, 3 cosmetic warnings (the known `if_pos`/`if_neg` deprecation class — same as
h2-run11's). Runs used: **1 of 3–5** (hard cap 5; 4 unused). Kernel-only; decide-only;
Mathlib-only imports; no tauceti consumption at any point.

## What landed

1. **The q = +1 certificates (Theorem C part 1 — NEW):** `sigmaOneOrth_raw` /
   `sigmaOneOrth` and `sigmaOneExpand_basis_raw` / `sigmaOneExpand_basis`, both
   [propext] kernel decides — **eth's own σ-table (the deformation's q = +1 fiber,
   δ = +2) is a permuted Walsh matrix** (rows = characters of the affine forms
   a₊(p)·p′, a₊ = cumsum + cubic-gradient; precharter P1's mechanically cross-checked
   hand table, now kernel-certified). Plus `sigmaOne_asym_witness` [propext]:
   σ(100,010) = −σ(010,100) — the traciality witness at this fiber (H1's q = −1
   witness pair was (100,110)): any q = +1 dictionary is non-tracial at ANY strand
   count.
2. **The q = −1 certificates re-proved** (H2 §1 verbatim, self-containment):
   `sigmaOrth` / `sigmaExpand_basis` [propext].
3. **The generalized lifting** `tableExpand` (H2's sigmaExpand over an arbitrary row
   family + basis certificate — the delicate rw chain exists ONCE): [propext,
   Classical.choice, Quot.sound]; instances `sigmaExpand` (q = −1) and
   `sigmaOneExpand` (q = +1, NEW), triad.
4. **The generalized rank no-go** `table_rank_nogo` (H2's rank_obstruction_nogo over
   an arbitrary index list + row family + expansion binder): triad. Instances:
   **`no_realization_dim7`** (q = −1) and **`no_realization_dim7_one`** (q = +1,
   NEW) — no 7-dimensional linear-functional realization of EITHER certified table.
   Theorem C's S-part is kernel-proved: every abstract host of dim ≤ 7 is excluded at
   both closed fibers (δ ∈ {−2, +2}); any TL dictionary needs d ≥ 8 — TL₄ (dim 14)
   the minimal TL host, words spanning ≥ 8 dims, outside every 2-generator subalgebra
   (dims 4/5), non-tracial at both fibers.
5. **Statement skeleton:** `DictionaryOn` (abstract-host dictionary Prop,
   precharter §4 §3 tier) — #check'd; the literal hosts (A14 / spin) are the M-rung.

## Runs

| run | bytes sha256(16) | verdict | wall | log |
|---|---|---|---|---|
| 1 (full H3.lean) | `833dcff84309c986` (fired = on-disk; no post-green edits) | **GREEN** (0/0; audits as tabled) | 62 s | `logs/h3-s-run1.log` (sha16 `6dc794e7a27d8565`) |

Telemetry: 1 sample (cpu=0.67, mem=8296MB OVER-mem = the documented olean-mapping
artifact, anon=0 — the h2-run11 class, AGENTS §Modal 5; no investigation triggered).

## Files (this worktree; sha256(16))

- `research/pilots/41/H3.lean` — `833dcff84309c986` (fired = on-disk)
- `research/pilots/41/H3-precharter.md` — `60278bd4b6e824bf` (post-battery final)
- `research/pilots/41/logs/h3-s-run1.log` — `6dc794e7a27d8565`
- `research/pilots/41/H3-record.md` — this record

## Tranche state + the M-GO call

S = GREEN (1 run). The M-tranche (precharter §5): the spin-host search — generator
literals at the integer fibers, TL relations decide-certified, word enumeration
≤ L = 3, the 64-equation certificate checker, candidates from the P5 spin ansatz
(sparse K / matrix-coefficient families). **M-GO gate per the precharter §7: S GREEN ✓
+ a paper-level candidate class identified (OPEN — the concrete word/K candidate list
is the next unit's paper-level work: compute the spin-host word images at δ = ±2 and
pre-solve the small K systems) + re-price checkpoint (unchanged: +0.3–0.5k LoC,
+2–4 runs).** Recommendation: next unit = paper-level candidate identification (NO
fires), then the M-GO request with the candidate list attached.

— lane R4, 2026-11-20 (S-rung close).
