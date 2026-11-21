# Candidate dossier 41 — q-deformed-eight-square-temperley-lieb

Lane R1 (tauceti-surveyor), 2026-11-09. Realizes §3a of
`research/bridges/tauceti-contributions.md`. **Coordinate header — cross-ref dossier 30
(Hall/Parseval) and 31 (BudgetedSplit), lane R7** (map: `research/bridges/tensor-algebra.md`
§2–§4). Delimitation vs R7's territory: R7 §4b owns the **q = 1** classification (octonion/
cocycle reading of `Eight.Signs`, the σ_n families on F₂ⁿ, the Hurwitz constraint) and §4c owns
the Fock/Hall side (dossiers 30/31); this dossier owns the **q ≠ 1 theory**: a one-parameter
deformation of the Graves sign rule with the classical alternation as the q = 1 fiber, hosted
in Temperley–Lieb / Hecke. Tags: [VERIFIED] / [HYPOTHESIS].

**Corrections to the two bridge maps, found while verifying this dossier** (both lanes should
absorb): (1) **tauceti has octonions** — `TauCeti/Algebra/CayleyDickson/` constructs
`CayleyDickson ℍ[R]` with `TauCeti.DivisionOctonionReal` for R = ℝ, Moufang identities, Artin's
theorem (`Artin.lean:90–164` [VERIFIED decls]) and the imaginary-octonion cross product +
automorphism-invariant trilinear form (`Imaginary.lean` header [VERIFIED]) — R7's §1.2 hosting
map ("octonions/composition algebras absent", suggesting they be defined) under-lists tauceti.
(2) **openai-math has two Temperley–Lieb developments** — `HarmonicArtin.TemperleyLieb`
(`lean/OAI/Topology/ArtinGroups/Diagrams/{Circle,Relation}.lean` [VERIFIED namespaces]) and a
dilute-TL decomposition in `lean/OAI/Combinatorics/HoneycombChords/` (`PhysicalWeights.lean:189`
[VERIFIED docstring line]) — the TL host exists in a third corpus.

---

## Name

q-deformed-eight-square-temperley-lieb

## One-line pitch

eth's eight-square (Graves) alternation `σ(p,q)σ(p′,q′)+σ(p,q′)σ(p′,q)=0` is the q = 1 fiber of
an explicit ℤ[q±]-valued sign family σ_q built by weighting eth's own cubic correction by −q,
with defect factor (1−q) — and the deformation is hosted (conjecturally, with a finite
verification path) by tauceti's Jones representation of the braid group inside Temperley–Lieb,
making the eth seed identity the classical point of a TL/Hecke-valued cocycle identity.

## Precise mathematical statement

**Setting [VERIFIED].** `Block := Bool × Bool × Bool` with `bxor` (eth
`proof/networks/Eight/SecCrossing_Identity.lean:40–56`); eth's sign exponent decomposes as
`phi = phiQ + phi1 + phi2 + phi3` with `phiQ` the quadratic part `Σ_{1≤i≤j≤3} p_i q_j` and
`phi1+phi2+phi3` the three cubic terms (`phi_parts … := rfl`, `SecCrossing_Identity.lean`
[VERIFIED]; component defs `:126–133`); `sigma p q = (−1)^(phi p q)` (from `unfold sigma` in
the proof of `signs`, `:261–266`); `Signs` is the four-term alternation on parallelograms
`p⊕q = p′⊕q′, q ≠ q′` (`Eight.signs : Signs`, `:261`).

**Definition (the deformation).** For a commutative ℤ-algebra R and unit `q ∈ Rˣ`:

```
sigmaQ q p q' := (−1)^(phiQ p q') * (−q)^(tau p q'),   where tau p q' := phi1 p q' + phi2 p q' + phi3 p q'
```

(naming clash note: in Lean, `sigmaQ q : Block → Block → ℤ` with parameter `q : Rˣ`; below
written `σ_q(p,·)`).

**Bridge axiom (B) [VERIFIED as a definition-level fact].** `sigmaQ 1 p q = sigma p q` for all
blocks: at `q = 1`, `(−1)^(phiQ)·(−1)^(tau) = (−1)^(phiQ+tau) = (−1)^(phi p q)` by
`phi_parts`. This axiom is what ties the candidate to `Eight.signs`; any host theorem must
satisfy it.

**Main identity (M) [HYPOTHESIS — the finite verification target].** For all blocks
`p, q, p′, q′` with `p⊕q = p′⊕q′` and `q ≠ q′`:

```
sigmaQ q p q * sigmaQ q p' q' + sigmaQ q p q' * sigmaQ q p' q
  = (1 − q) * G_q p q p' q'
```

where `G_q : Block⁴ → ℤ[q, q⁻¹]` is the **explicit polynomial**

```
G_q p q p' q' := (−1)^(Q1) · (−q)^(τmin) · Σ_{j=0}^{2k} (−q)^j   with
  d := q ⊕ q′, p′ = p ⊕ d (eth's `p'_eq`, `:78`),
  Q1 := phiQ p q + phiQ p′ q′,  τmin := min(τ p q + τ p′ q′, τ p q′ + τ p′ q),
  2k+1 := |(τ p q + τ p′ q′) − (τ p q′ + τ p′ q)|,
```

**provided** the two parity facts [HYPOTHESIS, derivable from eth's existing lemma chain — see
Proof sketch step 1] hold: (P1) `Q1 ≡ Q2 (mod 2)` where `Q2 := phiQ p q′ + phiQ p′ q`, and
(P2) the τ-difference is odd. Under (P1)+(P2), identity (M) is an algebraic identity in ℤ[q±]
(no number theory); its q = 1 fiber recovers `Eight.signs` by (B) and `1 − q = 0`.

**[ERRATUM 2026-11-18, lane A6 — two display mis-prints in the G_q block above; the
corrected form is the one the dossier's own Proof sketch step 2 algebra computes, and the
one the pilot consumes. Surrounding prose untouched.]**

1. The geometric-sum **summand is `q^j` (positive), not `(−q)^j`** as the display's last
   factor mis-prints. Sketch step 2: `F_q = (−1)^{Q1}(−q)^{τmin}·(1 + (−q)^{2k+1})`, and
   since `2k+1` is odd, `1 + (−q)^{2k+1} = 1 − q^{2k+1} = (1−q)·Σ_{j≤2k} q^j` — the
   alternating sum does not factor `(1−q)`; the positive one does. (Note the display was
   ALSO right by accident in one degenerate reading: if the summand were `(−q)^j`, the
   factorization would give `(1+q)`, not `(1−q)`.)
2. The **gap identity is `2k+1 = |τ₁ − τ₂| = gapOdd − 2·τmin`**, where
   `gapOdd := (τ p q + τ p′ q′) + (τ p q′ + τ p′ q)` — NOT `gapOdd − 1` (i.e. `k` is not
   `(τ₁+τ₂)/2`); the two agree only when `τmin = 0`. Since `τ₁ + τ₂ = 2·τmin + |τ₁−τ₂|`,
   the sketch's `τmin`-factoring requires the `− 2·τmin` form.

Corrected display (authoritative for the pilot; per the P0 pre-charter
`qa/iter4-review/a6-41-p0-precharter.md` §1.3 `Gq` def, where it is pinned in
`Polynomial ℤ` — all exponents nonneg, no Laurent needed):

```
G_q p q p' q' := (−1)^(Q1) · (−q)^(τmin) · Σ_{j=0}^{2k} q^j,   2k+1 = gapOdd − 2·τmin,
  gapOdd := (τ p q + τ p′ q′) + (τ p q′ + τ p′ q)   [= |τ₁−τ₂| + 2·τmin]
```

— end erratum.

**[CORRECTION 2026-11-19, lane R4 — machine-certified; folded by H per the
one-writer convention, draft = `pilots/41/dossier41-amendment-draft.md`.]** The P0
precharter's universal SHAPING of the hypothesis layer is FALSE as stated —
kernel-certified refutations (`pilots/41/Core.lean` §1, decide/norm_num,
axiom-lean; witness quad **p = 000, q1 = 100, p′ = 100, q2 = 000**, a valid
parallelogram with q1 ≠ q2): **P1 fails** (Q1 = 0 but Q2 = 1, `P1_refuted`, zero
axioms); **P2 fails** (gapOdd = τ1 + τ2 = 0, even, `P2_refuted`); the
**MainIdentity-as-universal fails** (at R = ℤ, q = −1 it reads 0 = 2,
`MainIdentity_refuted`). **What survives, strengthened (all kernel-proved,
triad-clean, `Core.lean` §6):** (1) **`mainCor` (M-corrected, universal)**: for
EVERY parallelogram quad and every CommRing R with unit q,
σ_q(p,q1)σ_q(p′,q2) + σ_q(p,q2)σ_q(p′,q1) = (1−q)·aeval q (GqGen), where
**GqGen := (−1)^{Q_small}·(−X)^{τmin}·Σ_{j<|τ1−τ2|} X^j** — the geometric factor
has length |τ1−τ2| = gapOdd − 2·τmin, Q_small the quadratic sum of the smaller-τ
side; empty sum (τ1 = τ2) gives defect 0. (2) **`mainStratum`**: ON the odd-gap
stratum GqGen = the dossier's G_q exactly (`Gq_eq_GqGen_on_stratum`) — the
dossier's (M) display is exactly right where its own conditional meant it.
(3) **Stratum characterization** (`stratumComplement`, decide-certified, zero
axioms): the odd-gap stratum is precisely the **antipodal** parallelograms
{p′ = ¬p bitwise} (bxor p p′ = 111); off it τ1 ≡ τ2 (mod 2), with defect 0 when
τ1 = τ2 (**q-rigidity**, `qRigid` — the classical alternation survives every q
there) or an even-length geometric sum when |τ1−τ2| ≥ 2 (e.g. p = 101, q1 = 101,
p′ = 011, q2 = 011: A + B = 1 − q²). (4) **(N′) closed**
(`SigmaQ_Signs_all_q_refuted`, [propext]): the family is NONdegenerate — at the
antipodal quad p = 110, q1 = 110, p′ = 001, q2 = 001 the alternation value at
q = −1 is 2 ≠ 0 (`alternation_fails_at_q_minus_one`, [propext]). (5) The anchor
+ bridge re-proved in-pilot (`signs_anchor`, `bridge_axiom`, [propext,
Quot.sound]): eth's Signs via the same route eth itself uses, and the
corrected-⇒classical regression `mainCor_one_implies_signs` (triad-clean).
**Provenance (the three-way ruling):** the falsity is the P0 precharter's
universal-shaping layer (`a6-41-p0-precharter.md` §1.4 stated (P1)/(P2)/(M) as
Para-universals; the decide it invoked, when actually run, refuted its own
universal — core runs 1–2) — **NOT the eth source** (eth's actual parity fact
`SecCrossing_Identity.lean:240–242` `four_phi_odd` states NO (P1)/(P2) split;
every eth-originated statement in the P0 is TRUE, Signs re-proved) and **NOT the
dossier's (M)** (stated conditionally "provided the two parity facts hold" — the
conditional reading is correct and now a theorem). Claim discipline unchanged
(first sign-rule/parallelogram-defect deformation; NEVER first q-deformation —
Benkart–Pérez-Izquierdo 1998 owns the q-composition object level). Billing
(findings only): a spec-shaping defect in the precharter layer; the DISCOVERY
content (unified defect identity + antipodal stratification + nondegeneracy) is
intact and kernel-proved; the novelty battery targets the CORRECTED identity.
**Verification:** mathlib `ff2494ea` / v4.36.0-rc2, warm `crossmath-probe`
(doz/semraker); `pilots/41/Core.lean` GREEN run 9 sha256(16) `921bc43cbd06d252`
(full `921bc43cbd06d252dbc796c79b734529a1dd1e02d7097b0e8efb3fdc41adf269`),
0 sorry, 0 sorryAx, triad-or-leaner audit in-file; logs `core-run1..9`.

**Nondegeneracy (N) [HYPOTHESIS, spot-checkable].** There exists a parallelogram quadruple with
`G_q ≠ 0` in ℤ[q±] (equivalently: the alternation fails for a specific q ≠ 1, e.g. q = 2).
Then: *the Graves alternation holds for all quadruples at parameter q iff q = 1* — the
classical rule of signs is exactly the classical point of the family.

**Host theorem (H) [HYPOTHESIS — the bridge payoff, second phase].** With `R = ℂ`, `A ∈ Rˣ`,
`δ := jonesDelta A = −(A² + A⁻²)` (tauceti `KnotTheory/TemperleyLieb.lean:87` [VERIFIED]),
`jones A : BraidGroup n →* (TemperleyLieb R δ n)ˣ` (`TemperleyLieb.lean:146` [VERIFIED]) and a
Markov trace τ_TL (tauceti `KnotTheory/Hecke.lean:49 MarkovBraid.eq_heckeTrace_of_skein`
[VERIFIED] gives the skein-characterized Hecke trace on braids): there exist eight 3-strand
braid words `w_p`, p ∈ Block, such that

```
sigmaQ q p p' = (Jones/Markov trace evaluation of w_p · w_p′ at A with q = −A²)
```

and (M) becomes an identity of TL-diagram evaluations — a **skein-theoretic Graves identity**:
`⟨w_p w_q⟩⟨w_p′ w_q′⟩ + ⟨w_p w_q′⟩⟨w_p′ w_q⟩ = (1 − q)·(TL linear combination)` for all
parallelogram quadruples. At the Hecke fiber q = 1 (H_n(1) = ℤ[S_n]; tauceti's `Hecke.lean`
skein traces) the left side vanishes identically. [HYPOTHESIS: the existence of `w_p` with the
right closure traces is a finite search over 3-strand TL diagrams (dimension of TL_3(δ) = 5);
verify by explicit computation before any general statement is attempted.]

Quantifier order (Lean, M): `∀ {R : Type*} [CommRing R] (q : Rˣ), ∀ p q1 p' q2 : Block,
bxor p q1 = bxor p' q2 → q1 ≠ q2 → <M with G_q as above>`, with (P1)(P2) discharged as
`decide`-able finite facts over Bool³ once phrased as parity lemmas.

## Novelty check

- **Corpus side** (rg, 2026-11-09):
  - mathlib: `rg -i -c 'octonion|composition algebra|temperley' Mathlib/` → only false
    positives (`Algebra/Jordan/Basic.lean`, `Algebra/Ring/Identities.lean` etc. hit
    "composition algebra"-adjacent docstrings; no octonion/TL algebra). **No q-deformed sign
    family, no TL.**
  - tauceti: octonions exist (`Algebra/CayleyDickson/Artin.lean:2` octonion mentions,
    `Imaginary.lean:36` [VERIFIED counts]) but `rg -i 'q.?deform|qDeform' QuantumGroups/` → 0
    in the eight-square sense (UqSl2's "quantum" content is the standard algebra, not a sign
    cocycle); the *classical* eight-square identity is present in norm form —
    `CayleyDickson/Quaternion.lean` "Degen's eight-square identity" = multiplicativity of the
    Cayley–Dickson norm (the q = 1 object this dossier deforms; cf. Corrections header) — but
    no `F₂³` sign-cocycle, q-family, or alternation statement
    (`rg -i 'sigma|cocycle|alternation' TauCeti/Algebra/CayleyDickson/` → 2 hits, both
    Mathlib's `associator_cocycle` (Teichmüller identity, `Artin.lean`) — no sign-rule
    content).
    [erratum 2026-11-09, H/QA: v1 wrote "`rg 'eight.?square|Graves' TauCeti/` → 0", which the
    Quaternion.lean identity contradicts; negation restated to what is actually absent.]
  - anthropics (eth): `Eight.signs` + the statement file
    (`proof/statements/EightSquareStatement.lean:53` per R7 §0 [VERIFIED via R7; statement read
    by this lane at `SecCrossing_Identity.lean:259–261`]) — q = 1 only.
  - openai-math: TL exists (`HarmonicArtin.TemperleyLieb`,
    `ArtinGroups/Diagrams/Circle.lean:7,60`, `Relation.lean:7,253` [VERIFIED]); no Graves/
    eight-square identity content — the raw pattern `eight.?square` returns 333 hits that are
    ALL the substring "h**eight_square**" (SLE `height_square` identifiers), and word-boundary
    forms (`rg -iw 'eight.?square|Graves|rule of signs'`) return no eight-square-identity or
    sign-cocycle content. [erratum 2026-11-09, H/QA: v1 wrote "→ 0" for the unanchored
    pattern; restated with the word-boundary form so the negation is true as written.]
- **Literature side: PENDING lane R8 round-2.** High-risk novelty area — q-deformed composition
  algebras DO exist in the mathematical-physics literature, so R8 must run at least:
  1. `"quantum octonion"` / `"q-deformed octonion"` (zbMATH, arXiv listing) — the direct
     collision risk for the *object*; expectation: variants exist (e.g. q-octonion algebras in
     physics journals); the differentiator to check is whether any carries the **four-term
     Graves alternation with explicit defect (1−q)**;
  2. `"Temperley-Lieb" octonion OR "composition algebra"` ;
  3. `"q-analogue" "eight square identity" OR "Degen" OR "Graves"` ;
  4. `"sign cocycle" "braid" OR " Temperley-Lieb" deformation Clifford` (Bravyi–Kitaev /
     fermionic-simulation literature uses sign systems on F₂ⁿ — the alternation property there
     is `(−1)^{Σ_{i<j} a_i b_j}`, the *bilinear* case; eth's cubic correction has no
     counterpart there — check);
  5. `"octonion" "Hecke algebra" structure constants`.
- `[R8 confirmation pending]` on all five. The dossier's honest posture: **no classical
  analogue claimed**; (M)+(N) as ℤ[q±]-identities are almost certainly unstated anywhere, but
  (H)'s diagrammatic content has real collision risk in the mathematical-physics literature.
- **Known nearest misses:** (a) eth `Eight.signs` (q = 1, mod-2 proof only,
  `SecCrossing_Identity.lean:22–23`: "no step runs through the values of a block"); (b) R7 §2a
  cocycle reading (parallelogram ratio −1 at q = 1, `tensor-algebra.md` §2a [VERIFIED by R7]);
  (c) tauceti `DivisionOctonionReal` (the host of the q = 1 structure constants); (d) Kauffman
  bracket skein relations (classical TL calculus — the ambient algebra of (H), not the
  identity); (e) fermionic ordering signs in fermionic-simulation literature (bilinear only).

## Bridge analysis

- **Corpora bridged:** anthropics/eth (`Eight.Signs` statement + its own lemma chain as the
  proof scaffold) × tauceti (`TemperleyLieb.lean` Jones representation, `Hecke.lean` skein
  traces, `QuantumGroups/UqSl2/` quantum trace/pivotal normalization, `Algebra/CayleyDickson/`
  octonions, `RepresentationTheory/Spin/LineSign.lean` two-Fock-action grade-involution
  comparison `spinRepEquivNegLineCoordinate:149` [VERIFIED] — the sign-choice-is-invisible
  phenomenon that motivates (H)) × mathlib (`MvPolynomial`/`CliffordAlgebra` substrate) ×
  openai-math (`HarmonicArtin.TemperleyLieb` as a second TL host, `OAI/RepresentationTheory/
  VertexAlgebra/` mode calculus adjacent to R7's dossier 30).
- **Why essential:** eth owns the sign family and its parity lemmas but nothing algebraic beyond
  Bool arithmetic and no TL/Jones content; tauceti owns TL, Hecke traces, U_q(sl₂) and octonions
  but has no F₂³ sign statement anywhere; neither alone can even state (M)+(B). The identity's
  *proof* is an integer lift of eth's own mod-2 chain (step 1 below) — so eth contributes the
  proof scaffold, tauceti the deformation's algebraic home.
- **Empty-zone fit:** `bridges/tauceti-contributions.md` §3a; `bridges/tensor-algebra.md` §1.1
  row "Two disjoint sign algebras" (item 4) and §4b — explicitly the q ≠ 1 half of that zone;
  feeds R7's §4a BudgetedSplit (dossier 31) if the pieces machinery deforms (see Significance).

## Proof-strategy sketch

1. **Parity facts (P1)(P2) — routine lift of eth's chain.** eth's proof computes
   `phi p q + phi(p⊕d)(q⊕d) + phi p (q⊕d) + phi(p⊕d) q ≡ 1 (mod 2)` via the chain
   `four_phi → phi_add_phi_shift → four_changes → seven_terms → one_add_prod`
   (`SecCrossing_Identity.lean:109–258` [VERIFIED names]). That chain treats the quadratic part
   (`change_Q`, `phiQ_self`) and the cubic changes (`change_1/2/3`, `three_changes`)
   separately; tracking the two parts as separate congruences gives (P1) (quadratic parts
   congruent) and (P2) (cubic parts' four-sum odd). Genuinely routine: same lemmas, split
   conclusions.
2. **Identity (M) — polynomial algebra.** With (P1)(P2), `F_q := σ_q(p,q)σ_q(p′,q′) +
   σ_q(p,q′)σ_q(p′,q) = (−1)^{Q1}(−q)^{τ1} + (−1)^{Q2}(−q)^{τ2}` with `τ1−τ2 = ±(2k+1)`:
   `F_q = (−1)^{Q1}(−q)^{τmin}·(1 + (−q)^{2k+1})` and `1 + (−q)^{2k+1} = 1 − q^{2k+1} =
   (1−q)Σ_{j≤2k} q^j`. This *is* (M) with the displayed `G_q`. The whole content is step 1's
   parity split. **This step is fully elementary; the hardest step of the dossier is (H).**
3. **Nondegeneracy (N).** `decide` over the 8⁴ = 4096 quadruples for, say, `q = 2` (integers):
   exhibit one quadruple with `F_2 ≠ 0`. [HYPOTHESIS it exists; if every `G_q ≡ 0` the family
   is degenerate and (N) fails — the finite check settles it either way.]
4. **Host theorem (H) — the genuinely new part.** (i) Tabulate the closure traces
   `⟨w_p w_q⟩` over a basis of 3-strand TL diagrams (dim TL₃(δ) = 5; Jones relations
   `e_i² = δ e_i`, `e_ie_{i±1}e_i = e_i` — the relations `jones_sigma` satisfies,
   `TemperleyLieb.lean:157` [VERIFIED name]); (ii) match the resulting 8×8 table against
   `σ_q` at `q = −A²`; (iii) if matched, (M) transports to TL and (B) lands at the Hecke fiber.
   The UqSl2 normalization (`QuantumGroups/UqSl2/QuantumTrace.lean:41
   trace_lsmul_k_comp_eq_trace_lsmul_kInv_comp` [VERIFIED], pivotal/`Pivotal.lean`,
   classical specialization `ClassicalSpecialization.lean`) is where the q ↔ A dictionary is
   proved. Risk: no match exists; the fallback is the purely algebraic (M)+(N) with the octonion
   host (`CayleyDickson ℍ[ℤ]`, structure constants = σ by R7 §4b's table) as the q = 1 anchor
   and (H) restated as an open problem.
5. **Downstream (speculative, feeds dossier 31).** eth's `Eight.lemPieces`
   (`EightSquareStatement.lean:107` per R7 §0) budgets pieces via σ; a (1−q)-defect version
   would give a one-parameter family of piece constructions whose ρ-parameters
   (11/12, 1/√2 — R7 §3 item 4) vary with q — a BudgetedSplit-level question, out of scope
   here, noted for R7. [HYPOTHESIS]

## Feasibility

- **F0.** Target: Definition + (B) + (M) + (N) as a self-contained ℤ[q±] theorem package with
  `Eight.Signs` as the q = 1 corollary; (H) as a second-phase extension.
- **F1. Mathlib entry points:** `MvPolynomial` (the `G_q` polynomial side), `Bool`/`Finset`
  decide infrastructure for the finite tables, `CliffordAlgebra` (q = 1 geometric reading);
  tauceti (donor side, not mathlib): `TemperleyLieb R δ n`, `jones`, `jonesDelta`, `jones_sigma`
  (`KnotTheory/TemperleyLieb.lean:87,146,157`), `MarkovBraid.eq_heckeTrace_of_skein`
  (`KnotTheory/Hecke.lean:49`), `UqSl2` quantum trace family
  (`QuantumGroups/UqSl2/QuantumTrace.lean:41`), `CayleyDickson`/`DivisionOctonionReal`
  (`Algebra/CayleyDickson/{Basic,Artin,Imaginary}.lean`), `spinRepEquivNegLineCoordinate`
  (`RepresentationTheory/Spin/LineSign.lean:149`).
- **F2. Donor lemmas:** eth's parity chain — `four_phi`, `phi_add_phi_bxor`, `phi_add_phi_shift`,
  `change_Q/1/2/3`, `three_changes`, `four_changes`, `seven_terms`, `one_add_prod`,
  `four_phi_odd` (`proof/networks/Eight/SecCrossing_Identity.lean:88–256` [VERIFIED names in
  file]) and the statement `Eight.signs : Signs` (`:261`). eth is Lean v4.33/Mathlib v4.33
  (toolchain split; `research/feasibility/port-probe.md` **pending** — no EightSquare probe in
  `research/feasibility/probe/` yet); the statement file imports only core + `Mathlib.Data.
  Nat.ModEq`, so the port surface is tiny (S).
- **F3. Missing glue:** (a) definitional: none for (M) — everything is defined in the dossier;
  for (H), the trace dictionary `q ↔ −A²` and the `w_p` family (finite search); (b) genuinely
  absent mathematics: (H)'s existence statement; nothing else (steps 1–3 are lifts of proved
  lemmas + polynomial algebra + decide); (c) porting debt: eth's `SecCrossing_Identity.lean`
  chain to v4.36 (small; the file's imports are `Mathlib.Data.Nat.ModEq` + tactics).
- **F4. Effort: S–M.** (M)+(N): ~500–1k LoC (definition ~50, step-1 parity split ~200 — mostly
  transcribing eth's chain with both parts tracked, step 2 ~100, (N) decide driver ~50,
  packaging ~100). (H): +1–3k with the finite TL search; scoped as a separate milestone.
  *[ACTUALS 2026-11-19, lane R4: ~600 LoC, GREEN run 9 (logs `pilots/41/core-run1..9`);
  the estimate held; see the CORRECTION block above for what the run actually proved.]*
- **F5. Risks:** (i) **novelty risk is the dominant one** (q-octonion literature; R8 round-2
  mandatory before pilot); (ii) ~~(N) could fail (family degenerate)~~ **CLOSED 2026-11-19 —
  REFUTED (the family is NONdegenerate)**: `(SigmaQ_Signs_all_q_refuted,
  alternation_fails_at_q_minus_one)`; the F5(ii) degenerate-branch descope is DEAD
  (R4's CORRECTION block item 4); (iii) (H)'s finite search may have no solution — mitigated by the fallback scope;
  (iv) eth's `Signs` predicate lives in the statement file `EightSquareStatement.lean` imported
  by the proof file — restating (B) requires the statement-level `sigma`/`phi` defs to be
  visible; they are (`@[expose]` defs in `SecCrossing_Identity.lean:126–133`).
- **F6.** Kernel-only; the (N)/(H)-search steps are `decide`/`NormNum`-style finite checks —
  no `native_decide` needed at 8⁴ scale over ℤ. Milestones: (1) port eth's chain, re-prove
  `Eight.signs` (anchor); (2) parity split (P1)(P2); (3) (M)+(B); (4) (N) decide; (5) (H)
  search. Modal build per math-proof1.

## Significance

If (H) holds, this is the first theorem connecting a complexity-theory seed identity (eth's
eight-square device, the engine behind its ETH-refuting tensor-network bounds) with the
Temperley–Lieb/Jones quantum-topology world — and it exhibits the classical Graves rule as the
exact semisimple point of a one-parameter family, with the eth parity proof lifting verbatim
to the deformation. Even without (H), (M)+(N) is the first q-deformation of a composition-
algebra sign rule with a controlled defect factor, and the infrastructure (σ_q tables over
tauceti's TL) directly serves R7's BudgetedSplit dossier 31 (a q-family of piece constructions)
and, via R7 §2b's `t_k ↔ p_k` dictionary, dossier 30's Hall/Parseval program.

## Score (filled at triage — leave empty)

- Novelty (1–5):
- Significance (1–5):
- Effort (S/M/L → 1–5):
- Rank (novelty × significance ÷ effort):

**Lane proposal (R1, non-binding):** Novelty 4 (object-level collision risk with q-octonion
literature; the (M)/(N) form likely unstated), Significance 4 (first complexity↔TL bridge;
feeds dossiers 30/31), Effort 1–2 (S for (M)+(N); +1 if (H) piloted) → proposed rank ≈ 8
(for (M)+(N) scope), conditional on R8 round-2 clearing the q-octonion queries.

## F4 grade by lane R9

2026-11-09, round 4. Evidence: Modal port-probe runs 1–6; tauceti `lean-toolchain` read
directly (`research/feasibility/port-probe.md`).

- **Grade: S–M — confirmed.** Both donor sides measure favorably: (i) the eth parity chain
  (`SecCrossing_Identity.lean`, imports core + `Mathlib.Data.Nat.ModEq` + tactics) is in the
  same eth statement family whose probes ran clean (`ProbeB2` eth TM shape, `ProbeB3` 3sum
  core-Lean verbatim) — the F2 "tiny port surface (S)" assessment stands with analog
  evidence; no dedicated EightSquare probe was run (statement is self-contained core-Lean
  arithmetic — lowest-risk category in the corpus). (ii) **tauceti side: zero port
  friction** — `tauceti/lean-toolchain` = `v4.36.0-rc2`, identical to the encore checkout;
  `TemperleyLieb`/`UqSl2`/`CayleyDickson` donors import cleanly as a same-toolchain lake
  dependency (no re-base, no port line-item at all).
- **F1 confirmations**: `MvPolynomial`, `CliffordAlgebra`, decide infrastructure are
  long-stable mathlib (unprobed but pre-module-era core algebra; churn risk negligible).
- No F1 corrections. Verdict: keep S–M ((M)+(N) ~0.5–1k LoC; (H) separate); the novelty
  risk flagged in F5(i) remains the dominant one, unchanged by port evidence.

---

## Kernel-upgrade follow-ups (2026-11-21, external-referee revision — recorded per the orchestrator's directive; each needs a NEW PILOT RUN)

1. **41H det M(q) ≠ 0 at generic q** (settles the 41H scope comment): the revision
   restricted article 41H's no-go to the q = −1 fiber because only that fiber is
   kernel-closed. The referee's claim — `det M(q) = −512·q·(q⁴+6q²+1)`, non-zero for
   real q ≠ 0 — was independently recomputed by the revision lane (exact integer
   interpolation; det M(−1) = 4096 = 8⁴ consistent with the B1 certificate) but is
   UNFORMALIZED. A Lean determinant proof at generic q (or per-fiber decides over the
   complex excluded fibers, per the H2.lean §4 comment) would restore the general
   real-fibre no-go and re-open the "host, if any, at n ≥ 4 strands" corollary at its
   original strength.
2. **41H3 per-fiber scan split — SETTLED 2026-11-21 (custody settlement, option (a)):**
   the archived re-run (`pilots/41/presolve/`, deterministic seed 20261121) scanned
   both fibers explicitly and reports the split: canonical-13 51,891,840 per fiber
   (all 1287 subsets, 0 rank-skips); natural 82,575,360 per fiber; random-L4
   14,112,000 (m₊) / 13,950,720 (m₋). Reconciliation: the record note's combined
   counts were rows 2–3 one-fiber figures and row 1 short by 7 subsets/fiber; the
   re-run covers the full space (see ledger §12 item 5).
3. **41H3 custody archive — DONE 2026-11-21 (option (a)):** generator/checker +
   outputs persisted at `pilots/41/presolve/` (numpy-only, deterministic, no Modal);
   S1 census, |det| = 8⁴, plants (~1e-13) and far-table residuals (~7.1) all
   reproduce the record note; **0 survivors in ~2.97×10⁸ systems** (negative
   strengthened: the re-run covers the 7 previously-unscanned canonical subsets per
   fiber and both fibers of the natural class). The CERTIFIED-NUMERIC billing
   stands, now with archived artifacts. The H3.lean print-coverage rider (16
   unprinted helpers at the next H3.lean edit) remains the only open custody item.
