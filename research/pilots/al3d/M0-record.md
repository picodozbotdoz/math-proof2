# AL-P2 find-#5 canonical z-rank rebuild — M0 RECORD (regression/freeze + REBUILD legs)

Lane R8 (A4 lineage), worktree agent-05, 2026-11-19. Executes the M0 rung of
`research/pilots/al3d/rebuild-precharter.md` §3 under the orchestrator's day-1-class
re-task (regression/freeze scoping: this unit = the M0 REGRESSION component — re-verify
P0 → A1 → A2 with statements unchanged + the freeze manifest + this record; the
M0-REBUILD leg — the new canonical core + moved bodies — is the follow-on under the same
precharter budget). Commits held for H (post-K). No main-checkout writes.

## 0. M0-REBUILD LEG — EXECUTED GREEN same day (unit 3 re-task; runs 2–3 of the M0 budget)

**Verdict: GREEN at run 3 of the 3–4-run M0 budget (1 spent on the §1 regression +
1 rebuild fire + 1 fix round). A2.lean OK, sorry-strict, rc=0, 0 errors; wall 86 s,
telemetry OVER=0** (`logs/alp2-m0-run3-fixround1.log`, run URL in-log;
`crossmath-pilot-al3d`, doz CLI).

- **New canonical core (the precharter §2 design, z-image route):** `colZImage`
  (z-image Finset ℤ) + `colZRank` (position of the site's z in the sorted z-image) +
  the congruence class — `colZImage_congr`, `colZRank_congr` (plain `congrArg` through
  the data functions, NO `Eq.rec`, NO instance transport), `colZRank_fibre` (M1's exact
  feed: `colZRank (fibre Λ X') u x = colZRank Λ u x` from `col_fibre_eq`) — plus the
  pinning/transparency layer: `mem_colZImage`, `colZImage_card`, `colZRank_eq`
  (rfl-level characterization via `Finset.orderIsoOfFin_symm_apply`), `colZRank_lt`,
  `colZRank_inj` (rank-fiber uniqueness — the value-pinning of the classical leg),
  `colToFin_apply` (per-site transparency: `toFun` value IS the z-rank),
  `colToFin_symm_rank` (inverse-leg pinning). **Pre-flight design note (documented
  divergence from the precharter's FIRST option):** `Finset.sort`/`orderIsoOfFin`
  DIRECTLY on ℤ×ℤ×ℤ is unavailable on this pin — `Finset.sort` demands
  `[DecidableRel r] [IsTrans α r] [Std.Antisymm r] [Std.Total r]` and zLt is not total
  off columns — so the enumeration runs through the Z-IMAGE (Finset ℤ, full
  `LinearOrder`, `orderIsoOfFin` data-canonical with `orderIsoOfFin_symm_apply` proved
  `rfl` in mathlib), with the site↔z leg `Equiv.ofBijective` on the literal z-map
  (classical but value-pinned by `colZRank_inj`/`colToFin_symm_rank`). This IS the
  precharter's sanctioned alternative ("built from the z-image Finset via
  `Finset.orderIsoOfFin` … a function of the Finset DATA"); API verified read-only in
  encore-mathlib @ `ff2494ea` before authoring.
- **Moved bodies (per the §2 freeze manifest):** `colToFin` (was
  `Fintype.equivFin _`; now the canonical composite, RELOCATED to the P2-b core block —
  declaration order: `colRegEquiv` consumes it; the old site carries a pointer
  comment) and `colRegEquiv`'s inner reindex (was a SECOND independent
  `Fintype.equivFin _` — the two classical choices never agreed; now `colToFin Λ u`).
  `regReindexEquiv`/`colSiteOf`/`colIdxOf`/`colEquivVarToFun`/`colEquivVarInvFun`/
  `colEquivVar` TEXT UNCHANGED (transitive consumers). The two rfl-transparency
  lemmas (`regReindexEquiv_apply`, `regReindexEquiv_comp_colEquivVar`): text
  unchanged, and the regression proved their payloads unchanged.
- **Run history:** run 2 (`alp2-m0-run2-rebuild.log`) FAIL rc=1 errors=5 — the first
  SIX new theorems GREEN triad first try (`mem_colZImage`, `colZImage_card`,
  `colZRank_eq`, `colZRank_lt`, `colZRank_inj` + the P2-b pair); three classified
  defect classes (header of the run-3 log): congrArg-at-Λ-level in `colZImage_congr`
  (fix: column-level `congrArg` after `simp only [colZImage]`); `by simpa` membership
  conversions in the ofBijective anonymous constructor (fix: direct defeq terms —
  `Finset.mem_coe` is `Iff.rfl` `@[norm_cast]` on this pin); a dangling docstring at
  the vacated `colToFin` site (fix: plain comment). All sorryAx leakage in run 2's
  audit was definitional cascade through the sorried def. Run 3 GREEN.
- **REGRESSION GATE (binding) — PASSED:** every run-13 audit line is present in the
  run-3 audit BYTE-IDENTICALLY (unique-line comparison: 85/85 decl names AND axiom
  payloads; the run-1 raw-multiset check was 275 lines with repetition from log
  dumping — the decl-set + payload identity is the invariant). The audit GREW by
  exactly the 10 new theorems, ALL triad-only `[propext, Classical.choice,
  Quot.sound]`. The only non-full-triad payload remains `walk_induce_length`
  `[propext, Quot.sound]` (triad subset, unchanged since run 13). The frozen-statement
  surfaces all re-verified with unchanged names and payloads.
- **Manifest update:** A2.lean sha256(16) after the rebuild =
  `b84270b639166680` (was `6a5ed5553bb62c55` at the freeze; P0/A1 untouched —
  sha guard `/tmp/al3d-prefire-sha-m0run3.txt`). Statements frozen at
  `6a5ed555…` remain the M1–M3 contract; the byte delta is bodies-only per §2's
  bodies-may-move list + the new core.
- **M0 CLOSED at 3 runs of 3–4.** Next: M1 (the restriction-compat workhorse via the
  congruence class; 2–3 runs; first action = state it against `colToFin_apply` +
  `colZRank_fibre`). The named first risk (orderIsoOfFin-congruence shape) RESOLVED
  by construction: the congruence lemmas are `congrArg`-level, GREEN.

## 1. Audit result — run-13's triad audit REPRODUCED (GREEN)

**One Modal run fired** (this M0 is NOT audit-only — the precharter prices M0's
regression component as a verification run; this is M0-run 1 of the precharter's 3–4-run
M0 budget, the remaining 2–3 runs belonging to the M0-rebuild leg):
`logs/alp2-m0-run1-regression.log`, app `crossmath-pilot-al3d` (warm layers, doz CLI
`/home/doz/dozenv/bin/modal`, run URL `modal.com/apps/semraker/main/ap-WeQR1SYOYxJLEaS1KwjzkK`),
command `bash research/pilots/al3d/run_pilot.sh P0.lean A1.lean A2.lean`, elaboration
order P0 < A1 < A2.

- **Verdicts: P0.lean OK (probe, sorry allowed — the 3 probe-convention stubs at
  :104/:142/:147 only) · A1.lean OK · A2.lean OK** (sorry-strict, rc=0, 0 errors open
  or hidden — the 2026-11-18 anchored error filter was in the fired runner).
- **Telemetry: wall 53 s, spec cpu=2.0/mem=4096MB, LEAN_NUM_THREADS=2, OVER=0** (clean;
  no breach, nothing to investigate).
- **Audit-trail comparison against `alp2-run13-p2c-closureverify.log`: FULL LINE-LEVEL
  IDENTITY — 275 `depends on axioms` lines, identical decl names AND identical axiom
  payloads, set-equality and per-line equality both confirmed by diff.** The single
  non-full-triad payload is the SUBSET case `OpenAI.AL3D.walk_induce_length` →
  `[propext, Quot.sound]` (no `Classical.choice`) — unchanged from run-13, hence
  triad-clean (⊆ triad), not a new finding. Every other audited decl prints exactly
  `[propext, Classical.choice, Quot.sound]`. The 275-line audit = A1's 22 + A2's 187
  axiom-print lines in-file plus the P0-adjacent/staged re-prints, matching run-13's
  census class for class ("P2-c closed at 100%", A2.lean:17).
- The A2 bytes differ from run-13's guard sha (509f2368…) ONLY by the post-closure
  P2-d PARTIAL/PARKED header prose + the in-file P2-d green subset (parking edits);
  the audit identity above proves those edits touched no audited declaration — exactly
  the regression expectation (statements unchanged; parked find-#5 content is NOT in
  the file).

**M0 verdict: GREEN — the run-13 triad audit reproduces on the frozen tree; the
regression baseline for the M0–M3 ladder is established.**

## 2. Frozen-statement manifest (the M0–M3 freeze; sha256(16) per file)

Verify-fire sha guard recorded pre-launch (`/tmp/al3d-prefire-sha-m0.txt`, full 64-hex
shas; reproduced in the log header):

| file | sha256(16) | vs run-13 guard | role in the ladder |
|---|---|---|---|
| `P0.lean` | `52c5b9f77344e0ed` | UNCHANGED | statement layer (find-#4 amended `PlanarAreaLawVar`/rung-stone pair; find-#3 `groupStrength` def) — FROZEN whole-file |
| `A1.lean` | `a8feb25bcd60722f` | UNCHANGED | support layer (22/22 triad) — FROZEN whole-file; the rebuild consumes `col_inj_on_z`/`col_heights` read-only |
| `A2.lean` | `6a5ed5553bb62c55` | delta = parking prose + P2-d green subset only (audit identity proves no audited decl changed) | STATEMENTS FROZEN as below; BODIES may move per the M0-rebuild leg |

**A2 frozen statement surfaces (precharter §2, "Statements unchanged (frozen)")** —
name → A2.lean locator (worktree bytes = e3d984b bytes, verified sha-identical):

- **P2-b:** `colSigmaEquiv`, `colRegEquiv` (TYPE), `regReindexEquiv` (TYPE),
  `colCard_le_h`; the column-encoding support defs `colToFin` :623, `colSiteOf` :630,
  `colIdxOf` :639 (types frozen; bodies move).
- **P2-c (whole surface):** `colEquivVar` (TYPE — the composite
  heightCasts ∘ (regEquivOfEq (projF_fibre)).symm ∘ (regReindexEquiv _).symm shape is
  retained; only the regrouping factor's body changes), `projInteraction` :712,
  `projInteraction_isHermitian` :726, `projInteraction_eq_zero` :755,
  `projInteraction_norm_le`, `isAdmissible_projInteraction` :808, plus the fibre
  layer `mem_projF`, `card_projFib_le`, `projF_fibre`, `col_fibre_eq`,
  `colCard_fibre_eq`, `image_projF_mem_supportsG`, `card_le_of_mem_supportsG`.
- **P2-d GREEN generic/entrywise layer (consumes none of the moving bodies):**
  `vecMulVec_submatrix`, `hasGlobalGap_submatrix`, `mulVec_eq_smul_submatrix`,
  `star_dotProduct_comp`, `regReindexEquiv_apply`, `regReindexEquiv_comp_colEquivVar`,
  `fibre_subset`, `sdiff_fibre_eq`.
- **Support layers I–IV untouched** (glue/extendId calculus; L2-opNorm
  relabelling/padding incl. `l2_opNorm_extendId_le` with its restored
  `[∀ i, Fintype (loc i)]` binder — the run-13 one-line fix; spectral entropy
  `trace_cfc`/`vonNeumann_submatrix_equiv`; planar packing).

**Bodies that MAY move (M0-rebuild leg only):** `colRegEquiv`, `regReindexEquiv`, and
the supporting `colToFin`/`colIdxOf`/`colSiteOf`/`colEquivVarToFun`/`colEquivVarInvFun`
(+ the `colEquivVar` composite's `regReindexEquiv` factor) — replaced by the
choice-free canonical z-rank enumeration (rank via `col_inj_on_z`/`col_heights`;
`Finset.orderIsoOfFin` route) + the column-encoding congruence class; and the two
rfl-transparency API lemmas re-proved as needed (`regReindexEquiv_apply`'s `rfl`,
`regReindexEquiv_comp_colEquivVar`). Any statement-level change to a frozen surface
aborts the ladder (re-charter required).

## 3. Ladder plan confirmation (precharter §3–§4, confirmed as the go-forward plan)

- **M0-rebuild leg (next unit; 2–3 runs of the 3–4 M0 budget remain):** EXECUTED GREEN
  same day — see §0 above (runs 2–3; gate passed; A2 sha `b84270b639166680`).
- **M1 (2–3 runs):** the restriction-compat workhorse
  `colEquivVar Λ q X' hX' (restr hX' (regReindexEquiv Λ q x)) = restr (fibre_subset Λ X') x`
  via the congruence class — the un-park key (the find-#5 obstruction dies because no
  `Eq.rec` remains).
- **M2 (3–5 runs):** extend-relabel swap (entrywise; consumes M1 + `sdiff_fibre_eq` +
  complement form), powerset regrouping (`Finset.sum_biUnion` over `projFib`-fibres of
  `Λ.powerset`), Hamiltonian identification (rides `extendId_extendId`, GREEN).
- **M3 (4–6 runs):** P2-e assembly — eigenvector/gap/norm transports (GREEN, generic) +
  entropy identification for column-closed cuts (partial-trace commutation; consumes
  `vonNeumann_submatrix_equiv`) + the final `SlabAreaLawColumnCuts3D` discharge from
  the `PlanarAreaLawVar` binder; full-coverage audit + sorry-token classifier at close.
- **Fences carried (unchanged, precharter §5):** no `AreaLaw3D` content (Targets.md §A
  :23; C.1–C.4); B.1 donor-owned; full `SlabAreaLaw3D` HARD-STOPPED;
  `PlanarAreaLawVar` binder NOT discharged; `SlabAreaLawColumnCuts3D` stays
  weaker-by-cut-class and conditional.

## 4. Files (H commits, post-K)

- `research/pilots/al3d/logs/alp2-m0-run1-regression.log` — this rung's evidence
  (provenance header + full transcript; /tmp staging transcript discarded).
- `research/pilots/al3d/M0-record.md` — this record.
- UNTOUCHED: `P0.lean`, `A1.lean`, `A2.lean`, `run_pilot.py`, `run_pilot.sh`,
  `A2-gaps.md`, `rebuild-precharter.md` (bytes = e3d984b, shas §2).
- Same-session companion (lane R8, this worktree): the wave-2 queue + its 2026-11-19
  rulings appendix (`research/qa/iter4-review/a6-iter5-wave2-queue.md`, amended
  sha256(16) `05046074321e3517`).

— lane R8 (worktree agent-05), 2026-11-19. Basis: main @ `e3d984b` (worktree al3d
files sha-verified identical). No sorry/native_decide/external CAS introduced; kernel
verification only; Modal per AGENTS.md §Modal usage guidelines (SPEC 2cpu/4GB,
telemetry, LEAN_NUM_THREADS=2; measured wall 53 s, OVER=0).
