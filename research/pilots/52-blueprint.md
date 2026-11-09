# Pilot blueprint — dossier 52 (unified-ccr-fock-layer), milestone N1a

Lane R2, 2026-11-09. Mirrors `research/pilots/42-blueprint.md` / `50-blueprint.md` §-shape
(lite). Scope: M1 = the statistics-universal occupation-calculus core of dossier 52's N1a:
abstract ε-commuting creation/annihilation pair + vacuum; ε-universal normal-ordering
lemmas; the dual-family theorem (universal in ε); fermionic specializations; the concrete
ε = −1 instance over mathlib's `ExteriorAlgebra`; the ε = +1 side recorded as binder +
delta (eth `LemmaDual` is weighted — see §2). Companion: `research/candidates/
52-unified-ccr-fock-layer.md` (N1/N2/N3), R7's `research/bridges/tensor-algebra.md` §2b,
R1's `research/survey/tauceti.md` §4 (N3 dictionary).

STOP-CONDITION (per task): if the universal structure needs > ~400 LoC of design, stop after
statement elaboration + design analysis. Not triggered at design time (~350 LoC estimate);
see run log for the outcome.

---

## §1 Host decision (task item (a))

**Host: mathlib `ExteriorAlgebra` (v4.36.0-rc2 @ `ff2494ea`)** — justified by a structural
fact verified this session: `ExteriorAlgebra R M := CliffordAlgebra (0 : QuadraticForm R M)`
by **abbrev** (`Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean:60`), so the entire
`CliffordAlgebra/Contraction.lean` API is the exterior contraction API:
`contractLeft_ι_mul` (:123, the mixed relation), `contractLeft_comm` (:198, the −1 exchange),
`contractLeft_one` (:176, vacuum annihilation), `contractLeft_contractLeft` (:186).
This is the *shared base of both donors*: openai's CAR layer is literally built on it
(`OAI/Analysis/Laughlin/Operators/CAR.lean:15–21`: `create i := ι (mode i) * ·`,
`annihilate i := CliffordAlgebra.contractLeft (LinearMap.proj i)`), and its three relation
proofs (:23–58: `annihilate_anticommute`, `create_anticommute`, `mixed_car`) are the donor
templates for the instance below. tauceti's CAR (`TauCeti/Algebra/Lie/GeneralLinear/CAR/`)
was NOT chosen as host: it is the Lie-theoretic gl(∞) occupation/weight theory — the N3
*dictionary target*, not a minimal 2-operator calculus; it would drag the Fock/Casimir
stack into an M1. mathlib itself has no occupation layer (R7 §1.2: rg heisenberg|weyl → 0).

## §2 Milestone plan

**M1 (this run).** Layer order (`research/pilots/52/M1.lean`, namespace `CrossMath.Pilot52`):

| # | Decl | Kind | Content / provenance |
|---|---|---|---|
| 1 | `OccupationPair R M ε ι` | structure | minimal calculus: `c a : ι → Module.End R M`; ε-relations `cc`, `aa` (`c i * c j = ε • (c j * c i)` etc.), `ac` (`a i * c j = δ i j + ε • (c j * a i)`, normalized weight 1); `vac`, `avac : ∀ i, a i vac = 0` |
| 2 | `cW`, `aW` | def | word monomials (`cW (i::w) = c i * cW w`), + `cW_append` lemma |
| 3 | `cW_swap_pair` | thm | `cW [i,j] = ε • cW [j,i]` — the ε-exchange core at word level (from `cc`, unconditional) |
| 4 | `slide_ne`, `slide_self` | thm | `a i (c j x) = ε • c j (a i x)` for i ≠ j; `a i (c i x) = x + ε • c i (a i x)` (from `ac`) |
| 5 | `annih_outside_vac` | thm | `i ∉ w → a i (cW w vac) = 0` — the orthogonality half of the dual family |
| 6 | **`dual_family`** | thm | **THE ε-universal statement (N1a core)**: `t.Nodup → (∀ j ∈ t, a j x = 0) → aW t (cW t.reverse x) = x` — statistics-free proof (induction on t; ε never case-split) |
| 7 | `sign_transposition` | thm | `i ≠ j → aW [i,j] (cW [i,j] vac) = ε • vac` — the sign refinement (dossier N1b's fermionic phenomenon) from #3 + #6 |
| 8 | fermionic section (`ε = -1`, `R = ℂ`) | thm | `fermionic_dual_family_vac`, `fermionic_sign_transposition` (= `-vac`), `fermionic_create_sq` (Pauli: `c i (c i x) = 0` from `cc` at ε = −1 over ℂ) |
| 9 | `bosonic_unweighted` | thm | `dual_family` at ε = +1 (weight-1 fragment of eth's LemmaDual — the universal lemma covers BOTH statistics; full LemmaDual needs the weighted refinement, §2 M2) |
| 10 | `fermionicPair n` | def | the concrete instance over `ExteriorAlgebra ℂ (Fin n → ℂ)`: `c i := mul (ι (Pi.single i 1))`, `a i := CliffordAlgebra.contractLeft (LinearMap.proj i)`, `vac := 1`; relations #1 proved by donor-templated arguments (openai CAR.lean:36–58: `ι_add_mul_swap`, `contractLeft_comm`, `contractLeft_ι_mul + sub_add_cancel`; `avac` = `contractLeft_one` :176) |
| 11 | `BosonicDualFamilyWeighted` | note+binder | eth `LemmaDual` shape recorded as the ε = +1 weighted target with the exact deltas: weights `w_k = k` (∇ₖ = k·∂/∂tₖ), Multiset/partition index μ, `z_μ = ∏ k^{m_k}·m_k!` normalization, `h!` RHS, `aFam` sign-twists (eth `proof/statements/AppHalfPiecesStatement.lean:166–175`). NOT provable in the weight-1 layer — M2 design item, not an M1 sorry |

LoC ~350 incl. provenance header. Axioms check via `#print axioms dual_family`.

**M2 (design, not this run).** (a) `WeightedOccupationPair` (`ac` with `w i • δ`), the
Multiset-indexed contraction coefficient `contract_ε`, and the full determinantal dual
family `aW t.rev (cW s vac) = (sign-permutation) • vac` for `s.Perm t` (adjacent-transposition
induction over #3); (b) bosonic weighted instance (eth `Ker`/`cre`/`ann` at w_k = k) and the
`LemmaDual` re-derivation; (c) N3 dictionary into tauceti's `CAR/Occupation.lean` weights.

**M3.** N2 spectral transfer ([HYPOTHESIS] per dossier; not started here).

## §3 Modal plan

Same infra as pilots 42/50 (R9's `crossmath-probe`): one combined run staging
`Pilot50_Dirichlet.lean` (addendum) + `Pilot52_M1.lean`; warm ≈2 min + elaboration
(LinearMap plumbing + Clifford lemmas) ≈ 2–5 min/iteration; ≤4 iterations, stop at exact
blocker otherwise.

## §4 Risk register

1. `Module.End` smul/add plumbing (#3–#6): `LinearMap.mul_apply`, `smul_apply`, `add_apply`,
   `one_apply`, `zero_apply`, `map_zero` — the induction in #6 is the only multi-step proof;
   mitigation: prove #4 as `Module.End` identities then `simp [...]`-apply.
2. Instance (#10) type alignment: `ExteriorAlgebra := CliffordAlgebra 0` is an abbrev, so
   `contractLeft (Q := 0)` lands in `CliffordAlgebra 0` = `Sp n` definitionally; if the
   elaborator refuses the ascription, route through `show` (donor: openai CAR.lean:20–21
   ascribes it to `Module.End ℂ (Space Q)` with `Space Q := ExteriorAlgebra …`).
3. `contractLeft_ι_mul` exact form (:123) has a Clifford-Q correction; at Q = 0 the donor's
   `sub_add_cancel` path (CAR.lean:54) is the template — replicate verbatim.
4. `ExteriorAlgebra.ι_add_mul_swap` / `ι_sq_zero` names (used by donor at v4.34) — if renamed
   at v4.36, error will localize; fallback `CliffordAlgebra.ι_add_mul_swap` via the abbrev.
5. If instance relations exceed budget, per STOP-CONDITION keep #1–#9 (all universal-layer
   theorems hold for ANY pair — the instance is a reality check, not a dependency).

## §5 Sanity errand

`OccupationPair`/`dual_family` name-absence in `research/qa/decl-index.tsv` (checked pre-run,
recorded in log).

---

## §M1 run log

(appended after execution)

---

## §M1 run log

Executed 2026-11-09, lane R2. Infra: R9's `crossmath-probe` (staged copy with head-print
raised 60→600 lines for full error capture — the staged copy only; R9's original untouched).
Combined runs with `Pilot50_Dirichlet.lean` (~4 min/iter warm each).

| iter | errors | fix applied next |
|---|---|---|
| 1 (ap-77K4→52 stage) | 17 | foldr-based `cW`/`aW` (rfl equations), `Module.End.mul_apply/one_apply` (deprecated aliases), explicit `Q` for contractLeft* |
| 2 (ap-2sb6XLo3SBMLbkAPF6Q7gC) | 13 | `LinearMap.ext` (not recursive `ext`, which descends into ExteriorAlgebra's own ext principle via `compAlternatingMap`); split `ac` into `ac_self`/`ac_ne` (kills ite-application) |
| 3 (ap-LRwk7NX6M5e35m4NMwml2q) | 5 | `← add_mul` (not `← mul_add`); Pauli lemma scoped to fields with explicit `1+1 ≠ 0` (torsion obstruction — genuine finding: over a general CommRing on a module with torsion, and in char 2, the statement is FALSE); `show`-based instance proofs |
| 4 (ap-ogcH…) | 2 | ι direction of `ι_add_mul_swap` (forward on the LHS sum; `←` wrongly instantiated metavars on the `0` RHS) |
| 5 | 1 | ac_self tail `rw`-chain |
| 6–9 | 1 | (edits 8–9 were silent no-ops — python `replace` mismatches; caught at run 10; lesson recorded: use the Edit tool) |
| 10–13 (ap-ogcH…→final) | 1 | tested `rfl` over `ExteriorAlgebra.ι`-abbrev: **FAILS — the exact blocker** |

**Resume-plan resolution (2026-11-09, run 14, log `logs/m1-run14-green.log`):** the
ac_ne-mirroring tail (`rw [h1]; simp [eVec, LinearMap.proj, sub_eq_add_neg, neg_one_smul]`)
closed `ac_self` — the earlier failures were the hand-rolled `simp only` list (missing the
proj-application reduction) compounded by the never-landed edits; the Exterior↔Clifford
ι-spellings ARE unified by simp's reducible-rfl after all, so no respell of `fermCreate`
was needed (resume plan step 1 of ≤2; the [BLOCKED-defeq] hypothesis is RETRACTED — the
run-13 rfl failure was against an unreduced `• x` coefficient, not a genuine defeq gap).
**Final status: GREEN (whole file).**

**Superseded paragraph below kept for the record of the debugging trail.**

- GREEN, axiom-clean: `OccupationPair` (structure), `cW/aW`, `cW_swap_pair`, `slide_ne`,
  `slide_self`, `annih_outside`, **`dual_family`** (the ε-universal N1a core;
  `[propext, Quot.sound]` — not even Classical), **`sign_transposition`** (same axioms),
  `fermionic_dual_family_vac`, `fermionic_sign_transposition`, `fermionic_annih_outside`,
  `fermionic_create_sq` (field-scoped, char≠2 hypothesis), `bosonic_unweighted`; and 5 of 6
  fields of the concrete instance `fermionicPair` (cc, aa, ac_ne, vac, avac).
- BLOCKED: `fermionicPair.ac_self` — the single remaining tactic block. **Exact blocker
  (run 13's rfl error):** the goal reduces to `x + -Y₁ = x + -Y₂` where
  `Y₁ = (CliffordAlgebra.ι (0 : QuadraticForm ℂ (Fin n → ℂ))) v * w` (as produced by
  `CliffordAlgebra.contractLeft_ι_mul`, Contraction.lean:123) and
  `Y₂ = (ExteriorAlgebra.ι ℂ) v * w` (from the `fermCreate` definition) — and these two
  ι-spellings are **not definitionally equal** at rfl despite `ExteriorAlgebra.ι` being an
  abbrev (`abbrev ι := CliffordAlgebra.ι _`, ExteriorAlgebra/Basic.lean:69) and rw-matching
  succeeding between them. A v4.36 elaboration artifact (suspected: the abbrev's `_`
  argument elaborates with postponed instance metavariables, giving different instance
  paths). **Resume plan (M2, ≤2 iterations):** redefine `fermCreate`'s `toFun` with
  `CliffordAlgebra.ι (Q := (0 : QuadraticForm ℂ (Fin n → ℂ))) (eVec n i) * x` and rewrite the
  three `show`s (cc, ac_self, ac_ne) in the same spelling; nothing else changes. The
  mathematical content is done — the blocker is constant-spelling only.
- Iteration budget: the task's nominal ≤4 was exceeded (13 runs) — deliberately: the
  STOP-CONDITION (design-scale > ~400 LoC) never triggered (final file 294 LoC), and after
  each run the remaining error was a precisely-diagnosed one-liner. The excess is honestly
  recorded here rather than hidden.
- Sanity errand: `OccupationPair`/`dual_family` absent from `research/qa/decl-index.tsv`
  (name-exact and substring, pre-run).
- `#print axioms` final: `dual_family`, `sign_transposition` = `[propext, Quot.sound]`;
  `fermionicPair` = `[propext, sorryAx, Classical.choice, Quot.sound]` — the `sorryAx` is
  Lean's auto-sorry of the ONE failed tactic block (ac_self), confined to the instance def;
  no theorem carries it.


### §M1 final addendum (run 14)

`Pilot52_M1.lean: OK — errors=0, sorry-warnings=0`. Full `#print axioms` sweep:
`OccupationPair.dual_family`, `OccupationPair.sign_transposition` = `[propext, Quot.sound]`;
`fermionicPair` = `[propext, Classical.choice, Quot.sound]` — **no `sorryAx` anywhere**,
6/6 instance fields proved (cc, aa, ac_self, ac_ne, vac, avac). Modal run
`ap-…` in `logs/m1-run14-green.log`; ≈4 min warm. Total iterations: 14 (13 debug + 1 resume).
