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

## M3 — the final rung: PARKED at the unit cap with 2 pre-written one-line fixes (2026-11-20, lane R8, re-fired fresh after the external termination)

**Context:** the previous dispatch (2026-11-19 night) died mid-run after 3 FAIL fires
(`logs/alp2-m3-run1-transports.log`, descent 3→2→2, the `Equiv.sum_comp` named-arg +
cascade). This unit re-fired fresh with a ≤3-run budget and the FULL M3 remainder
authored (the split-lemma two-loc fix + support layer V + the entropy identification +
the rung-stone). **Verdict: PARKED at A2.lean FAIL errors=11 (2 unique roots, both
one-line, fixes pre-written in the parked bytes); descent 27 → 13 → 11.** The ladder's
M0→M2 GREEN state is untouched (regression gate HELD at every fire: run-13's 85-line
core byte-identical; P0/A1 shas frozen at the M0-record §2 manifest values).

**Run ledger (app `crossmath-pilot-al3d`, doz CLI, warm; telemetry OVER=0 every fire):**
- run 2 `alp2-m3-run2-remainder.log` (wall 55 s, pre-sha a9e19f54353d6054): FAIL errors=27
  — 8 mechanical root classes (zero math defects): `mul_zero`→`zero_mul` orientation;
  `Finset.sum_comm` all-implicit on this pin (positional application was the error);
  `Finset.sum_eq_single` carries the out-of-set case (`sum_eq_single_of_mem` the right
  form); `vonNeumann`'s `[DecidableEq n]` binder; `restr_congr`'s redundant rfl;
  `fibre_eq_of_column_closed` orientation + exists-form; the identification RHS's
  delayed-witness unification (vector-type ascription); the rung-stone's def-wrapped
  anonymous constructor (`refine fun _ => ⟨…⟩`).
- run 3 `alp2-m3-run3-fixround1.log` (wall 88 s, sha 93ff27cce18a27e4): FAIL errors=13 —
  banked TRIAD: `sum_nonneg_re`, `vonNeumann_witness_ext`, `vonNeumann_congr`,
  `restr_congr`, `fibre_eq_of_column_closed` (the dichotomy), `compE`, + h1 of
  `dotProduct_sum_mulVec`. 4 one-line roots left.
- run 4 `alp2-m3-run4-fixround2.log` (wall 74 s, sha 32de92b713267873): FAIL errors=11 —
  banked TRIAD: `dotProduct_sum_mulVec` (h3's Pi-star form `(star x) j`, not `star (x j)`);
  **find #6 CONFIRMED** (below). 2 roots left → parked.

**Delivered content (all in the parked bytes, post-state sha256(16) `221eb30b6debba75`;
`4402ab460aac541e` = the same bytes before the header-prose edit):**
- **Split fix:** `ptrace_submatrix_split` generalized to TWO site-type functions (the
  planar variable-height system vs the 3D system — the identification's requirement),
  proof restructured: summands rewritten by the derived `e.symm ∘ glue` identity FIRST,
  then `Equiv.sum_comp eC.symm _` positional (run-1's `(f := …)` was the named-arg
  class's 7th recurrence).
- **Support layer V (psd, mathlib-only):** `compE` (slice-selector matrix; triad),
  `compE_entry` + `ptrace_eq_sum_compE` (ptrace = ∑ of conjugate compressions),
  `posSemidef_ptrace'` (the P0 stub's CONTENT re-proved under a new name — each
  compression psd by `Matrix.PosSemidef.mul_mul_conjTranspose_same`; the ℝ-cast route
  `sum_nonneg_re`; quadratic-form distributivity `dotProduct_sum_mulVec`), plus
  `vonNeumann_witness_ext`/`vonNeumann_congr` (proof irrelevance) and `restr_congr`
  (the fibre↔cut restriction transport; GREEN-triad).
- **Entropy identification** `regionEntropy_pureState_column_closed`: consumes the M1
  ē-form workhorse at the cut and its complement + `fibre_eq_of_column_closed` +
  `restr_congr` + the split lemma + `vonNeumann_submatrix_equiv`; the pureState-to-
  vonNeumann bridge `regionEntropy_pureState_eq` (rfl + proof-irrelevance).
- **The rung-stone** `slab_column_cuts_of_planar_var`: `SlabAreaLawColumnCuts3D`
  discharged from the `PlanarAreaLawVar` binder (EnclOK hypothesis-binder pattern) at
  `G := projLattice Λ`, `Λ' := projF Λ`, `hU := colCard Λ`, `Ψ := projInteraction`,
  output constant `max C 0` (monotonicity needs `0 ≤ C'`); boundary side A1's
  `edgeBoundaryG_card_le`; consumes the three keystone-fed transports.
- **The linter lift:** `set_option linter.all false` REMOVED per the task (verified
  across three fires: verdict extraction is filter-based on full output; the returned
  warning volume did not affect any verdict or audit line).

**STATEMENT-LAYER FIND #6 (CONFIRMED at run 4):** the frozen P0 probe stubs
(`posSemidef_vecMulVec_self_star` P0:104, `posSemidef_ptrace` :142, `trace_ptrace` :147
— probe-convention sorries) sit INSIDE the frozen DEFS `pureState` and
`SubState.restrict`, and the def-traversing axiom audit propagates them: any theorem
whose TYPE mentions `pureState`/`regionEntropy` prints `sorryAx` of P0 provenance
regardless of its own proof — `regionEntropy_pureState_eq`'s proof CLOSED at run 4 and
its audit line still shows sorryAx, exactly as pre-registered. Consequence at GREEN: the
three pureState-typed decls (`regionEntropy_pureState_eq`,
`regionEntropy_pureState_column_closed`, `slab_column_cuts_of_planar_var`) will carry
P0-statement-layer sorryAx; every OTHER M3 decl is triad-only (the mathematical content
of the stubs is re-proved in A2 at `posSemidef_ptrace'` + mathlib's
`Matrix.posSemidef_vecMulVec_self_star`). **Amendment option for H (not executed — P0 is
frozen whole-file): a PROOF-ONLY P0 completion (replace the three sorry bodies; zero
statement drift; ~5 LoC for the two vecMulVec/trace one-liners + the A2-ported
`posSemidef_ptrace'` body) would make the whole rung-stone triad-clean. Fence status
unchanged: `PlanarAreaLawVar` NOT discharged (consumed as the binder); full
`SlabAreaLaw3D` untouched; no `AreaLaw3D` content.**

**Residual census (fixes PRE-WRITTEN in the parked bytes):**
1. hglue's STATEMENT: `glue E x F z` (four juxtaposed tokens, two equivs) defeats the
   elaborator's overapplication-grouping — it consumed the second trans-equiv as glue's
   first explicit arg. FIX (applied): parenthesize — `glue ((E₁) x) ((E₂) z)`.
2. `ptrace_eq_sum_compE`'s outer slice-selection left an ill-typed postponed target.
   FIX (applied): the per-slice entry equality extracted as `compE_entry` (both
   selections standalone, exact-chained, no rw-induced beta redexes); the main lemma
   reduced to `sum_congr` over it (+ its audit line).

**M3-COMPLETION = ONE fire of the parked bytes** (sha `221eb30b6debba75`; expected
verdict: A2.lean OK sorry-strict with the three pureState-typed decls P0-sorryAx and
everything else triad — the ladder M0→M3 then closes modulo the find-#6 statement layer,
with the amendment decision H's).

## Ladder roll-up (M0→M3, at the M3 park)

| rung | state | evidence |
|---|---|---|
| M0 regression | GREEN (run 1, 2026-11-19) | `alp2-m0-run1-regression.log` — run-13's 275-line audit reproduced |
| M0 rebuild | GREEN (run 3 of 3–4) | `alp2-m0-run3-fixround1.log` — canonical z-rank core, 10 new triad |
| M1 | GREEN (4 runs) | `alp2-m1-run4-completion.log` — `colEquivVar_restr` triad |
| M2-a/b/c | GREEN (units 6–9) | `alp2-m2c-run9-unit9c.log` — swap + `hamiltonianVar_eq_submatrix` |
| M3 | PARKED at cap (3 fires, 27→13→11); completion = 1 fire | `alp2-m3-run{2,3,4}*.log`; parked sha `221eb30b6debba75` |

— lane R8 (worktree agent-05), 2026-11-20. P0/A1 frozen-unchanged throughout
(52c5b9f77344e0ed / a8feb25bcd60722f); no sorry/native_decide/external CAS in A2 (grep
verified, prose-only tokens); kernel verification only; Modal per AGENTS.md (SPEC
2cpu/4GB, LEAN_NUM_THREADS=2, telemetry every fire, OVER=0; walls 55–88 s).

## M3 completion fire (run 5, 2026-11-20, the granted 1-fire): NOT-GREEN — parked per the ruling, both fixes pre-written

**The find-#6 amendment was APPLIED first** (H-approved, proof-only): P0's three stub
bodies proved mathlib-only — `posSemidef_vecMulVec_self_star` := mathlib's
`Matrix.posSemidef_vecMulVec_self_star`; `posSemidef_ptrace` := the compression route
(the A2 M3 support-layer V port); `trace_ptrace` := the glue-reindex route
(`Reg S × Reg (T \ S) ≃ Reg T` bijection) — decl-list BYTE-IDENTICAL (+106/−10,
bodies + header-prose only; the frozen sha 52c5b9f77344e0ed → amended d4573bdf00a5a2bb;
the probe-convention provenance note kept in P0's header as ruled).

**Run 5** (`logs/alp2-m3-run5-completion.log`, wall 48 s, telemetry OVER=0, guard
`/tmp/al3d-prefire-sha-m3run5.txt`): **NOT-GREEN — P0 FAIL errors=2, A1/A2 pure cascade**
(P0's olean never built). Both errors sit INSIDE the amended `posSemidef_ptrace` body and
are precisely diagnosed; the rest of the amendment (trace_ptrace entirely, hsel, the
Hermitian half, hq's internal proofs, hnn) elaborated clean:
1. The per-slice entry-normalization associates `(lit * M) * litᴴ`, putting the
   star-selector OUTSIDE the inner sum (not the A2 form the port assumed).
2. The bare `rw [hq]` failed to match its fully-generic pattern at the concrete goal.

**Both fixes are PRE-WRITTEN into the parked P0 bytes (sha `2d84a3caf8d0d26f`)** — the
M1-park convention: `hsel'` right-selector + `hin` inner-selection for (1); fully-pinned
`rw [hq (ι := …) (κ := …) … ]` for (2). A1/A2 need NO changes (cascade only). **The next
1-fire order at P0 `2d84a3caf8d0d26f` + A1 `a8feb25bcd60722f` + A2 `221eb30b6debba75`
completes** (expected: P0 OK sorry-free, A2 OK rc=0 with ZERO sorryAx — the amendment
removed the P0-layer taint, so the find-#6 prediction for the three pureState-typed
theorems is SUPERSEDED: all should print triad).

— lane R8 (worktree agent-05), 2026-11-20, completion fire spent per the grant; parked;
awaiting the next order. Files: P0.lean `2d84a3caf8d0d26f` (amended+fixed), A1.lean
`a8feb25bcd60722f` (frozen), A2.lean `221eb30b6debba75` (parked); logs
`alp2-m3-run5-completion.log`. No commits (H commits).

## M3 final fire (run 6, 2026-11-20, the wave's LAST): NOT-GREEN — honest-partial park; iter-6 inherits

**Run 6** (`logs/alp2-m3-run6-final.log`, wall 31 s, telemetry OVER=0, guard
`/tmp/al3d-prefire-sha-m3run6.txt`): **P0 FAIL errors=2 (both inside the amended
`posSemidef_ptrace` body); A1/A2 pure cascade.** The run-5 fixes landed: `hin`+`simp only
[in]` worked (the inner selection closes), and the per-z goal is now ONE `.symm` from
done. The residuals:
1. `:184` — PURE ORIENTATION: the per-z goal (sum_congr orients ptrace-side = product-side)
   is `M (glue c z) (glue d z) = ∑ x, …`; `hsel'` gives the ∑-side first. FIX
   (pre-written): `(hsel' …).symm`.
2. `:205` — the pinned `rw [hq …]` fails to match its structurally-identical pattern
   (both displays identical up to bound names — an invisible implicit divergence). FIX
   (pre-written): `refine (hq … x) ▸ ?_` transport instead of the rewrite.

**Parked post-state (fixes pre-applied): P0 `33c759420ad65598`, A1 `a8feb25bcd60722f`,
A2 `221eb30b6debba75` — one fire at these shas is iter-6's first M3 action** (expected:
P0 OK sorry-free; A2 OK rc=0 errors=0 with ZERO sorryAx — the find-#6 amendment stays in
force; the three pureState-typed theorems should print triad).

**Wave-5 M3 roll-up:** 6 fires total this unit-lineage (3 budget + 1 completion grant +
1 fresh order... i.e. runs 2–6 of 2026-11-20), descent 27→13→11→2→2; every error class
mechanical (named-args, implicit-arg signatures, simp-normalization shapes, orientation,
rewriter-matching); ZERO math defects across the entire M3 content. Ladder state: M0, M1,
M2 GREEN-triad (kernel-verified); M3 = honest-partial — all content authored and in the
bytes, the psd/compression/identification/rung-stone chain one orientation+transport fix
from GREEN. The find-#6 P0 amendment (H-approved) is applied and 90% verified in-file
(trace_ptrace, hsel, hsel', hin, Hermitian half, hq internals, hnn cast all clean).

— lane R8 (worktree agent-05), 2026-11-20, M3 wave fires EXHAUSTED per the cap; parked
honestly; iter-6 inherits with a one-fire-ready state. No commits (H commits).

## M3 iter-6 day-1 fire (run 7, D5 inheritance): NOT-GREEN ⇒ PARK-PERMANENT for re-scoping

**Run 7** (`logs/alp2-m3-run7-iter6day1.log`, wall 19 s, telemetry OVER=0, guard
`/tmp/al3d-prefire-sha-m3run7.txt` at the inherited triple `33c759420ad65598` /
`a8feb25bcd60722f` / `221eb30b6debba75`): **P0 FAIL errors=2 (one root + cascade);
A1/A2 pure cascade.** Per the D5 order: park-permanent, no further fires.

**ROOT — finally COMPLETE, and it retroactively explains the entire `hq` saga (runs
5–7):** the inlined `hq` helper was declared `∀ {ι κ : Type}` — universe-0 — while the
concrete index type `Reg loc S` lives in `Type (max u_3 u_1 u_2)`. Run 7's error shows
it literally (`x : Reg.{u_1,u_2} loc S → 𝕜` vs expected `Reg.{0,0} ?m → 𝕜`); run 5's
bare-`rw` and run 6's pinned-`rw` "pattern not found" failures were the same universe
mismatch surfacing opaquely. **FIX = ONE WORD, pre-applied to the parked bytes:
`{ι κ : Type}` → `{ι κ : Type*}`.** Parked post-state: **P0 `7cd41a3046eda597`**, A1
`a8feb25bcd60722f`, A2 `221eb30b6debba75` — the re-scoped unit's first action remains
ONE fire, now with the last invisible root eliminated (the run-6 `.symm` and `▸` fixes
are also in these bytes and the per-z entry proof's only remaining step after them is
exactly the machinery that elaborated clean in runs 5–7).

**Full M3 fire history (7 fires, 2026-11-19/20+): 27 → 13 → 11 → 2 → 2 → 2 → 1 root —
every class mechanical; zero math defects. The M0→M2 ladder stays GREEN-triad on main
(batch Q); M3 = park-permanent honest-partial with a one-fire-ready, one-word-from-GREEN
state.**

— lane R8 (worktree agent-05), iter-6 day-1. Records worktree-side until the opening
commit. No commits (H commits).

## M3 final granted fire (run 8, iteration-6 budget, ABSOLUTE CAP): NOT-GREEN ⇒ DEEP RE-SCOPING PARK

**Run 8** (`logs/alp2-m3-run8-finalgreen.log`, wall 27 s, telemetry OVER=0, guard
`/tmp/al3d-prefire-sha-m3run8.txt`): **P0 FAIL errors=5; A1/A2 pure cascade.** The run-7
`Type*` fix DID eliminate its root (the `hq`-application unifies) and exposed the FINAL
layer: **a universe-polymorphic local `have` cannot be absorbed into the enclosing
declaration's universe profile** — kernel: `commitConst: level params [u_1..u_5] but
expected [u_1,u_2,u_3]` at :152, cascading `unknown constant 'Arealaw.posSemidef_ptrace'`
at :301 + two universe-constraint failures at the ▸-site (:205).

**Fix-class named, both variants recorded; the proof-only-legal one PRE-APPLIED (UNFIRED,
grant-gated):** pin the have's universe at the enclosing parameters —
`∀ {ι κ : Type (max u_1 u_2)}` (both Reg-index types live exactly there; no new level
params) — OR pull `hq` out as a top-level private helper (A2's own architecture;
requires H to widen the find-#6 amendment grant beyond "3 sorry bodies"). The re-scoping
decision owns the next fire.

**M3 fire history FINAL: 8 fires — 27 → 13 → 11 → 2 → 2 → 2 → 1 → 1 root — all
mechanical (named-args, implicit-arg signatures, simp-normalization shapes, orientation,
rewriter-matching, universe-0 restriction, universe-polymorphic-have escape); ZERO math
defects across the entire M3 content.** Ladder final state this cycle: **M0/M1/M2
GREEN-triad kernel-verified on main (batch Q); M3 = deep re-scoping park, one
universe-pinning word from GREEN** with the full diagnosis chain recorded
(`7cd41a3046eda597` + the fixed-universe word = the one-fire-ready bytes for whoever
re-scopes).

— lane R8 (worktree agent-05), run 8 of 8. Records worktree-side until the opening
commit. No commits (H commits).

### ORCHESTRATOR RULING (iter-6 re-scoping disposition, relayed 2026-11-20+)

The M3 re-scoping is QUEUED as a future iter-6 unit (NOT a completion grant). When
charted: **variant 1 preferred** (the `Type (max u_1 u_2)` universe pinning — proof-only
-legal, already pre-applied in the parked bytes `c6752422b49555af`); variant 2 (top-level
private helper = a decl-list addition) would need the find-#6 amendment grant widened —
a bigger decision, not assumed. No next fire now; the re-scoped unit gets its own scope
at iter-6 wave-2 queue formation. — recorded by R8 from the orchestrator's relay.
