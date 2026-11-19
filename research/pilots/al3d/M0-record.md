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

## M1 — RESTRICTION-COMPAT WORKHORSE: PARKED-AT-BUDGET (2026-11-19, lane R8, unit 4; honest park per the precharter's gate discipline)

**State: the M1 congruence class is FULLY GREEN-triad; the workhorse's statement
elaborates; its PROOF is parked at the budget with two classified one-line residuals
(both recurrences of classes already fixed this session). Budget spent: 3 result-runs
of 2–3 (m1-run1 FAIL 6 error-lines/3 classes → m1-run2 modal-client log-timeout
NO-VERDICT (infra flake, retry per convention) → m1-run2b FAIL 1 class → m1-run3 FAIL
2 residuals). The regression gate HELD at every run: run-13's 85 unique audit lines
byte-identical throughout; growth = the 10 M0 lines + the 4 M1 lines, all triad-only
except the parked workhorse's `sorryAx`.**

**GREEN (all triad-only, runs 2b/3):**
- `colToFin_symm_fibre` — the site-level rank-pinned agreement of the two inverse legs
  (the un-park key's numerical heart).
- `colRegEquiv_fibre_apply` — the per-column encoding congruence through the height
  cast (raw-site agreement discharges by proof-irrelevance `rfl` — the kernel's
  proof-irrelevance does for free what the equivFin era could not).
- `heightCast_finFunctionFinEquiv` (private) — the digit-cast congruence,
  variable-generalized so the proof is `subst` + `rfl` (NO `Eq.rec` on complex terms).

**The workhorse `colEquivVar_restr`** (statement = precharter §1 verbatim, modulo the
`restr (loc := …)`/`regReindexEquiv (Λ := …)` named-arg spellings): statement
elaborates; proof route (fibre-regrouping injectivity + the GREEN comp-lemma +
per-column congruence) is correct as designed — the sorried state is TACTIC-LEVEL
assembly only. **Residual census (2 items, fixes pre-written):**
1. `huX` membership recovery: `rw [← projF_fibre Λ hX']` dies on a dependent motive
   (u : ↥projF (fibre Λ X')'s type mentions the Finset — the find-#5 family at
   membership level, third recurrence). FIX (pre-written): destructure through the
   image — `obtain ⟨y, hyfib, hyu⟩ := Finset.mem_image.1 u.2;` then
   `(Finset.mem_filter.1 hyfib).2` gives `proj y ∈ X'`; `rw [← hyu]` on the GOAL
   (non-dependent) closes.
2. `colRegEquiv_fibre_apply Λ huX _ _ _` — positional `Λ` against the `{Λ}`-implicit
   signature (second recurrence of the class). FIX: drop the positional `Λ`
   (`colRegEquiv_fibre_apply huX _ _ (fun _ _ _ => rfl)`).
**M1-completion = ONE run with these two fixes applied** (the 77-T1-completion
pattern: residual census = the work list; ~2 LoC delta).

Run evidence: `logs/alp2-m1-run1-workhorse.log`, `alp2-m1-run2-fixround1.log` (the
client-timeout flake, annotated), `alp2-m1-run2b-fixround1-retry.log`,
`alp2-m1-run3-fixround2.log` (walls 47–76 s, telemetry OVER=0 throughout).
A2.lean sha256(16) at park (the audited run-3 bytes): `b4bc9f25be772998`;
post-park header-correction bytes (prose-only, this record's park wording carried into
the file header): `001d08978a4c9758`. P0/A1 frozen-unchanged. Fences carried (no
AreaLaw3D content; `PlanarAreaLawVar` binder not discharged; full `SlabAreaLaw3D`
hard-stopped).

## M1 — COMPLETED GREEN (2026-11-19, unit 5; completion grant, 1 run)

**Run m1-run4 (`logs/alp2-m1-run4-completion.log`): A2.lean OK sorry-strict, wall 83 s,
telemetry OVER=0 — `colEquivVar_restr` triad-only.** The two pre-written census fixes
(huX image-destructure; positional-Λ drop) closed it exactly as designed — ZERO new
error classes. **M1 CLOSED GREEN at 4 runs total (3 + 1 completion grant).** Gate: the
85 run-13 lines byte-identical; all 14 M0+M1 audit lines triad-only. Post-GREEN bytes:
`0aa6dafef2c511ce`.

## M2-a — 2 of 4 GREEN, 2 at one-line residuals (2026-11-19, unit 5; the unit's ≤2-run M2
allocation spent; M2 continues on re-task)

Content: the bankable first rung of M2 — the swap's ē-form feed
(`colEquivVar_restr_apply`), the powerset partition
(`powerset_eq_biUnion_projFib`), its disjointness
(`projFib_pairwise_disjoint` at `Set.PairwiseDisjoint` — `Finset.Pairwise` does NOT
exist on this pin; `Finset.sum_biUnion` takes `Set.PairwiseDisjoint (↑s) t`, verified
read-only at `Mathlib/Algebra/BigOperators/Group/Finset/Basic.lean:229+`), and the
per-fibre factorization (`sum_projFib_extendId`, attach-form both sides,
`extendId_sum` + `extendId_extendId` + proof-irrelevance on the subset-proofs).

- **GREEN triad (m2-run2): `powerset_eq_biUnion_projFib`, `sum_projFib_extendId`** —
  the structural halves of the Hamiltonian identification are banked.
- **Parked at one-line residuals (both PURE tactic-shape, fixes pre-written):**
  1. `colEquivVar_restr_apply` — L1's `.symm` orientation missing: FIX =
     `have h := (colEquivVar_restr Λ q hX' ((regReindexEquiv (Λ := Λ) q).symm w)).symm;
      rwa [Equiv.apply_symm_apply] at h`.
  2. `projFib_pairwise_disjoint` — `Set.PairwiseDisjoint` unfolds to
     `Function.onFun Disjoint …` on this pin, so `rw [Finset.disjoint_right]` found no
     pattern: FIX = prefix `unfold Function.onFun` (or `show Disjoint _ _`).
- **Run history:** m2-run1 FAIL (4 classes: the restr-loc metavar's 3rd recurrence —
  fixed with the named loc; the mem_powerset-normalized subset component; the
  Finset.Pairwise absence; a benign extra-rfl) → m2-run2 FAIL (the 2 one-line
  residuals above). Descent 6→2→(2 trivial).
- **Gate HELD both runs:** the 85-line core + all prior new lines byte-identical;
  growth = the 4 M2-a lines (2 triad, 2 sorryAx-parked).
- **M2 continuation (next unit):** the 2 one-line fixes + the SWAP PROPER
  (extend-relabel at the glue level — `extendId_apply_glue` makes the guard trivial
  once the ē-decomposition is stated in glue-form via `colEquivVar_restr_apply` and
  its complement instance) + the Hamiltonian-identification assembly
  (submatrix-sum distribution over the partition). Design notes in the unit-5 lane
  history; swap statement: `(extendId (fibre_subset Λ X') M).submatrix ē ē = extendId
  (loc := fun u => Fin (q ^ colCard Λ u)) hX' (M.submatrix (colEquivVar Λ q X' hX')²)`
  with ē := `(regReindexEquiv (Λ := Λ) q).symm`.

## M2 unit-6 — M2-a CLOSED 4/4 GREEN; the guard-bridge + swap parked at 2 classified residuals (2026-11-19; honest stop at the unit's 3-run cap)

**M2-a is now COMPLETE: all four of `colEquivVar_restr_apply`,
`powerset_eq_biUnion_projFib`, `projFib_pairwise_disjoint`, `sum_projFib_extendId`
GREEN-triad** (the two pre-written one-liners landed first try in m2-run4's byteset:
the `.symm` orientation and the `unfold Function.onFun` prefix).

**New this unit (authored, not yet GREEN):**
- `regReindexEquiv_compl_iff` — the GUARD BRIDGE (planar-off-X' agreement iff
  3D-off-fibre agreement), designed the donor's way: per-column through the GREEN
  toFun-transparency (`colRegEquiv` injectivity forward, `congrArg` backward) — NO
  `Eq.rec`, no complement-transport. Statement elaborates (after naming the loc on
  both planar restrs — the class's 4th recurrence).
- `colEquivVar_swap` — the SWAP proper, entrywise (`extendId`'s guard is NON-dependent
  `ite` on this pin — `if_pos/if_neg`, not `dif_pos/dif_neg`); consumes the guard.
- **Run history (3 fires = the unit cap):** m2-run3 (4 error-lines: the guard's
  statement loc-metavar + the swap's dif/ite confusion) → m2-run4 (26 error-lines =
  the guard's PROOF first-checked: roundtrip `symm_apply_apply`/`apply_symm_apply`
  direction + the iff-branches swapped; dominated by cascade) → m2-run5 (3 error-lines
  = 2 root residuals, below). Descent 4→26→3.
- **Parked residuals (both one-line, fixes pre-written):**
  1. `:1312` the hwu-step: the planar-restr index element passed as a NESTED Subtype
     `⟨⟨proj x, huP⟩, mem⟩` — the index of `↥(projF Λ \ X')` is FLAT. FIX:
     `congrFun h ⟨proj (x : ℤ × ℤ × ℤ), Finset.mem_sdiff.2 ⟨huP, hxu⟩⟩` (the
     `w`-membership rides `Finset.sdiff_subset` inside the restrict₂-unfold, met by
     `simpa`).
  2. `:1325` the injectivity-step's bare `rw [← regReindexEquiv_apply]` cannot match
     through the elaborated membership-proofs. FIX: construct the two colRegEquiv-eqs
     EXPLICITLY — `have e1 : colRegEquiv … (fun s => ēw ⟨↑s, col_subset …⟩) =
     w ⟨proj x, huP⟩ := by rw [← regReindexEquiv_apply (Λ := Λ) q (ēw)
     ⟨proj x, huP⟩, hw]` (and `e2` for `w'`), then
     `exact e1.trans (hwu.trans e2.symm)`.
- `colEquivVar_swap`'s own proof is UNTESTED (cascade-sorried through the guard); its
  if_pos/if_neg + ē-form-L1 route stands as designed.
- **The Hamiltonian identification was NOT started** (the unit cap went to the
  guard/swap descent). It is the M2-c continuation: submatrix-sum distribution +
  the attach-level partition regroup + `sum_projFib_extendId` + the swap +
  projInteraction-unfold.
- **Gate HELD all three runs:** the 85-line core byte-identical; all prior new lines
  unchanged (16 triad); growth = the 2 M2-b lines (currently sorryAx-parked).
- A2.lean sha256(16) at the unit-6 stop: `9706196c5f5ff593` (P0/A1 frozen-unchanged).
  Logs: `alp2-m2-run3-guard-swap.log`, `alp2-m2-run4-fixround2.log`,
  `alp2-m2-run5-fixround3.log` (walls 71–78 s, telemetry OVER=0).

## Unit 7 (2026-11-19) — part (a) M2-b NOT closed at the 3-fire cap; part (b) M2-c charter first-exit MET

**Part (a) — M2-b closure attempt (3 fires: m2-run6/7/8, descent 3→1→1 root):** the
unit-6 census's two fixes landed (flat index; explicit-args e1/e2 with `(q := q)`
named — the positional-implicit class's 5th recurrence found en route; `Eq.trans`
explicit), but the guard+swap still carry `sorryAx` at unit end. Run-8's residual
(`haf`'s `.trans`-on-membership) was fixed in the m2c-run1 byteset; the run-3(m2c)
audit still lists both sorried, with no visible error-contexts in the printed tail —
**the runner's error-context tail truncation is hiding their current root cause
(recorded as a known runner limitation; the next unit's first action re-reads it from
an untruncated channel or splits the guard out).**

**Part (b) — M2-c (3 fires: m2c-run1/2/3):**
- **CHARTER FIRST EXIT MET: `sum_powerset_eq_sum_projFib` GREEN-triad** (the
  partition regroup — 2 lines over the GREEN partition + `Finset.sum_biUnion` at
  `Set.PairwiseDisjoint`), and **the identification statement
  `hamiltonianVar_eq_submatrix` ELABORATES** (its proof is parked, see census).
- `sum_attach_eq_dite` (attach↔dite bridge for dependent bodies) GREEN-triad (run 3).
- `sum_submatrix` GREEN-triad in run 2 (induction-name regression in run 3 — the
  `Finset.induction` term-form failed; pre-written fix: `induction s using
  Finset.induction_on with | empty => simp | insert …` or revert to the run-2 bytes).
- **Run descent:** m2c-run1 (9 error-lines: bridge-dependent-f; hom-elaboration;
  partition-rw direction; hR syntactic) → m2c-run2 (8: bridge-internal dite;
  induction-names; hR syntactic confirmed) → m2c-run3 (6: sum_submatrix regression;
  key's hatt ILL-TYPED — the two attach-sums have different matrix types (fibre vs Λ)
  — my hatt wrongly equated them; fix pre-written: drop hatt, use
  `(sum_projFib_extendId …).symm` inside a `congrArg (·.submatrix ē ē)`; finale's
  `if_pos` → `dif_pos` — the dite/ite class's 3rd recurrence).
- **Standing census (all pre-written):** (1) sum_submatrix induction-form; (2) key's
  factorization-consumption via congrArg + the explicit bridge; (3) finale dif_pos;
  (4) the guard/swap's hidden root cause (tail-truncation).
- **Gate HELD all fires** (85-line core byte-identical; prior lines unchanged; growth
  = the M2-b/M2-c lines as authored). A2.lean sha256(16) at unit-7 stop:
  `455be065fd7e30f0` (P0/A1 frozen). Logs: `alp2-m2-run6-m2b-closure.log`,
  `alp2-m2-run7-fixround4.log`, `alp2-m2-run8-m2b-final.log`,
  `alp2-m2c-run1-identification.log`, `alp2-m2c-run2-fixround1.log`,
  `alp2-m2c-run3-fixround2.log` (walls 36–78 s, telemetry OVER=0).

## Unit 8 (2026-11-19) — M2-c assembly at TWO one-line residuals; the guard's invisible-sorryAx mystery isolated (3 fires)

**First-action untruncated re-read (done):** the raw-output tail-200 was confirmed as
the hiding mechanism (linter volume), and `set_option linter.all false` was added
file-wide as the diagnostic workaround — **yet the guard+swap STILL show sorryAx with
ZERO visible errors and every audited dependency triad-GREEN** (3 consecutive runs).
This is NOT a math defect on visible evidence — it is an elaboration phenomenon the
logs cannot see. **Recorded next action: an isolated bisect** (split `regReindexEquiv_compl_iff`
into its two iff-directions as separate lemmas, or `#print axioms` placed immediately
after the decl) — one diagnostic fire, not a repair fire.

**M2-c assembly — run descent 5→4→4 error-lines, TWO one-line residuals at stop
(both pre-written, both mechanical):**
1. `sum_submatrix`'s insert-case: `⊢ DecidableEq ι` — the theorem's binders lack
   `[DecidableEq ι]` (needed by `Finset.sum_insert`). FIX: add the binder.
2. `key`'s tail `exact Finset.sum_congr …` at :1475 — **the rw-chain now CLOSES the
   whole goal** (run 6: the bridge consumed cleanly once its f-instantiation carried
   the `.submatrix`; only the dead tactic remains). FIX: delete the two lines.
**En route fixes (run 4→6):** map_sum has no `F`-param on this pin (named ι/M/N/G);
`Finset.induction` is hypothesis-form — `induction … using Finset.induction_on with |
empty | @insert` works; explicit `rfl` needed after the curried `submatrix_add`; the
key-bridge's `f` must carry the `.submatrix`; `← sum_projFib_extendId` needs Φ
explicit (unresolved-Φ metas break the pattern).
**If the two fixes land, `hamiltonianVar_eq_submatrix` is expected GREEN** — the swap
and guard remain its only other dependencies (still the invisible-sorryAx pair).
- **Gate HELD all three fires** (85-line core byte-identical; growth only). A2.lean
  sha256(16) at unit-8 stop: `b186f960ba7ffc3a` (P0/A1 frozen). Logs:
  `alp2-m2c-run4-unit8.log`, `alp2-m2c-run5-unit8b.log`, `alp2-m2c-run6-unit8c.log`
  (walls 42–75 s, telemetry OVER=0).

## Unit 9 (2026-11-19) — **M2 CLOSED GREEN: the Hamiltonian identification PROVED** (3 fires)

**THE BISECT ANSWERED (run 7): `regReindexEquiv_compl_fwd` = sorryAx root,
`compl_bwd` = triad-GREEN.** The invisible root WAS the `.trans`-on-membership in
fwd's `haf` — its error was SUPPRESSED in the fused-iff context (why four runs of
full-output logs showed nothing); the split made it visible at last. MECHANICAL, not
math — fixed by the pre-written rw-form (`apply huX; rw [← …]`). Run-7 collateral:
the reindent script mis-anchored (its "first funext u" was `colEquivVar_restr`'s) and
flattened by-block interiors/signature continuations of four neighboring decls — all
indent-repaired in run 8's byteset (fwd/bwd bodies kept at level 2).

**Run 8: THE M2-b PAIR CLOSED** — compl_fwd, compl_iff, and `colEquivVar_swap` all
GREEN-triad (plus the iff-assembly's positional-Λ, the class's 6th recurrence, named).
**Run 9: A2.lean OK sorry-strict, rc=0 — `hamiltonianVar_eq_submatrix` GREEN-TRIAD =
THE M2-c KEYSTONE. The full M0→M1→M2 ladder stands kernel-verified.**

- **Gate at close:** run-13's 85-line core byte-identical; growth = 26 lines ALL
  triad-only; sole subset-payload `walk_induce_length` unchanged since run 13.
- **Standing notes:** (i) `set_option linter.all false` is DIAGNOSTIC-ONLY (unit 8) —
  lift at the next file touch, restoring the tail-200 margin by pruning the warning
  backlog instead; (ii) the fwd/bwd split decls stay (good hygiene: direction-level
  audit).
- **What M2's close means:** the precharter's P2-d parked targets — the extend-relabel
  swap AND the Hamiltonian identification — are PROVED over the canonical z-rank
  enumeration. The ladder's remainder is M3 (P2-e: eigenvector/gap/norm transports
  [already GREEN, generic] + the entropy identification for column-closed cuts + the
  final `SlabAreaLawColumnCuts3D` discharge from the `PlanarAreaLawVar` binder;
  4–6 runs per the precharter).
- A2.lean sha256(16) at unit-9 close: `61af175aae141aa9` (P0/A1 frozen). Logs:
  `alp2-m2c-run7-unit9-bisect.log`, `alp2-m2c-run8-unit9b.log`,
  `alp2-m2c-run9-unit9c.log` (walls 71–82 s, telemetry OVER=0).

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
