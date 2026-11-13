# Pilot 42 — M4 execution spec: the ZetaZerosV2 donor swap (unconditional ζ-side landing)

Lane A3, 2026-11-13. Companion to `research/novelty/axiommath-as-donor.md` §(c) (the donor
map this implements; verdicts and citations below are taken from there unless noted) and
`research/pilots/42-blueprint.md` (M1–M2b history). Posture: M4 *replaces* the ζ-side of
the M2b certificate-binder architecture with ZetaZerosV2's unconditional Lamzouri
theorems, dropping `hCert` entirely on that side, and first *corrects* the distinct-count
vocabulary (§b). Ground rules unchanged: no `sorry`, no `native_decide`, no external CAS;
`#print axioms` = `[propext, Classical.choice, Quot.sound]` on every landing theorem.

## 0. Donor reference card (verified file:line in `/home/doz/zcode-workdir/axiommath/ZetaZerosV2`, branch `dev/claude`, our pin ff2494ea/v4.36.0-rc2; built OK in `feasibility/axiommath-bump/logs/v2-run9.log`, 8,262 jobs incl. the redirected PrimeNumberTheoremAnd path)

- `ZetaZeros.simple_proportion_lower` — `ZetaZeros/Main.lean:47`:
  `∀ ε > 0, ∃ T₀, ∀ T ≥ T₀, 3/2 − (1/√2)·cot(1/√2) − ε < simpleOnLineCount T / zeroCount T`
  (C₀ = 0.6725007… > 2/3 = 0.66667; numerator N₀ˢ = *set-card* of simple on-line zeros).
- `ZetaZeros.distinct_proportion_lower` — `Main.lean:88`: same shape at
  C₁ = 5/4 − (1/(2√2))·cot(1/√2) = 0.8362504… > 5/6 = 0.83333; numerator
  `distinctZeroCount` = **strip-wide** distinct (N_d).
- Numeric endpoints (fallback inputs, §c): `simple_proportion_d4` (`Main.lean:130`,
  `0.6725 < …`), `distinct_proportion_d5` (`Main.lean:149`, `0.83625 < …`); both derived
  from `montgomeryTaylorConst_lt : C_MT < 1.3275` (`Numeric/MontgomeryTaylor.lean:172`),
  with the closed-form rewrites `C₀ = 2 − C_MT`, `C₁ = 3/2 − C_MT/2` proved by
  `rw [montgomeryTaylorConst]; ring` inside V2 (`Main.lean:73–76, 114–117`) — reuse verbatim.
- Counting vocabulary — `Definitions.lean`: `nontrivialZeros T` (:38) =
  `{ρ | riemannZeta ρ = 0 ∧ 0 < ρ.re ∧ ρ.re < 1 ∧ 0 < ρ.im ∧ ρ.im ≤ T}`;
  `zeroMultiplicity = analyticOrderNatAt riemannZeta` (:43) — **definitionally the same
  multiplicity function as pilot 42's `multOf riemannZeta`**; `zeroCount` (:47, N with
  mult, `∑ᶠ` over the set), `simpleOnLineCount` (:51), `distinctZeroCount` (:56),
  `onLineCount` (:60, N₀ with mult), `simpleZeroCount` (:65), `simpleOrOnLineCount` (:70).
  Statements re-exported as the mathlib-only Challenge at `Challenge/Basic.lean:209–278`
  (elaboration-verified standalone on our pin, `axiommath-bump/logs/run1.log`), discharged
  at `Solution/Basic.lean:58–114`.
- Eventual-positivity input used by V2 itself: `riemannVonMangoldt.zeroCount_pos_eventually`
  (as consumed at `Main.lean:60`; pin the exact dotted path at implementation).
- Knausgård (M4a only): `distinct_zeros_839_of_local` (kristianmk/839
  `lean/Distinct839/Compose.lean`) is over zeta23's `Ndist` = **strip-wide** distinct
  (`zeta23/ChallengeDeps.lean:59`, `(zerosIn T₁ T₂).ncard`, zerosIn = strip) — the M2b
  transcription wrongly mapped it to an on-line numerator (§b).

Window/quantifier shape: all V2 endpoints are cumulative (0, T], eventual ε-forms —
*exactly* the shape of M2b's `EpsLowerCum`/`EpsLowerDistinctCum` (`∀ε>0, ∃T₀, ∀T≥T₀,
(c−ε)·N(0,T] ≤ …`). No dyadic↔cumulative bridge exists on the V2 side (zeta23's library
has one; Knausgård note in `knausgaard-as-donor.md` §2a(ii)).

## (a) Exact target statements (M4b deliverables)

All statements are **cumulative (0, T]** — the V2-native phrasing. Dyadic-window forms are
NOT M4 targets: they stay at their M1/M3 conditional status (a cumulative liminf does not
unfold into window proportions without the missing bridge; recorded as a limitation, not a
loss — the M2b landings were already cumulative). Two phrasings per theorem: the `EpsLower`
def-form (library vocabulary) and the unfolded liminf form (readable statement).

1. **Glue (count identifications).**
   `supp_multOf_eq_zeroSet : ∀ ρ, 0 < ρ.re → ρ.re < 1 → (multOf riemannZeta ρ ≠ 0 ↔ riemannZeta ρ = 0)`
   (mathlib `Analytic/Order` API — pin exact lemma name at implementation; both directions
   at points of analyticity of `riemannZeta`);
   `countCum_eq_zeroCount (hfinζ : WindowFinite (multOf riemannZeta)) (T : ℝ) :
     (⟨multOf riemannZeta, hfinζ⟩ : ZeroMult).countCum T = ZetaZeros.zeroCount T`;
   `countOnCum_eq_onLineCount (…) : (⟨multOf riemannZeta, hfinζ⟩ : ZeroMult).countOnCum T
     = ZetaZeros.onLineCount T`; and, after §b, the strip-distinct analogue
   `distinctCountCum_eq_distinctZeroCount (…) : … = ZetaZeros.distinctZeroCount T`.
   Each: set-identity from `supp_multOf_eq_zeroSet` + window-definitional `rfl`-shuffles,
   then `∑ᶠ`-over-set ↔ `Set.Finite.toFinset` sum (mathlib finsum↔sum bridge).
2. **ζ-side discharges (unconditional).**
   `epsLowerCum_zeta (hfinζ) : EpsLowerCum ⟨multOf riemannZeta, hfinζ⟩ (2/3)` — from
   `simple_proportion_lower ε hε` (division → multiplication by eventually-positive
   `zeroCount`), the point-count bound `simpleOnLineCount T ≤ onLineCount T`
   (`EpsLowerCum`'s numerator is the *with-multiplicity* `countOnCum`, so the a-fortiori
   lift is a one-liner), and monotone absorption with
   `two_thirds_le_C₀ : (2/3 : ℝ) ≤ 3/2 − (1/√2) * Real.cot (1/√2)` — proved by the V2
   route: `rw [show 3/2 − (1/√2)*cot(1/√2) = 2 − montgomeryTaylorConst from by
   rw [montgomeryTaylorConst]; ring]` then `linarith [montgomeryTaylorConst_lt]`
   (1.3275 < 4/3).
   `epsLowerDistinctStripCum_zeta (hfinζ) : EpsLowerDistinctStripCum ⟨multOf riemannZeta,
   hfinζ⟩ (5/6)` — from `distinct_proportion_lower` + `five_sixths_le_C₁` (C₁ = 3/2 −
   C_MT/2 ≥ 5/6 ⟺ C_MT ≤ 4/3; same route).
3. **LANDED (2/3, unconditional ζ-side).** `zetaK_two_thirds_landed_of_V2 {fK fχ : ℂ → ℂ}
   {cert : Prop}` — hypothesis list of `zetaK_two_thirds_landed` (`M2b.lean:1062–1074`)
   **minus `hCert` and `hK673`**, with `fζ := riemannZeta`; conclusion
   `EpsLowerCum ⟨multOf fK, hfinK⟩ (2/3)`. Unfolded: *for the zero data of the quadratic
   Dedekind zeta (identified via `hfac`), liminf_{T→∞} N^{on}(0,T] / N(0,T] ≥ 2/3,
   conditional only on the Dirichlet-factor density (`hEχ`), the M2a structural set, and
   `hntopζ` — no certificates, no native_decide anywhere in the dependency.*
4. **LANDED (distinct 5/6 + strip defect, unconditional ζ-side).**
   `zetaK_distinct_five_sixths_landed_of_V2` — the `zetaK_distinct_five_sixths_landed`
   (`M2b.lean:1081`) signature minus `hCert`/`hK839`, at the §b strip-distinct vocabulary:
   `∀ ε > 0, ∃ T₀, ∀ T ≥ T₀, (5/6 − ε)·countCum fK ≤ distinctCountCum fK + commonStripCum
   zζ zχ`, conditional on `hEχd′` (χ-side strip-distinct, §b) + structural set. Plus the
   negligible-defect form `…_of_negligible` with `hCZ′` (strip-common negligibility).

M4 does NOT touch: `hEχ`/`hEχd` discharge (zeta23 ThmE port — separate line item),
`hntopζ`/`hfinζ` discharge (M2a residue / V2-machinery softeners — noted in the donor map
§(c).5, out of scope here), any dyadic-window restatement.

## (b) The `countDistinctOnCum` re-vocabulary plan (M4a; QA flag from the donor map §(c).2)

**The bug class.** M2b defined `ZeroMult.countDistinctOnCum z T := (lineFiniteCum …).toFinset.card`
— distinct **on-line** count — and transcribed Knausgård's 839 statement onto it
(`K839OfLocal`, `M2b.lean:877`), with docstring "his `Ndist 0 T` shape". His (and zeta23's,
and V2's) `Ndist`/`distinctZeroCount` is **strip-wide** distinct. On-line ≤ strip, so the
transcribed binder is *strictly stronger than the donor's theorem* — undischargeable by
Knausgård, by V2, or by any known result (it would need "almost all zeros are on the line
and distinct"). Nothing false was *proved* (the binder is only ever a hypothesis; M2b's
GREEN status and its axcheck stand), but the M2b distinct-family statements are dead ends
as written. The 2/3-family (`EpsLowerCum`, numerator = on-line **with multiplicity**) is
faithful (N₀ˢ ≤ N₀ a fortiori, `M2b.lean:871` comment) and untouched.

**The fix, at the cumulative layer (strip vocabulary):**

| M2b artifact (line) | M4a replacement (same proof body, window swapped) |
|---|---|
| `countDistinctOnCum` (def ~`:788`, over `lineWindow`) | `ZeroMult.distinctCountCum z T := (z.windowFinite 0 T).toFinset.card` (over `stripWindow 0 T`) |
| `commonOnLineCum` (`:794`) | `commonStripCum z w T := ((supp z.mult ∩ stripWindow 0 T) ∩ (supp w.mult ∩ stripWindow 0 T)).Finite.toFinset.card` |
| `EpsLowerDistinctCum` (`:804`, on-line numerator) | `EpsLowerDistinctStripCum z c := ∀ε>0, ∃T₀, ∀T≥T₀, (c−ε)·z.countCum T ≤ z.distinctCountCum T` (name deliberately distinct — do NOT shadow) |
| `countDistinctOnCum_add` (`:821`) | `distinctCountCum_add` — inclusion–exclusion over `stripWindow`; proof identical (`supp_add_eq` + `Set.Finite.toFinset_union/inter`) |
| `countDistinctOnCum_of_factorization` (`:906`) | `distinctCountCum_of_factorization` — uses `stripWindow_ne_one` (already in the M1 layer; the line version needed `lineWindow_ne_one`, the strip version is *more* natural) |
| `assemble_eps_defect_cum` (`:982`) | `assemble_eps_defect_strip_cum` — same wiring at strip windows |
| `K839OfLocal` (`:877`) | `K839′OfLocal hyps z := hyps → EpsLowerDistinctStripCum z (1645064/1960733)` — now a **verbatim-faithful** transcription of `distinct_zeros_839_of_local` modulo the count identification `Ncount 0 T ≡ countCum`, `Ndist 0 T ≡ distinctCountCum` |
| `zetaK_distinct_five_sixths_landed` (`:1081`), `…_of_negligible` (`:1121`) | restated landings at strip vocabulary, `hK839 → hK839′`, `hEχd → hEχd′ : EpsLowerDistinctStripCum ⟨multOf fχ, hfinχ⟩ (5/6)` (also more faithful to zeta23 ThmE's C-form, which is over `NdistL` = strip) |
| `hCZ` (`:1125`-shape) | `hCZ′`: `commonStripCum zζ zχ T ≤ ε·countCum fK T` eventually — the honest obstruction, now at the strip (a common strip zero of ζ and L(χ_D) is a multiple zero of ζ_K; the `20-hCZ-NOTE.md` analysis transfers verbatim — on-line was a special case) |

**Minimal-diff policy.** M1.lean, M2a.lean, M3.lean, M2b.lean are **frozen as landed**
(GREEN historical record, axcheck'd, cited by the dossier addendum); every M4 change lives
in new self-contained files `research/pilots/42/M4a.lean` and `M4b.lean` that carry the
needed prior layers verbatim (the M2b precedent). M3's dyadic defect layer
(`commonOnLine`, `zetaK_five_sixths_defect`, `zetaK_five_sixths_of_negligible`) stays
on-line-vocabulary — it is superseded for the distinct family by the M4a cumulative layer;
record that in the dossier addendum (§e M4c), do not edit M3. The 2/3-family names
(`EpsLowerCum`, `countOnCum`, `K673OfLayers`) are carried unchanged into M4a/M4b files.

## (c) V2 import/instantiation plan on our pin

**What elaborates today:** the V2 *Challenge* statements (mathlib-only imports) elaborate
standalone against v4.36 mathlib (`run1.log`: OK), and the full V2 lib + its PNT+ path
*build* on our pin (`v2-run9.log`: OK, app `crossmath-axbump`, image = axbump.py's). What
has never been run: elaborating an *external consumer file* against the built V2 oleans,
and `#print axioms` of V2's endpoints on our pin (M4c closes both).

**Primary route (direct import, new Modal app modeled on axbump.py):** stage
`/work/ZetaZerosV2` exactly as axbump does (tarball upload, PNT+ redirect patch, `lake
update` → resolves mathlib `ff2494ea`, `lake exe cache get`, `lake build ZetaZeros`), then
copy `M4b.lean` into the workspace root as an extra module and run `lake env lean M4b.lean`
(one file, errors with context; persist full log). `M4b.lean` header:
`import ZetaZeros` (root module re-exports `Definitions`/`Main`/`Proportions`/
`NumericProportions`) + `import Mathlib`. Everything else in the file is mathlib-only
(carried pilot-42 layers). Expected friction: none known — same toolchain, same mathlib
rev, no name clash (namespace `ZetaZeros` vs our `CrossMath.Pilot42`; note V1's lib is
*also* namespace `ZetaZeros` — never import both).

**Fallback route (binder transcription, zero infra):** if direct import fricts (lake
elaboration quirks, `module`/`public import` experiment friction in `lake env lean`, or
`zz_tag` attribute hooks needing the Meta files), transcribe V2's **numeric endpoints** as
hypothesis binders in V2's own Challenge vocabulary (statement-elaboration already verified
by run1):

- `hV2d4 : ∀ T₀-exists shape of simple_proportion_d4` — verbatim: `∃ T₀ : ℝ, ∀ T ≥ T₀,
  0.6725 < (ZetaZeros.simpleOnLineCount T : ℝ) / (ZetaZeros.zeroCount T : ℝ)` with the
  Challenge counting defs re-declared locally (they are 7 short defs, mathlib-only);
- `hV2d5` — verbatim `distinct_proportion_d5` (0.83625, strip-distinct numerator — the
  fallback *automatically* uses the corrected vocabulary).

Numeric lemmas then avoid all cot-arithmetic: `two_thirds_le_6725 : (2/3 : ℝ) ≤ 0.6725 :=
by norm_num` (margin 0.0058…), `five_sixths_le_83625 : (5/6 : ℝ) ≤ 0.83625 := by norm_num`
(margin 0.0029…) — decimal literals are exact rationals; `norm_num` closes both (verify;
fallback `decide` on the rational comparison). Landing theorems stay *conditional on
`hV2d4`/`hV2d5`*, labeled "V2-endpoint binders (donor theorems, built on-pin v2-run9)" —
same epistemic class as the EnclOK pattern minus the certificate, since the donor is
sorry-free/native_decide-free. This route can land M4b **today**; the primary route then
only *strengthens* the same file by discharging the two binders.

**Decision rule:** attempt primary first with a ≤ 1-day infra box; if it fricts, land the
fallback and re-try primary as M4b′ (a 20-line delta: replace binder applications by the
glue of §(a).2).

## (d) Binder-inventory delta (before M2b → after M4b)

| Binder | M2b landed theorems | M4a (re-vocab) | M4b (V2 swap) |
|---|---|---|---|
| `hCert : cert` (Knausgård `LocalInequality`) | on 2/3 + distinct landings | on both (unchanged) | **DROPPED** (both) |
| `hK673 : K673OfLayers cert ⟨multOf fζ, hfinζ⟩` | on 2/3 landing | on 2/3 landing (unchanged) | **DROPPED** — discharged by `simple_proportion_lower` + glue |
| `hK839 : K839OfLocal cert ⟨multOf fζ, hfinζ⟩` (on-line numerator) | on distinct landing | replaced by `hK839′` (strip, faithful) | **DROPPED** — discharged by `distinct_proportion_lower` + glue |
| `hEχ : EpsLowerCum ⟨multOf fχ, hfinχ⟩ (2/3)` | on 2/3 landing | unchanged | **REMAINS** (ζ-only donor) |
| `hEχd : EpsLowerDistinctCum … (5/6)` (on-line) | on distinct landing | `hEχd′` strip form | **REMAINS** (as `hEχd′`) |
| `hCZ` (on-line common negligibility) | on `_of_negligible` | `hCZ′` strip form | **REMAINS** (as `hCZ′`) |
| M2a structural set: `hζ`, `hχ`, `hK`, `hK1`, `hP1`, `hfac` (`FactorizationOnHalfPlane`, `M2a.lean:406`), `hfinK/ζ/χ` | all | all | **ALL REMAIN** (with `fζ := riemannZeta` in the M4b signatures) |
| `hntopζ`, `hntopχ` | both | both | **REMAIN** (V2-softener for `hfinζ` noted, not scoped) |

Net: the M4b 2/3 landing carries **exactly** `hEχ` + structural set + `hntopζ/hntopχ`;
the distinct landing additionally `hEχd′`; the `_of_negligible` form additionally `hCZ′`.
No `cert`-type binder survives; no native_decide can enter through any remaining binder
(zeta23 ThmE statements and tauceti ports are mathlib-statement-shaped; audit at M4c).

## (e) Milestone split and GREEN gates

- **M4a — re-vocabulary, still Knausgård binders.** File `research/pilots/42/M4a.lean`
  (self-contained: M1 layer + M2b cumulative layer carried verbatim + §b strip-distinct
  layer + `K839′OfLocal` + restated distinct landings). Elaboration-only against mathlib
  (existing `run_pilot.sh` infra / `crossmath-pilot-32` pattern — no V2 needed).
  **GREEN gate:** 0 errors / 0 sorry-warnings; `#print axioms` on the restated landings =
  triad; the `distinctCountCum_add` inclusion–exclusion and the restated `hK839′`
  transcription proof-check. Deliverable meaning: the M2b QA flag is fixed and the
  distinct family is *dischargeable-shaped*.
- **M4b — V2 swap, unconditional ζ-side landing.** File `research/pilots/42/M4b.lean`
  (carries M4a content + §(a).1–2 glue + §(a).3–4 landings; `import ZetaZeros` per §c
  primary, or `hV2d4/hV2d5` binders per fallback). **GREEN gate:** 0/0 on the V2-workspace
  elaboration (primary) or mathlib-only elaboration (fallback); axioms triad on all four
  landing theorems; the numeric lemmas `two_thirds_le_C₀`/`five_sixths_le_C₁` (primary) or
  `two_thirds_le_6725`/`five_sixths_le_83625` (fallback) `norm_num`-clean.
- **M4c — audit + record.** (i) On-pin axcheck: extend the axbump app one function to
  print `#print axioms` for `ZetaZeros.simple_proportion_lower`,
  `distinct_proportion_lower`, `simple_proportion_d4`, `distinct_proportion_d5` (+ the
  four M4 landing theorems via the staged file) — expect triad; anything else stops the
  M4b claim and reverts posture to binder-conditional. (ii) Dossier-42 Pilot-outcome
  addendum (append-only draft, routed through the orchestrator for
  `candidates/42-*.md`): the M4 record = donor swap per `novelty/axiommath-as-donor.md`
  §(c); the re-vocab correction (M2b distinct family superseded, M3 noted); binder
  inventory delta (§d); honest statement that constants 2/3 and 5/6 are unchanged and
  Knausgård's 0.67354/0.83900 remain the stronger *conditional* constants (constant-race
  caveat unchanged); STATUS/INDEX row updates likewise routed through the orchestrator.

## (f) Risk register + Modal plan

| Risk | Likelihood | Impact | Mitigation |
|---|---|---|---|
| `lake env lean` on a consumer file inside the V2 workspace fails (module system / attribute hooks) | medium | blocks primary route | fallback (§c) lands M4b today; primary retried as M4b′ |
| finsum↔toFinset / zero-set↔supp glue needs an unexpected mathlib lemma name | high (name-level only) | trivial | each glue lemma is ≤ 10 LoC; enumerate candidate names at implementation (`Set.Finite`, `finsum`, `Analytic/Order` families) |
| cot-closed-form numerics (`two_thirds_le_C₀`) | none-to-low | — | V2's own `montgomeryTaylorConst_lt` + `rw [montgomeryTaylorConst]; ring` route (primary); decimal endpoints + `norm_num` (fallback) |
| `zeroCount` eventual positivity path (dotted name `riemannVonMangoldt.zeroCount_pos_eventually`) | low | trivial | it is consumed inside `Main.lean:60`; copy that invocation shape |
| V1/V2 namespace collision (`ZetaZeros` both) | certain if both imported | trivial | never import V1 in M4; V1 is not on any M4 path |
| Hidden axiom in V2 endpoints on pin (contradicting comparator config) | very low | reverts unconditionality claim | M4c(i) is a hard gate before any "unconditional" wording lands in the dossier |
| Scope creep (hEχ port, hntopζ discharge, dyadic bridge) | — | — | explicitly out of scope (§a last para); do not fold into M4 LoC |

**Modal plan** (substrate note: **MODAL_USER=doz approved** — the axbump runs already used
the doz CLI, `/home/doz/dozenv/bin/modal`, per the v2-run2…9 provenance headers; do NOT
route through xyz for M4): ephemeral app `crossmath-pilot-42-m4`, image = axbump.py's
recipe verbatim (elan v4.2.4, toolchain v4.36.0-rc2, mathlib `ff2494ea` via `lake exe
cache get`); function `run(tarball)` stages ZetaZerosV2 + PrimeNumberTheoremAnd (with the
PNT+ path redirect patch, axbump.py:79–81), builds `ZetaZeros`, then elaborates the staged
`M4a.lean` (mathlib-only, pre-build, cheap sanity) and `M4b.lean` (in-workspace, `lake env
lean`), printing errors with 25 lines of context (the run_pilot.py convention) and the
`#print axioms` report (M4c). No volume/secret/deploy; logs persisted to
`research/pilots/42/logs/m4-run<N>.log` with provenance headers (the log-rescue lesson).
Budget: M4a ≈ 2–4 warm runs; M4b primary ≈ 2–6 runs (build ≈ cold 3–4 h once, then cached
image); M4c piggybacks on the M4b run + one axcheck extension run. Total estimate ≈ S
(≤ 600 new LoC across M4a/M4b, mostly carried layers).
