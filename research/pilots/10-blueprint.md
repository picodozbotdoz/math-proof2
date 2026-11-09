# Pilot blueprint — dossier 10 (z3-uniform-poly-space-eth-refutation), milestone M1 = L3

Pilot-10 lane, 2026-11-09/10. Top-3 pick #2. Companions: dossier
`research/candidates/10-z3-uniform-poly-space-eth-refutation.md` (statement of `SpaceWithin`,
strategy steps 3–5), prework + G1 audit `research/pilots/10-prework.md` (§5 lemmas L1–L3, §9
CASE A ⇒ GO unconditional at effort M, L3 first). Shape mirrors `42-blueprint.md` /
`52-blueprint.md` (lite).

---

## §1 Milestone choice

M1 is the prework's **L3 (space-annotated assembly)**: eth's `exists_tm`
(`anthropics_formal-math/eth/proof/machines/ToTuring/Machine/Host.lean:305–309`) with a
`SpaceWithin` conjunct, combined with openai-math's per-prefix space monitor. It is the most
reusable, wall-free tranche (prework §7): it does not touch the pad (L1/L2), only the host
machine that every eth time bound goes through.

**Statement proved** (`research/pilots/10/M1.lean`, `Groundwork.exists_tm_space`):

    ∃ N : TM2ComputableAux Bool Bool, ∃ c, (∀ k, Finite (N.tm.Γ k)) ∧
      ∀ x T S b, M.Runs x T S b → S ≤ (|x|+2)^d →
        Nonempty (TM2OutputsInTime N.tm (x ↦ input) (some [b]) (c·(T+1)·(|x|+1)^c))   -- eth, verbatim
        ∧ ∀ t, SpaceWithin N x t (c·(|x|+1)^c)                                          -- new

for every `M : Stepped (List Bool) Bool` with `[IsPolyT M]` and every d. The space bound is a
polynomial in |x| alone — independent of the running time T. `SpaceWithin` is the dossier's
definition verbatim (every configuration reached in s ≤ t steps has total stack content ≤ S),
stated in mathlib's own iteration form `(flip bind tm.step)^[s] (some (initList tm l))`
(`Mathlib/Computability/StateTransition.lean:256–268`, the `EvalsTo` relation that
`TM2OutputsInTime` is built from).

Corollaries in the same file: `exists_tm` (eth's statement verbatim, the time half — shows the
transcribed host is eth's machine), `exists_tm_space_at_time` (the dossier's exact shape: space
at the time bound), `exists_tm_space_monitor` (openai's per-prefix monitor form, shape of
`openai-math/lean/OAI/Algorithms/SubexponentialSAT/SqrtLogSpace/Final.lean:122–128`), and
`spaceWithinTM_iff_trace` (dossier form ↔ openai's `Computation.Trace` form).

## §2 Formulation decisions

1. **No binders.** The task allowed donor statements as explicit hypothesis binders where porting
   is too costly. Not needed: the host stack (Run/Frag/Tree/Stacks/Rename/Move/Ops/Lift/Enc/
   Bound/PolyT/Host, ~1.1k LoC of eth) was transcribed with its proofs and re-elaborated on
   v4.36.0-rc2. Every theorem in the file is unconditional.
2. **Same machine as eth.** The space theorem is about `tmOf (prog Pi Ps Po)` — eth's host, not a
   new one — so it can replace `exists_tm` wherever eth uses it (dossier step 4: the `St…`
   interface swap). `exists_tm` is recovered as a two-line corollary.
3. **The key lemma is generic.** `stkLen_stepAux`: one TM2 step running statement q grows the
   total stack content by at most `pushes q` (the most pushes along a path of q). Hence every
   fragment has a constant `Frag.growth` (finitely many labels) and every run of n steps stays
   below *start + growth·n* (`Frag.Runs.toB`). No fragment internals are needed: the eth leaf
   fragments (prologue, init+look, loop body, drop) are bounded through their `PolyT` time bounds.
4. **Where the polynomial comes from.** The loop of the host is the only place where T enters.
   At the head of each round the stacks hold one coded state and one optional bit (≤ L + 5
   symbols, L = 7(|x|+2)^d, from `Carried`); a round is one head step plus one body run of
   ≤ tS L + 3L + 3 + tO L steps. So `mainLoop_withinB` bounds every configuration of the loop by
   L + 5 + growth(body)·(tS L + 3L + 3 + tO L) — the same for every round, hence independent of
   T. This is the prework's §4 claim ("a stack-length invariant threaded through the existing
   step-induction"), now a kernel-checked lemma.
5. **Monitor form.** openai bounds the *visited interval* of each tape (`LocatedCfg`/`monitor`/
   `visitedSpace`, `ComparatorChallenges/SubexponentialSAT.lean:149–189`). The stack analogue
   transcribed here records each stack's high-water mark per step (`LocatedCfg.monitor`), and
   `visitedStacks_le` turns SpaceWithin S into visited ≤ |K|·S (|K| = 5 stacks for the host; the
   factor is absorbed into the constant). Granularity is per TM2 step, as in the dossier's
   definition: transient pushes inside one statement add at most `Frag.growth` more (constant).

## §3 Modal plan

Runner: `research/pilots/32/run_pilot.sh <files>` (app `crossmath-pilot-32`, ephemeral `modal
run`, image = elan v4.2.4 + `leanprover/lean4:v4.36.0-rc2` + mathlib `ff2494ea` with ~8.7k
cached oleans; `lake env lean <file>`; sorry-warnings count as FAIL). Staging: the repo file is
copied to `/tmp/crossmath-p10-src/Pilot10_M1.lean`; the runner restages it world-readable under
`/tmp/crossmath-pilot-stage/`. Logs persisted to `research/pilots/10/logs/` with provenance
headers.

## §4 Risk register (at design time)

| Risk | Outcome |
|---|---|
| v4.33 → v4.36 proof churn in the ~1.3k transcribed LoC | **none**: run 1's 3 errors were all in the new layer; every transcribed eth proof elaborated verbatim |
| `Sym` name clash with mathlib's `_root_.Sym` under `import Mathlib` | **none**: overload resolution picks `Groundwork.TM.Sym` everywhere |
| make_axcheck.py's theorem regex captures only the first component of dotted names (`Frag.seq_runs` → `Frag`) and skips `@[simp] theorem` lines | full-coverage generator `pilots/10/axcheck_full.py` used for the audit (135/135 theorems); make_axcheck's own copy also run and OK |

## §M1 run log

**Invocation** (from the worktree; the runner restages world-readable and runs as `xyz`):

```bash
mkdir -p /tmp/crossmath-p10-src && cp research/pilots/10/M1.lean /tmp/crossmath-p10-src/Pilot10_M1.lean
research/pilots/32/run_pilot.sh /tmp/crossmath-p10-src/Pilot10_M1.lean
```

| # | Log | Verdict | Errors | Fixes applied |
|---|---|---|---|---|
| 1 | `pilots/10/logs/m1-run1.log` | FAIL | 3 | — (all three in the new layer; see below) |
| 2 | `pilots/10/logs/m1-run2-green.log` | **OK** | 0 (3 linter warnings) | `Frag.Runs.toB`: explicit `(f := TM2.step P.m)`, typed `sz`, `(g := P.growth)` (the elaborator could not infer `c.stk`'s type); `loop_runs_iterB`: `RunsB` unfolded through a typed `have` before `RunIn.start` (higher-order `?p ?a` was approximated by a constant); `spaceWithinTM_of_withinB` takes `(hx : x' = x)` like eth's `outputs_of_within`, since `rw [List.map_id]` cannot see through `(tmOf H).Γ (tmOf H).k₀ = Bool` |
| 3 | `pilots/10/logs/m1-run3-confirm-axcheck.log` | **3/3 OK** | 0 / 0 warnings | linter cleanup only (`<;> omega` dropped in `stkLen_head`; `letI` → `let` ×2); same run elaborates the two axcheck copies |
| 4 (final) | `pilots/10/logs/m1-run4-final.log` | **OK** | 0 / 0 warnings | none (comment-only donor-line corrections since run 3); run on the committed file, sha256 `8822167f8c18…` |

Each run took a few minutes on Modal (cache present: 8,710 oleans; the runner records no wall
times).

**Final verdict: GREEN.** `Pilot10_M1.lean: OK`, 0 errors, 0 `sorry` warnings, 0 other warnings.
`rg "sorry|native_decide|admit"` → one header-prose line only. 2,043 lines: ~1,330 transcribed
(eth Part A + Host) and ~640 new (Part B space layer + space-annotated host, Part C monitor);
135 non-private theorems + 12 private, 83 defs/structures/classes.

Headline axioms (in-file `#print axioms`, every run since run 2):

    'Groundwork.exists_tm_space'         depends on axioms: [propext, Classical.choice, Quot.sound]
    'Groundwork.exists_tm'               depends on axioms: [propext, Classical.choice, Quot.sound]
    'Groundwork.exists_tm_space_at_time' depends on axioms: [propext, Classical.choice, Quot.sound]
    'Groundwork.exists_tm_space_monitor' depends on axioms: [propext, Classical.choice, Quot.sound]

**Axiom audit (run 3).** `AxPilot10_M1_full.lean` = M1 + `#print axioms` on all 135 non-private
theorems (generator `research/pilots/10/axcheck_full.py`): OK, all 135 resolved; 105 report
axiom sets ⊆ {propext, Classical.choice, Quot.sound} (64 the full three), the rest report none
(run_pilot.py's axiom filter prints those lines only in its output tail); **0 `sorryAx`, 0
axioms outside the standard three**. `AxPilot10_M1.lean` (make_axcheck.py's own output for the
new TARGETS entry `("AxPilot10_M1", PILOTS / "10/M1.lean")`): OK, 70 distinct decls reported,
same result. So the entry added to `make_axcheck.py` runs cleanly in the close-out sweep.

## §M1 theorem map

| Decl | Role |
|---|---|
| `stkLen_update`, `stkLen_stepAux`, `pushes` | one TM2 step grows the total stack content by at most `pushes q` |
| `Frag.growth`, `Frag.step_growth` | per-fragment growth constant (finitely many labels) |
| `RunIn` + `.run/.start/.mono/.trans/.of_run/.iterate` | runs with an invariant on every configuration; `of_run`: growth g ⇒ ≤ start + g·n; `iterate`: every configuration mathlib's iteration reaches is on the run |
| `Frag.RunsB`, `Frag.WithinB`, `Frag.Runs.toB`, `Frag.Within.toB`, `runIn_place`, `run_headB`, `Frag.seq_runsB`, `Frag.loop_runs_exitB/iterB`, `Frag.WithinB.seq/mono/within` | eth's fragment calculus with a stack ceiling, closed under seq and loop |
| `stkLen_withIO_st`, `stkLen_main`, `stkLen_head`, `sum_stk` | stack sizes of the host's five-stack configurations |
| `mainLoop_withinB` | eth's `mainLoop_within` + ceiling L + 5 + growth(body)·(tS L + 3L + 3 + tO L), independent of T |
| `SpaceWithinTM`, `SpaceWithin`, `spaceWithinTM_of_withinB` | dossier 10's predicate; a ceiling on the host's run gives it for every t |
| **`exists_tm_space`** | time (eth) ∧ ∀ t, SpaceWithin N x t (c·(\|x\|+1)^c) |
| `exists_tm`, `exists_tm_space_at_time` | eth's statement verbatim; the dossier's exact shape |
| `Trace`, `Trace.iterate/of_iterate`, `spaceWithinTM_iff_trace` | openai's `Computation.Trace` and the equivalence with the dossier form |
| `LocatedCfg`, `locatedInit`, `LocatedCfg.monitor`, `locatedStep`, `visitedStacks`, `located_high_le`, `visitedStacks_le` | openai's located monitor for stacks (high-water marks), SpaceWithin S ⇒ visited ≤ \|K\|·S |
| **`exists_tm_space_monitor`** | the headline in openai's per-prefix monitor form |

## §Next milestones

- **M2 = L1** (counter combinators `rngC/sumFC/capC` + agreement with eth's `rng/sumF/cap` when
  the cut-offs are inactive, prework §5). Independent of M1; mathematical, not machine-level.
- **M3 = L2** (PolyTVal certificates over the counter combinators) — the hard layer. M1's
  `Frag.Runs.toB` already says that *any* fragment uses at most start + growth·steps cells; what
  L2 must add is that the counter-based fragments run on *poly-size words* (value-bounded loops),
  so that `exists_tm_space`'s hypothesis `S ≤ (|x|+2)^d` holds for the counter-`padM`.
- Assembly then = counter-`padM'` + L2 + `exists_tm_space` in place of `exists_tm` inside
  `exists_tm_padded`; the time half is unchanged because `exists_tm_space` is about eth's machine.
