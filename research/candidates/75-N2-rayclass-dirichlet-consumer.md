# Candidate dossier 75-N2 — the ℚ ray-class↔Dirichlet consumer (the ℚ-instantiation of 75)

Lane A5 (discovery-design), Iteration 4, 2026-11-17. Commissioned by RESUME-BRIEF-ITER4
§Session-end restart item 4 ("charter the 75-N2 consumer design — the cycle's strongest
discovery candidate, NOT started"); spec source R2 §10 consumer (ii)
(`qa/iter4-review/r2-discovery-strength.md:658–705`). Parent dossier
`research/candidates/75-abelian-assembly-zetaL-proportions.md` (P-a/P-b landed GREEN;
C2/C3 carried = this dossier). Pre-registered milestones N0–N3 at
`research/pilots/75-prework.md` §(c) (N0/N1 executed as Pa/Pb; **this dossier is N2's
design**). Tags [VERIFIED] / [HYPOTHESIS] per claim; every corpus citation read at the
sibling this session (the AGENTS.md decl-index caveat honored — no TSV evidence used).

**Honesty header (read first).**

- **What is already proved and NOT claimed here:** the assembly engine (`zetaL_assembly_landed`,
  `Pa.lean:1473`; `Pb.lean` strip-distinct layer, pb-run11 GREEN), the ζ-column discharge
  pattern over V2 (`pilots/42/M4b.lean`, direct import G2-green), and the group-level ℚ
  dictionary in tauceti (`ratModulusEquivZMod`, `ratDirichletEquiv` — see Objects). The
  hEχ donor chain is audited GREEN at the zeta23 pin (`pilots/zeta23e/logs/
  zeta23e-p0-run1.log`: `thmE_A₀/B₀/C₀`, `paperInputsChi_L`, `thmE_A` all exactly
  `[propext, Classical.choice, Quot.sound]`, build OK — the donor hygiene gate executed).
- **What N2 adds:** (1) the **DZDF-side dictionary** — DZDF's ideal-functional
  `RayClassCharacter ℚ m` ↔ mathlib `DirichletCharacter ℂ N`, with the Hecke-tsum =
  `DirichletCharacter.LFunction` identification (absent from every corpus at this
  level — § Novelty; **billing per the A7 pre-shipping sweep: classical-known
  mathematics (Milne, *Algebraic Number Theory* / MIT 18.785) — the dictionary is
  FORMALIZATION-NOVEL only, never mathematical novelty**); (2) the **hEχ port** —
  zeta23's dyadic/distinct/primitive-only ThmE
  converted to the stack's cumulative/with-multiplicity/imprimitive-inclusive
  `EpsLowerCum` binder (the two R2 §10.1 convention deltas + one named classical
  structural input, zero-infinitude, that the mini-spec flagged but did not price —
  see F3(e)); (3) the **composed landing** — the first ζ_L zero-proportion statement for
  every abelian L/ℚ **with every proportion input discharged** (ζ-column: V2, kernel
  theorem; Dirichlet components: zeta23 ThmE, donor-pin-audited statement-port). After
  N2, the open core of 75's C2 shrinks from "component proportions (open for every
  Hecke L)" to "the DZDF factorization statement (a theorem we cannot import: G1b) +
  classical structural binders (window finiteness, zero-infinitude)".
- **Category: DISCOVERY-grade at the composed-statement level (S4(a) discharge-in-article
  of the 42/75 χ-column), CONDITIONAL on the factorization statement-binder (DZDF,
  G1-blocked) and classical structural binders.** The dictionary in isolation is class
  (iv) glue (classical textbook content — Neukirch VII §6); the discovery claim rests on
  the composed statement, which no corpus and no literature source states (§ Novelty).
  The cyclotomic INSTANCE of the factorization (ζ_{ℚ(ζ_m)} = ∏_χ L(s,χ)) is textbook
  (Washington ch. 4) — credited; DZDF's general-abelian statement is what N2 consumes as
  binder precisely to avoid re-deriving the subfield/conductor bookkeeping (R2 §10.4
  item 2: the CFT-free-over-ℚ alternative is corpus-absent and priced L).

---

## Name

75-N2-rayclass-dirichlet-consumer

## One-line pitch

Discharge the Dirichlet column of the 75 assembly at K = ℚ: a proved ℚ dictionary
(DZDF's ray-class ideal characters over ℤ ↔ mathlib Dirichlet characters, Hecke series =
`DirichletCharacter.LFunction` on ℜs > 1) + the audited zeta23 Theorem-E port (dyadic →
cumulative, distinct → with-multiplicity, primitive → imprimitive-inclusive) + the M4b
V2 ζ-column ⇒ **for every abelian extension L/ℚ, ≥ (2/3 − ε) of ζ_L's window zeros (with
multiplicity, cumulative (0,T]) lie on the critical line** — conditional only on the DZDF
factorization statement-binder and classical structural hypotheses; every proportion
input is a kernel-verified theorem.

## Precise mathematical statement

**Objects (corpus side, all [VERIFIED] this session).**

- *The assembly schema (ours, GREEN):* `zetaL_assembly_landed` (`research/pilots/75/
  Pa.lean:1473`) — from `hAbFac : ∀ s ≠ 1, fL s = (∏ i, F i s) * fK s` plus structural
  hypotheses and component binders `EpsLowerCum` at `c₀`/`c i`, conclude
  `EpsLowerCum ⟨multOf fL, hfinL⟩ c*`. Vocabulary: `multOf = analyticOrderNatAt`,
  `countCum`/`countOnCum`/`EpsLowerCum` (cumulative (0,T] windows, with multiplicity).
- *The factorization donor (DZDF, statement-binder ONLY — DO-NOT-CONSUME as build
  dependency, G1b FAIL stands):* `abelianFactorization`
  (`axiommath/DedekindZetaZeroFree/DedekindZetaZeroFree/LFunctions/Dedekind/
  AbelianRayCharacterFactorization.lean:62–73`, quoted verbatim below in the binder
  inventory): for `[Algebra K L] [IsGalois K L]`, `hcomm : ∀ σ τ, σ * τ = τ * σ` ⇒
  `∃ n (m : Fin n → Ideal (𝓞 K)) (χ : (i : Fin n) → RayClassCharacter K (m i)),
    (∀ i, m i ≠ ⊥ ∧ ¬(χ i).IsPrincipal) ∧ ∀ s, 1 < s.re →
    dedekindZeta L s = (∏ i, ∑' I, χ i I * (absNorm I : ℂ)^(-s)) * dedekindZeta K s`.
  DZDF's `RayClassCharacter F 𝔪` (`Challenge/DedekindZetaChallenge.lean:14–20`):
  `toFun : Ideal (𝓞 F) → ℂ`, multiplicative, `toFun ⊤ = 1`, `toFun I = 0 ↔ I = ⊥ ∨
  I ⊔ 𝔪 ≠ ⊤`, and `toFun (span {α}) = 1` for totally-positive α ≡ 1 mod 𝔪 — an
  ideal-functional structure with NARROW-ray congruence (the total-positivity clause =
  all real places adjoined; over ℚ this is the modulus (N)·∞ of the tauceti dictionary).
  `IsPrincipal` (:26–28): trivial on the coprime cone. Continuation donor:
  `dedekindAbelianQuotient` (`…/EntireAbelianQuotient.lean:13–21`): continuations
  fK, fL differentiable off {1} agreeing with `dedekindZeta` on ℜs > 1, and entire g
  with fL = g·fK off {1}; its identity-theorem step (:34–49,
  `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq` from the half-plane to ℂ∖{1})
  is the pattern N2's D3 step reuses.
- *The Dirichlet side (mathlib, on-pin `ff2494ea`):* `DirichletCharacter R n := MulChar
  (ZMod n) R` (`Mathlib/NumberTheory/DirichletCharacter/Basic.lean:39`);
  `DirichletCharacter.LFunction χ s = ZMod.LFunction χ s`
  (`Mathlib/NumberTheory/LSeries/DirichletContinuation.lean:60`), `= LSeries` on ℜs > 1
  (`Mathlib/NumberTheory/LSeries/ZMod.lean:95`); **entire for χ ≠ 1**
  (`differentiable_LFunction`, `DirichletContinuation.lean:97–99`); the imprimitivity
  Euler identity `LSeries ↗(changeLevel hMN χ) s = LSeries ↗χ s * ∏_{p ∈
  N.primeFactors} (1 − χ p * p^(−s))` on ℜs > 1
  (`Mathlib/NumberTheory/EulerProduct/DirichletLSeries.lean:173`); construction of a
  character from a unit hom `MulChar.mulEquivToUnitHom`
  (`Mathlib/NumberTheory/MulChar/Basic.lean:373`); the FE symmetry
  `completedLFunction_one_sub` for `IsPrimitive` χ (`DirichletContinuation.lean:291` —
  the optional C3-arm reflection, not needed for the proportion landing).
- *The group-level ℚ dictionary (tauceti, same toolchain/pin, NOT consumed by the pilot
  design but the novelty anchor):* `TauCeti.GlobalNumberFields.ratModulus n hn`
  (modulus (n)·∞ of ℚ, `…/Global/RayClass/Rat.lean:89`); `ratModulusEquivZMod :
  RayClassGroup (ratModulus n hn) ≃* (ZMod n)ˣ` (`Rat.lean:206`); the ray class of an
  integral ideal is its absNorm mod n (`coe_ratModulusEquivZMod_idealClass`,
  `Rat.lean:220`); `ratDirichletEquiv : RayClassCharacter (ratModulus n hn) ≃*
  DirichletCharacter ℂ n` (`…/RayClass/Character/Dirichlet.lean:75`), with
  `ratDirichletEquiv_absNorm` (:95), induced = `changeLevel` (:112), and conductor
  compatibility (file doc). NOTE: tauceti's `RayClassCharacter` is a group hom out of
  `RayClassGroup 𝔪` (`RayClass/Basic.lean:130` defines the group; `Character/
  Basic.lean:72` the `onIdeals` evaluation) — **a different type from DZDF's
  ideal-functional structure**; neither corpus bridges the two, and neither identifies
  the Hecke series with mathlib's `DirichletCharacter.LFunction`.
- *The Dirichlet proportion donor (zeta23, audited GREEN at its pin v4.33.0-rc2):*
  `thmE_A₀` (`Zeta23/ThmE/Final.lean:93–96`, wrapper `dirichlet_two_thirds_on_critical_line`,
  `Solution.lean:106–109`): for `1 < q`, `χ.IsPrimitive`:
  `∀ ε > 0, ∃ T₀, ∀ T ≥ T₀, (2/3 − ε) * (NcountL χ T (2*T) : ℝ) ≤ N0starL χ T (2*T)`
  — counting over **mathlib's `DirichletCharacter.LFunction`** (Final.lean docstring;
  conventions `Challenge.lean:92–108`: `NcountL` = with-multiplicity denominator in the
  DYADIC window (T,2T]; `N0starL` = DISTINCT on-line numerator). Audit:
  `pilots/zeta23e/P0.lean` + `pilots/zeta23e/logs/zeta23e-p0-run1.log` (build OK;
  `thmE_A₀/B₀/C₀/paperInputsChi_L/thmE_A` all triad-only). No cumulative Dirichlet form
  exists in zeta23 (`rg "dirichlet.*cumulative"` → 0; cumulative forms are ζ-only,
  `Solution.lean:56–77`).
- *The ζ-column donor (V2, BUILDS on our pin, direct-import G2-green):*
  `ZetaZeros.simple_proportion_d4` (`axiommath/ZetaZerosV2/ZetaZeros/Main.lean:130`,
  0.6725 > 2/3) and `distinct_proportion_d5` (:149, 5/6 arm) — consumed exactly as
  `pilots/42/M4b.lean` does (`import ZetaZeros` at :45; endpoints cited :1215–1216; the
  M4b landings `zetaK_two_thirds_landed_of_V2` GREEN + full axcheck).

**(N2-a) The ℚ dictionary (DZDF-ideal-character → Dirichlet character + L-series
identification) — the proved glue.** For every `q ≠ 0` and every DZDF
`RayClassCharacter ℚ (span {q})` χ [the structure statement-quoted in-corpus], there is a
Dirichlet character `χ̂ : DirichletCharacter ℂ q` with:

  (i) *value dictionary:* `χ (span {k}) = χ̂ (k : ZMod q)` for all `k : ℤ`
    (both sides 0 exactly off the coprime cone, by DZDF `eq_zero_iff'` vs
    `MulChar.map_nonunit`);
  (ii) *L-series identification:* `∑' I : Ideal (𝓞 ℚ), χ I * (absNorm I : ℂ)^(−s)
    = χ̂.LFunction s` for `1 < s.re` (the DZDF Hecke series of the factorization
    identified with the mathlib L-function);
  (iii) *principality transfer:* `¬χ.IsPrincipal ↔ χ̂ ≠ 1` (so DZDF's nonprincipality
    delivers the `χ ≠ 1` needed for entireness);
  (iv) *converse/inflation:* every `ψ : DirichletCharacter ℂ N` with the right
    imprimitivity data arises thus (the map is essentially surjective onto Dirichlet
    characters viewed at level q) — needed only to READ the factorization output as a
    Dirichlet family, not for the landing itself.

**(N2-b) Euler-correction strip immunity (imprimitive components).** For `ψ` at level N
with conductor M ∣ N: `L(s, ψ) = L(s, ψ*) * ∏_{p ∈ N.primeFactors∖M} (1 − ψ* p p^(−s))`
on ℜs > 1 (mathlib `LSeries_changeLevel`, level-swapped), each correction factor
`1 − ψ* p p^(−s)` is entire with all zeros on `ℜs = 0` (`|p^(−s)| = 1` forces
`ℜs = 0`; `Complex.abs`-level, 75-prework §(d) (d2)); hence `multOf (ψ.LFunction) ρ =
multOf (ψ*.LFunction) ρ` for every `0 < ρ.re < 1`, and window counts/transfers coincide
— strip-window counting is immune to imprimitivity. (tauceti has the general-K analogue:
`RayClassCharacter.eulerCorrection` entire and zero-free on ℜs > 0, `heckeLFunctionC_
induced`, `…/LFunctions/Hecke/Basic.lean` header — the ℚ/Dirichlet-level instance is
ours to prove but the mathematical content is the same.)

**(N2-c) The hEχ port (donor dyadic/distinct/primitive → stack cumulative/with-mult/
imprimitive).** For every `ψ : DirichletCharacter ℂ N` with `ψ ≠ 1`, from the verbatim
zeta23 binder `hEχ^dyad` for the primitive associate ψ* (statement-port, zeta23e
precedent), the window/count identifications (`NcountL`-block ↔ `ZeroMult.countCum`
over (T,2T]; `N0starL` ≤ with-multiplicity on-line count), and the classical
zero-infinitude structural hypothesis `hUnbψ` (see F3(e)):
`EpsLowerCum ⟨multOf ψ.LFunction, hfinψ⟩ (2/3)`.

**(N2-d) THE LANDING (the headline).** For every abelian L/ℚ (data: the continuations
fL, fK = ζ-side, and the factorization family from the DZDF statement-binder translated
through N2-a): with the ζ-column discharged by `ZetaZeros.simple_proportion_d4`
(imported, M4b pattern verbatim) and each Dirichlet component by N2-c,

  `EpsLowerCum ⟨multOf fL, hfinL⟩ (2/3)`

— i.e. for every ε > 0 there is T₀ with `(2/3 − ε)·countCum(T) ≤ countOnCum(T)` for
ζ_L's window zeros, cumulative (0,T], with multiplicity — **conditional only on**: the
DZDF `abelianFactorization` statement-binder (a theorem in the donor we cannot import:
G1b), structural hypotheses (analyticity off {1}, `analyticOrderAt ≠ ⊤`, window
finiteness for fL — classical, unformalized; for the components PROVED from
`differentiable_LFunction` + discreteness), and `hUnbψ` per Dirichlet component. In
particular the statement covers every cyclotomic field ℚ(ζ_m) and every subfield — the
uniformity over all abelian L/ℚ is carried by the DZDF binder, not by us.

**(N2-e, optional, carried from C3):** the location-side strip confinement for real
abelian L/ℚ with the Dirichlet reflection discharged by mathlib's
`completedLFunction_one_sub` (`DirichletContinuation.lean:291` — primitive χ; gamma
factors zero-free ⇒ multOf transfer ρ ↔ 1−ρ̄) instead of pilot 50's `hFEχ` binder.
Not part of the N2 pilot; recorded because it is the first C3 arm with an on-pin
reflection source.

## Novelty check

Corpus side (direct-source `rg`, run this session in the sibling trees, read-only):

1. **The DZDF→mathlib-Dirichlet dictionary at the ideal-character + L-series level:
   absent from every corpus.** mathlib has **no ray-class machinery at all**
   (`rg -l "RayClass" Mathlib/` → 0 files — no `RayClassGroup`, no ray class group of
   ℚ; the ℚ-special case is NOT "nearly free in mathlib", it is absent). tauceti has
   the GROUP-level dictionary (`ratDirichletEquiv`, `Character/Dirichlet.lean:75`) but
   (a) its `RayClassCharacter` type is a group hom, not DZDF's ideal-functional
   structure — no bridge between the two exists anywhere; (b) no Hecke-series =
   `DirichletCharacter.LFunction` identification for ℚ exists in tauceti
   (`rg "heckeLFunctionC" TauCeti/ | grep -i "rat|dirichlet|ZMod"` → 0; the Hecke
   theory is general-K). DZDF itself has no `DirichletCharacter` content
   (`rg -l "DirichletCharacter" DedekindZetaZeroFree/` → 0). V2 likewise (→ 0).
2. **ζ_L proportion statements of any kind: absent from every corpus** (re-confirmed
   from R2 §5 q1–q2, this lane re-ran the load-bearing greps: V2 ζ-only
   (`ZetaZerosV2/ZetaZeros/Main.lean` proportions `simple/distinct_proportion_d4/d5`);
   DZDF zero-free only, no counting; zeta23 ζ + Dirichlet only (`Solution.lean:56–119`);
   tauceti's ζ_K factorization quadratic-only (`ZetaMul.lean`, `DedekindZeta/Quadratic.
   lean`); OAI location-only 7/8 (`OAI/NumberTheory/DirichletL/Nonvanishing.lean`).
3. **Nearest formal misses (≥2 required; four named):**
   - **tauceti `ratDirichletEquiv`** (`Character/Dirichlet.lean:75`) — the ray-class
     GROUP/character ↔ Dirichlet-character dictionary for ℚ, with conductor and
     changeLevel compatibility. Delta: group characters, not DZDF's ideal-functional
     structure; no L-series identification; no consumer; no counting.
   - **OAI `SevenEighths.IdealCharacter` / `RayQuotient`** (`OAI/NumberTheory/
     DirichletL/IdealCharacter.lean` — `value M χ : Ideal A → ℂ` from `MulChar (A ⧸ M) ℂ`
     over a PID, `value_span`, `isUnit_mk_iff_isCoprime`; `RayQuotient.lean` —
     `ofResidue`, ray-quotient characters; `IdealEuler.lean` — ideal Euler series) —
     the CONVERSE dictionary direction (residue → ideal) over ℤ[ω], built for the 7/8
     architecture. Delta: wrong base ring (Eisenstein), wrong direction, no ℚ
     ray-class input, no `DirichletCharacter.LFunction` identification, no proportions.
   - **our own 75-C2** (dossier 75, this repo) — the same landing with the Dirichlet
     components as OPEN binders. Delta: N2 discharges them (the S4(a) move).
   - **our own 42-M4b** (`pilots/42/M4b.lean`) — the ζ-column discharge pattern N2
     reuses. Delta: quadratic ζ_K only; no dictionary; no Dirichlet column.
4. **Literature (informal) nearest misses:** DLRT arXiv:1908.04876 Thm 1.1 / Cor 1.3(i)
   — fixed abelian/quadratic K, GRH-conditional, o_K(1) as T→∞, DISTINCT zeros; nothing
   uniform over L, no with-multiplicity form, no unconditional proportion (A5 PART-2
   P2-3 scope flip; re-confirmed by R2's arXiv sweep 2026-11-16). Bansal–Maji
   arXiv:2507.18121 — Hardy-type INFINITUDE of on-line zeros for any number field; no
   proportion. Liu-2 arXiv:2610.26835 — half-plane nonvanishing, the C3 clock, never
   proportions. **[A7 pre-shipping sweep, folded 2026-11-17 —
   `qa/iter4-review/a7-n2-preshipping-sweep.md`, agent-08: two MANDATORY nearest-miss
   rows:]** (a) **arXiv:2608.13637 Theorem B** — on-line proportions for FIXED primitive
   Dirichlet χ, unconditional but with constants O_q non-uniform in the conductor; the
   paper's own text states the ζ_K assembly corollary "is not made anywhere in the
   text" — the honest comparison is hypothesis-shape-to-hypothesis-shape exactly as
   the dossier styles DLRT: our N2-d is uniform over every abelian L/ℚ with
   conductor-uniform constants (via the ThmE/V2 discharges), theirs is fixed-χ with
   non-uniform constants and no assembly; neither implies the other; (b) **the D'Souza
   simple-zeros zeta23 fork** — a conductor-aspect simple-zeros family with
   ThmE-shaped endpoints; single-commit provenance and open-sorry hygiene caveats per
   the sweep — registered as watch-level prior art for the P2 distinct/simple tiers
   only, not a competitor to the with-multiplicity 2/3 family N2-d consumes. The
   dictionary itself is classical (Neukirch VII §6; Washington ch. 4 for the
   cyclotomic factorization instance; **A7 billing note: Milne's *Algebraic Number
   Theory* / MIT 18.785 notes spell the ℚ dictionary out — the dictionary is
   formalization-novel only and must NEVER be billed as mathematical novelty**) —
   class (iv) in isolation; **the composed statement (N2-d) appears nowhere**.
   Kuwahara-style traps: none (proportion assembly, not concentration-from-gap).
5. **mathlib ray-class API finding (the task's explicit question):** none exists —
   `RayClassGroup`/`RayClass` are tauceti-only. The ℚ-special case IS cheap, but for a
   different reason than hoped: over ℤ every ideal is (k), so the DZDF-structure →
   Dirichlet-character bridge is concrete (PID classification + a three-line
   well-definedness trick + `MulChar.mulEquivToUnitHom.symm`), NOT because mathlib
   already knows ray class groups of ℚ. What mathlib DOES supply on-pin: the entire
   Dirichlet L-function layer (LFunction, entireness for χ ≠ 1, LSeries agreement,
   changeLevel Euler identity, `MulChar` construction) — i.e. the RECEIVING side of the
   dictionary is fully native; only the ray-class side must be bridged by hand.

## Bridge analysis

- Corpora bridged: **DZDF (the general-abelian factorization, statement-binder — G1b
  keeps it un-importable) × zeta23 (Dirichlet 2/3 proportions, donor-pin-audited
  statement-port) × ZetaZerosV2 (ζ-column, direct import on our pin) × mathlib (the
  Dirichlet L-function object layer: LFunction/entireness/changeLevel/MulChar) × our
  pilot-75/42 stack (assembly engine, count vocabulary, V2 glue)**. Five corpora; no
  subset produces N2-d: zeta23 has proportions but no ζ_L object and no factorization
  beyond its ζ framework; DZDF has the factorization but no counting; V2 is ζ-only;
  mathlib has neither ζ_L nor proportions; our stack has the assembly but, before N2,
  no Dirichlet-column source and no dictionary.
- The three glues (N2-a dictionary, N2-b strip immunity, N2-c port) exist nowhere —
  each is small, each is load-bearing, each is verifiable at statement level first
  (the ProbeE/N0 pattern).
- Empty-zone fit: R2 §9 priority 1 ("75/42 statement class → discharge hEχ … the
  cheapest path to a genuinely unconditional theorem in the project's flagship
  statement class"); R2 §10.7 (KPI hook: 42-v2 + 75-N2 as the two discovery-graded
  Iter-4 deliverables); RESUME-BRIEF-ITER4 §Session-end ("the cycle's strongest
  discovery candidate").

## Proof-strategy sketch

1. **(N2-a, S–M) the dictionary over ℤ.** Fix q ≠ 0, DZDF χ. Every ideal of 𝓞 ℚ ≃ ℤ is
   `span {k}`, k ≥ 0 unique (`Rat.ringOfIntegersEquiv` transport, mathlib
   `NumberField/Padics/HeightOneSpectrum.lean` `intEquiv` layer; tauceti's
   `IntegersRat.lean` is the reference for the absNorm transport if imported).
   Define `χ̂` on `(ZMod q)ˣ`: `χ̂ (k mod q) := χ (span {k})` for k > 0 coprime to q.
   Well-defined: if a ≡ b mod q (both coprime, positive), pick c with bc ≡ 1 mod q
   (ZMod unit inverse; lift to ℤ>0 coprime) — then ac ≡ 1 and bc ≡ 1 mod q, so by
   DZDF `map_span'` (α = ac, totally positive since > 0, α − 1 ∈ (q)):
   `χ((ac)) = 1 = χ((a))·χ((c))` and `χ((bc)) = 1 = χ((b))·χ((c))` ⇒ `χ((a)) = χ((b))`
   (values are nonzero on the coprime cone by `eq_zero_iff'`). Multiplicativity:
   `map_mul'` + `span_mul`. Package via `MulChar.mulEquivToUnitHom.symm`
   (`MulChar/Basic.lean:373`) and `DirichletCharacter` = `MulChar (ZMod q) ℂ` by rfl.
   (i) is then `value`-style (`Ideal.span` transport; OAI's `IdealCharacter.value_span`
   is the model lemma shape). (iii): χ IsPrincipal ⇒ χ̂ = 1 by evaluation; χ̂ = 1 ⇒ χ
   trivial on all coprime ideals by unique factorization of (k) into prime ideals
   (multiplicativity reduces to primes, primes are (p), p coprime ⇒ χ̂(p) = 1 — needs
   the ℤ-prime-ideal classification; routine over ℤ).
2. **(N2-a(ii), S–M) the L-series identification.** On ℜs > 1 both series converge
   absolutely: the Hecke tsum over `Ideal (𝓞 ℚ)` reindexes along `k ↦ span {k}`
   (nonzero ideals ↔ ℕ⁺; `absNorm (span {k}) = k`) to `∑' k, χ̂-shaped k^(−s)` =
   `LSeries ↗χ̂ s` (`tsum` transport + `ZMod.LFunction_eq_LSeries`,
   `ZMod.lean:95`). Friction: the `LSeries` API sums over ℕ with the
   arithmetic-function wrapper (`↗χ̂`) — one `LSeries_summable`/`HasSum` bridge.
3. **(N2-d factorization translation, S) identity-theorem transfer.** From the DZDF
   binder: `fL s = (∏ Hecke_i s) * fK s` on ℜs > 1 (continuations per
   `dedekindAbelianQuotient`'s shape, also binder-quoted); N2-a(ii) identifies each
   Hecke_i with `χ̂_i.LFunction` there; both sides of the target `hAbFacℚ : ∀ s ≠ 1,
   fL s = (∏ χ̂_i.LFunction s) * fK s` are analytic off {1} (components entire by
   (N2-a(iii)) `χ̂_i ≠ 1` + `differentiable_LFunction`; fL, fK by hypothesis), so the
   DZDF pattern (`EntireAbelianQuotient.lean:34–49`) transfers the identity from the
   half-plane to ℂ∖{1}. This is the exact `hAbFac` form `zetaL_assembly_landed`
   consumes — no change to the engine.
4. **(N2-b, S) strip immunity.** `LSeries_changeLevel` (`DirichletLSeries.lean:173`)
   gives the Euler-factor identity on ℜs > 1; both sides meromorphic/entire ⇒ identity
   theorem ⇒ on all ℂ; each factor `1 − ψ p p^(−s)`: `Complex.abs (p^(−s)) = p^(−ℜs)`,
   so a zero forces `p^(−ℜs) = |ψ p|^(−1) = 1` ⇒ `ℜs = 0`; hence the correction is
   zero-free on the open strip `0 < ℜs < 1`, and `multOf` transfer
   (`multOf_mul`-style, pilot vocabulary) preserves strip window counts. (This is
   75-prework §(d)(d2); mathlib now supplies the series identity, so only the
   zero-locus + count-invariance lemmas remain.)
5. **(N2-c, S–M) the port.** (a) *distinct → with-multiplicity*: `N0starL`-block ≤
   with-mult on-line block count (article 42 §4's argument, already the recorded safe
   direction). (b) *window identification*: `NcountL χ T (2T)` ↔ the stack's dyadic
   block count of `multOf ψ.LFunction` (an `EpsLowerCum_congr`-style congruence,
   `pilots/42/M2b.lean:958` pattern; `zeroMultL = (analyticOrderAt …).toNat` = our
   `multOf` by construction). (c) *dyadic → cumulative*: sum the block inequality over
   the O(log T) dyadic segments covering (2T₀₀, T]; the initial segment (0, 2T₀₀] is a
   fixed constant absorbed against `hUnbψ` (zero-infinitude, below); conclude with an
   ε/2-split. (d) *primitive → imprimitive-inclusive*: compose with N2-b.
6. **(N2-d, S) the assembly instantiation.** `zetaL_assembly_landed` at `c₀ := 2/3`
   (ζ-column: `EpsLowerCum_mono two_thirds_le_d4` over the M4b count-identification
   glue, `import ZetaZeros` — the `zetaK_two_thirds_landed_of_V2` pattern verbatim;
   components: N2-c) with `cStar := 2/3`. Landing statement + `#print axioms` over
   every new decl; full-coverage axcheck per N3.

**Hardest steps:** N2-a's well-definedness/converse bookkeeping (step 1 — concrete but
fiddly ℤ-ideal transport) and N2-c's dyadic→cumulative absorption (step 5c — needs
`hUnbψ`). No new analysis anywhere else; the analytic content is deliberately
quarantined into (already-proved) donor theorems + named classical structural binders.

**The hUnbψ obligation (named, priced — the honest new cost).** The dyadic donor bound
cannot be converted to cumulative without knowing the component zero count is unbounded
(R2 §10.1(b) flags "unboundedness of N(0,T]" as the needed input; zeta23 has no
cumulative Dirichlet form — verified — and its ζ-side cumulative route consumed its own
framework's growth law). Classical (functional-equation order argument; Titchmarsh
§5.8, Davenport ch. 9), unformalized in mathlib and not visible in the audited zeta23
chain. N2 carries it as a structural binder `hUnbψ : Filter.Tendsto (fun T =>
(countCum ⟨multOf ψ.LFunction, _⟩ T : ℝ)) atTop atTop` — a NAMED CLASSICAL FACT with
citation, S4(a)-compatible; a P2 probe item checks whether `paperInputsChi_L`'s
dependency chain already supplies a usable form (if so the binder drops).

## Feasibility

R9's F0–F6 shape. Base: the GREEN pilot-75 stack (`Pa.lean` 1,557 / `Pb.lean` 2,296
LoC, triad-audited) + M4b's V2 glue + the audited zeta23 statement layer.

- **F0 (entry):** P0 statement rung (below), then P1 dictionary, P2 port, P3 landing.
- **F1 mathlib entry points [VERIFIED on-pin]:** `DirichletCharacter.LFunction`
  (`DirichletContinuation.lean:60`), `differentiable_LFunction` (:97),
  `ZMod.LFunction_eq_LSeries` (`ZMod.lean:95`), `DirichletCharacter.LSeries_changeLevel`
  (`EulerProduct/DirichletLSeries.lean:173`), `MulChar.mulEquivToUnitHom`
  (`MulChar/Basic.lean:373`), `changeLevel`/`conductor`/`IsPrimitive`
  (`DirichletCharacter/Basic.lean:65`+), `Rat.ringOfIntegersEquiv`/`intEquiv`
  (𝓞 ℚ ≃ ℤ), `Ideal.span` PID classification over ℤ, `AnalyticOnNhd.
  eqOn_of_preconnected_of_eventuallyEq` (identity transfer), `ZetaZeros` (V2, import).
  NOT in mathlib: any ray-class notion; `dedekindZeta ℚ = riemannZeta` (unneeded — fK
  stays abstract exactly as in the M4b/75 landings).
- **F2 donor lemmas:** DZDF `abelianFactorization` + `RayClassCharacter` structure +
  `dedekindAbelianQuotient` (statement-binder ONLY; G1b; quote under a
  `hDZDFAbelianFac : Prop` mirror exactly as `hAbFac` mirrors it in `Pb.lean:51` —
  zero DZDF/vendor imports). zeta23 `thmE_A₀` (verbatim binder-port; zeta23e P0
  precedent — the port shape elaborated in-donor-tree GREEN). V2 `simple_proportion_d4`
  (direct import, M4b precedent). tauceti (OPTIONAL, route decision): import for the
  ℤ↔𝓞 ℚ ideal/absNorm transport (`IntegersRat.lean`) and as a cross-check of N2-a
  against `ratDirichletEquiv_absNorm` — same toolchain/pin; the pilot can stay
  Mathlib-only (`Pb.lean`'s zero-import convention) because the dictionary is concrete
  over ℤ; recommendation: Mathlib-only primary, tauceti-import as fallback if the
  𝓞 ℚ-ideal transport fights (F-friction 1).
- **F3 missing glue:** (a) N2-a dictionary (S–M, ≈0.3–0.5k LoC); (b) N2-c port
  (S–M, ≈0.3–0.5k, incl. dyadic→cumulative + hUnb handling); (c) N2-b immunity
  (S, ≈0.1–0.15k); (d) count/window identifications (S, ≈0.1k); (e) `hUnbψ` binder
  (0 LoC) or donor-chain probe (1 probe run); (f) window finiteness for components —
  PROVED from `differentiable_LFunction` + zero-discreteness on compacts (routine,
  real obligation, the pilot-20 pattern; ≈0.05–0.1k); fL-side finiteness stays
  structural binder (as in 75).
- **F4 Effort:** **M** — ≈0.9–1.4k LoC new over the carried stack (P0 0.15–0.25 +
  P1 0.3–0.5 + P2 0.35–0.55 + P3 0.1–0.15). Reconciliation vs 75-prework §(e) N2
  (0.4–0.8k): the prework priced the ℚ-route before the hEχ port was pulled in-spec
  (R2 §10 made the port part of the N2 consumer); the dictionary side shrinks
  (mathlib's changeLevel identity + tauceti's group dictionary de-risk it), the port
  side grows (hUnb + dyadic→cumulative were unpriced).
- **F5 Risks:** (i) F-friction: `𝓞 ℚ`-vs-ℤ ideal transport in N2-a (mitigate: tauceti
  import fallback); (ii) the `LSeries`-API bridge (arithmetic-function wrapper vs raw
  tsum) — known-shape work, 1–2 runs; (iii) `hUnbψ` cannot be discharged in-corpus
  (expected outcome: binder stays, honestly billed as classical-structural — the
  landing's billing must say so); (iv) DZDF statement-quote drift (the Challenge-file
  structure uses `NumberField.RingOfIntegers` sugar — quote verbatim at the DZDF
  repo's own names, G1a precedent says it elaborates on-pin); (v) the G1 gate is
  permanent for the factorization binder — N2-d is CONDITIONAL forever unless a
  G1-cleared DZDF build or an alternative formalization of abelianFactorization over
  ℚ appears (the Kronecker–Weber route is corpus-absent, priced L, not recommended);
  (vi) zeta23 pin immutability (v4.33) — statement-port only, never import (the
  ProbeE/zeta23e discipline).
- **F6:** kernel-only; Modal statement-first (`crossmath-pilot-75` runner warm), 2cpu/
  4GB defaults, telemetry, logs with provenance headers; full-coverage axcheck
  (`axcheck_full.py` pattern) at N3; V2-import route adds the on-pin `#print axioms`
  of the endpoints (A3 recommendation 4, executed in M4b already).

## Significance

This is the S4(a) move for the project's flagship statement class: the first ζ_L
zero-proportion statement where **every analytic-content input is a kernel-verified
theorem** (ζ-column: V2; Dirichlet components: audited zeta23 ThmE) rather than an open
binder — R2 §9's priority 1 and §10.7's KPI hook. The remaining binders are honest and
named: the DZDF factorization statement (a THEOREM in a donor we cannot import —
billed as donor consumption, not an open problem) and classical structural facts
(window finiteness of ζ_L, zero-infinitude per component). The dictionary (N2-a) is the
reusable interface: it is simultaneously the missing piece for 50-M2's R2 route
(DZDF 31/32 at K = ℚ, needs (d1) only — 75-prework §(d)) and the template for any
future DZDF-over-ℚ consumer. If a future G1-cleared DZDF build (or a formal
Kronecker–Weber factorization) lands, N2-d becomes unconditional-in-structural-binders
only — the statement is stable across that motion (same shape, fewer hypotheses).

## Score (filled at triage — leave empty)

- Novelty (1–5): —
- Significance (1–5): —
- Effort (S/M/L → 1–5): —
- Rank (novelty × significance ÷ effort): —

**Lane proposal (A5, non-binding):** Novelty 4 (composed statement new everywhere;
dictionary classical-in-substance — do not grade the dictionary above glue), Significance
4 (S4(a) discharge of the flagship class's χ-column; first every-abelian-L/ℚ proportion
statement), Effort 2–3 (M, ≈0.9–1.4k LoC over GREEN infrastructure; all donors audited
or on-pin). Rank ≈ 5.3–8 at N4. Sequencing: P0 immediately (statement rung, no gates);
P1/P2 parallelizable; P3 + axcheck at close. Honest category: **DISCOVERY-grade at the
composed-statement level (S4(a)); the dictionary is interface glue (class iv); the
factorization binder is donor consumption (class iii component), billed as such.**

---

## S1–S4 self-assessment (A5, 2026-11-17; the Iteration-4 quality gate run explicitly)

Bar: `qa/iter4-review/r2-discovery-strength.md` §4.

- **S1 (statement-level novelty, named nearest-miss).** PASS for N2-d. The
  mathematical statement — ≥ (2/3−ε) on-line with-multiplicity proportion for ζ_L,
  uniformly over every abelian L/ℚ, cumulative windows — is absent from all five
  corpora (§ Novelty 1–2, direct-source queries recorded) and from the literature
  (nearest: DLRT 1908.04876 Thm 1.1/Cor 1.3(i) — fixed K, GRH-conditional, distinct,
  T→∞ asymptotic; delta one sentence: "uniform over all abelian L/ℚ, unconditional
  proportion inputs, with-multiplicity form"). Formal nearest-misses named at
  file:decl granularity: tauceti `ratDirichletEquiv` (Character/Dirichlet.lean:75),
  OAI `IdealCharacter.value` (IdealCharacter.lean), our 75-C2 and 42-M4b.
  Corollary-level check: N2-d is NOT a corollary of any single donor (five corpora
  compose); but the assembly math IS corollary-level — S1 passes on the statement,
  not the proof. N2-a alone would FAIL S1 (textbook, Neukirch VII §6) — correctly
  billed as glue.
- **S2 (essential multi-corpus bridge).** PASS, strong: DZDF statement × zeta23 × V2 ×
  mathlib × in-repo stack; no corpus subset produces N2-d; the dictionary and port are
  the non-bookkeeping glue (they carry real mathematical decisions: well-definedness,
  Euler immunity, window absorption).
- **S3 (non-trivial proof OR surprising statement).** PASS on limb (b) only: the
  statement is the discovery (first ζ_L proportion family with discharged inputs —
  the R2-capped "load-bearing inputs are open binders" objection is precisely what N2
  removes). Limb (a) fails honestly: the proof is dictionary + port + engine, all
  elementarity; the only non-bookkeeping steps (the c-trick, the dyadic absorption,
  Bonferroni-inheritance) are small. Elementarity acceptable in case (b) per the bar.
- **S4 (discharge discipline).** PASS with billing conditions: (a) every binder named
  with citation — factorization binder = DZDF `abelianFactorization` (a donor THEOREM,
  G1-blocked from import; per S4(c) this is billed as donor consumption, class (iii)
  component, in the article title/abstract); `hUnbψ` = classical zero-infinitude
  (Titchmarsh §5.8/Davenport ch. 9), unformalized, named; window finiteness of fL =
  classical, named. No binder restates the conclusion. (b) previously-open binders
  discharged in-article: YES — hEχ, open since the main run (42 §4), discharged via
  the audited ThmE port; the ζ-column already discharged in M4b, reused. This is the
  S4(a) pattern the bar asks for.
- **Provisional grade: PASS (discovery-grade at composed-statement level, S4(a)),
  N4 / S4 / E2–3.** What hardens it: (i) P0 statement-rung GREEN (the binder set
  elaborates on-pin — removes the quote-drift risk); (ii) P1–P3 GREEN with triad-only
  axcheck; (iii) one focused literature re-sweep at article time for
  "uniform-over-L Dirichlet-assembly" statements (the R2 §5 q2 sweep stands; nothing
  since 2026-11-16 expected to move it); (iv) the `hUnbψ` probe (if zeta23's chain
  supplies unboundedness, one binder drops and the grade is unchanged; if not, the
  article carries the binder prominently). What would WEAKEN it: discovering that
  `paperInputsChi_L`'s audited chain does not actually cover the ThmE statement shape
  quoted (contradicted by zeta23e P0's GREEN in-tree elaboration — low risk), or a
  uniform-over-L informal prior appearing (monitored at article time).

## Milestone status (A5, updated 2026-11-18 post-M3 — runs 9–19)

- **P0 GREEN** (15/15 triad, `pilots/75/logs/n2-p0-run4.log`; unchanged).
- **P1 M1 GREEN-triad 7/7** — the full P1-a dictionary layer:
  `exists_nat_span` (ℚ ideal classification), `chi_span_eq_one/mul/ne_zero`,
  **`chi_span_residue` (the c-trick, kernel-verified since run 7)**,
  `ratCharOf` + `ratCharOf_apply` (the value dictionary, ALL k at 1 < q).
  Verified state run 10 (`logs/n2-p1-run10.log`).
- **P1 M2 GREEN-triad** — **`heckeTsum_eq_ratCharOf_LFunction`** (N2-a(ii),
  the L-series identification): the DZDF Hecke tsum over ideals of 𝓞 ℚ =
  `DirichletCharacter.LFunction (ratCharOf hχ hq)` on ℜs > 1. Verified state
  run 15 (`logs/n2-p1-run15.log`, sha 2e5217010e46…; 8/8 file decls triad-clean,
  0 sorry). **Components (i) and (ii) of `HasQDirichletDictionary`
  (`N2-P0.lean:152`) are now kernel-verified theorems.**
- **P1 M3 GREEN-triad 6/6 — P1 COMPLETE** (re-task session, runs 16–19,
  `logs/n2-p1-run19.log`, sha ca1089e2a0c1…; 14/14 file decls triad-clean,
  0 sorry): `ratCharOf_eq_one_iff` (principality transfer, N2-a(iii)),
  `isPrincipal_of_modulus_one` (q = 1 degeneracy), `identity_theorem_extension`
  (the DZDF EntireAbelianQuotient pattern on our pin — half-plane → ℂ∖{1}),
  **`hasQDirichletDictionary` (N2-a DISCHARGED: the full dictionary Prop is a
  kernel-verified theorem)**, `factorization_identity_extension` (the
  `hAbFacQ : ∀ s ≠ 1` bridge the engine consumes),
  `dirichletFactorizationTransfer` (the composed transfer, corrected shape).
- **STATEMENT FIND (find-#4 precedent class): `DirichletFactorizationTransferQ`
  (`N2-P0.lean:166`) as literally stated is NOT provable** — it omits the
  nonprincipality hypothesis (`∀ i, ¬IsDZDFPrincipalQ (m i) (χ i)`) while
  asserting `ψ i ≠ 1` in the conclusion; a principal family with fK ≠ 0 on the
  half-plane refutes it (coefficient comparison). M3-e carries `hnp` explicit
  and lands GREEN-triad; the one-line N2-P0 amendment is owed at the next
  P0-touching commit (P0's elaboration ledger unaffected). Recorded in-decl
  (`N2-P1.lean:641`), in the P1 record, and here.
- **P2 opened at the close-act hard stop (2026-11-18)**: the N2-P0 erratum APPLIED (hnp restored to DirichletFactorizationTransferQ, dated block at `N2-P0.lean:161`); P2-a (`windowFinite_LFunction`) in flight — runs 20–21 fired (10→8 errors, all name-resolution classes in the new block; the 14/14 triad core untouched and error-free; three more certain fixes applied on disk post-run-21: `.analyticAt` bridge, `AnalyticOnNhd.` prefix, `IsClosed.preimage`); P2-b/P2-c not started, spec current. Full state + next-step error list: `pilots/75/N2-P1-record.md` §P2 state.
- **[R6 wave-4 update, 2026-11-19]**: P2-a fix-loop continued to budget exhaustion — runs 22–23 fired (8→3→4-unmasked; every residual error name-resolution/shape, zero math defects; the `isDiscrete_zeroSet` isolation core now fully GREEN; the 14/14 triad core error-free throughout). Budget 6/6 SPENT.
- **[R6 unit-2 update, 2026-11-19]**: fresh ≤2-run grant executed — runs 24–25 fired (11-unmasked → **1**; r24's eleven all in the never-elaborated hBbd body — bare `|ℂ|` is a lattice-abs parse error on this pin, `Complex.sq_abs` unknown, folded-hρ linarith blindness, `Metric.mem_closedBall`/`dist_zero_right` finish; the full ‖·‖-form rewrite landed at r25). The single r25 residual (a trivial `abs_le.mp` unification trap) FIXED on disk; grant 2/2 spent.
- **[R6 unit-3 update, 2026-11-19]: P2-a CLOSED GREEN — run 26 (the final FIRE-ONCE grant) = OK, 15/15 file decls triad-clean, 0 sorry** (`windowFinite_LFunction`: χ ≠ 1 ⇒ WindowFinite (multOf χ.LFunction) — the hEχ port's window-finiteness input; OVER=0 telemetry). Fix-loop 10→8→3→4*→11*→1→0 over runs 20–26, zero math defects (the * events are unmaskings under failed-have suppression — the complete name-resolution/tactic taxonomy is in `pilots/75/N2-P1-record.md` engineering record). Same unit: the N2-P3 skeleton drafted (`pilots/75/N2-P3.lean`).
- **[R6 unit-4 update, 2026-11-19]: P3-a GREEN** (statement rung elaborated, `n2-p3-run2`, 2 runs, 0 sorry; runner pair `run_n2p3` + the N2P1 byte-identical-copy staging verified). P2-b (strip immunity) opened and driven through runs 27–29 (11→6→4; the Euler-identity transport `hhp`/`hident` GREEN since r29; four mechanical fixes parked).
- **[R6 unit-5 update, 2026-11-19]: P2-b HARD-STOPPED at 2-residual depth by the final-grant ruling** (run 30: 11→6→4→2, NOT green, FIRE-ONCE spent). **16/17 decls triad-clean — the helper `lFunction_not_eventually_zero` is now a verified theorem**; only `eulerStripImmunity_changeLevel` remains (failed-decl sorryAx; the two residuals = a truncated-display by-linarith in the norm chain + the Exists-whnf dot trap on `analyticOrderAt_eq_top` — both fixed on disk, parked sha 396d8710…, expected next-run GREEN 17/17; zero math defects across runs 27–30). P3-a stays banked; P2-c not opened (was conditional). Unit 6: the N2-P3 execution plan drafted (`pilots/75/N2-P3-plan.md`).
- **[R6 unit-7 update, 2026-11-19]: P3-b + P3-c EXECUTED GREEN, first shot** (`logs/n2-p3-run3.log`, 1 of ≤4 runs): **`abFacQ_of_factorization`** (the hAbFacQ bridge — the two-theorem P1 chain `dirichletFactorizationTransfer` → `factorization_identity_extension` applied, discharging the `AbFacQOfFactorization` card) and **`analyticOrderAt_lFunction_ne_top`** (the engine's component `hntopψ` slot, from the run-30-triad helper + root `analyticOrderAt_eq_top`), plus `windowFinite_family`'s first formal axiom print — all triad, 0 sorry; N2-P3.lean sha f9bd28c5…. Per the plan's binder table the composed P3-e assembly now awaits only P2-b-confirm (transitive, imprimitive hEχ) + P2-c + P3-d (V2 substrate, held for scheduling). Canonical state: `pilots/75/N2-P1-record.md` §ledger + §NEXT-INSTANCE RESUME NOTE + `pilots/75/N2-P3-plan.md`.
- Billing note (unchanged by the landings): the dictionary remains
  FORMALIZATION-novel only (classical per Milne; the A7 pre-shipping sweep's
  two mandatory nearest-miss rows stand); the discovery claim rests on the
  composed N2-d statement, which now awaits ONLY P2 (hEχ port) + P3 (V2 ζ-column
  landing). The S1–S4 self-assessment "what hardens it" item (ii) is now
  substantially satisfied for the P1 layer (14/14 triad-only; P2/P3 pending).



## Pilot spec skeleton (P0/P1 decomposition for the N2 pilot)

File: `research/pilots/75/N2.lean` (self-contained carry of the Pb.lean vocabulary per
the duplication convention; runner `crossmath-pilot-75`, staged files import `Mathlib`
(+ `ZetaZeros` from P3 on), Modal 2cpu/4GB, telemetry, logs to `pilots/75/logs/`).

- **P0 (statement rung, S, ≈0.15–0.25k LoC, zero gates).** Elaborate the N2-d landing
  shape with ALL binders in place: `zetaL_rat_two_thirds_landed {fK fL : ℂ → ℂ}
  {n q : Fin n → ℕ} {ψ : Fin n → DirichletCharacter ℂ (q i)}
  (hAbFacℚ : ∀ s ≠ 1, fL s = (∏ i, (ψ i).LFunction s) * fK s)
  (hne : ∀ i, 1 < q i ∧ ψ i ≠ 1)   -- nonprincipality transfer, N2-a(iii)
  (hEχdyad : ∀ i, <verbatim zeta23 thmE_A₀ conclusion for the primitive associate>)
  (hUnb : ∀ i, Tendsto (fun T => (countCum ⟨multOf ((ψ i).LFunction), _⟩ T : ℝ)) atTop atTop)
  (hV2 : EpsLowerCum ⟨ζ-column zero data⟩ (2/3))   -- or import route at P3
  (structural: hK/hL analyticity, hntop, hfinL, component hfin derived)
  : EpsLowerCum ⟨multOf fL, hfinL⟩ (2/3)` — proved by `zetaL_assembly_landed`
  (engine already GREEN; P0 is the elaboration + binder-inventory check, the N0/EnclOK
  pattern). Binder inventory per rung: P0 carries everything; P1 discharges hAbFacℚ's
  DZDF translation; P2 discharges hEχdyad→EpsLowerCum (hUnb stays binder unless the
  probe kills it); P3 swaps hV2 for the import.
- **P1 (dictionary rung, S–M, ≈0.3–0.5k).** N2-a: the DZDF `RayClassCharacter ℚ`
  structure quoted verbatim as a Prop (`hDZDFChar` mirror, zero imports) → `χ̂`
  construction (c-trick), value dictionary (i), L-series identification (ii),
  principality transfer (iii); then the factorization translation: DZDF-shaped binder
  ⇒ `hAbFacℚ` (identity-theorem step, the EntireAbelianQuotient pattern). Optional
  sub-rung P1x: tauceti-import cross-check (`ratDirichletEquiv_absNorm`) — off by
  default.
- **P2 (port rung, S–M, ≈0.35–0.55k).** N2-b strip immunity (changeLevel Euler
  identity + Re s = 0 zero-locus + count invariance); N2-c port (distinct→with-mult
  dominance, dyadic window ↔ countCum identification, dyadic→cumulative summation with
  hUnb absorption); component window-finiteness derivation (entireness ⇒ discreteness
  ⇒ strip-finite). One probe run inside P2: does the audited zeta23 chain expose a
  usable unboundedness form (paperInputsChi_L dependencies) — if yes, hUnb drops.
- **P3 (landing + audit, S, ≈0.1–0.15k).** ζ-column via `import ZetaZeros`
  (M4b pattern: count identifications + `two_thirds_le_d4` numeral lemma); final
  `#print axioms` over every new decl + full-coverage axcheck (`axcheck_full.py`
  pattern); V2 endpoint on-pin axiom prints appended (A3 rec. 4).
- **Guards:** (i) 1.6k LoC new content without GREEN ⇒ stop; (ii) 6 consecutive runs
  without error descent ⇒ stop; (iii) any friction item (F5 i/ii) consuming > 3 runs ⇒
  invoke its recorded fallback (tauceti import / LSeries-bridge restructure) or park;
  (iv) NO proof-side consumption of zeta23/DZDF (statement-ports only — pins differ).
- **Expected friction points (ranked):** (1) 𝓞 ℚ ↔ ℤ ideal/absNorm transport in P1;
  (2) the LSeries arithmetic-function wrapper bridge in P1; (3) dyadic-block bookkeeping
  in P2 (the M3 layer's shape, reusable); (4) hUnb handling (binder by default).

— end dossier (A5, 2026-11-17; design-only session — no Modal runs, no Lean built).
