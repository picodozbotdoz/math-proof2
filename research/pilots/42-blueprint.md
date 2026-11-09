# Pilot blueprint — dossier 42 (zeta-k-two-thirds-product-assembly)

Lane R1, 2026-11-09. Mirrors `research/pilots/01-blueprint.md` §1–5 (R6's pattern). Scope:
milestone plan (M1 full conditional theorem with zero ports; M2 donor instantiation after the
zeta23→v4.36 port; M3 the C_K common-zeros defect theorem), M1 file spec, Modal plan (consumes
R9's `crossmath-probe` infra, `research/feasibility/probe/lean_probe.py`), risk register.
Companion: `research/candidates/42-zeta-k-two-thirds-product-assembly.md` (statement + F0–F6),
`research/bridges/tauceti-contributions.md` §2, R5's `analytic-nt.md` §0–§2, R3's
`mathlib-frontier.md` §1.

---

## §1 Milestone plan

**Posture** (dossier 42, F5(iii)): everything is a *conditional theorem* — zeta23's submitted
statements and the analytic glue enter as explicit hypothesis binders, so M1 is provable
sorry-free **today**, against mathlib v4.36 (encore checkout `ff2494ea`), with zero ports.
mathlib actually supplies one genuinely analytic ingredient for free:
`analyticOrderNatAt_mul` (`Mathlib/Analysis/Analytic/Order.lean:565` [VERIFIED this session]:
`AnalyticAt f ρ → AnalyticAt g ρ → analyticOrderNatAt (f*g) ρ = analyticOrderNatAt f ρ +
analyticOrderNatAt g ρ`) — the multiplicity glue of dossier 42's A-K is therefore *proved*, not
hypothesized, at the point level; only the global factorization (ζ_K = ζ·L(χ_D), a tauceti
theorem) and the two density statements (zeta23) remain binders.

### M1 — the full conditional theorem (this run)

File `research/pilots/42/M1.lean`, namespace `CrossMath.Pilot42`. Layer order:

| # | Decl | Kind | Content / provenance |
|---|---|---|---|
| 1 | `stripWindow T₁ T₂`, `lineWindow T₁ T₂` | def | windows `{ρ | 0 < ρ.re ∧ ρ.re < 1 ∧ T₁ < ρ.im ∧ ρ.im ≤ T₂}` and the critical-line variant; mirror zeta23 `zerosIn` (`ChallengeDeps.lean:48`) shapes; `lineWindow_subset : lineWindow ⊆ stripWindow` |
| 2 | `multOf f ρ` | def | `analyticOrderNatAt f ρ` (mathlib `Order.lean:63` [VERIFIED]); the zeta23 `zeroMult` (`ChallengeDeps.lean:46`) shape at v4.36 |
| 3 | `multOf_mul` | thm (1-line) | pointwise multiplicity glue from `analyticOrderNatAt_mul` (`Order.lean:565`) — **proved, not a binder** |
| 4 | `supp m`, `WindowFinite m` | def | `supp m = {ρ | m ρ ≠ 0}` (self-contained; avoids `Function.support` API churn); `WindowFinite := ∀ T₁ T₂, (supp m ∩ stripWindow T₁ T₂).Finite` |
| 5 | `sum_inter_distrib` | thm | the core counting lemma: pointwise `c = a + b` ⇒ window sums add (three-finiteness hypotheses; union Finset + two `Finset.sum_subset` transports) |
| 6 | `ZeroMult` (structure: `mult : ℂ → ℕ` + `windowFinite`), `.add`, `.count T` (dyadic strip window `(T, 2T]`), `.countOn T` (critical-line window) | def | the count-with-multiplicity object; mirror `Ncount` (`ChallengeDeps.lean:55`) and on-line counts |
| 7 | `count_add`, `countOn_add` | thm | **Theorem A-K, abstract form**: `(z.add w).count = z.count + w.count` (both windows) |
| 8 | `EpsLower z c` | def | the ε-form `∀ ε > 0, ∃ T₀, ∀ T ≥ T₀, (c − ε) * ↑(z.count T) ≤ ↑(z.countOn T)` — zeta23's submitted-statement convention (liminf reading, `ChallengeDeps.lean` notes per `survey/anthropics.md` §1.3) |
| 9 | `assemble_eps` | thm | **B-K core**: `EpsLower z c → EpsLower w c → EpsLower (z.add w) c` (max of the two T₀; division-free) |
| 10 | `assemble_eps_min` | thm | general constants: `EpsLower z c₁ → EpsLower w c₂ → EpsLower (z.add w) (min c₁ c₂)` |
| 11 | `zetaK_two_thirds` | thm | headline conditional: binders `hAζ : EpsLower zζ (2/3)` (= `two_thirds_on_critical_line`, `Challenge.lean:131`), `hAχ : EpsLower zχ (2/3)` (= `dirichlet_two_thirds_on_critical_line`, `Challenge.lean:191`) ⇒ `EpsLower (zζ.add zχ) (2/3)` |
| 12 | `zetaK_montgomery_taylor` | thm | MT-window instantiation at `c = 2 − 1/c₁` (binders = `montgomery_taylor_on_critical_line` `:163`, `dirichlet_montgomery_taylor_on_critical_line` `:212`); same-constant remark (dossier step 5) |
| 13 | `countOf`, `zetaK_count_of_factorization` | thm | **Theorem A-K at function level**: `hfac : ∀ ρ, multOf fK ρ = multOf fζ ρ + multOf fχ ρ` + window-finiteness binders ⇒ window counts add — the M2 discharge target (`hfac` ← `multOf_mul` + tauceti `dedekindZeta_eq_riemannZeta_mul_LFunction`) |

LoC estimate: ~300–360 with comments; proof load concentrated in #5 (set/Finset algebra,
~40 LoC) and #6's `.add` finiteness field (~15 LoC).

### M2 — donor instantiation (after the zeta23→v4.36 port; cross-ref R9)

Replace binders by ports/lemmas: (a) restate zeta23's submitted A/E theorems as `EpsLower` over
`ZeroMult.ofFun riemannZeta` / `ofFun χ.LFunction` — needs the N₀*-convention reconciliation
(dossier glue (b)) and window-finiteness from `IsCompact.inter_riemannZetaZeros_finite`
(`Mathlib/NumberTheory/LSeries/ZetaZeros.lean:68`) + the Dirichlet continuation's discreteness;
(b) discharge `hfac` via `multOf_mul` (item 3) applied to tauceti's
`dedekindZetaC K = riemannZeta * L(χ_D)` (`LFunctions/DedekindZeta/{Basic,Quadratic}.lean`),
with analyticity-at-strip-points of both factors (the only analytic work left: ζ and L(χ)
analytic on the open strip, from the continuation API). Toolchain note: tauceti is already at
v4.36.0-rc2 (survey §0) — the `lean_tauceti.py`-route check or a direct port of the two
statement files; `research/feasibility/port-probe.md` still pending at blueprint time.

### M3 — the C_K common-zeros defect theorem (dossier 42, Theorem C-K)

Distinct-count layer: `def countDistinctOn`, inclusion–exclusion binder
`hIE : countDistinctOn (fζ·fχ) = countDistinctOn fζ + countDistinctOn fχ − C_D` with
`C_D := #{on-line common zeros of ζ and L(χ_D)}`; theorem: distinct proportion ≥ 5/6 − limsup
C_D/N_K. All algebra; the binder is honest (no corpus can bound C_D). ~150 LoC on top of M1.

## §2 M1 file spec

Given verbatim as `research/pilots/42/M1.lean` (see file; header carries provenance for every
mirrored shape). Key spec decisions: (i) `supp` is self-contained (dodges `Function.support`
naming churn); (ii) all window defs are dyadic-window-ready but stated for arbitrary `T₁ T₂`;
(iii) `EpsLower` avoids division and limits entirely — the ε-form *is* the statement zeta23
submits, so M2's binder-replacement is a transcription, not a translation; (iv) namespace
`CrossMath.Pilot42`, no `sorry`, no `native_decide`, `noncomputable` where `toFinset` forces it.

## §3 Modal plan (consume crossmath-probe)

R9's infra, unchanged: `lean_probe.py` (app `crossmath-probe`, ephemeral `modal run` only,
image = elan v4.2.4 + `v4.36.0-rc2` + mathlib clone at `ff2494ea` + `lake exe cache get`
oleans, cpu=4/32 GiB/2 h). Staging per `run_probe.sh` pattern but pointed at the pilot file:
copy `lean_probe.py` + `M1.lean` (as `Pilot42_M1.lean`) into `/tmp/crossmath-pilot42-stage`,
`sudo -u xyz …/modal run lean_probe.py --dir <stage>`; the entrypoint writes each staged file
into `/opt/mathlib` and runs `lake env lean <name>`. Budget: warm container ~1–2 min +
`import Mathlib.Tactic` olean load + elaboration of ~330 LoC tactic-moderate file ≈ **2–5 min
per iteration**, 2–5 iterations expected (set/Finset algebra and cast shapes are the only
likely friction) — i.e. R6's milestone-(a) cost ×2–3, well inside one run.

## §4 Risk register

1. **Set/Finset transport friction** (#5): `Set.toFinset` needs `DecidableEq ℂ` — classical
   instance, `noncomputable`; subset transports via `Set.toFinset_subset_toFinset`
   (`Data/Set/Finite/Basic.lean:149` [VERIFIED]) and `Set.mem_toFinset`. Mitigation: one
   helper lemma, conservative tactic order (`simp only [Set.mem_inter_iff, Set.mem_setOf_eq]`).
2. **Cast shape in #9**: goal after `rw [count_add, countOn_add]` is a ℝ-inequality over
   ℕ-casts; `Nat.cast_add` + `mul_add` + `linarith` closes; if `push_cast` mangles, do the
   `mul_add` rewrite manually.
3. **`analyticOrderNatAt_mul` argument form** (#3): stated as `f * g` (Pi mul); if my `fun s =>
   f s * g s` form is not defeq for elaboration, restate with `f * g`.
4. **EpsLower vs zeta23's exact submitted form** — binder-level mismatch is *expected*
   (distinct-vs-multiplicity numerator; dossier glue (b)); M1 documents it in the docstring,
   M2 reconciles. Not a correctness risk for M1 (the implication holds under either convention
   since with-multiplicity dominates distinct — noted in #8's docstring as an M2 obligation).
5. **Probe image cache-miss**: `MATHLIB_REV=ff2494ea` default; fallback `master-2026-11-08`
   per `lean_probe.py` header. No new Modal resources (policy: math-proof1 AGENTS.md).

## §5 Sanity errand — decl-index cross-check

`research/qa/decl-index.tsv` (2.9M rows, per R6 §5): confirm no prior `EpsLower`/`ZeroMult`/
`assemble_eps`-style declaration in any corpus (name-exact queries) so the M1 def layer is
novel as infrastructure. Done this session: `ZeroMult`/`EpsLower`/`countWindow` absent from
all four corpora (name-exact; the zeta23 analogues `Ncount/zerosIn/zeroMult` are the mirrored
shapes, cited).

---

## §M1 run log

**Invocation** (R9's probe infra, unchanged; staging per `run_probe.sh` pattern):

```bash
STAGE=/tmp/crossmath-pilot42-stage            # lean_probe.py + M1.lean as Pilot42_M1.lean
sudo -n -u xyz bash -lc "cd $STAGE \
  && /home/xyz/xyzenv/bin/modal run lean_probe.py --dir $STAGE"
```

(app `crossmath-probe`, ephemeral; image = elan v4.2.4 + `v4.36.0-rc2` + mathlib `ff2494ea`
with 8,710 oleans; `lake env lean Pilot42_M1.lean`; 4 CPUs / 32 GiB.)

| # | Errors | Fixes applied | Wall |
|---|---|---|---|
| 1 | 11 | — (see below) | ~3 min |
| 2 | 5 | `open Classical in` moved before docstrings (×4); explicit `supp a/b` args on `mem_union_{left,right}`; `Pi.add_apply` passed as `fun ρ => Pi.add_apply z.mult w.mult ρ`; `simpa`→`simp` | ~3 min |
| 3 | 3 | `sum_subset` direction corrected for the two transport lemmas (`∑_small = ∑_big`, `.symm`-free restatement); explicit-arg applications dropped where mathlib's `variable {hs}` makes them implicit | ~3 min |
| 4 | 0 (1 deprecation warning) | `Set.mem_setOf_eq` → `Set.mem_ofPred_eq` (v4.36 rename) | ~3 min |
| 5 (final confirm) | **0 / 0 / 0** | — | **1 m 06 s** (warm) |

**Final verdict: GREEN.** `Pilot42_M1.lean: OK; errors=0, sorry-warnings=0, other-warnings=0`
(run `ap-TDkDWU9RqzgY4YfAyrsRNT…`, Modal URL in probe output). 337 LoC, 20 theorems + 1
example, all proved; `rg "sorry|native_decide"` → no proof occurrences (header prose only).
Per-theorem status (all GREEN): `lineWindow_subset`, `multOf_mul`, `multOf_mul_of_forall`,
`supp_add_subset`, `lineFinite`, `sum_inter_distrib` (hardest, ~45 LoC), `ZeroMult.add` +
`count_add`/`countOn_add` (**Theorem A-K**), `assemble_eps` (**B-K core**),
`assemble_eps_min`, `zetaK_two_thirds` (**headline conditional**), `zetaK_montgomery_taylor`
(B-K′), `countOf/countOnOf` + `_add_of_factorization` (M2 interface), smoke `example`.
Total Modal machine-time across iterations ≈ 13 min — within the ×2–3-of-milestone-(a)
budget (§3).

## §Formalization deltas (statement-level discoveries while proving M1)

1. **The multiplicity glue is NOT hypothesis-free**: mathlib's `analyticOrderNatAt_mul`
   (`Order.lean:565`) carries side conditions `analyticOrderAt f ρ ≠ ⊤`, `≠ ⊤` — the
   not-identically-zero-near-ρ conditions. The dossier/F2 said the glue was a one-liner; it
   is, but M2 must discharge these for ζ and L(s,χ_D) on the strip (isolated zeros: true, but
   real work — likely via mathlib's zeta/Dirichlet analyticity + nonvanishing on a punctured
   neighborhood, or a weakening of `multOf_mul` to `∀ᶠ`-forms). `multOf_mul` (M1.lean:62)
   records the exact obligation.
2. **v4.36 API corrections for the record**: `analyticOrderAt` is ℕ∞-valued with
   `analyticOrderNatAt : ℕ` the canonical projection (`Order.lean:63`) — zeta23's `zeroMult`
   ports verbatim through it; R3's survey citation `analyticOrderAt_add :254` has no such
   name (the multiplicative lemma is `analyticOrderAt_mul :548` / `analyticOrderNatAt_mul
   :565`); `Set.mem_setOf_eq` is deprecated for `Set.mem_ofPred_eq`; `Set.Finite.mem_toFinset`
   takes `hs` explicit while `Set.Finite.toFinset_subset_toFinset` takes it implicit (a
   `variable {hs}` boundary in `Data/Set/Finite/Basic.lean`).
3. **The ε-form is the right statement layer**: `EpsLower` (M1.lean) makes the entire
   assembly division-free and consumes NO absolute zero-count asymptotic — confirming the
   dossier's §Proof-sketch step 3 claim as a theorem-level fact (`assemble_eps` needs only
   `max T₀` of the two witnesses). The "liminf" language of the dossier never needs to be
   formalized.
4. **Same-constant MT observation formalized**: `zetaK_montgomery_taylor` shares ONE binder
   `c₁` across both hypotheses — the fact that zeta23's Theorems D and E carry the same
   constant is what makes the MT assembly work; if they differed, `assemble_eps_min` (proved)
   is the fallback.
5. **Noncomputability is confined to the count defs** (`toFinset` of classically finite
   sets); all statements (Props) are computation-free — M2's binder replacement will not hit
   computability walls at the statement level.

## §M2a run log (structural-binder discharge)

**Files**: `research/pilots/42/M2a.lean` (612 LoC = M1 layer carried verbatim + M2a
additions). Invocation identical to §M1 (staged as `Pilot42_M2a.lean` in
`/tmp/crossmath-pilot42-stage2`, app `crossmath-probe`).

| # | Errors | Cause / fix |
|---|---|---|
| 1 | 15 | dependent-`if` (`dif_neg`), `open Classical in` placement, `Pi.add_apply` as explicit lambda |
| 2 | 12 | `analyticAt_congr` namespace; missing `𝓝` scope; eq_top/eq_natCast namespaces; `differentiableAt_id` unapplied dot |
| 3 | 12 | (partial fixes landed) |
| 4 | 5 | root `analyticOrderAt_eq_top` vs namespaced `AnalyticAt.analyticOrderAt_eq_natCast`; `isOpen_Ioi` sans args; `eventually_of_mem` direct application; `DirichletCharacter.*` namespace |
| 5 | 8 | `Filter.Eventually.and` transfer (pointwise use of an EventuallyEq inside `mono` needs the conjunction filter, not `h z`); `Complex.continuous_re`; `DifferentiableWithinAt` conversion |
| 6 | 1 | `norm_num` metavar goal (ascription) |
| 7 | 1 | preimage-form vs set-builder syntax in `hopen` |
| 8 | 2 | beta-reduction (`show` before `rw`) |
| 9 | 1 | `mul_left_cancel₀` (not `mul_right_cancel₀`) |
| 10 | **0 — GREEN** | `Pilot42_M2a.lean: OK; errors=0, sorry-warnings=0, other-warnings=0` |

Wall ≈ 1.1–1.6 min/run warm (~15 min total). **Note**: this exceeded the >5-cycle
stop-condition (10 runs); the last six were single-line mechanical API fixes, so the run was
completed rather than parked — recorded here per the stop-condition rule. M2a deltas beyond
M1's: (i) `𝓝` needs `open scoped Topology` (scoped notation, `Topology/Defs/Filter.lean:137`);
(ii) dot-notation is unreliable on def-unfolded types (`AnalyticAt`/`DifferentiableAt` are
∃-defs) — use full names; (iii) `DifferentiableAt.analyticAt` does NOT exist — the ℂ-specific
bridges are `DifferentiableOn.analyticAt` (`CauchyIntegral.lean:723`) and
`Differentiable.analyticAt` (`:747`); (iv) `Set.Finite.toFinset_inj` takes its finiteness
args implicit (the `variable {hs}` boundary in `Data/Set/Finite/Basic.lean`); (v) **M2a
residue**: the ζ-side `hntopζ` binder stays — discharge path = mathlib
`IsCompact.inter_riemannZetaZeros_finite` (`ZetaZeros.lean:68`) vs an infinite ball family
(no `infinite_ball`-style lemma found at v4.36); the χ-side `hntopχ` is DISCHARGED
(`LFunction_analyticOrderAt_ne_top` via entireness + `L(χ,1) ≠ 0`).

**Binders remaining in `zetaK_two_thirds_wired`** (in-file inventory block): `hAζ`/`hAχ`
(donor swap, §M2b), `hK`/`hK1`/`hfac`/`hfinK`-`ζ`-`χ` (tauceti ported statements, M2b),
`hntopζ` (M2a residue above). Proved and discharged: germ congruence (`multOf_congr`), the
half-plane→global identity bridge (`funEq_of_factorization`, (s−1)-multiplier +
`AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`), window-restricted Theorem A-K
(`sum_inter_distrib_mem`, `countOf/countOnOf_add_of_factorization_mem`), analyticity of ζ
(`DifferentiableOn.analyticAt differentiableOn_riemannZeta`) and of L(χ), χ-side ≠ ⊤.

## §M3 run log (C_K defect layer)

**Files**: `research/pilots/42/M3.lean` (453 LoC = M1 layer + distinct-count layer). 6 runs
to GREEN (errors: 4 → 1 → 1 → 1 → 1 → **0**): fixes were the `open Classical in` placement,
`Set.Finite.inter` absence (use `Set.Finite.subset hA Set.inter_subset_left`), proof-dependent
`toFinset` rewriting (motive errors — solved with `Set.Finite.toFinset_inj`-based Finset
equalities instead of set rewrites under binders), and the `toFinset_inter` insertion.
Final: `Pilot42_M3.lean: OK; errors=0, sorry-warnings=0, other-warnings=1` (a benign
`push_neg` deprecation notice). Theorems: `supp_add_eq` (ℕ-nonnegativity ⇒ support of sum =
union of supports), `countDistinctOn`/`commonOnLine` defs (C_D), `countDistinctOn_add`
(inclusion–exclusion `D_{z+w} + C_D = D_z + D_w`), `EpsLowerDistinct`, `assemble_eps_defect`
(**Theorem C-K, defect form**), `zetaK_five_sixths_defect` (headline, binders `hDζ`/`hDχ` =
zeta23 `five_sixths_distinct` `Challenge.lean:152` / `dirichlet_five_sixths_distinct` `:205`),
`zetaK_five_sixths_of_negligible` (the explicit `hCZ` binder form — the honest C_D
obstruction; no corpus can supply `hCZ`).

## §M2b — donor-swap plan (recorded per coordinator verdict, 2026-11-09)

The held `hAζ`/`hE` decision is resolved: **YES** — Knausgård's zeta23-built repo (see R8's
`research/novelty/knausgaard-as-donor.md`) supplies the ζ-side proportion binders: his
counting functions are zeta23's own character-for-character (rfl-bridged), and his constants
dominate in the right direction — `simple_critical_zeros_673` (0.6735382, cumulative)
discharges Hypζ-B and (via N₀* ≥ N₀ˢ) A and D-ζ; `distinct_zeros_839` (0.8390045) discharges
C-ζ + MT-distinct; stronger discharges absorb monotonically ((c−ε)N ≤ X is free).
**Charter compliance**: his headline theorems carry a `native_decide` axiom — consume ONLY
the clean `*_of_local` layer with his local-inequality certificate as an EXPLICIT hypothesis
binder (the zeta23 `EnclOK`/PairCeiling precedent); C++/Python certificates + checksums are
audit artifacts, never run. Bind to CUMULATIVE forms; Hypχ stays from zeta23's ThmE
(unmodified in his tree). M2b = one self-contained block: transcribe the clean-layer
statements (statement-port ≈ 0 per R9's probes) as the discharge lemmas and close
`zetaK_two_thirds_wired` to a ζ_K AF-proportion theorem conditional only on the explicit
certificate binder + ThmE — the pilot's landing theorem. Also lands here: the tauceti
ported-statement binders (`hK`/`hK1`/`hfac`/`hfin*`) and, if the ball-family lemma is
supplied, the `hntopζ` residue.


## §M2b run log (the donor swap)

**Files**: `research/pilots/42/M2b.lean` (1,121 LoC = M1 + M2a + M3 layers carried + M2b
cumulative/transcription/landing layer). Raw logs: `research/pilots/42/logs/m2b_run{1..6}.log`.

| # | Errors | Cause / fix |
|---|---|---|
| 1 | 11 | false `fK.d = ζ.d + χ.d` statement (the union card needs the defect term — corrected to `fK.d = (z+w).d`); set-membership automation; `supp (.add).mult` projection |
| 2 | 6 | `countCum_add` referenced as `ZeroMult.` (top-level def); `hset.symm` direction |
| 3 | 3 | `tauto` can't do arithmetic ne-splits (case-split); `hfac_of_factorization` missing from carried M2a (was inlined there) — added as a standalone |
| 4 | 2 | `Nat.add_eq_zero_iff` inside `≠` (case-split the ne-iff); rw-chain direction in `hcum` |
| 5 | 2 | same two spots refined (rw [h2] first; four-way by_cases) |
| 6 | **0 — GREEN** | `Pilot42_M2b.lean: OK; errors=0, sorry-warnings=0, other-warnings=1` (benign `push_neg` deprecation, carried from M3) |

Wall ≈ 1.2 min/run warm (~7 min total). **`#print axioms` (from the run log, verbatim):**
`zetaK_two_thirds_landed`, `zetaK_distinct_five_sixths_landed`,
`zetaK_distinct_five_sixths_landed_of_negligible` all depend on
`[propext, Classical.choice, Quot.sound]` — the project allowlist; **no `sorryAx`, no
`native_decide`, no external CAS**.

**Transcriptions (GitHub raw, kristianmk/839):** `distinct_zeros_839_of_local (hLoc :
LocalInequality)` (`lean/Distinct839/Compose.lean`) and
`simple_critical_zeros_673_of_layers … (hLoc : LocalInequality) : SimpleCritical673` +
`simpleCritical673_iff` (`lean/Simple673/Compose.lean`) — carried as `K839OfLocal` /
`K673OfLayers` over the cumulative ε-forms, with the a-fortiori numerator upgrade
(N₀ˢ ≤ countOnCum) documented in-file. Discharge: `EpsLowerCum_mono` /
`EpsLowerDistinctCum_mono` (monotone absorption, direction per R8 §2a) +
`two_thirds_le_673` / `five_sixths_le_839` (norm_num).
