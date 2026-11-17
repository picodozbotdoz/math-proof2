# D2 record — pilot-10 Closure layer, Route A: VALIDATED; landing = tranche 1+2 GREEN
modulo ONE diagnosed statement error at fix-budget exhaustion

**Verdict: PARTIAL GREEN, 2026-11-17** (charter: orchestrator D2-GO ruling; plumbing
billing; fix-loop ≤4 — 4 fix iterations used across 6 runs, stopped per budget with
one error remaining and its 2-line fix diagnosed). Evidence:
`research/pilots/10/logs/d2-run1.log` (attempts 1–3: the GREEN **Route-A canary
milestone** — attempt 3 fully GREEN, wall=56 s warm) and
`research/pilots/10/logs/d2-run2.log` (attempts 4–6: the Cases/fields tranche —
everything GREEN except the one `padM'_init_polyT` statement, detailed below).
File: `research/pilots/10/L4.lean` (sha `ad366b23…`, 3,341 LoC = 46-line D2 header +
L3.lean verbatim 2,805 + Part F ~490 lines).

## ROUTE A/B OUTCOME: **Route A — validated; recommended**

- `attribute [fun_prop] Groundwork.PolyT` (post-hoc on the embedded def) is
  **ACCEPTED at v4.36** — the spec's Route-A enabling step works.
- `fun_prop` CLOSES goals over the user-class: `canary_init`, `canary_pair`,
  **`padM'_out_polyT`** all proved `by fun_prop`, triad-only; every `@[fun_prop]`
  lemma of eth's `Closure/Basic` and the transcribed `Closure/Cases` excerpt
  (sumCore/cond'/sumElim, whose own proofs contain `fun_prop` sub-goals) elaborated.
- Transcription churn ≈ 0 on ~490 lines, two mechanicals only (both recorded in the
  log headers): eth's file-level `variable {α β} [Enc α] [Enc β]` line is LOAD-BEARING
  for the Carried instance heads; root `code` is ambiguous at this pin (Lean.Doc) —
  qualify `TM.code` in the Cases simp sets.

## What is GREEN in L4.lean (attempt-6 state)

| item | status |
|---|---|
| **D2 FIRST BILL: the `Carried` instances** (eth EncLemmas:106–127 verbatim; Unit/Bool/ℕ/×/⊕/Option/List — ℤ skipped, unneeded for σ) + `carried_σ : Carried ((List Bool × ℕ) ⊕ Bool)` | GREEN, `[propext, Quot.sound]` |
| EncLemmas excerpt (wd_inl/inr, len_pair/nil/none/some/inl/inr/unit/nat/list/append, two_le_len_list) + size_* rfl lemmas | GREEN |
| Structural fragments (eth TM/Ops.lean): pop1, swapF, consF, unconsF + toA/toB within-lemmas (fromA/fromB already in the substrate, L2 :836/:843) | GREEN |
| `PolyT.of` / `PolyT.congr` / `PolyT.of_wd` (eth PolyT.lean:62–100 verbatim) | GREEN |
| `attribute [fun_prop] Groundwork.PolyT` | ACCEPTED |
| eth `Closure/Basic` verbatim (id'/const/comp/prodMk/fst/snd/some'/inl'/inr'/cons' + private ops) | GREEN |
| eth `Closure/Cases` excerpt (within_branch, tagHead/tagHead_eq, sumCore, cond', sumElim; listCases/optionElim + their nilHead/listSplit gadgets skipped — unneeded) | GREEN |
| `padM'_out_polyT` (the out field: Sum-elim to none/some) | GREEN, `by fun_prop`, triad |
| `canary_init` (= the init field's body, stated projection-free), `canary_pair` | GREEN, `by fun_prop`, triad |
| L3/L2/M1 substrate regression (exists_tm_space family, Counted block, Part E) | GREEN, triad |

## The ONE remaining error (diagnosed; 2-line fix queued, not applied)

`padM'_init_polyT`'s **statement** fails elaboration: `Enc (padM' e A').σ` synthesis —
the `.init`/`.σ` structure projection blocks instance search even under the type
ascription (PolyT's β binds the projection before the ascription wins; the tactic
body cannot reach a statement-level failure — attempt 6's have/exact wrapper proved
this is not a proof problem). **Queued fix:** state the theorem projection-free (the
canary shape `PolyT (fun x : List Bool => (.inl (x, 1) : (List Bool × ℕ) ⊕ Bool))`,
already proved as `canary_init` triad-clean) plus the rfl bridge
`padM'_init_eq : (padM' e A').init = fun x => .inl (x, 1) := rfl` — the future
`padM'_isPolyT` consumes the pair. Fix-loop budget was exhausted (4); the file on
disk is the maximal VERIFIED state.

## The step field = the charter call (source-measured, beyond first-run evidence)

`step` needs `fun s => s.elim (fun p => bif decide (e p.1 ≤ Nat.log2 p.2) then …
else .inl (p.1, 2 * p.2)) …` — i.e. `cond'`/`sumElim` (LANDED) **plus** the numeric
atoms `decide_le`, `log2'`, `mul`, whose honest transitive closure was re-measured
this session at ≈ **450–550 verbatim LoC** (eth Nat1's bitRun/bval foundation :55–200,
add_aux/subRun/sub_aux :200–300, `Closure/Fold`'s foldl machinery (~180 lines, needed
by `length`), Nat1b length/size'/log2', Nat2 mul, Bool `not'`) — the spec's §2 line
list is not self-contained. Guard (iii) (>0.6k) is therefore formally exceeded on the
Route-A side; its pre-authorized remedy (Route B ≈ 250 LoC) is under-priced the same
way — B also needs the (now-landed) structural fragments plus bespoke
compare/double fragments with real correctness burden, ≈ 300–400 new-LoC.
**Recommendation:** with Route A mechanically validated (0 churn on 490 lines),
COMPLETE ROUTE A at the next slot (≈ 500 LoC verbatim + the queued 2-line fix +
`padM'_isPolyT`'s three fields) — B no longer has a price advantage.

## D3-readiness

D3 (`pad_bound` + `padded_time_absorb`) is **independent of the step field** — pure
arithmetic transcribing eth Pad.lean:98–109 — and can land while the step field is
pending. D4 needs: `padM'_isPolyT` complete (all three fields — init essentially in
hand via canary_init + the queued bridge; out DONE; step = the call above) +
`padM'_state_poly` (DONE, amendment-bound, carried verbatim in the L4 substrate) +
`padM'_runs` (DONE, D1). **Amendment compliance:** both binding forms are in the
verbatim substrate; the spec's false line appears nowhere.

## Files (H commits; A1 folds the §10 row from this record)

`research/pilots/10/L4.lean` (3,341 LoC, sha ad366b23…),
`logs/d2-run1.log` (canary milestone GREEN + descent),
`logs/d2-run2.log` (fields tranche + the diagnosed error + descent),
this record. Billing: plumbing/completion-value, never novelty.

— lane A6, 2026-11-17.
