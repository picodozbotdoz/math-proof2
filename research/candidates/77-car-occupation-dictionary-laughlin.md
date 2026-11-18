# Candidate dossier 77 — car-occupation-dictionary-laughlin

Lane R6 (fresh-bridge scan), 2026-11-16. Realizes territory-(d) of
`research/novelty/iter4-fresh-bridges.md` §3 FB-5 — **re-scoped and corrected at hardening
time** (the pre-dossier's "sector decomposition exists in neither corpus" and implicit
CAR-relation novelty claims are FALSE: the OAI proved tree owns both — see the Honesty
header). Tags: [VERIFIED] = read at the cited locator this lane; [HYPOTHESIS] = proposed.
**[NOVELTY-CHECK DISCHARGED 2026-11-16 (A5 battery, Phase B) — verdicts in the Novelty
section: T1/T2 CLEAN (no CAR relations on physlib master 2026-11-16; no graded-algebra
lemma or Clifford/CAR identification in OAI); T3 NARROWED (spin-sector representation
theory is donor-owned; the bosonic occupation-basis theorem now exists on physlib master
— T3's surviving rung is the Frobenius sector-trace identity; grade B− → C+).]**

## Honesty header (read first — corrections to the pre-dossier)

The R6 scan read only the comparator (`ComparatorChallenges/LaughlinFock.lean`) and the
proved tree's file names. Hardening read the proved tree's content and found the donor
owns more than the pre-dossier claimed:

- CAR relations are PROVED in-tree: `annihilator_square` (`FermionOperators.lean:95`),
  `annihilator_anticommute` (:102), `annihilator_creator_anticommute` (:156),
  `annihilator_adjoint_anticommute` (:190).
- The particle-number sector decomposition is PROVED in-tree, in the stronger exact-card
  form (not just parity): `sectorHamiltonian` (`Model.lean:51`),
  `sectorHamiltonian_eq_zero_of_le_one` (0- and 1-particle sectors vanish, :150),
  `sectorHamiltonian_square` ((H²)|_{sector n} = (H|_{sector n})², :167),
  `sector_inequality_of_fock` (:197), entry-level block-diagonality
  `hamiltonian_entry_eq_zero` (:138).
- The headline inequality is PROVED in-tree (not just comparator-`sorry`):
  `thm_fock` (`Main.lean:69`), `gammaStar = 4616733319001/10¹⁴` (`Model.lean:56`),
  sanity `gammaStar_gt_one_twenty_fifth` (`Model.lean:92`).

What survives as fresh — and is this dossier's actual content — is the **tauceti-side
algebraic substrate bridge**: the donor's occupation calculus is self-contained finite
matrix algebra with zero representation-theoretic identification; tauceti's
CAR/Occupation/Casimir stack (proved, on OUR pin, with NO consumer anywhere — survey
§2(d) "no downstream consumer") is the abstract layer it instantiates. The dictionary
theorem, the graded-algebra↔block-structure equivalence, and the transport of a
tauceti-side occupation identity are new in both corpora. **[Battery addendum,
2026-11-16 (A5, Phase B): the honest scope narrowed once more — the donor's
spin-sector SU₂/Schur theory and physlib's bosonic occupation-basis theorem bracket
T3 from both sides; the dossier's center of gravity is now T1 (CAR dictionary —
confirmed clean on physlib master 2026-11-16: still no CAR relations anywhere) + T2
(graded↔blocks general lemma) + T3's Frobenius sector-trace identity. Grade: B− → C+.
Verdicts and evidence in the Novelty section's DISCHARGED battery block.]**

## Name

car-occupation-dictionary-laughlin

## One-line pitch

Identify openai's Laughlin Fock-matrix calculus as a representation of tauceti's
unconsumed CAR/Occupation algebra — the first external consumer of that stack — and
transport tauceti's graded/occupation identities (idempotent occupation elements,
Casimir-type scalar action) to give the Laughlin Hamiltonian algebraic structure
(identity-per-sector statements) that the donor's numeric certificates do not carry.

## Precise mathematical statement

**Setting [VERIFIED].** `Occupation Q := Finset (Orbital Q)`, `Orbital Q := Fin (Q+1)`
(OAI `Analysis/LaughlinFock/Model.lean:14–26`; comparator same shapes); `annihilator Q j`
the signed removal matrix (:28), `pairAnnihilator Q p` (:35), `hamiltonian Q` (:43).
tauceti side: `TauCeti.Algebra.Lie.GeneralLinear.CAR` over `gl n K` with
`traceQuadraticForm`; `carOccupationElement` (`CAR/Occupation.lean:70`),
`isIdempotentElem_carOccupationElement` (:121), `commute_carOccupationElement` (:138),
`carCasimirElement_eq_scalar` (`CAR/Casimir.lean:231`: the Casimir acts as the scalar
`N(2N²−1)/4` on the highest-weight vector, over any K with `(Fintype.card n : K) ≠ 0`),
even-subalgebra machinery `carCasimirElement_mem_even` (:169) and the graded discipline
(`SetLike.mul_mem_graded`, :186); faithfulness `carLieModule_isFaithful`
(`Fock.lean:167`); exterior identification `CliffordAlgebra.equivExterior` (mathlib, cited
as the bridge surface by survey §4).

**T1 (dictionary theorem, glue rung).** For every Q there is a ℂ-algebra homomorphism Φ
from the even CAR subalgebra at `n = Q+1` (tauceti) to `FockMatrix Q := Matrix
(Occupation Q) (Occupation Q) ℂ` (OAI) sending tauceti's creation/annihilation generators
to `annihilator Q j`†/`annihilator Q j`, such that (i) Φ intertwines
`carOccupationElement i j` with the matrix units-graded operators `annihilator Q i† *
annihilator Q j`; (ii) Φ is injective on the even subalgebra (faithfulness transfer via
`carLieModule_isFaithful` at K = ℂ, hypothesis `(Q+1 : ℂ) ≠ 0` free); (iii) `hamiltonian Q`
lies in the image of the even part, and the induced card-grading statement re-derives
`hamiltonian_entry_eq_zero` (Model.lean:138).

**[T1 AMENDED 2026-11-17 (lane A7, at execution — the pilot's first two derived
corrections; full account in `pilots/77/T1.lean` header + `pilots/77/T1-record.md`).**
The drafted T1 above is replaced by the corrected shape:
1. *(ii) is dimensionally unsound and DROPPED.* No unital algebra hom
   `CliffordAlgebra (TauCeti.traceQuadraticForm ℂ N) →ₐ FockMatrix Q` exists once
   `N * N > 2 * (Q + 1)`: the trace form is nondegenerate
   (`TauCeti.traceQuadraticForm_nondegenerate`), so over ℂ that Clifford algebra is
   simple of dimension `2 ^ (N * N)`, exceeding `FockMatrix Q`'s `2 ^ (2 * (Q + 1))`.
   The drafted "injectivity via dimension count `2^{Q+1} = #Occupation Q`" conflated the
   Fock space with its endomorphism algebra. **Corrected statement:** the dictionary
   lives on the hyperbolic submodel `V := (Orbital Q → ℂ) × (Orbital Q → ℂ)` of rank
   `2 * (Q + 1)` with `qV (c, d) = ∑ i, c i * d i` — the restriction shape of the trace
   form along an isotropic-pair embedding `isoV` into `Matrix (Sum (Orbital Q)
   (Orbital Q))` — and `Φ := CliffordAlgebra.lift ⟨toFock, …⟩` with
   `Φ (ι (e i)) = annihilator Q i`, `Φ (ι (e' i)) = creator Q i`.
2. *(i) is algebraically ill-typed as drafted.* tauceti's `carOccupationElement i j`
   are idempotent (off-diagonal) and mutually commuting (`CAR/Occupation.lean:121/:138`);
   the drafted images `annihilator† * annihilator` are neither — no hom sends a
   commuting family to a noncommuting one. **Corrected statement:** Φ intertwines the
   hyperbolic occupation elements `o i := ι (e' i) * ι (e i)` — which satisfy the same
   idempotent/commuting algebra in `Cl(qV)` — with the **number operators**
   `creator Q i * annihilator Q i` (diagonal: `creator_mul_annihilator`); the
   element-level dictionary to tauceti's own declaration is
   `CliffordAlgebra.map isoQ (o i) = TauCeti.carOccupationElement ℂ (.inl i) (.inr i)`
   (theorem-level transport of tauceti's :121/:138 along `map` would need injectivity
of `CliffordAlgebra.map` on the generated subalgebra — mathlib-absent; recorded as
  the T1-extension condition). (iii) moves to T2's parity/card-block delivery.

**[T1/T2 EXECUTION UPDATE 2026-11-18 (lane A7, the re-chartered T1-completion + T2
unit; runs 6–9, logs `pilots/77/logs/t1t2-run{6..9}.log`).]**
- *Residual map reconciled:* the 31 site-local residuals of run 5 are burned down
  to **7** (run 8, the best state; the run-9 fix attempt for those 7 regressed and
  was reverted — the tree carries the run-8 state). Remaining 7, all site-local,
  all root-caused: (1)–(2) `pairBilin`'s two OUTER field proofs — `ext` on the
  nested `Hyperbolic Q →ₗ[ℂ] Hyperbolic Q →ₗ[ℂ] ℂ` structure decomposes into
  `∘ₗ LinearMap.inl/LinearMap.single` canonical form (the ext-chain sabotage; fix:
  a hand-rolled `LinearMap.ext` avoiding Pi-ext), (3)–(7) the two undecided-ite
  cases of `isoV_hypE`/`isoV_hypE'` — full `simp` with a `¬(x = i ∧ y = i)`
  hypothesis leaves proof-obligation side goals (`i = x → ¬ i = y`-shaped); fix:
  pre-split per variable. **Zero mathematical failures** — every statement
  elaborates; the two derived corrections above held through all four runs.
  T1 NOT-GREEN at budget (the honest-stop precedent of run 5 stands).
- *T2 DELIVERED at 7/8 triad-clean:* `isParityBlock_iff_sum_parityProj` (the
  mod-2 regrading decomposition), `isParityBlock_of_isDegreeBlock` (the
  coarsening), `isDegreeBlock_sum`/`isParityBlock_sum`, and all three Laughlin
  instance theorems — `pairHamiltonian_isDegreeBlock`,
  `pairHamiltonian_entry_eq_zero` (the donor's `Model.lean:138` re-derived at the
  abstract coefficient shape), `pairHamiltonian_isParityBlock` (the parity-sector
  corollary) — verify **[propext, Classical.choice, Quot.sound]**, triad-only,
  0 sorryAx. One theorem tainted: `isDegreeBlock_iff_sum_blockProj` carries
  sorryAx via an elaboration error the runner's error filter missed (rc=1 with
  errors=0; the error sits in the unprinted output region). T2's tauceti-SetLike
  instantiation through Φ remains the recorded T2-extension condition (scope note
  in `pilots/77/T2.lean`'s header).
- *Durable API finds (the substrate-pin gotchas, for any follow-up):* `rw` fixes
  metavariables at the first match (per-instance rewrites need `simp` with the
  lemma, not `rw`); `rw [← h]`-style pattern fixes apply to `Finset.sum_add_distrib`
  (`∑ (f+g) = ∑ f + ∑ g` on this pin) and `Finset.mul_sum`; the pin has NO
  `Prod.fst_smul`/`Prod.snd_smul` simp lemmas (use `have : (r • v).1 = r • v.1 := rfl`);
  matrix rings lack `NoZeroDivisors` (halve via `two_smul`/`inv` scalars instead of
  `add_self_eq_zero`); `eq_neg_of_add_eq_zero_right` solves for the RIGHT summand
  on this pin; `Nat.mod_two_lt` is `Nat.mod_lt _ two_pos` here; omega cannot see
  `Finset.card ≥ 1` from `j ∈ s` (pass `Finset.card_pos`); `Matrix.single` terms
  from `unfold` of tauceti defs carry `Classical.decEq` instances that differ from
  statement-elaborated ones (use the `_def` theorems, or bridge by `ext`+`simp`).
- **NOVELTY EVENT — the physlib clock FIRED PARTIALLY (condition (iii)):** master
  ticked 2026-11-17T09:42:38Z → 2026-11-18T08:24:23Z (→ 13:00:37Z end-tick) and the
  push LANDED a creation/annihilation wing: `Physlib/QFT/PerturbationTheory/`
  (54 files, Tooby-Smith) — `CrAnFieldOp` (the type layer), `FieldOpFreeAlgebra`
  (the FREE algebra on CrAn ops with a supercommutator), and **`WickAlgebra`**
  (`FieldOpFreeAlgebra` quotiented by the ideal making two creation ops, two
  annihilation ops, and mixed-statistics pairs super-commute, with central
  super-commutators). Verdict: **the equal-statistics HALF of the CAR relations
  now exists on physlib master** (for fermions: a² = 0, aa' = −a'a, in
  supercommutator-quotient form at a general field specification) — the battery's
  standing trigger "a physlib CAR landing" has PARTIALLY fired, and T1's
  CAR-relations-transport sub-content (the idempotent/commuting occupation
  algebra reproved from Clifford relations) drops to formalization-parity AGAINST
  THAT LAYER. What remains clean in both corpora: the DICTIONARY core — no
  Clifford algebra of a quadratic form anywhere in the new wing, no {a, a†}
  mixed relation (the Wick design keeps create/annihilate super-commutators
  central = the contractions), no finite Fock-matrix model, no tauceti connection.
  T1's novelty claim must be read as the *dictionary* (hyperbolic-Clifford ↔ Fock
  matrices ↔ tauceti `carOccupationElement`) only; the seed-13 "no CrAnFieldOp"
  gap has also CLOSED (watchlist note for the coordinator). Billing unchanged
  (C+ substrate-bridge); the standing clock condition stays LIVE for any
  follow-up.

**T2 (grading ↔ blocks, general lemma, new-in-both-corpora).** For any subalgebra A of a
matrix algebra on `Finset ι`-indexed basis with the card-grading
`A = ⨁_n A_n`, `A_n = {M : ∀ A B, card A ≠ card B → M A B = 0}`: an element M commutes
with every number-operator diagonal N_κ (κ a card-function) iff M is even-graded w.r.t.
the mod-2 grading... precise form: *M is card-block-diagonal iff M lies in the
⨁_n-grading; M connects only sectors of equal parity iff M is in the even part of the
mod-2 regrading* — stated and proved once over tauceti's `SetLike`-graded discipline,
then instantiated at Φ (T1) to give: `hamiltonian Q` is even ⇔ pair-preserving — with
parity-sector coarsening of the donor's exact-card `sectorHamiltonian` decomposition as
the corollary OAI states only implicitly.

**T3 (identity transport, glue rung — NARROWED at battery 2026-11-16).** The surviving
discovery content is the **H² Frobenius sector-trace identity**: for each particle-number
sector n, `Trace_{sector n}(hamiltonian Q) = ∑_{p ≤ 2Q-1} ‖(pairAnnihilator Q p)|_{sector
n→n}‖²_F` (Hilbert–Schmidt/Pythagorean identity over the Gram decomposition `hamiltonian
= ∑ P_p† P_p`, Model.lean:43), stated in tauceti's occupation vocabulary and proved by
transport. The originally-planned number-operator spectrum statement
(`spec (Φ(N_Q)) = {0,…,Q+1}` with binomial multiplicities `C(Q+1,k)`) is **RETIRED AS A
DISCOVERY CLAIM**: physlib master's `PhyslibAlpha/Mathematics/LadderSystem/
OccupationBasis.lean` (Diem, 2026) proves the bosonic occupation-basis version
(`LadderSystem.finrank_vacuumSpan_eq_choose`, eigenvalue-encoding independence) — a
fermionic restatement would be a variant of a now-existing theorem (at most a
cite-and-adapt corollary of T1, never a headline). No "first representation-theoretic
account" claim is made: the donor's representation theory is the spin-sector SU₂ side
(verdict (i)); T3 is the occupation-side complement only.

## Novelty check

**In-corpus (rg + read, 2026-11-16).**
- OAI: rg `anticommut` over `OAI/Analysis/LaughlinFock/` → the four CAR theorems (owned,
  listed above); rg `sector|grading|graded|Clifford|representation` → the sector family
  (owned) but **no graded-algebra lemma, no Clifford/CAR identification, no trace/spectral
  identity** (0 hits for `Clifford`, `carOccupation`, `equivExterior` in the tree).
  Recorded adjacent layers (battery, 2026-11-16): the infinite-dimensional occupation
  wing `OAI/MathematicalPhysics/Fock/Operators.lean` (`NumberIndex`, `up`, weighted-shift
  `creationSandwich` CLM calculus — analytic, no CAR, no sector algebra) +
  `OAI/InformationTheory/PhotonNumber/Basic.lean` (`numberKet`, `totalNumber k = ∑ j k j`
  as an index function, `entropy` — no operator spectrum statement); the spin-sector
  Schur machinery (`ThreeRows/ThreeTraces/AveragedOperators/SpinSchur`, verdict (i)
  above). None pre-empts T1/T2 or T3's Frobenius rung; the T3 spectrum rung's fate is
  physlib's, per verdict (ii).
- tauceti: rg over `TauCeti/Algebra/Lie/GeneralLinear/` for `Laughlin|pairAnnihilator|
  hamiltonian` → 0 (no physics consumer — confirms survey §2(d)); `CAR/Occupation.lean`
  and `CAR/Casimir.lean` have no consumer outside the CAR stack itself (import rg).
- mathlib: no occupation/CAR layer at all (`Algebra/Star/CHSH.lean` is the lone
  quantum-adjacent theorem; quantum-info-substrate.md §A: no partial trace, no Fock).
- anthropics: nothing (surveys).
- **[NOVELTY-CHECK DISCHARGED — A5 battery, 2026-11-16, Phase B]:**
  (i) **T3 partially pre-empted IN-DONOR (spin side)**: the OAI tree owns a spin-sector
  representation-theoretic account — `sectorAverage_of_complete_spin`
  (`ThreeRows.lean:33`, spin-intertwiner averages), `threeSpinProjection_kernel_trace`
  (`ThreeTraces.lean:155`), `schur_matrix_average`/`matrix_scalar_of_commutes`
  (`AveragedOperators.lean:113,91`), and eigenvector statements for compressed
  certificate matrices (`ThreeSpectrum.lean:122 threeWedgeMatrix_gram_eigenvector`,
  `ExchangeSpectrum.lean:206 pairSwapCompression_eigenvector`). T3's "first
  representation-theoretic account" phrasing is RETIRED — the donor owns the
  **spin-sector (SU₂/three-spin) Schur theory**; T3 lives on the **particle-number/
  occupation side**, where the donor has the block decomposition but NO trace identity
  (rg `(hamiltonian Q).trace|trace.*hamiltonian` over `OAI/Analysis/` = 0), no
  Frobenius-norm statement (rg = 0), no eigenvalue/spectrum statement for the
  occupation sectors.
  (ii) **physlib differentiation vs the G10-corrected modern surface (master pushed
  2026-11-16, full tree via gh API — the 2026-11-14 `physlib-surface.md` scan is STALE
  on this wing)**: the surviving QuantumInfo wing is real and large (root-level
  `QuantumInfo/{Capacity,Channels,ClassicalInfo,Entropy,ForMathlib,Measurements,
  Operators,ResourceTheory,States}`). Verdicts: **NO CAR relations anywhere on master
  (still)** — T1's dictionary stays clean; BUT **T3's number-spectrum rung is
  NEAREST-MISSED by `PhyslibAlpha/Mathematics/LadderSystem/OccupationBasis.lean`**
  (Diem, 2026): occupation-number basis of `vacuumSpan L Ω n`, `finrank = (d+n-1).choose n`
  (`LadderSystem.finrank_vacuumSpan_eq_choose`), linear independence VIA a diagonal
  number-operator `M = ∑ᵢ (n+1)^i • Nᵢ` at distinct eigenvalues `countEncode n α` —
  exactly the binomial-multiplicity spectral statement, **bosonic**. The fermionic
  occupation-sector analogue would be a variant of a now-existing theorem, not a
  discovery — T3 is RE-GRADED accordingly (its surviving discovery content = the H²
  Frobenius sector-trace identity + the CAR-dictionary corollaries, not the spectrum
  statement). Adjacent, non-colliding: `Physlib/QuantumMechanics/HarmonicOscillator/
  NumberOperator.lean` (Kevorkian 2026) = **CCR** commutation calculus on Schwartz
  maps (unbounded-operator setting; `[Nᵢ,aⱼ]=−δᵢⱼaⱼ`, `aᵢaᵢ†=Nᵢ+𝟙`, `[H_N,Nᵢ]=0`) —
  bosonic and analytic, distinct layer, but MUST-CITE as the number-operator
  commutation precedent. `QuantumInfo/ForMathlib/ExchangeRelations.lean` is NOT
  physics (rank-one tensor/Segre 2×2-minor characterization — relevant to the
  border-rank cluster, not here). Seed-13 factoring confirmed: seed 13 (tauceti→physlib
  `CrAnFieldOp`) and this dossier (tauceti→OAI Laughlin) remain disjoint targets; the
  shared donor-side layer is tauceti's occupation stack only.
  (iii) **companion preprint** (`A-Fock-space-inequality-and-the-Laughlin-spectral-gap`,
  Sept 24 2026, theorem list read): Theorem 1.1 + Cor 1.2 = the Fock inequality; the
  spectral content is spin-side (Lemma 3.2 "Three-body Gram eigenvalues", Lemma 3.3
  spin-block traces, Schur partial traces over spin-j irreducibles, p.596–612); particle
  sectors used conceptually ("in a particle sector without a zero mode", p.103) but no
  occupation-spectral identity stated. No pre-emption of T1/T2/T3's surviving content.
- Known nearest misses: donor `sector_inequality_of_fock` (inequality transport — not an
  algebraic identity); donor `gram_quadratic_form` (Model.lean:211ff, the A†A quadratic
  form — the engine T3's first identity formalizes, but stated only pointwise, never as a
  sector trace/spectral statement); tauceti `carCasimirElement_eq_scalar` (the transport
  source, at gl n — never instantiated at a pair Hamiltonian).

## Bridge analysis

- Corpora bridged: tauceti (CAR/Occupation/Casimir stack; our pin, BUILT direct dep) ×
  openai-math (Laughlin statement layer + proved `thm_fock` + certificate structure;
  v4.34.1 → statement-binder class per the G-convention; the Model/FermionOperators defs
  are self-contained ℂ-linear algebra, statement-port≈0) × mathlib (`CliffordAlgebra.
  equivExterior`, `SetLike` grading, `Matrix` spectrum/trace layer).
- Why the bridge is essential: tauceti's stack has the abstract identities but no model
  (no hamiltonian, no sectors); OAI's tree has the model and the inequality but no
  representation theory (no algebra identification, no occupation-spectral identities);
  T1–T3 exist in neither. mathlib alone has neither side.
- Empty-zone fit: survey/tauceti.md §2(d) "CAR/Fock/Kostant isotypy stack: no downstream
  consumer" + §4 "CAR/Fock ↔ no QFT" within-corpus zone, now resolved OUTWARD at the OAI
  physics corpus (the R6 scan's territory-(d) finding, `novelty/iter4-fresh-bridges.md`
  §1(d)).

## Proof-strategy sketch

**[SUPERSEDED IN PART 2026-11-17/18 — items 1's injectivity route and 3's spectrum
rung are retired; see the T1 AMENDED block above and the T1/T2 EXECUTION UPDATE
below. The executed strategy is that of `pilots/77/T1.lean` (hyperbolic submodel,
`CliffordAlgebra.lift` dictionary, number-operator intertwining) and
`pilots/77/T2.lean` (entry-level graded ↔ blocks lemmas + the Laughlin instance).]**

1. T1: build Φ on generators; relations: the OAI CAR theorems (`FermionOperators.lean:95,
   102, 156, 190`) match tauceti's generator relations verbatim (sign cocycle
   `(-1)^{#{i ∈ B : i < j}}` = exterior-algebra sign discipline, both sides [VERIFIED]);
   use `CliffordAlgebra.equivExterior` (mathlib) + tauceti `car_lie_def`
   (`Fock.lean:96`) to factor Φ through the exterior algebra on `Orbital Q` — then
   injectivity is dimension count `2^{Q+1} = #Occupation Q` (Finset powerset cardinality,
   mathlib `Finset.card_powerset`). The genuinely new idea is only the assembly.
2. T2: pure graded-algebra: card-grading as a `SetLike.GradedMonoid` on the subalgebra;
   both directions by entry-chasing (`hamiltonian_entry_eq_zero` Model.lean:138 is the
   donor's instance, reproved abstractly). Routine.
3. T3 first identity: `Trace (P† P) = ‖P‖_F²` (mathlib `Matrix.trace_mul_comm`/
   Frobenius inner product) summed over the `hamiltonian` Gram decomposition (:43),
   restricted via `sectorHamiltonian_square` (:167). Number-operator spectrum: conjugate
   Φ(N_Q) to the diagonal occupation-count matrix on `Occupation Q` (combinatorial
   permutation, `decide`-assisted per Q, general by induction on Q). M-tier.
4. Consumer (statement-binder): `thm_fock` (Main.lean:69) as the hypothesis binder for
   any eventual conditional statement about sector-wise γ-positivity — never re-proved.

## Feasibility

- mathlib API entry points: `CliffordAlgebra.equivExterior`, `LinearAlgebra.Matrix.Trace`,
  Frobenius `Matrix.norm` layer, `SetLike.GradedMonoid`; tauceti direct imports
  `TauCeti.Algebra.Lie.GeneralLinear.{Fock,CAR.Occupation,CAR.Casimir}` (same pin).
- Donor lemmas: OAI Model/FermionOperators defs + the four CAR theorems + sector family
  (statement-port + cite; donor build NOT needed — everything restatable ℂ-matrix-only);
  tauceti occupation/Casimir (direct import); `thm_fock` as binder only.
- Missing glue: Φ itself, the dimension-count injectivity, the graded re-derivation, T3's
  closed forms — all within S–M.
- Effort: T1 S–M, T2 S, T3 M (~2–3k LoC total). Substrate class: `crossmath-probe`
  (tauceti direct dep; no OAI donor build).
- Risks: (i) T3's identities may be implicit in the donor's `Assembly/SquareSplitting`
  certificate content (the novelty battery); (ii) the preprint may state T3 informally
  (then re-grade T3 FORMALIZATION-OF-RECENT and the dossier's headline becomes T1+T2
  substrate); (iii) `equivExterior` signature friction over `Fin (Q+1)` (mitigate:
  work with the raw sign-cocycle matrices instead, as both donors do).

## Significance

First consumer of tauceti's deepest unconsumed stack (the survey's own flagged empty
zone), and the first representation-theoretic reading of the OAI Laughlin development —
sector data as occupation-spectrum identities rather than certificate numerics. Modest
as standalone mathematics (glue + identities); high as lane-opening infrastructure for
the whole OAI `MathematicalPhysics/{Fock,Heisenberg}` wing, which is proved, large, and
unconsumed (R6 scan §0.4).

## Score (filled at triage — leave empty)

- Novelty (1–5):
- Significance (1–5):
- Effort (S/M/L → 1–5):

---

## Battery (2026-11-17, lane A7) — the C+ substrate census + wing-check; verdict **CHARTER-GO**

*The FB-5 dossier-level battery (the same gate A3 executed for FB-1), per the coordinator's
queue. Inputs: this dossier (re-scoped C+ at hardening), R6's FB-5 entry
(`novelty/iter4-fresh-bridges.md` §3 FB-5, honesty-corrected B → B− → C+), and A8's G13
verdict as coordinator-relayed (not yet in a repo file; operative content: seed-13 stands
alone — the physlib `CrAnFieldOp` carrier target is distinct from this dossier's Laughlin
matrix target; wing-check gate (c) applies here). All sibling reads read-only; the physlib
check is API-level.*

### (1) C+ substrate census (on-pin, exact decls; tauceti @ our pin, OAI LaughlinFock,
encore mathlib)

**tauceti CAR side — the importable (public) surface:**
`traceQuadraticForm` (`GeneralLinear/TraceForm.lean:177`), `polarBilin_traceQuadraticForm`
(:218), `carGenerator` (TraceForm.lean, public); `carOccupationElement`
(`GeneralLinear/CAR/Occupation.lean:70`), `carOccupationElement_def` (:79),
`isIdempotentElem_carOccupationElement` (:121), `carOccupationElement_mul_self` (@[simp],
:126), `commute_carOccupationElement` (:138); `car_lie_def` (`GeneralLinear/Fock.lean:96`),
`CliffordAlgebra.car_one_lie_eq_smul` (:103), `car_lie_ι` (:113), `carRightMul` (:133,
apply :142), `carLieSubmoduleOfLeftIdeal` (:148, :156), `carLieModule_isFaithful` (:167),
**`finrank_cliffordAlgebra_traceQuadraticForm` (:182 — directly serves T1's
dimension-count injectivity; not cited by the dossier before)**. **Privacy correction
(A3's, confirmed and extended): the ENTIRE Casimir layer is file-private —
`carCasimirElement` itself is a `private noncomputable def` (`CAR/Casimir.lean:63`), and
every theorem about it is private (:130 `commute_carCasimirElement_carGenerator`, :169
`carCasimirElement_mem_even`, :188 `carCasimirElement_eq_algebraMap`, :210
`representation_glCasimir_eq_carCasimirElement_mul`, :231 `carCasimirElement_eq_scalar`).**
Consequence in (2).

**OAI LaughlinFock side (v4.34.1 sibling; statement-port ≈ 0, all ℂ-matrix-only):**
`annihilator` (`Model.lean:28`), `pairAnnihilator` (:35), `hamiltonian` (:43),
`sectorHamiltonian` (:51), `gammaStar` (:56), `hamiltonian_entry_eq_zero` (:138),
`sectorHamiltonian_eq_zero_of_le_one` (:153 — the dossier's :150 has drifted),
`sectorHamiltonian_square` (:174 — was :167), `sector_inequality_of_fock` (:197); the four
CAR theorems (`FermionOperators.lean:94` `annihilator_square` — was :95 — `:102` `:156`
`:190`); `thm_fock` (`Main.lean:69`). The tree is far larger than the scan surface (≈230
files: Sparse-certificate families, SpinSchur, Assembly, SquareSplitting) — the honesty
header's "donor owns more" stance stands; no NEW pre-emption beyond the three discharged
2026-11-16 verdicts (re-rg at battery: trace-of-hamiltonian / Frobenius-norm statements
still 0 in `OAI/Analysis/`).

**mathlib Matrix/Clifford side:** `CliffordAlgebra.equivExterior`
(`LinearAlgebra/CliffordAlgebra/Contraction.lean:351`, `[Invertible (2:R)]` — free at ℂ);
`Matrix.trace_mul_comm` (`LinearAlgebra/Matrix/Trace.lean:156`); the Frobenius norm family
(`Matrix.frobeniusNormedRing` etc., `Analysis/Matrix/Normed.lean:25–28`); the
DirectSum/`SetLike` graded-algebra discipline (T2's substrate). All present on-pin.

### (2) B− honesty correction vs the C+ substrate — does the substrate close it?

**Yes for T1/T2/T3-surviving, with one sub-rung dropped.** Every declaration T1 (CAR
dictionary), T2 (graded ↔ blocks), and T3's surviving rung (H² Frobenius sector-trace
identity) needs is public on-pin: T1 = tauceti generators + relation theorems + faithfulness
(:167) + finrank (:182) + OAI statement ports; T2 = mathlib SetLike/DirectSum; T3-surviving
= mathlib `trace_mul_comm`/Frobenius + the donor's Gram decomposition + the
`sectorHamiltonian` family — **no Casimir anywhere in the surviving scope**. The **Casimir
transport sub-rung (the one-line pitch's "Casimir-type scalar action"; the Setting's
:231/:169 citations) is DEAD-AS-IMPORT** (all private, §1): charter scope drops it; options
if ever wanted are an in-repo re-proof (the private scaffolding spans ≈170 lines,
Casimir.lean :59–:235 — M-tier by itself) or upstream publicity (out of our hands; siblings
read-only). With the drop, the effort class stands at T1 S–M / T2 S / T3 M (≈ 2–3k LoC, now
bounded below by the Casimir exclusion). The B−/C+ honesty corrections (spin-side
rep-theory disclaimed; spectrum rung retired on physlib's bosonic theorem) are unaffected
by the census — the C+ center of gravity (T1 dictionary + T2 lemma + Frobenius identity) is
exactly what the public substrate closes.

### (3) Wing-check gate (c) — physlib daily-build risk (seed-13 protocol)

Clock **ticked**: `pushed_at = 2026-11-17T09:42:38Z` (leanprover-community/physlib, master;
vs the 2026-11-16T09:37:19Z snapshot — the library moved within 24 h, as the week-1 row-6
warning said it does daily). Re-grep of the full tree (gh API, 2288 files): **still NO CAR
relations anywhere** — the only Clifford/anticommut content is the pre-existing Relativity
`CliffordAlgebra.lean` + `PauliMatrices/Anticommuting.lean`; no `CrAnFieldOp` path exists
at all (seed-13's gap persists); the LadderSystem wing is stable at 7 files and
`OccupationBasis.lean` (Diem) is still explicitly **bosonic** ("the degeneracy of the n-th
level of a d-dimensional bosonic oscillator"; 18 decls, content fetched 2026-11-17) — no
fermionic occupation-sector identity appeared. T1/T2/T3-surviving are clean as of
2026-11-17, but the risk is LIVE: any charter carries the clock as a standing condition on
T1's novelty (a physlib CAR landing mid-pilot would drop T1 to formalization-parity).

### (4) Verdict: **CHARTER-GO**

All three FB-5 battery items were discharged 2026-11-16 (donor trace-identity pre-check,
physlib differentiation, preprint theorem list); this battery adds the substrate closure
(public, exact-pinned), the Casimir-privacy re-scope (sub-rung dropped), and a clean
wing-check on a ticked clock. No blocker remains on the evidence side. Conditions on the
charter: (i) **billing at C+** — substrate-bridge + identity layer, the
lane-opening/infrastructure class per the dossier's own significance note, never a
discovery headline; (ii) Casimir sub-rung OUT of scope (privacy; a re-proof is a separate
decision); (iii) the physlib clock rides the pilot (re-check at pilot start and end);
(iv) effort per §Feasibility minus the dropped rung. The charter/ranking decision stays
with the orchestrator.

— lane A7, 2026-11-17. Sources: tauceti/OAI/mathlib checkouts (read-only, session reads);
`api.github.com/repos/leanprover-community/physlib` + raw `OccupationBasis.lean`
(2026-11-17).
