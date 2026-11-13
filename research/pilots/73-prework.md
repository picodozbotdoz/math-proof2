# Pre-work spec — pilot 73 (function-field Hecke L, Tier-C binder layer)

Lane A2, 2026-11-13. Companion docs: `research/bridges/function-field.md` §4 FF-EZ3 + §5,
dossier 73 (`research/candidates/73-function-field-hecke-tate.md`, lane A9 — on disk; the
statement shapes below realize its (P) and (C1); **one honesty correction to the dossier's
step 5 folded in §2.4 — also recorded in `research/pilots/FF-sequencing-memo.md`**),
`research/pilots/71-prework.md` + `research/pilots/71/logs/run4.log` (the Tier-C pattern and
its no-Stacks baseline). SPEC ONLY — no Lean execution. **Verdict up front: GO at Tier C,
zero import gates** (mathlib `ff2494ea` + hypothesis binders only, the 71 pattern; run4 log
is the evidence the whole approach elaborates on our pin without Stacks). Tier A (the
Kummer-sheaf dictionary itself) is Stacks-gated and priced, not planned.

---

## §1 The pilot in one page

Dossier 73's Tier-C slice: build the **first formal Tate-thesis-type objects** — a
function-field ray-class character class (the DZDF `RayClassCharacter` transplant, positivity
clause vacuous), its Hecke series in T-form, and the statement pair (P)(i) continuation under
`hRat` / (P)(ii) sharp-1/2 window under `hPur`, in the DZDF `heckeL_ne_zero` shape — plus the
(C1) 𝔽_q(T) probe instance with `hRat` **discharged** (elementary periodicity) and `hPur`
**kept as a binder** (it is the RH for Kummer covers — not Gauss-sum-elementary; §2.4).
Milestones: **Q0** statement probe (P0-pattern) → **Q1** class def + series + 71-reuse glue →
**Q2** (P)(i) → **Q3** (P)(ii) → **Q4** (C1) `hRat` discharge → axcheck. Out of scope:
functional equation / root numbers (Gauss sums), general curves C beyond 𝔽_q(T) (integral
closure), sheaf construction (Tier A), any proportion statement (dossier C3 fence).

## §2 Exact statement specs

### 2.1 The donor endpoints and the binder vocabulary (transcription plan) [VERIFIED locators]

| Binder | Mirrors (donor decl, file:line) | Tier-C form |
|---|---|---|
| `hRat` | `Weil.exists_rationalLFunction_mul_eq_polynomial` (`axiommath/Weil/…/Trace/LAdicTraceFormulaFinal.lean:51`): "∃ P Q ∈ ℚ_ℓ[T], Q(0) = 1 ∧ L(X,ℱ)·Q = P in ℚ_ℓ⟦T⟧" | `∃ P₀ P₁ : Polynomial ℂ, P₀.eval 0 ≠ 0 ∧ L•P₀ = P₁` as a PowerSeries identity for our ℂ-series (complex, not ℚ_ℓ — the transplant's coefficient-field delta, dossier F5(iv)) |
| `hPur` | `SatisfiesWeilEstimate`'s eigenvalue clause (`Weil/Definitions.lean:161–165`) and the LeanEval purity clause `‖α‖ = √(q^i)` (`Weil/LeanEval/WeilConjectures.lean:191`) | for the T-factorization off trivial factors `L(T,χ) = ε(χ)·∏_j (1 − α_j T)`: `‖α_j‖ = √q` for every j (purity of H¹ of the Kummer sheaf; Weil II for curves) |
| `hTate` | the identification clause: L(T,χ) = `LAdicSheaf.rationalLFunction` of the lisse Kummer sheaf ℒ_χ on `U = C ∖ supp m` (Euler product over closed points, `Weil/Defs/…/Trace/LFunctionRationalSheaf.lean:87` docstring) | recorded as a Tier-A target only — NOT stated as a usable binder at Tier C (no sheaf objects on our side); the (P)(iii) dictionary clause is a comment-level cross-ref |
| (statement shape) | `DedekindZetaZeroFree.heckeL_ne_zero` (`HeckeCorollary.lean:12`: existential continuation + `¬IsPrincipal → entire` + Euler-series `HasSum` + window nonvanishing) and the challenge transcription `RayClassCharacter` (`axiommath/DedekindZetaZeroFree/Challenge/DedekindZetaChallenge.lean:14`; arithmetic source `DedekindZetaZeroFree/Arithmetic/RayClasses/Character.lean:12`) | our (P) statements carry the same clause architecture (continuation ∙ series agreement ∙ window nonvanishing) so the number-side comparison typechecks |

DZDF-challenge elaborability on our pin: confirmed (`research/feasibility/axiommath-bump/logs/`:
"challenge DedekindZetaZeroFree/Challenge/DedekindZetaChallenge.lean: OK") — the (C2)
anti-CT pairing can import it later; the 73 core does not.

### 2.2 The FF Hecke class (the transplant; DZDF `Challenge/DedekindZetaChallenge.lean:14`
field-by-field, onto the polynomial substrate)

```lean
/-- The 𝔽_q[T] ray-class characters: DZDF's `RayClassCharacter` transplanted to the
function-field PID k[X] (k finite), modulus the polynomial m. Transplant delta: DZDF's
archimedean clause `(∀ φ : F →+* ℝ, 0 < φ α)` is dropped — there are no unital ring
homomorphisms 𝔽_q(T) →+* ℝ (char p vs char 0), so the positivity requirement is vacuous. -/
structure FFRayClassCharacter (k : Type*) [Field k] [Fintype k]
    (m : Polynomial k) where
  toFun : Ideal k[X] → ℂ
  map_mul' : ∀ I J, toFun (I * J) = toFun I * toFun J
  map_top' : toFun ⊤ = 1
  eq_zero_iff' : ∀ I, toFun I = 0 ↔ (I = ⊥ ∨ I ⊔ Ideal.span {m} ≠ ⊤)
  map_span' : ∀ f : Polynomial k, f ≠ 0 → f - 1 ∈ Ideal.span {m} →
    toFun (Ideal.span {f}) = 1
```

Field-by-field parity check against the donor (read this session, `DedekindZetaChallenge.lean:14–21`):
`toFun`/`map_mul'`/`map_top'`/`eq_zero_iff'`/`map_span'` correspond verbatim with `𝓞 F → k[X]`,
`Ideal (𝓞 F) → Ideal k[X]`, `𝔪 → span {m}`; only `map_span'` loses its archimedean conjunct
(the named delta; also record the companion lemma `no_real_homs : (k →+* ℝ) → False` or the
`IsEmpty`-style instance as documentation of vacuity). General curves C (integral closure of
k[X] in 𝔽_q(C), `FunctionField.ringOfIntegers`, `Mathlib/NumberTheory/FunctionField.lean`)
are a documented extension point, NOT Tier-C scope.

### 2.3 The Hecke series (formalization home: PowerSeries ℂ, mirroring `zetaSeries`)

```lean
/-- L(T,χ) = Σ_{f monic, gcd(f,m)=1} χ(span f) · T^{deg f} — coefficient-finite by
construction (finitely many monic f of each degree), so a well-defined element of ℂ⟦T⟧
with no convergence theory; the T-form of the Euler product ∏_{v ∤ m} (1 − χ(v) T^{deg v})⁻¹. -/
def heckeSeriesT (χ : FFRayClassCharacter k m) : PowerSeries ℂ :=
  PowerSeries.mk fun n => ∑ f ∈ monicDegreeN k n, χ.toFun (Ideal.span {f})
```

Decisions (the 71 §2.3 discipline): (a) series-over-product as the DEFINED object — the
Euler-product expansion is a theorem/binder, not a definition (avoids infinite-product
machinery); (b) `monicDegreeN k n` := the Finset of monic `f` of `natDegree n`, finite via
the `degreeLT`-style Fintype layer over `[Fintype k]` (Q0 verifies the exact spelling);
(c) coprimality enters through `χ`'s own `eq_zero_iff'` (χ vanishes off the coprime cone),
so the coefficient sum needs no separate `IsCoprime` filter — a simp lemma records that;
(d) the s-plane object reuses 71's machinery verbatim: `wOf q s = Complex.exp (−s·log q)`
(`research/pilots/71/P1.lean`, `norm_wOf` proved) with
`L(s,χ) := (heckeSeriesT χ).eval`-question deferred — at Tier C state (P)(i) via the
rationality identity transported by `wOf` (the 71 W1/W2 pattern one factor-level up), NOT
via PowerSeries.eval convergence.

### 2.4 Target statements (with the honesty correction on `hPur`)

**(P)(i) — continuation from rationality (unconditional in `hRat`).**

```lean
theorem hecke_continuation (χ : FFRayClassCharacter k m) (hRat : ∃ P₀ P₁ : Polynomial ℂ,
    P₀.eval 0 ≠ 0 ∧ heckeSeriesT χ * (P₀ : PowerSeries ℂ) = P₁) :
    ∃ f : ℂ → ℂ, (∀ z : ℂ, z ∉ (trivialPoles χ).Finset → DifferentiableAt ℂ f z) ∧
      (∀ s : ℂ, 1 < s.re → f s = Ls χ s)   -- Ls χ s := P₁(wOf q s) / P₀(wOf q s)
```

i.e. meromorphic continuation as an explicit quotient of entire functions in the `wOf`
variable (poles among the `P₀(wOf q s) = 0` set — the "trivial locus" bookkeeping mirrors
DZDF's `DifferentiableOn ℂ f {1}ᶜ` clause). Proof: 71's D1/D1b pattern — polynomial-eval at
an entire function, `Polynomial.differentiable` (`Mathlib/Analysis/Calculus/Deriv/
Polynomial.lean:96`); nothing new mathematically (dossier step 3, "reuse, not reproof").

**(P)(ii) — the sharp window under `hPur` (the payoff; binder-conditional).**

```lean
/-- Purity hypothesis, LeanEval-purity shape (WeilConjectures.lean:191):
the nontrivial T-factorization has all inverse roots on the √q circle. -/
def HeckePurity (χ : FFRayClassCharacter k m) : Prop :=
  ∃ (ε : ℂ) (α : Multiset ℂ), ‖ε‖ = 1 ∧ heckeSeriesT χ * (trivialFactors χ) =
    ε • (α.map fun a => 1 - Polynomial.C a * Polynomial.X).prod ∧
    ∀ a ∈ α, ‖a‖ = √(Nat.card k)

theorem hecke_window (χ) (hPur : HeckePurity χ) (hq : 1 < Nat.card k)
    (s : ℂ) (hs : (1/2 : ℝ) < s.re) (htriv : s ∉ trivialPoleSet χ) :
    Ls χ s ≠ 0
```

Proof shape: exactly W1's numerator step one level up (`Multiset.prod_ne_zero` +
`‖α · wOf q s‖ = √q·q^{−σ} ≠ 1` for `σ ≠ 1/2`, by 71's `norm_wOf`) + the trivial-factor
exclusions. **Honesty correction to dossier 73 step 5** ("Gauss-sum derivations of
`hRat`/`hPur` for this class"): `hRat` yes (below); **`hPur` for 𝔽_q[T] Dirichlet characters
IS the RH for the Kummer covers y^ℓ ≃ f of ℙ¹ — Weil's theorem, deep, not Gauss-sum
elementary.** Tier C keeps `hPur` a binder even for the probe; (C1) lands (i)
unconditionally and (ii) conditional. Recommend A9 append this delta (mirrored in the
sequencing memo).

**(C1) — the 𝔽_q(T) probe: `hRat` DISCHARGED (the priced M item).**
For `χ` factoring through `(k[X]/(m))ˣ` (all of them, by `map_span'`), the series is
rational by periodicity: group monic `f` by residue class `r ∈ k[X]/(m)`; for
`deg f ≥ deg m` each class contributes `q^{n − deg m}`-many degree-n monics uniformly, so
`heckeSeriesT χ = (numerator of degree < deg m) / (1 − qT)`-shape. Statement: the `hRat`
existential, produced explicitly; content = residue-class counting on `k[X]` (Rosen GTM 210
ch. 8 territory minus the FE, which is OUT of Tier-C scope). No Gauss sums anywhere at
Tier C — Gauss sums belong to the FE/root-number layer, explicitly out.

## §3 Binder inventory (what each statement consumes)

- `hRat` (2.1 row 1): discharged for the probe class at Q4; a hypothesis for general χ.
- `hPur` (2.1 row 2): always a hypothesis at Tier C (§2.4 correction).
- From 71 (proved, green, `research/pilots/71/P1.lean`): `wOf`, `norm_wOf`, `norm_wOf_pos`,
  `norm_wOf_lt_one`, `lPoly_eval` (reuse by duplication — self-contained-file convention,
  pilot-01 pattern; ~40 LoC copy).
- mathlib substrate (standard; Q0 verifies spellings): `Polynomial.Monic`, `natDegree`,
  ideals of a PID (`Ideal k[X]`, `Ideal.span`, `Ideal.sup_eq_top`-family via `IsCoprime`,
  `EuclideanDomain` structure on `k[X]`), `PowerSeries.mk`, `Multiset.prod_ne_zero`
  (`Mathlib/Algebra/BigOperators/Ring/Multiset.lean:39`), `Complex.norm_exp`
  (`Mathlib/Analysis/Complex/Trigonometric.lean:993`), `Fintype` counting of degree-bounded
  polynomials (`Polynomial.degreeLT`-layer), `Fintype.one_lt_card`
  (`Mathlib/Data/Fintype/EquivFin.lean:257`), `Real.log_pos`, `Polynomial.differentiable`
  (`Mathlib/Analysis/Calculus/Deriv/Polynomial.lean:96`).

## §4 Import-tier ladder (Stacks-gated tiers marked)

| Tier | Content | Gated by |
|---|---|---|
| **C (default, this spec)** | everything in §2: class def, series, (P)(i) under `hRat`, (P)(ii) under `hPur`, (C1) `hRat` discharge | **nothing** — mathlib `ff2494ea` + binders; the run4 no-Stacks baseline (`research/pilots/71/logs/run4.log`) is the evidence pattern |
| **A** | the dictionary `hTate` itself: construct ℒ_χ (Kummer), trace formula + purity ⇒ discharge `hRat` and `hPur` wholesale | G6a/G6b (StacksFrontier build pricing + rev `012108f6` toolchain check; A7) + Kummer sheaves **not present in any corpus** (`LAdicSheaf.constantSystem` is the only sheaf developed, bridge §2(a)) — priced ceiling, not a plan |

(No Tier B: there is no importable mathlib-only Weil statement at the Hecke-L layer
analogous to LeanEval's `weil_conjectures` — the sheaf L-definitions are Stacks-tainted at
the def level, `Weil/Defs/…/Trace/LFunctionRationalSheaf.lean:87` imports StacksFrontier.)

## §5 Milestones, Modal plan, effort

- **Q0 (S, one warm run)**: statement probe, P0-pattern (`research/pilots/71/P0.lean`
  header convention; probe-convention sorries at statement stubs): all §2 definitions +
  the four target signatures elaborate against mathlib. Runner: clone
  `research/pilots/71/run_pilot.sh` → `research/pilots/73/` (app `crossmath-pilot-73`,
  same image recipe, doz Modal CLI; logs to `research/pilots/73/logs/` with provenance
  headers).
- **Q1 (S–M, ≈ 0.15–0.3k LoC)**: class def + series + 71-glue duplication + the
  χ-vanishing-off-coprime-cone simp lemma + `no_real_homs` vacuity lemma; kernel-clean.
- **Q2 (S, ≈ 0.1k)**: (P)(i) — 71 pattern, one factor level up.
- **Q3 (S, ≈ 0.1k)**: (P)(ii) — W1's numerator step + trivial-factor exclusions.
- **Q4 (M, ≈ 0.3–0.6k)**: (C1) `hRat` discharge — residue-class decomposition; the
  fiddly part is the monic-counting Finset algebra (`q^{n−deg m}` uniformity), not the
  mathematics.
- **Q5 (S)**: axcheck (`#print axioms` per theorem, 0 sorry — pilot standard; the
  `research/feasibility/probe/run_axcheck.sh` pattern if the file count grows).
- **Total Tier C: ≈ 0.65–1.1k LoC, S–M overall** (Q0–Q3 ≈ 0.35–0.5k; Q4 is the isolated
  M). No donor builds, no gates.

## §6 Risk register

- **R1 — `hPur` mis-selling** (the dossier step-5 overclaim): contained by §2.4's
  correction — `hPur` never discharged at Tier C; the (C1) statement is honestly
  "(i) unconditional + (ii) conditional". If triage wants (ii) unconditional for the
  probe, that is a NEW dossier item (Weil-RH-for-Kummer-covers, L/Stacks-adjacent), not
  this pilot.
- **R2 — definition faithfulness**: a mis-transplanted class strands the binders (dossier
  F5(iii)); mitigations: field-by-field parity table (§2.2, checked against
  `DedekindZetaChallenge.lean:14–21` this session), Q0 elaboration, and the (C1) probe as
  the faithfulness check.
- **R3 — coefficient-field bookkeeping** (ℂ vs ℚ(χ); dossier F5(iv)): all objects are
  ℂ-valued from the start; the ℚ(χ)-refinement is out of scope.
- **R4 — trivial-locus bookkeeping** (the ε-factor, principal-χ ζ_C-poles): the
  `trivialFactors/trivialPoles` side-conditions are carried as explicit finite data in the
  statements; if they destabilize, degrade (P)(ii) to the nonprincipal-χ case only
  (principal χ reduces to 71's ζ_C anyway).
- **R5 — scope creep, banned**: FE/root numbers (Gauss sums), general curves, sheaf
  construction, proportions (C3 fence), Tier-A dreams. Success criterion: Q1–Q4
  kernel-clean + axcheck.

## §7 Recommendation — GO at Tier C, sequencing after 71-P2 (per the memo)

Q0 can run any time (one warm run, zero dependencies); Q1–Q3 want 71-P2's W1 pattern on
disk to mirror; Q4 last (isolated M-risk). The pilot's claim surface ("first formal
Tate-type statements") remains **[pending A5 PART-2 dossier-level confirmation]** per
dossier 73 — quote conditionally until then.

## §8 Sources (this session)

DZDF: `Challenge/DedekindZetaChallenge.lean:10–30` (RayClassCharacter + main, read verbatim),
`DedekindZetaZeroFree/Arithmetic/RayClasses/Character.lean:12` (locator check — the dossier's
":14" is this lane's ":12" correction), `DedekindZetaZeroFree/HeckeCorollary.lean:12`.
Weil: `Weil/Defs/…/Trace/LFunctionRationalSheaf.lean:87`, `…/Trace/LAdicTraceFormulaFinal.lean:51`,
`Weil/Definitions.lean:161–165`, `Weil/LeanEval/WeilConjectures.lean:191`. This repo:
`research/pilots/71/{P0.lean,P1.lean,run_pilot.py,run_pilot.sh,logs/run4.log}`,
`research/pilots/71-prework.md`, `research/pilots/FF-sequencing-memo.md`,
`research/candidates/73-function-field-hecke-tate.md`, `research/bridges/function-field.md`
§4 FF-EZ3/§5, `research/feasibility/axiommath-bump/logs/`. mathlib (`ff2494ea`):
substrate per §3 (spot-checked: `Multiset.prod_ne_zero` Ring/Multiset.lean:39,
`Complex.norm_exp` Trigonometric.lean:993, `Polynomial.differentiable`
Calculus/Deriv/Polynomial.lean:96, `Fintype.one_lt_card` EquivFin.lean:257).
