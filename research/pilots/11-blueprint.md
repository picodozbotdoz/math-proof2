# Pre-pilot blueprint — dossier 11 (z1-composable-reduction-theory), milestone 1

Lane R4, 2026-11-09. Scope: milestone-1 statement-file spec (`Red` calculus + composition
theorem + abstract Theorem-19 instance, S-sized, sorry-free), port inventory (verified:
the abstract core needs **zero proof ports** but one ~200-LoC arithmetic tranche),
Modal plan consuming R9's `crossmath-probe` infra, milestones 2–3 sketches, risk
register, decl-index errand. Everything below is a plan — **no builds were run**.
Companion docs: `research/candidates/11-z1-composable-reduction-theory.md` (statement +
F0–F6), `research/bridges/complexity.md` §4 Z1, `research/feasibility/port-probe.md`
(R9 round 2 — probe infra + warm-run cost), `research/pilots/01-blueprint.md` (format
source; its `research/pilots/01/` statement dir does **not** exist yet, so the
convention followed here is blueprint-01's own: statement-spec with step-comments, not
`sorry`; probe twins carry the sorries and never land in the pilot repo).

---

## §1 Port inventory for milestone 1

**Corpus:** `/home/doz/zcode-workdir/anthropics_formal-math/3sum-apsp` (read-only;
built on Lean v4.33.1; target toolchain v4.36.0-rc2 per encore checkout `ff2494ea`,
R9 §0). R9's `ProbeB3_3sumEnd.lean` already elaborated `EndStatement.lean` verbatim
against v4.36 with **0 errors, 0 warnings** (`research/feasibility/port-probe.md` §3)
— the module header survives, so transcriptions below keep `module` headers if built
in-tree, drop them if standalone.

Milestone 1 needs three tranches (LoC by `wc -l` + read this session):

**T1 — statement transcriptions (verbatim, ~90 LoC, zero proofs).** All Prop-valued
defs over ℝ/ℕ with no Mathlib beyond `Real.log`/`Real.sqrt`:

| Def | Donor loc | LoC | Notes |
|---|---|---|---|
| `DetTimeModel` (9 problem fields) | `ThreeSumApsp/TimeClaims/Sec3/Definitions.lean:75–101` | ~27 | verbatim; only the 4 fields the instance needs are exercised (`lopDetect`, `lopCount`, `exactTriangle`), keep all 9 for M3 |
| `wantedBound` | same file `:114–115` | 2 | `w·D^{0.437} + n²/D^{0.063}` |
| `Claim.Theorem_17` | `:192–199` | 8 | the reduction being abstracted; carries `MM`, `D`, `g` as parameters |
| `Claim.Corollary_16` | `:295–298` | 4 | callee-side claim |
| `Claim.Theorem_19_explicit` | `:305–308` | 4 | target instance statement |
| `termScans`/`termPrime`/`termBuild` | `ThreeSumApsp/Sec3/Parameters.lean:61,~66,~70` | 6 | `termPrime MM n D = MM n · D^{3/2}` [VERIFIED def; exact line of `termPrime` read at Parameters.lean via rg this session] |
| `queryCap`, `strassen`, `paramD₂₆`, `paramG₂₆` | `Sec3/Parameters.lean` (95 LoC total file) | ~12 | `strassen n = n^{log₂7}` |

**T2 — arithmetic tranche (verbatim proofs, ~200 LoC).** The instance theorem's
numeric content, all `norm_num`/`field_simp`/`linarith`-level ℝ lemmas:

| Lemma | Donor loc | Role |
|---|---|---|
| `Theorem19.choice_corollary_26` | `ThreeSumApsp/Sec3/Theorem19.lean:91–99` | D = ⌊n^{1/18}⌋, g = ⌈D^{0.0315}⌉ choice facts (`Choice` structure) |
| `Theorem19.exists_total_le` | same file (above :100; the η-balance master lemma behind both totals) | general g = D^η balancing |
| `Theorem19.total_corollary_26` | `:130–145` | 4ng·(a·n²/D^{0.063}) + b·(terms) ≤ C(a+b)κ n^{3−0.00175} log n |
| `time_le_of_calls`, `call_cost_corollary_16` | `ThreeSumApsp/TimeClaims/Sec3/Theorem19.lean` (glue used at :120–125) | one-call cost + summation glue |

Drift risk for T2: `Real.log_natCast_nonneg`, `pow_le_pow_left₀`, `le_self_pow₀`,
`Real.four_le_sqrt_natCast_of_sixteen_le` — all present in v4.36 (R9 probe A/B sweeps
found zero notation/API drift at statement level; proof-level `norm_num` shapes are the
residual risk, cf. port-probe.md §3 caveat). **No eth port is needed for milestone 1**
(the TM2 realization is milestone 2); **no `Light`-language port either** — milestone 1
is purely propositional. This confirms, more precisely than the dossier's "S-sized":
*T1+T2 ≈ 290 LoC transcribed + ~200 LoC new (§2) = ~500 LoC total.*

## §2 Milestone-1 statement-file spec

One file, proposed `CrossMath/Pilot11/Red.lean`, importing T1/T2 transcripts. New
namespace `CrossMath.RedCalc`; donor namespaces verbatim (`ThreeSumApsp` kept so the
transcribed claims are character-identical statements).

**Design decision — record, not inductive.** `Red` is a `structure` of data
(`β`, `calls`, `extra`, one Prop field), mirroring the corpus's `Claim.*` ∃-shape
(`∃C, ∀T, M.lopDetect T → ∃T', …`): a reduction here is a *witnessed transfer*, not a
derivation. An inductive `Red` (derivation system) would double-abstract against the
operational side and buys nothing until milestone 2, where the operational semantics is
3sum-apsp's `Light` `Ends` relation — not a `Red` induction. Heterogeneous parameter
types (callee times `ℕ→ℕ→ℕ→ℝ` vs caller times `ℕ→ℝ→ℝ`) are handled by two type
parameters `π ρ` with a total map `β : π → ρ`, exactly how `Claim.Theorem_17` fixes
`(n, u) ↦ (n, D n, queryCap n (D n))` implicitly.

```lean
/-
  CrossMath/Pilot11/Red.lean — MILESTONE 1 STATEMENT SPEC.
  Spec only: `:= by` bodies below are step-comments, not proofs, not sorry.
  Tranches T1 (defs) + T2 (arithmetic) transcribed verbatim from
  3sum-apsp (namespaces kept); everything in CrossMath.RedCalc is new.
-/
import CrossMath.Pilot11.Transcript            -- T1 + T2 (§1)

namespace CrossMath.RedCalc

open ThreeSumApsp                              -- DetTimeModel, Claim.*, termScans/Prime/Build

/-- A call-charged reduction from problem `A` (params π) to problem `B` (params ρ):
    `shape` fixes callee parameters, `calls`/`extra` are the per-instance call count
    and additive overhead (dossier 11, Thm A). `H` is the partiality guard — the corpus
    claims assert nothing where the parameter hypotheses fail ("Where the hypotheses
    on D n and g n fail, nothing is claimed", TimeClaims/Sec3/Definitions.lean:189). -/
structure Red {π ρ : Type} (A : (π → ℝ) → Prop) (B : (ρ → ℝ) → Prop)
    (β : π → ρ) (calls extra : π → ℝ) (H : π → Prop) : Prop where
  C : ℝ
  C_nonneg : 0 ≤ C
  transfer : ∀ T, B T → ∃ T', A T' ∧ ∀ p, H p →
    T' p ≤ extra p + calls p * T (β p) + C

/-- **Theorem A (composition — "calls multiply, extras add").** Binder-exact:
    the composed guard is H₁ ∩ (H₂ on shaped params); the composed bound evaluates the
    inner reduction at the shaped parameters of the outer one. -/
theorem Red.comp {π ρ σ : Type} {A : (π → ℝ) → Prop} {B : (ρ → ℝ) → Prop}
    {Cc : (σ → ℝ) → Prop} {β₁ : π → ρ} {β₂ : ρ → σ}
    {calls₁ extra₁ : π → ℝ} {calls₂ extra₂ : ρ → ℝ} {H₁ : π → Prop} {H₂ : ρ → Prop}
    (r₁ : Red A B β₁ calls₁ extra₁ H₁) (r₂ : Red B Cc β₂ calls₂ extra₂ H₂) :
    Red A Cc (β₂ ∘ β₁) (fun p => calls₁ p * calls₂ (β₁ p))
      (fun p => extra₁ p + calls₁ p * extra₂ (β₁ p))
      (fun p => H₁ p ∧ H₂ (β₁ p)) := by
  -- STEP 1: obtain r₂'s witness T₂' from r₂.transfer applied to r₁'s inner T_B.
  -- STEP 2: obtain r₁'s witness at T_B := T₂' — gives T_A with
  --         T_A p ≤ extra₁ p + calls₁ p * T₂' (β₁ p) + C₁  for H₁ p.
  -- STEP 3: bound T₂' (β₁ p) ≤ extra₂ (β₁ p) + calls₂ (β₁ p) * T_C (β₂ (β₁ p)) + C₂
  --         from r₂ at p' := β₁ p (needs H₂ (β₁ p)); substitute into STEP 2.
  -- STEP 4: collect: C := C₁ + 0 — no new constant needed because C enters linearly
  --         in both; monotone widening of C absorbs β-image variation. Close by
  --         nlinarith [STEP2, STEP3] / ring_nf; linarith.
  sorry_spec_step_only

/-- Lifting `Claim.Theorem_17` into the calculus (shape lemma, M1 scope: one route). -/
theorem red_of_theorem_17 (M : DetTimeModel) (MM : ℕ → ℝ) (D g : ℕ → ℕ) :
    Red M.exactTriangle M.lopDetect
      (fun p => (p.1, D p.1, queryCap p.1 (D p.1)))
      (fun p => 4 * (p.1 : ℝ) * (g p.1 : ℝ))
      (fun p => C_omitted p)          -- extra := C·(n²/√D + termScans + termPrime + termBuild),
      (fun p => 16 ≤ D p.1 ∧ D p.1 ≤ p.1 ∧ 1 ≤ g p.1 ∧ (g p.1 : ℝ) ≤ Real.sqrt (D p.1)) :=
  -- STEP: unfold Claim.Theorem_17 (Definitions.lean:192–199); the C there becomes
  -- Red.C; read the extra term off the two summands. 1 = routine.
  sorry_spec_step_only

/-- Lifting `Claim.Corollary_16` (callee side; lopCount part unused, keep Td). -/
theorem red_of_corollary_16 (M : DetTimeModel) :
    Red M.lopDetect (fun _ => True) β16 c16 e16 H16 := by
  -- STEP: Corollary_16 gives BOTH lopCount and lopDetect bounds (Definitions.lean:295–298);
  -- the calculus instance uses the lopDetect half; the constant C₁₆ becomes calls/extra
  -- degeneration (callee is a solved claim, i.e. Red to the trivial problem).
  sorry_spec_step_only

/-- **Instance (milestone-1 acceptance theorem)**: Theorem 19's route as one calculus
    composition, hypotheses in implication form (the corpus's own conditional-lemma
    style, cf. ConditionalTimes "implications between running-time claims"). -/
theorem theorem19_explicit_of_red (M : DetTimeModel)
    (h17 : Claim.Theorem_17 M strassen paramD₂₆ paramG₂₆)
    (h16 : Claim.Corollary_16 M) :
    Claim.Theorem_19_explicit M 0.00175 1 := by
  -- STEP 1: r₁ := red_of_theorem_17 …; r₂ := red_of_corollary_16 ….
  -- STEP 2: rc := r₁.comp r₂ — the composed Red for exactTriangle with
  --          calls = 4ng·c₁₆-shape, extra = termScans+termPrime+termBuild+… .
  -- STEP 3: discharge the composed guard at each n via Theorem19.choice_corollary_26
  --          (T2); obtain T' n u ≤ (2C₁₆ + C)·n²/D^{0.063}·4ng + C·(terms).
  -- STEP 4: apply transcribed Theorem19.total_corollary_26 (T2) with
  --          a := 2C₁₆ + C, b := C — exactly the donor's use at
  --          TimeClaims/Sec3/Theorem19.lean:113–125, now routed through Red.comp
  --          instead of the hand-glued obtain-chain.
  sorry_spec_step_only

end CrossMath.RedCalc
```

Spec-level caveats (resolve when writing the real file): (i) `Red.comp`'s constant: the
two witnesses carry `C₁, C₂`; the composed `C` is `C₁ + (sup over shaped params of
calls₁·C₂)` — on the corpus shapes `calls₁` is unbounded in `κ`, so the honest composed
statement must either take `C` as `C₁ + calls₁max·C₂` under a bounded-calls side
condition, or (cleaner, chosen above) let `Red.C` be *parameter-constant only* and push
`calls·C` into `extra` at the two corpus instances — decide by elaborating both;
(ii) `red_of_corollary_16`'s degenerate callee `(fun _ => True)` avoids introducing a
"zero problem"; alternative is a `Red` with the lopDetect claim on the right and T
instantiated at the explicit bound — take whichever needs fewer transcript defs;
(iii) the `p : ℕ × ℝ` parameter type for exactTriangle must match
`Claim.Theorem_19_explicit`'s `(n : ℕ) (κ u : ℝ)` binder order — transcribe, don't
re-currl. (iv) Prop-valued defs + `#check` probes per R9's probe style: the elaboration
twin `ProbeC_Red.lean` carries the sorries; `Red.lean` itself ships sorry-free
step-comments only until the real proofs land (then the comments are deleted).

**Acceptance test (regression anchor):** `theorem19_explicit_of_red` must have
*exactly* the type of donor `Theorem19.explicit_of_theorem_17_corollary_16`
(`TimeClaims/Sec3/Theorem19.lean:107–109`) — same hypotheses, same conclusion — so the
donor theorem is literally re-derived through the calculus. A `#print axioms` check on
the final file must show only `[propext, Classical.choice, Quot.sound]`.

## §3 Modal pilot plan (consumes R9's crossmath-probe infra)

Infra as measured in `research/feasibility/port-probe.md` §1: app `crossmath-probe`,
image bake ≈ 3 min 45 s cold (shared elan layer; `cache get` fetched 9096 olens for
`ff2494ea`), **warm run ≈ 68 s end-to-end**; container 4 CPU/32 GiB, `lake env lean
<file>` elaboration against warm olens; staging via `research/feasibility/probe/
run_probe.sh` (xyz-owned modal CLI, ephemeral, no volumes).

- **Phase (a) — statement elaboration (days 0–1):** add `ProbeC_Red.lean` (T1+T2
  transcripts + §2 signatures with `sorry` bodies, probe-authorized, never committed) to
  `research/feasibility/probe/`; one warm Modal run: **~2–4 min wall** (68 s overhead +
  elaboration of ~500 LoC with light tactics). Gate: 0 errors; the 4 §2 caveats
  resolved at the elaboration level (both `Red.comp` constant designs elaborated).
- **Phase (b) — T2 arithmetic compile (days 1–3):** transcript file with real donor
  proofs; per-file `lake env lean`: choice/exists_total_le ≈ 1–3 min each, totals +
  glue ≈ 2–5 min each → **~10–20 min machine-time clean; budget 2 h** for 2–3
  simp-drift fix cycles (the only v4.33→v4.36 exposure of milestone 1).
- **Phase (c) — new proofs (days 3–7):** `Red.comp` + 3 shape/instance lemmas,
  ~200 new LoC: each full pass **~5–15 min machine-time**; expect 3–6 cycles →
  **budget 3–4 h machine-time across ≤ 2 days calendar**.
- Check discipline: `lean_check`-style per-target builds, telemetry/memory capture,
  64 GiB investigation rule (not expected to trigger — no `decide`, no heavy `nlinarith`).
- **Milestone-1 total budget: ≤ 1 week calendar, < 8 h Modal machine-time.**

## §4 Milestones 2–3 (sketch, per-milestone LoC)

- **M2 — TM2 realization (Theorem B(ii), ~1.5–2.5k LoC, effort M):** port eth
  `ToTuring/` interface tranche — R9's port-probe.md §4 grades the full 46-file port
  M, but the realization needs only: `PolyT` + closure lemmas (`PolyT.lean:54–94`,
  self-contained per its import line), `Stepped`/`Runs`
  (`statements/StepMachineStatements.lean:33,73–80`), `exists_tm`
  (`ToTuring/Machine/Host.lean:305–309`), `Wrap.CodingExists` — ≈ 10-file slice.
  New content: `Tm2Model : DetTimeModel-to-CostModel realization` with three closure
  proofs (monotone = time-widening wrapper; choice = size-branching fragment; charging
  = fragment gluing with per-call clocks). Probe first: extend `ProbeB2_EthTime.lean`
  (already elaborates the eth time shapes clean) with `exists_tm`'s statement.
- **M3 — CH20∘VW13 instantiation (~300–600 LoC, effort S–M):** in-tree on vendored
  3sum-apsp (uses `Light.lightModel` + `Claim.CH20_Theorem_5_1` +
  `Claim.VW13_Theorem_4_3` + the `ChanHe.reduction_correct` program, which the pilot
  does not re-port); new content = the two `Red`-lifts + `Red.comp` + the composed
  statement matching `theorem_21a_compose`'s NOTE-carried `N^{3/2+o(1)}` term
  (`PaperStatements.lean`, NOTE at `Theorem_21a_compose`).

## §5 Risk register (top 5, with mitigations)

1. **`Red.comp`'s constant algebra under unbounded `calls`.** The corpus `calls`
   (4ng) is unbounded in the parameters, so `calls₁·C₂` is not absorbed by a constant.
   **Mitigation:** push multiplicative constants into `extra` at lift time (§2 caveat
   (i), second design); elaborate BOTH designs in phase (a) before committing — this is
   the one place the "calls multiply, extras add" slogan needs a precise convention.
2. **T2 simp-drift v4.33→v4.36** (`norm_num`/`field_simp` shapes on `Real.log`/
   `pow_le_pow_left₀`). **Mitigation:** phase (b) is isolated before any new math;
   drift surfaces in ≤ 5 lemmas; per-lemma `lake env lean` per port-probe method.
3. **Parameter-type friction** (π = ℕ × ℝ vs curried `(n : ℕ) (κ u : ℝ)` binders;
   `Fin`-vs-ℕ casts in `queryCap`). **Mitigation:** transcribe donor defs verbatim
   (never re-currl); lifts do the (un)currying once, in `red_of_theorem_17`.
4. **The partiality guard `H` composition** — guard conjunction `H₁ ∧ (H₂∘β₁)` must
   be *dischargeable* at the instance (choice lemmas give exactly `16 ≤ D ∧ D ≤ n ∧ …`).
   **Mitigation:** `choice_corollary_26`'s `Choice` structure fields are named after
   the conjuncts (T2) — the discharge is field-wise; verify in phase (a) by elaborating
   the guard against the `Choice` structure.
5. **Module-system friction** (3sum-apsp's `module`/`public import` vs pilot package).
   **Mitigation:** ProbeB3 proved module headers survive verbatim elaboration; for the
   standalone pilot drop `module` and keep plain `import`s (statement-only files have
   no cross-module `@[expose]` needs).

## §6 Sanity errand — decl-index verdict (mirrors blueprint-01 §5)

`research/qa/decl-index.tsv` (2,888,273 rows; landed 2026-11-09 ~18:39, after dossier
11 was written). Retroactive check this session: name-probes
`\t(def|theorem|structure)\t(Red|RedComp[^\t]*)\t` → **0 rows**; `CostModel` → 0 rows;
broader `[Rr]ed[A-Z]` prefix → 6 rows, all unrelated (`eth …/SparsifyProg.lean
theorem redP_eq`; openai `ReesReduction.lean def redEval/redValues`,
`Hypercube.lean def redCrossCopy`, `Logspace/EstimatorInstructions.lean def redV`,
`Congruence/ProStability.lean def redMap`). Donor rows confirmed present:
`openai-math / ComparatorChallenges/SubexponentialSAT.lean / def / visitedSpace` and
the library pair `SqrtLogSpace/VisitedTape.lean` (`visitedSpace_mono`,
`visitedSpace_le_of_envelope` — noted for dossier 10's prework). No pilot-11 name
collisions; no dossier-11 edits required. Incidental finding for triage: openai has a
39-file `OAI/Computability/Logspace/` project ("Exact Derandomization of Logarithmic
Space: L = RL = BPL", per `CatalyticComparison.lean` header) — adjacent
space-complexity machinery relevant to dossier 10, flagged for lane R8's round-2.

---

## §7 M1 run log (executed 2026-11-09, lane R4)

**Infrastructure.** `research/pilots/11/pilot11_probe.py` + `run_pilot11.sh` (this
directory), mirroring R9's `crossmath-probe` (same app name/image bake → shared layers;
`MATHLIB_REV=ff2494ea`, toolchain v4.36.0-rc2, 8710 warm olens; compile =
`LEAN_PATH=<p11>:<mathlib> lean -o X.olean X.lean` per file in dependency order:
P11T1 → P11T2 → RedCompA ∥ RedCompB). 13 warm Modal runs, ~19:25–19:58 local
(≈ 2–3 min per run end-to-end incl. 68 s warm-start overhead — within the §3 budget).
Run URLs (ephemeral, stopped): run 1 `…/ap-2ULRCmNVBZq9L4WZGpPaOG` … final
`…/ap-VjYV851PrTUdnV2bx7yXRD` (last URL per run in `/tmp/pilot11-run{1..13}.log`).
Raw transcripts preserved at `/tmp/pilot11-run*.log` (host-local; the salient lines are
reproduced below).

**Tranche statuses (final run 13): all four files OK, 0 errors, 0 sorry-warnings.**

| File (research/pilots/11/) | LoC | Status | Content |
|---|---|---|---|
| `P11T1.lean` | 95 | OK since run 1 | T1 statement transcript (Defs verbatim) |
| `P11T2.lean` | 349 | OK since run 1 | T2 arithmetic port **with proofs** + the donor reference theorem `ThreeSumApsp.Theorem19.explicit_of_theorem_17_corollary_16` compiled VERBATIM against the transcript — the port-faithfulness check passed on the first attempt |
| `RedCompA.lean` | 173 | OK run 13 | Design A: `Red` (∃-encoded constant) + `Red.comp` + lift + acceptance instance |
| `RedCompB.lean` | 164 | OK run 8 | Design B: `Red` (no constant field) + `Red.comp` + lift + acceptance instance |

**Iteration history (errors → fix):**

| Run | A / B errors | Root causes fixed next |
|---|---|---|
| 1 | 10 / 10 | calc step needed `add_le_add_*` side flip; `noncomputable` on `beta17`/`extra17`; `MM : ℕ → ℝ` signature in `extra17`; `Pi.zero_apply` before `mul_zero` |
| 2 | 6 / 5 | **A: Prop-structure cannot carry data field `C : ℝ`** → ∃-encoded; `positivity` does not unfold `calls17` → `simp only [calls17]; positivity`; r₂ witness metavariable → `intro T` |
| 3 | 6 / 4 | `gcongr` bullet mismatch → `linarith [mul_le_mul_of_nonneg_left …]`; A-instance `rcomp.transfer` is an ∃ |
| 4 | 6 / 3 | `simp only [Function.comp]` no-progress in A-comp → plain `ring`; A-instance transfer destructuring |
| 5 | 7 / 3 | A `extra17` def had drifted to the B-version (double term); B `zero_mul` (not `mul_zero`!) for `0 * T q`; guard `omega` cannot see inside `Choice` structure → `have h16 := P.sixteen_le` first; `hD1` via `(1 ≤ 16).trans P.sixteen_le` |
| 6 | 3 / 3 | `ring_nf [Pi.zero_apply]` illegal in `linear_combination` norm → `simp only` then `exact` |
| 7 | 3 / 1 | A ∃-witness `le_rfl` on metavariable → flat anonymous constructor |
| 8 | 3 / **0 (B OK)** | — |
| 9–10 | 3 / 0 | A `⊢ 0 ≤ 0` residue from `linear_combination (norm := ring_nf)` (elaboration quirk) |
| 11–12 | 2→1 / 0 | A `key`/t₁/lift switched to `linarith`-chain / `hbound.trans_eq (by ring)` |
| 13 | **0 / 0** | — |

**Design verdict — DESIGN B WINS** (as predicted, blueprint §5 risk #1), on four
recorded grounds, in ascending severity:

1. *A's lift instantiates its constant at 0 anyway* — `Claim.Theorem_17`'s `C` multiplies
   parameter-dependent factors, so it must ride in `extra` in both designs.
2. *A's Prop-structure with a data field is illegal* (run-2 elaborator rejection);
   the ∃-encoding is the workaround.
3. *A's composed constant cannot be stated in closed form* — with unbounded `calls₁`,
   the `calls₁ · C₂` correction is a parameter function; A's `Red.comp` must conclude
   `∃ ecorr, Red … (fun p => e₁ p + ecorr p) …`, B's concludes the closed form
   `(fun p => e₁ p + c₁ p * e₂ (β₁ p))`.
4. *A's ∃-packaged constant blocks opaque composition* — the composed bound mentions
   the opaque inner constant, so A's acceptance instance must unroll both transfers
   with literal constants (same algebra as `Red.comp`, but not through the lemma);
   B's instance consumes `Red.comp` as a black box (`rcomp.transfer` directly).

**Acceptance test: GREEN (both designs).**
`CrossMath.RedB.theorem19_of_red` (and A's twin) has exactly the donor's type —
`(M : DetTimeModel) → Claim.Theorem_17 M strassen paramD₂₆ paramG₂₆ →
Claim.Corollary_16 M → Claim.Theorem_19_explicit M 0.00175 1` — with the
Theorem-17/Corollary-16 combination routed through `Red.comp` (B) / `Red.comp`'s
algebra with literal constants (A), against the donor reference theorem compiled in
`P11T2.lean`. Kept artifacts contain **no `sorry`**.

**`#print axioms` (final run):**

    'ThreeSumApsp.Theorem19.explicit_of_theorem_17_corollary_16'
      depends on axioms: [propext, Classical.choice, Quot.sound]
    'CrossMath.RedA.Red.comp'
      depends on axioms: [propext, Classical.choice, Quot.sound]
    'CrossMath.RedA.theorem19_of_red'
      depends on axioms: [propext, Classical.choice, Quot.sound]
    'CrossMath.RedB.Red.comp'
      depends on axioms: [propext, Classical.choice, Quot.sound]
    'CrossMath.RedB.theorem19_of_red'
      depends on axioms: [propext, Classical.choice, Quot.sound]

No `sorryAx` anywhere; the three axioms are mathlib's standard triad (same as the
donor corpus's own audit standard).

**Budget reconciliation.** Blueprint §3 phase (a) estimated 2–4 min/elaboration-run —
matched. Phase (c) budgeted 3–6 proof cycles; actual: 12 proof iterations (runs 2–13),
overwhelmingly consumed by Design A's ∃-constant packaging (B alone converged in 7;
B-only budget would have fit). Machine-time total ≈ 13 × 2.5 min ≈ 35 min Modal
(warm), < 8 h budget respected with 15× margin. Total new LoC landed: 781 (vs ~500
estimated: the delta is T2's full donor-proof tranche, 349 LoC, included as the
faithfulness check — worth it: it validated the port on the first compile).
M1 milestone: **COMPLETE**; next: M2 (TM2 realization, §4) unchanged.

---

## §8 M2 run log (executed 2026-11-14, lane A8-relaunch, resumed after outage)

**Context.** The 2026-11-13 outage killed the previous A8 agent mid-application of
"four pinpoint fixes"; no M2 run had landed. Relaunch static audit found (a) and (b)
and (c) applied, (d) HALF-applied (statement + call site carried `hk`, proof body was
still the old length-form body: `ih h2 hk` mistypes in the cons case and the final
`omega` is unprovable from the k-form `ih` — re-proved via `clear hk` + inner
length-form induction + `Nat.mul_le_mul_right`), plus one genuine elaboration error
never reached by the dead agent (`hsomeCons`'s type annotation was ill-typed; rebuilt
with `hsfOpt` + `comp`-routing for `hstart`).

**Files.** `P11T3.lean` (1,100 LoC / 88 thms, eth machine-model tranche — Tree, Run,
Frag, Stacks, Bound, StepMachineStatements, Prog/Stepped, Prog/Comb, Enc, EncLemmas,
PolyT; two documented v4.36 deviations) and `RedTm2.lean` (421 LoC / 8 thms: Tm2Sol +
mono closure; EthExistsTm/EthPoly/EthIsPoly interface binders; tm2_choice;
suffix-walk + tm2_charging; composed_sum_le + tm2_realized_composed acceptance).

**Iteration (runs 1–8, all logs in `research/pilots/11/logs/m2-run{1..7}.log`,
`m2-run8-GREEN.log`, full axcheck in `m2-axcheck-final.log`; every log run-time
persisted with a provenance header within ~2 min of its run — none reconstructed).**
Error counts 4→2→3→6→3→2→2→0 — the churn is an artifact of hard elaboration errors
aborting whole declarations: each fix let elaboration proceed further and expose the
NEXT class (none of the intermediate rises were regressions). Root causes fixed, in
order of first appearance:

| Class | Sites | Fix |
|---|---|---|
| stuck `Enc ?β` on `hPoly.id'` (the interface field's β binder is statement-unused) | hp, htail, pid1/2/3 plumbing | explicit `(α := …) (β := …)` named args |
| `sum_sf` rw-residue (`(q :: t).headD []` not closed by rw's auto-rfl) | sum_sf | explicit trailing `rfl` |
| omega atom mismatch (`(q :: l).length * (Tn+1)` ≠ `(l.length+1) * (Tn+1)` for omega) | composed_sum_le | `List.length_cons` into the simp set |
| anonymous-constructor order (`∃ c : ℕ, Tm2Sol …` → `⟨c, N, witness⟩`) | both refines | reorder |
| `ite_runs_true/false` conclusion-only machine binders uninferrable + `ite`-vs-`branch` defeq not firing at application transparency | tm2_choice | `branch_runs_inl/inr` with `(M₁/M₂ := …) (a := x) (x/y := x)` and the sel in PREDICATE form `fun y => decide (y.length < n₀)` — this is the completed fix (b) |
| `Nat.pow_le_pow_right` v4.36 signature `(0 < base)` then exponent-bound; expected-type unification stuck on non-syntactic-pow LHS | tm2_choice hS ×2 | calc via `pow_succ` + pow-form statement |
| deprecated `if_pos` + bound-variable mismatch (ite under un-beta-reduced `T x`) | tm2_choice ×2 | `show` (beta) + `split` |
| higher-order pattern unification failures (`?f p.1 p.2.1 p.2.2` vs concrete lambdas) | listCases, foldWhile_runs | `(f := …)` / `(g := …) (c₀ := …)` named |

**Final verdict (run 8, m2-run8-GREEN.log): all six files OK — P11T1, P11T2, P11T3,
RedCompA, RedCompB, RedTm2; 0 errors, 0 sorry-warnings.** P11T3 (the whole eth
machine-model tranche with donor proofs) compiled GREEN on its FIRST run — the
corpus-wide "statement-port cost ≈ 0" finding extends to this definitional slice at
proof level. Full-coverage axcheck (`run_axcheck.sh AxPilot11_P11T3 AxPilot11_RedTm2`):
**76 axiom-lines, 0 sorryAx, every line a subset of [propext, Classical.choice,
Quot.sound]** (RedTm2 acceptance theorems: Tm2Sol.mono/tm2_choice/tm2_charging/
tm2_realized_composed full triad; composed_sum_le [propext, Quot.sound]; walk lemmas
orbit_sf/sum_sf [propext]; map_headD_sf axiom-free).

**M2 milestone: COMPLETE** (Theorem B(ii) at pilot grain: monotone/choice/charging
closures proved on Mathlib's own TM2 via the eth interface binders; the composed
calculus bound `c·(calls·T + calls + 1)·(|x|+1)^c` realized by ONE TM2 machine).
Machine-time: 8 pilot runs + 1 axcheck run ≈ 9 × 2.5 min ≈ 23 min warm Modal.
M3 (CH20∘VW13 instantiation) remains per §4, unchanged.
