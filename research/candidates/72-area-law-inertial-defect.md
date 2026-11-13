# Candidate dossier 72 — area-law-inertial-defect

Lane A9 (dossier-writer), Cycle 2, 2026-11-13; written against lane A4's bridge map
(`research/bridges/area-law.md`, zones AL-EZ1–AL-EZ4) and lane A5's round-4 pre-check
(`research/novelty/round-4.md` §2, zone AL — whose **refutation alarm is baked into this
dossier's structure**). Grows from dossiers 01/02/03 and pilot 01 (the PROVED inertial-defect
machinery). Tags: [VERIFIED] = read in source this lane or by A4 with locator; [HYPOTHESIS] =
proposed/reasoned, flagged.

**Honesty header (read first).** Three tiers, honestly categorized:

- **Primary statement (AL-EZ1, restructured per round-4's alarm): DISCOVERY-grade
  [HYPOTHESIS] at part 2; formal-new and provable at part 1.** Round-4's decisive negative
  datum: **Kuwahara arXiv:2610.15199 (2026-10-10) disproves Rényi-α<1 area laws in d ≥ 2 for
  the unique-ground-state + uniform-gap class**, so by monotonicity S₀ ≥ S_α the literal
  "rank concentration from a spectral gap" headline is **FALSE**, and A4's original
  cap-functional target is **dead on arrival** as a candidate statement. What survives — and
  is this dossier's primary — is (P1) the **gap-to-inertia dictionary lemma** (HasGlobalGap
  as a thresholded-index budget ≤ 1 — provable now, stated nowhere), plus (P2, the
  [HYPOTHESIS]) the **certificate route to α ≥ 1 entropic functionals**: the pilot-01 master
  identity applied to the ground-state RDM with a gap-induced index-1 perturbation, yielding
  **purity (α = 2) bounds of a new shape** (linear in the boundary budget, vs the entropic
  e^{C·|∂A|} the area law itself gives). The claim is a new *proof mechanism* (inertia/
  certificate vs the paper's MGF route), NOT a new concentration phenomenon — round-4 is
  explicit that the only surviving concentration shape (effective rank w.r.t. von Neumann
  entropy) *is* the area law, already proved by our own donor corpus.
- **Milestone-1 / corollary (AL-EZ3, the family-265 interface theorem): GLUE with a real
  consumer.** A Lean chain discharging openai-math's unproved `UniformAreaLaw` hypothesis
  (PEPSFilters/Basic.lean:135) from AreaLaw2D's `AreaLaw.areaLaw` (Transfer.lean:361) —
  the first Lean contact between the two halves of family 265 (proved half and assuming
  half). Corollary-grade mathematics; consumer: every PEPS-side result resting on that
  hypothesis; and it is the shared-encoding prerequisite of the primary's part 2.
- **Certified-negative corollary (C-neg, new this dossier): the Kuwahara obstruction as a
  formalizable no-go gate.** Main-run precedent: dossier 50's killed headline and pilot 30's
  refutation both produced publishable negative articles; this is the Cycle-2 analogue.

Also honest per round-4: **"first formal area law" framings are DEAD ON ARRIVAL** — the
formal-first mover (AreaLaw2D) is our own donor corpus; novelty here must be cross-bridge.
And the poly-PEPS *representation* form of any surviving statement is openai-math's companion
preprint territory (nearest miss for that form; `preprints/Polynomial-PEPS-approximation-
of-gapped-square-grid-ground-states-September-24-2026/`).

---

## Name

area-law-inertial-defect

## One-line pitch

The PROVED pilot-01 inertial-defect machinery (master identity, rank–trace, compression
inertia) meets AreaLaw2D's gapped-ground-state layer through a dictionary nobody has written —
HasGlobalGap *is* a thresholded-index budget `posIndexAbove θ (E₀−H) ≤ 1` on θ ∈ (−Δ, 0] —
which (P1) is provable now, (P2) opens a certificate/inertia route to purity-type (α = 2)
entanglement functionals of a new shape [HYPOTHESIS], (C-neg) formalizes the Kuwahara
no-go that kills every rank/α<1 version, and (AL-EZ3) discharges openai-math's PEPS
`UniformAreaLaw` hypothesis from our donor as the pilot's first milestone.

## Precise mathematical statement

**Objects ([VERIFIED] via A4's bridge §0.2/§1, locators restated).** AreaLaw2D statement
layer (`OpenAI/Statements.lean`, imports only Mathlib + Physlib + AreaLawForMathlib):
`HasGlobalGap H Ω E₀ Δ : (Δ:𝕜) • (1 − vecMulVec Ω (star Ω)) ≤ H − (E₀:𝕜) • 1`
(Statements.lean:185) — Loewner order, `H = hamiltonian Λ Φ` for admissible interactions
(`IsAdmissible Λ R J Φ`, :179), `Ω` a normalized eigenvector; the main theorem
`OpenAI.AreaLaw` (:202) proved as `AreaLaw.areaLaw` (`AreaLaw/Transfer.lean:361`,
RCLike-generic). `PositiveReplacement` (:259): operators `k_X`, `0 ≤ k_X ≤ 1`, `k_X Ω = 0`,
`Σ_X k_X ⪰ (Δ/c*)(1 − |Ω⟩⟨Ω|)`, locally approximable at rate `e^{−c l^α}`;
`condExpect` (:240, normalized partial trace = unital CP map). Region layer:
`Arealaw.Reg`/`ptrace` (`AreaLawForMathlib/QuantumInfo/Region/PartialTrace.lean:25`),
`SubState.regionEntropy` (State.lean:198), `entropy_eq_H` (:75),
`pureState` (Statements.lean:191). Pilot-01 PROVED layer (this repo, kernel-verified,
axioms `[propext, Classical.choice, Quot.sound]`): `posIndex`/`posIndexAbove` (ported
`research/pilots/01/port/01_PosIndex.lean`; donor zeta23 `RHLinalg/PosIndex.lean:50`),
`posIndex_conj_le` (`port/09_MasterIdentity.lean:846`; donor `Inertia.lean:51`),
`master_identity` (`port/09_MasterIdentity.lean:1983`), `rank_trace_mult_k_of_master`
(:2019; donor `RankTraceMult.lean:369`), `kc c p := c² − ((c−p)₊)²` with `kc_eq`/`kc_of_le`
(`port/08_RankTraceMult.lean:1640,1642,1654` — `k_c(x) = 2cx − x²` for x ≤ c).
openai-math PEPS side: `PolynomialPEPS.PinnedEntropy.reducedDensity Ω A :=
coefficientMatrix * conjTranspose coefficientMatrix` (Basic.lean:119 — **the Gram/W Wᴴ
form**), `vonNeumannEntropy` (:127), `boundaryCard` (:130), `UniformAreaLaw` (:135, unproved
hypothesis consumed by `MainStatement` :97).

**(P1) Gap-to-inertia budget dictionary (provable now; stated nowhere).** For 𝕜 = ℂ (or any
RCLike in AreaLaw2D's transfer layer), `H : Matrix n n 𝕜` Hermitian, `Ω` normalized,
`E₀ Δ : ℝ`, `0 < Δ`:

  `HasGlobalGap H Ω E₀ Δ ↔ ∀ θ ∈ Icc (−Δ) 0, posIndexAbove θ (E₀ − H) ≤ 1`

(the unique counted direction at each θ ∈ (−Δ, 0] being Ω; at θ > 0 the count is 0).
Consequently (P1b), for every **isometric** `B` (`BᴴB = 1`) and every θ ∈ (−Δ, 0]:
`posIndexAbove θ (Bᴴ(E₀−H)B) ≤ 1` — apply `posIndex_conj_le` to `(E₀−H) − θ·1`.
*QA delta vs the bridge [this lane]: A4's AL-EZ1 states P1b for "every B" — as written that
is **false** for non-isometric B (counterexample `B := (Ω, Ω/2)`: `Bᴴ(E₀−H)B = 0`, whose two
eigenvalues both exceed θ ∈ (−Δ, 0)); the correct general-B form needs the generalized
(BᴴB-relative) index. The isometric form is the one the certificate applications consume.*

**(P2) Certificate route to α ≥ 1 functionals [HYPOTHESIS — the load-bearing part].** Under
the hypotheses of Theorem 1.1 (admissible `H`, unique gapped ground vector `Ω`), for every
region `A ⊆ Λ` there exists an explicitly constructible Hermitian `Q_A` on the region —
candidate: `E_A(Σ_{X crossing A} k_X)` (conditioned positive-replacement terms; `condExpect`,
Statements.lean:240; `k_X` from PositiveReplacement :259) — such that, with `ρ_A :=
ptrace (pureState Ω hΩ) A` and `n₊(Q_A) ≤ b(∂A)` a boundary-linear index budget
(hypothesis **H-QA**, see risks):

  for every `c > 0`:  `2c(1 + tr Q_A) − ‖ρ_A + Q_A‖²_F ≤ Σ_i kc c (λ_i(ρ_A)) + c²·b(∂A)`,

where `λ_i(ρ_A)` are the entanglement (Schmidt) eigenvalues — this is
`rank_trace_mult_k_of_master` applied to `(P, Q) := (ρ_A, Q_A)` *in the eigen-decomposition
of ρ_A* (so the certificate side is the Schmidt-level functional `Σ_i kc c(λ_i)`, whose
cap-limit is `2c − tr(ρ_A²)`, the purity). Rearranged under H-QA with the defects dropped,
it yields **purity-type lower bounds `tr(ρ_A²) ≥ 2c − c²·b(∂A) − (defects)`** — i.e.
Rényi-2/effective-rank statements **linear in the budget** (optimizing c ≈ 1/b:
`tr(ρ_A²) ≳ 1/b(∂A)`), a different shape from the entropic `tr(ρ_A²) ≥ e^{−C·|∂A|}` that
the area law + Rényi monotonicity already give. **Scope (round-4 alarm, binding):** NO rank
statement, NO α < 1 statement, NO cap-functional-at-all-thresholds statement is claimed —
each is either false (rank, α<1: Kuwahara) or collapses to counting the rank (cap at all
thresholds). The claim is the mechanism: an inertia/certificate proof of α ≥ 1 bounds.
Sub-questions inherited from A4: (a) is the conditioned-contraction budget boundary-linear
(conditional expectations do NOT preserve index in general; the `Σ k_X ⪰ (Δ/c*)(1−Π_Ω)`
domination is the input to exploit); (b) which of the five master-identity defects vanish on
ground-state data (Δ₊ = 0 iff `ρ_A Q_{A,+} = 0`, dossier 01's A2); (c) relation to the
MarginalTails window (AHS spread).

**(C-neg) Certified-negative corollary: the Kuwahara no-go gate (formalizable now).**
At the density-matrix level (over AreaLaw2D's `SubState`/eigenvalue layer, or mathlib
spectra): **Rényi monotonicity** `0 < α ≤ β → S_β(ρ) ≤ S_α(ρ)` and the rank consequence
`log rank ρ = S_0(ρ) ≥ S_α(ρ)` for α ∈ (0,1); hence the *gate*: any proposed theorem of the
form "log Schmidt rank of ρ_A ≤ f(|∂A|) for every unique-gapped 2D ground state" is refuted
by any state family with volume-law S_α (α < 1) — and such families exist in exactly the
gapped unique-ground-state class (**Kuwahara arXiv:2610.15199**, informal, cited as scope,
not formalized). The formalizable content is the monotonicity lemma + the contrapositive
gate (S-effort); it permanently fences this zone and every future 70-series area-law
candidate.

**(M1/AL-EZ3) Family-265 interface theorem (milestone-1; GLUE with a real consumer).** A Lean
chain: (i) *ptrace-Gram identity*: for the `L×L` grid instance, `ptrace … (pureState Ω hΩ).M
= reducedDensity Ω A` (both encodings of ρ_A — the partial-trace form and the
coefficient-matrix Gram form, `W Wᴴ` = exactly the `Pmat m v` shape of pilot 01); (ii)
*boundary match*: `(edgeBoundary Λ A).card = boundaryCard A` for the grid; (iii) *gap-form
match*: `FullSystemGap` (openai, Basic.lean:74, quadratic-form) ↔ `HasGlobalGap`
(Loewner form); (iv) *theorem*: `AreaLaw.areaLaw ℂ q 1 J Δ` (Transfer.lean:361) implies
`PolynomialPEPS.PinnedEntropy.UniformAreaLaw` (Basic.lean:135) — discharging openai-math's
unproved hypothesis and making `MainStatement` (:97) unconditional modulo its remaining
hypotheses, with `regionEntropy = vonNeumannEntropy` by `entropy_eq_H` (State.lean:75).
Nearest miss for the *representation* (PEPS) form of surviving statements: the openai
companion preprint itself (it derives poly-bond PEPS from the same area law informally,
"always with their full-system hypotheses").

**(S/AL-EZ2) Secondary: moment-hierarchy ceilings for surprisal decoupling.** Mirror of
dossier 02's provable core applied to MarginalTails' data (`Statements.lean:469–489`): a
*k-moment certificate* class for the targets `F ∈ {S, effective rank at threshold τ,
P(K > w)}` with (a) monotone hierarchy `B_k ≤ B_{k+1}` whose k → ∞ point is the
MarginalTails MGF bound; (b) finite-LP representation of `B_k` on spectrum grids (dossier
02 Theorem E's declared unclaimed layer); (c) `w_1` = the Cauchy–Schwarz 1-moment window
(the `cauchySchwarz_count` shape, zeta23 `RHLinalg/Weyl.lean:89`). Named consumer: the
repo's own 3D bottleneck C.3 (`docs/3D/Targets.md`: "is the spectrum of `−log ρ_X` known to
concentrate in a window narrower than the square root of the number of terms crossing the
boundary of X?"). [HYPOTHESIS at (b); (c) is self-contained.]

**(Future, not claimed: AL-EZ4.)** Schur–Weyl ↔ Temperley–Lieb label dictionary — jointly
owned with the tensor-algebra lane (dossier 41); this lane contributes only the observation
that the replica layer (`IrrepLabel (Equiv.Perm (Fin k))`, `AreaLaw/S06_Replicas/Setup.lean:73`)
is the only in-corpus consumer of Schur–Weyl and mathlib has none of it. No statement here.

## Novelty check

Corpus side (rg; A4's bridge §3(b) [VERIFIED] sweeps + this lane's corroborating greps,
2026-11-13):

- **P1 (dictionary) / P2 (certificate route), formal absence:** A4:
  `rg -i 'posIndex|rank.?trace|frobSq'` over AreaLaw2D → **0 relevant hits**; openai-math
  PEPS defines RDMs but proves no spectral bound on them; mathlib/tauceti have no gap↔index
  dictionary; zeta23 has the certificates but no entropy/RDM/partial-trace notion. This lane,
  corroborating: `rg -i -c 'posIndex|rank.?trace|inertia' axiommath/AreaLaw2D` (excl.
  vendor/.lake) → 0; `rg -i -c 'partial.?trace|HasGlobalGap|spectral gap' Mathlib/` → 0;
  mathlib's only "entangle" hits are convex-cone files (inspected, unrelated). Neither
  corpus can even *state* P1 (the two vocabularies never meet).
- **AL-EZ3 (interface):** "No theorem in either corpus connects the two encodings" (A4 §0.3
  [VERIFIED]); the paper-level interface exists (`08-companion-interface.tex`), the Lean-level
  one does not. Formalization-bridge (no new mathematics).
- **AL-EZ2:** no barrier/ceiling theory for entropy decay in any corpus (A4: rg
  'ceiling|bandwidth' in AreaLaw2D/openai quantum dirs → hits are collar/amplification, not
  classes of proofs).
- **Literature — round-4 §2 (zone AL) rows, mandatory, and the coordinator's alarm:**
  - **AL-1/AL-3: Kuwahara arXiv:2610.15199 (2026-10-10), "The Rényi area law conjecture is
    false below α=1 in high dimensions"** — finite-range, fixed local dimension, bounded
    interactions, UNIQUE ground state, UNIFORM gap, volume-law Rényi-α for all 0 < α < 1.
    By S₀ ≥ S_α these states have log Schmidt rank = Ω(volume): **literal rank concentration
    from a 2D gap is FALSE, and this dossier's original cap-functional target is dead on
    arrival** — hence the restructure to α ≥ 1 / purity / effective-rank framings (round-4's
    standing alarm 1: do NOT write "rank concentration from spectral gap"). Kuwahara's
    Schmidt-rank trade-offs for approximate projectors are the 1D-style mechanism — no
    inertia/certificate route found anywhere.
  - **AHS: Anshu–Harrow–Soleimanifar arXiv:2004.15009** (Nature Physics 2022) —
    entanglement-*spread* (log-width of the significant spectrum) area law from the same
    global-gap hypothesis: the nearest positive result, and a *different functional* (spread
    ≠ purity/effective-rank; neither implies the other). P2's converse-style sub-question
    (c) is exactly the AHS comparison.
  - **AL-2: Anshu–Arad–Gosset arXiv:2103.02492 + 1905.11337** (2D frustration-free area
    law / subvolume law); **AAH FOCS 2022** (cite directly, not on arXiv under those tokens)
    — the modern 2D area-law cluster the paper situates itself in.
  - **AL-5: Abrahamsen–Tong–Bao–Su–Wiebe arXiv:2203.16012** (1D AGSP area law) — the AGSP
    framework is the classical technique nearest to "rank certificates from a gap"; the
    pilot-01 `Q_A` is an AGSP-flavored object, and the AGSP literature has no
    master-identity/inertia-budget form.
  - **AL-6:** `abs:"effective rank" AND abs:"ground state"` → 0 relevant — no effective-rank
    concentration statements found.
  - **AL-4:** no formalization of any area law on arXiv — but AreaLaw2D (our donor) already
    formalizes one, so **"first formal area law" framings are DEAD**; our novelty is the
    cross-bridge (dictionary + certificate route + no-go gate + interface), not first-formal.
  - **The poly-PEPS representation form**: openai-math's companion preprint (in-corpus,
    `preprints/Polynomial-PEPS-approximation-…`) — nearest miss for the representation
    conclusion of any surviving statement; AL-EZ3's discharge theorem is precisely the
    formalization of the interface that preprint assumes.
  - **[A5 PART-2 LANDED 2026-11-13, row 72 (r4 §2 + P2-4):]** structure CONFIRMED — the
    Kuwahara no-go correctly baked in; P1 "formal-new, stated nowhere (AL-1/3/4 clean)";
    **P2's purity-route (α=2, linear-in-boundary-budget) NOT contradicted by the
    literature (P2-4: no α≥1 2D Rényi area law found — the [HYPOTHESIS] survives the
    dossier-level sweep; residual re-check owed at pilot time)**; AL-EZ3 = "GLUE with
    real consumer"; C-neg = "precedent-backed (50/30 lineage)". Tier WARM ("hard NO-GO
    on literal rank statements — already honored"). Pre-registered queries executed in
    P2-4 (`purity`/`Rényi α≥1` + area-law + gap family).
- Nearest misses (summary): AHS 2004.15009 (spread, different functional, same hypothesis
  class); Kuwahara 2610.15199 (the false-side boundary — rank/α<1 dead, our statements sit
  at α ≥ 2 with a different shape); AGSP 2203.16012 (1D, projector technique, no
  inertia/defect identity); OAI265 + PEPS companion (in-corpus: the theorem and the
  representation corollary our milestone discharges/connects); MarginalTails (the MGF route
  our certificate route would complement); dossier 02's ceiling laws (the methodology being
  transported, different data).

## Bridge analysis

- Corpora bridged: **AreaLaw2D (axiommath; the proved area-law + gap/k_X/condExpect layer)
  × openai-math (the PEPS assuming half + the companion preprint) × the main-run linalg
  cluster in this repo (pilot-01's PROVED master identity / rank–trace / inertia machinery;
  dossier 02's ceiling methodology) × mathlib (spectral substrate: `eigenvalues₀_antitone`,
  `spectral_theorem`, `trace_eq_sum_eigenvalues`, L2 operator norm, CFC)**. tauceti only via
  AL-EZ4 (future). This is the Cycle-2 bridge that most directly welds a *new* corpus
  (AreaLaw2D) to the main run's own proved pilot artifacts.
- Why essential (no single side states or proves any part):
  - AreaLaw2D owns the entropy objects, the gap hypothesis, the positive-replacement
    operators, and the proved area law — but has **no certificate layer** (no rank–trace, no
    index budgeting, no defect bookkeeping — [VERIFIED] greps above) and does not touch the
    PEPS encoding;
  - the linalg cluster owns the exact certificate bookkeeping — but no entropy, no partial
    trace, no notion of gap or ground state;
  - openai-math owns the Gram-form RDM and the *consumer* of the area law — but assumes it;
  - mathlib owns the spectral substrate and nothing above it (no partial trace, no density
    matrix, no `Mathlib/Information/` for quantum entropy);
  - the P1 dictionary is the missing two-line bridge *neither side has written*; P2's `Q_A`
    exists only in AreaLaw2D's vocabulary (k_X), its budget only in pilot-01's (posIndex),
    and its target functional (purity) in neither's.
- Empty-zone fit: realizes `research/bridges/area-law.md` §4 AL-EZ1 (primary; with the
  restructure recorded as this dossier's delta), AL-EZ3 (milestone-1), AL-EZ2 (secondary);
  AL-EZ4 flagged future/joint. Round-4 §2 records the zone verdict (WARM; naive headline
  REFUTED — high confidence).

## Proof-strategy sketch

**Milestone-1 (AL-EZ3) — the pilot's natural first milestone.**

1. (S) *Statement ports:* re-state openai's `UniformAreaLaw`/`reducedDensity`/
   `vonNeumannEntropy`/`boundaryCard`/`FullSystemGap` verbatim on our pin (Basic.lean:74–135
   is 15 lines of defs, mathlib-only; openai-math's tree is v4.34.1 — statement-port cost ≈ 0
   per `FEASIBILITY-SUMMARY.md`; A4 §5 recommends exactly this over importing the OAI tree).
2. (S–M) *ptrace-Gram identity (i):* unfold `ptrace` over `Reg` and `coefficientMatrix`
   over `RegionConfiguration`; both sides are `Σ_z Ω(x,z) conj(Ω(y,z))` — a reindexing
   (A4's first-proof-step note); then `regionEntropy = vonNeumannEntropy` via
   `entropy_eq_H` (State.lean:75) and eigenvalue-list transport.
3. (S) *Boundary + gap-form matches (ii)/(iii):* grid-instance reindexing for (ii); (iii)
   is the quadratic-form ↔ Loewner transfer (mathlib `Matrix` order API).
4. (Routine) *Discharge (iv):* compose `AreaLaw.areaLaw ℂ q 1 J Δ` with (i)–(iii).

**Primary (AL-EZ1).**

5. (S, provable now) *P1 dictionary:* the Loewner inequality `Δ(1−ΩΩᴴ) ≤ H − E₀` to
   `E₀ − H ⪯ 0` with `((E₀−H) − θ·1)` having positive index ≤ 1 exactly on θ ∈ (−Δ, 0] —
   `IsHermitian.eigenvalues` bookkeeping over the ported `posIndexAbove`
   (`port/01_PosIndex.lean`). *P1b:* `posIndex_conj_le` (`port/09_MasterIdentity.lean:846`)
   at `(E₀−H) − θ·1`, isometric B (note the QA delta above).
6. (The feasibility probe that decides P2) *Single-crossing instance:* one term `h_X`
   crossing the cut, `Q_A := E_A(E₀ − h_X)`, compute the budget by hand (A4's probe
   prescription). This either surfaces the right `Q_A` or refutes H-QA's first form —
   either outcome is report-grade.
7. (M, [HYPOTHESIS]) *P2 assembly:* `ρ_A = Pmat λ u` in the eigen-decomposition (the
   ptrace-Gram identity from step 2 supplies `ρ_A = W Wᴴ`; the spectral theorem supplies
   the decomposition); apply `rank_trace_mult_k_of_master` (`port/09_MasterIdentity.lean:2019`)
   to `(ρ_A, Q_A)` with the budget from step 6; drop the five defects (nonnegativity at the
   pilot-01 anchors) and read off the purity bound `tr ρ_A² ≥ 2c − c²·b(∂A) − …` via
   `kc_of_le` (`port/08_RankTraceMult.lean:1654`).
8. (S) *C-neg gate:* Rényi monotonicity in α over the eigenvalue list (a Jensen/log-sum
   computation at the density-matrix level; no physics), then the rank consequence and the
   contrapositive gate statement.

**Secondary (AL-EZ2).**

9. (S, self-contained) *1-moment ceiling (c):* from `Σ_j p_j = 1`, `E K = S`: the
   Cauchy–Schwarz effective-rank ceiling over `Arealaw.H` (the `cauchySchwarz_count` shape,
   zeta23 `RHLinalg/Weyl.lean:89`); compare against the MarginalTails window — a measurable
   delta with zero new physics (A4's first-proof-step note).
10. (M, [HYPOTHESIS]) *Hierarchy (a) + LP layer (b):* dossier 02's Theorem-E machinery
    (LP weak duality) transported from near-CUE rows to entanglement spectra; consumer C.3.

**Hardest step:** 7 (H-QA) — flagged [HYPOTHESIS] with the probe at 6; everything else is
template-following on pilot-01/A4 anchors.

## Feasibility

Preliminary, R9's F0–F6 shape; **A7's probes G5 (Physlib staging) pending — the load-bearing
unknown for every part that consumes AreaLaw2D's statement layer.**

- F0: M1 = AL-EZ3 chain (steps 1–4) + P1 dictionary (step 5) + C-neg (step 8); P2 probe =
  step 6; P2 = step 7; AL-EZ2 core = step 9.
- F1 mathlib entry points (on `ff2494ea`): `Matrix.PosSemidef`, the spectral layer
  (`Analysis/Matrix/Spectrum.lean:63,143,202,240`), L2 operator norm
  (`Analysis/Matrix/Order.lean:316–335`), CFC, `Real.log`/`Real.exp` convexity layer,
  `Analysis/Convex/Separation.lean` (AL-EZ2's LP substrate), `Real.negMulLog`
  (`negMulLog`-family, used by both entropy defs).
- F2 donor lemmas: pilot-01 PROVED layer (this repo — `port/09_MasterIdentity.lean:1983,
  2019, 846`; `port/08_RankTraceMult.lean:1640–1654`; donor attributions zeta23
  `RankTraceMult.lean:369`, `Inertia.lean:51`, `Weyl.lean:89`); AreaLaw2D ([VERIFIED] via A4;
  axiom triad per `OpenAI/Audit.lean:22–38`): `AreaLaw.areaLaw` (`AreaLaw/Transfer.lean:361`),
  `positiveReplacement` (:136), `marginalTails` (:228), `pureState` (Statements.lean:191),
  `HasGlobalGap` (:185), `PositiveReplacement`/`condExpect` (:259/:240), region layer
  (`PartialTrace.lean:25`, `State.lean:69,75,160,164,198`); openai-math PEPS statement layer
  (`PEPSFilters/Basic.lean:74–135`, no sorry [VERIFIED]); dossier-02 Theorems A/D/E (AL-EZ2).
  **Porting friction (A4 §0.1/§5, adopted):** AreaLaw2D HEAD `c0f6d96` pins our exact
  mathlib (`ff2494ea`, v4.36.0-rc2; the README's v4.33.0 prose is stale) — **but** requires
  **Physlib `a50684a1`**, which the region layer imports directly
  (`AreaLawForMathlib/QuantumInfo/Region/PartialTrace.lean:3`), and its manifest is stale
  (`db584cd6` — trust the lakefile, not the manifest). Physlib is not among the siblings;
  **consumption cost = staging Physlib on Modal and checking its own mathlib pin (A7 G5)**,
  or re-deriving the minimal region core in-repo (A4's fallback: `ptrace` is a 5-line def;
  `vonNeumann`/`SubState`/`MState` ≈ 300 LoC; SSA/Araki–Lieb only at the AL-EZ2 margins).
  openai-math's PEPS tree is v4.34.1 — re-state verbatim (15 lines) rather than import.
- F3 missing glue: (a) P1 dictionary — new, S; (b) ptrace-Gram identity — new, S–M; (c)
  boundary/gap-form matches — new, S; (d) H-QA budget construction — new, M, the
  [HYPOTHESIS]; (e) Rényi-α monotonicity at the density-matrix level — new (no corpus has
  Rényi entropies at all), S; (f) AL-EZ2's LP-duality layer — dossier 02's declared
  M-effort item; (g) generalized (BᴴB-relative) index if the non-isometric P1b is ever
  wanted — flagged, not needed by consumers.
- F4 Effort: **M1 (AL-EZ3 + P1 + C-neg): S–M** (the dictionary is "one evening" per A4;
  the interface is reindexing-heavy but bounded); **P2: M if H-QA holds, with a
  decider probe at S**; AL-EZ2: S for (c), M for the hierarchy. Overall anchor: M.
- F5 Risks: (i) **Physlib** — the single biggest consumption risk (G5 pending; fallback
  exists at ≈300 LoC); (ii) **H-QA may be false as first phrased** (conditional expectations
  do not preserve index — the probe at step 6 exists to find the right `Q_A`; a refutation
  is itself report-grade, C-neg style); (iii) the purity bound's shape (linear-in-budget)
  could be weaker than trivial for small boundaries — the probe must compare against
  `entropy_le_log_card` (State.lean:160) and the MarginalTails window before claiming
  value; (iv) encoding gap fiddliness (`Finset (ℤ×ℤ)` + `Reg` vs `Vertex L = Fin L × Fin L`
  + `RegionConfiguration`); (v) Kuwahara-adjacent literature is one month old and moving
  (round-4 depreciation note); (vi) pilot-01's port is over `Matrix`/`rtrace` in the RHLinalg
  vocabulary — the AreaLaw2D side is CFC/spectral-flavored; the dictionary step must bridge
  trace conventions (named, routine).
- F6: kernel-only, math-proof1 standard; Modal probe infra (`research/pilots/32/
  run_pilot.sh` pattern); pilot-01's port is already in-repo and axiom-audited (no donor
  build needed for the certificate side — the asymmetry that makes M1 cheap).

## Significance

The gap-to-inertia dictionary and the certificate route would give the entanglement-spectrum
side what the linalg cluster gave zeta-side zero counting: an exact, defect-accounted
bookkeeping layer under an asymptotic theorem. P2, if H-QA holds, is the first
inertia-derived bound on any entanglement functional — a mechanism genuinely absent from a
literature whose nearest neighbors are the MGF route (OAI265/MarginalTails), the spread
route (AHS), and the AGSP route (1D) — and its no-go fence (C-neg) is the first formal
Kuwahara-gate, permanently protecting this and future area-law candidates from the false
rank/α<1 shapes. AL-EZ3 closes family 265's own loop (proved half ↔ assuming half) and
discharges a real hypothesis with a real consumer tree (`MainStatement`, `PEPSMove/`,
`PEPSSubvolume/`, `TensorNetwork/`). The cluster value is high; the honest per-part
mathematics is dictionary + transport + one flagged hypothesis.

## Score (filled at triage — leave empty)

- Novelty (1–5): —
- Significance (1–5): —
- Effort (S/M/L → 1–5): —
- Rank (novelty × significance ÷ effort): —

**Lane proposal (A9, non-binding):** Primary AL-EZ1: Novelty **3–4** (P1 formal-new but
math-trivial; P2's certificate mechanism unclaimed in every round-4 search — capped by its
[HYPOTHESIS] status; C-neg formal-new, math-known-from-Kuwahara), Significance **3–4**
(new mechanism + permanent no-go fence + zone infrastructure), Effort **2–3 (M, with an
S decider probe)**. AL-EZ3 milestone: Novelty 2 (GLUE), Significance 3 (real consumer
tree), Effort 1–2 (S–M) — recommend as M1 of any pilot here, gated on A7 G5 (Physlib).
Composite proposal: pilot M1 = AL-EZ3 + P1 + C-neg (S–M, mostly in-repo donors, minimal
Physlib exposure), then the P2 decider probe. Honest categories: **P1/C-neg = formal-new
glue with discovery-adjacent value; P2 = DISCOVERY-grade [HYPOTHESIS] (the zone's only
surviving discovery claim, post-Kuwahara); AL-EZ3 = GLUE-with-real-consumer; AL-EZ2 =
methodology transport [HYPOTHESIS at the LP layer]; AL-EZ4 = future work, jointly owned.**
**[A5 PART-2 LANDED (row 72): "P1: formal-new (moderate); P2: N as proposed
([HYPOTHESIS], flagged); C-neg: precedent-backed (50/30 lineage)"; tier WARM; P2-4
outcome folded into § Novelty above — P2 un-contradicted, residual re-check at pilot.]**
