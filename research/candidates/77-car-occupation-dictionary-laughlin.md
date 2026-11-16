# Candidate dossier 77 — car-occupation-dictionary-laughlin

Lane R6 (fresh-bridge scan), 2026-11-16. Realizes territory-(d) of
`research/novelty/iter4-fresh-bridges.md` §3 FB-5 — **re-scoped and corrected at hardening
time** (the pre-dossier's "sector decomposition exists in neither corpus" and implicit
CAR-relation novelty claims are FALSE: the OAI proved tree owns both — see the Honesty
header). Tags: [VERIFIED] = read at the cited locator this lane; [HYPOTHESIS] = proposed.
[NOVELTY-CHECK-NEEDED] marks survive at T3 (the tauceti-side identity) and at the
physlib-side differentiation (seed 13's battery).

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
tauceti-side occupation identity are new in both corpora.

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

**T3 (identity transport, the discovery rung) [NOVELTY-CHECK-NEEDED].** A closed
occupation-spectral identity the donor's certificate files do not carry. Target form:
for each sector n, `Trace_{sector n}(hamiltonian Q) = ∑_{p ≤ 2Q-1} ‖pairAnnihilator Q p
restricted to sector n‖_F²` (a Hilbert–Schmidt/pythagorean identity over the Gram
decomposition `hamiltonian = ∑ P_p† P_p`, Model.lean:43) plus the number-operator
spectrum `spec (Φ(N_Q)) = {0, 1, …, Q+1}` with multiplicity `C(Q+1, k)` — both stated in
tauceti's occupation vocabulary and proved by transport, giving the first
representation-theoretic account of the donor's sector data. [HYPOTHESIS: exact closed
forms and their novelty vs the donor's Certificate01–10 contents need the
[NOVELTY-CHECK-NEEDED] battery below.]

## Novelty check

**In-corpus (rg + read, 2026-11-16).**
- OAI: rg `anticommut` over `OAI/Analysis/LaughlinFock/` → the four CAR theorems (owned,
  listed above); rg `sector|grading|graded|Clifford|representation` → the sector family
  (owned) but **no graded-algebra lemma, no Clifford/CAR identification, no trace/spectral
  identity** (0 hits for `Clifford`, `carOccupation`, `equivExterior` in the tree).
- tauceti: rg over `TauCeti/Algebra/Lie/GeneralLinear/` for `Laughlin|pairAnnihilator|
  hamiltonian` → 0 (no physics consumer — confirms survey §2(d)); `CAR/Occupation.lean`
  and `CAR/Casimir.lean` have no consumer outside the CAR stack itself (import rg).
- mathlib: no occupation/CAR layer at all (`Algebra/Star/CHSH.lean` is the lone
  quantum-adjacent theorem; quantum-info-substrate.md §A: no partial trace, no Fock).
- anthropics: nothing (surveys).
- **[NOVELTY-CHECK-NEEDED] batteries:** (i) read OAI `Analysis/LaughlinFock/
  {Assembly, AveragedOperators, SquareSplitting}.lean` heads for any Frobenius/trace
  identity that pre-empts T3's first form; (ii) the physlib differentiation battery
  (ITERATION4-SCAN seed 13): physlib `CrAnFieldOp`/`FieldStatistics` carry an
  occupation-adjacent calculus — confirm Φ's source-and-target shapes differ from seed
  13's instantiation target before chartering (seed 13 aims tauceti→physlib; this dossier
  aims tauceti→OAI-Lauglin; the shared donor-side layer must be factored, not duplicated);
  (iii) informal: the Laughlin-model literature states sector decompositions routinely —
  T3's Lean identity layer must be dated against the companion preprint
  `preprints/A-Fock-space-inequality-and-the-Laughlin-spectral-gap-September-24-2026`
  (read its theorem list at charter time).
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
