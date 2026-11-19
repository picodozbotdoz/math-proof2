# Round-6 — dossier-41 novelty battery: q-deformed eight-square / Temperley–Lieb (R9, wave 4)

Lane R9 (novelty/prior-art), 2026-11-19. Unit: the novelty table (≥ 2 nearest-miss rows)
for the pilot-41 object — the σ_q sign family with the (1−q)·G_q parallelogram defect
((M)+(B)+(N)) and the (H) octonion/eth ↔ Temperley–Lieb host bridge — corpus greps
(mathlib + tauceti + axiommath + openai-math + eth, direct-source per the AGENTS caveat)
plus the TL/Jones-formalization external leg. Builds on round-3 §2 (`novelty/round-3.md`,
lane R8 2026-11-09) and the locked headline wording (precharter §0: "first
sign-rule/parallelogram-defect deformation"; NEVER "first q-deformation of a composition
algebra"). Companion file: `round6-41-errata-check.md` (the (M) display's mathematical
state, incl. the two-regime correction — the battery below grades the CORRECTED object).

**Verdict line: (M)+(B)+(N) NEW-narrow — RE-CONFIRMED at 2026-11-19 evidence state, no new
collision in any corpus or external sweep; (H) NEW as a BRIDGE but its novelty wording must
NOT claim any TL/Jones formalization first — R9's new finding is that tauceti's KnotTheory
layer is Jones-polynomial-COMPLETE (Markov trace, Markov invariance, HOMFLY specialization,
diagram-route comparison — §1), far beyond the dossier's cited 3-decl host surface; the (H)
claim is the eight-square ↔ that machinery CONNECTION, which nothing states. Object-level
q-composition collision (Benkart–Pérez-Izquierdo 1998) stands as round-3 graded.**

---

## 1. Corpus side (direct-source `rg`, 2026-11-19; read-only siblings)

**NEW FINDING (the battery's material change): tauceti KnotTheory is a full knot-invariant
stack, and the dossier's (H)-host citation surface under-lists it** (same class as the
dossier's own Corrections header re: octonions). At source:

- `TauCeti/KnotTheory/TemperleyLieb.lean` — the Jones representation of the braid group:
  `jones : BraidGroup n →* (TemperleyLieb R (jonesDelta a) n)ˣ`, `jonesDelta a = −(A²+A⁻²)`
  (loop value), `jonesUnit` (Kauffman-bracket expansion of one crossing), and the
  writhe-normalized Markov trace `MarkovBraid.jonesTrace` with Markov invariance
  (`MarkovEquiv.jonesTrace_eq`, cited in-file at `BraidWord/Jones.lean:33`).
- `TauCeti/KnotTheory/BraidWord/Jones.lean` — the diagram route: `jonesTrace_toBraid`
  (:121) and `jonesTrace_toBraid_eq_eval₂_jonesPolynomial` (the braid-route trace EQUALS
  the closed-braid Jones polynomial via the closure bracket), with the Jones skein
  relation `A⁴V(σᵢc) − A⁻⁴V(σᵢ⁻¹c) = (A⁻²−A²)V(c)`.
- `TauCeti/KnotTheory/Homfly/Jones.lean` — the Jones polynomial as the HOMFLY
  specialization (a = A⁴, z = A⁻²−A²), proved for every braid closure and compared with
  both routes.
- `TauCeti/KnotTheory/Hecke.lean:49` — `MarkovBraid.eq_heckeTrace_of_skein` (skein
  characterization of the normalized Hecke/Ocneanu trace; the dossier's cited donor).
- Beyond: `Khovanov/` (24 files: Frobenius, complex, homology, Euler characteristic),
  `Jimbo/` (quantum-group route, incl. `Jimbo/TemperleyLieb.lean`, trace, stabilization),
  `Markov/Skein.lean`, `Burau/`, `Alexander.lean`, `SeifertSurface/`, `TristramLevine/`.

**Effect on (H):** the host side is corpus-native and COMPLETE — cost down (the (H)
milestone's w_p search builds on `jonesTrace`, Markov invariance, and the q ↔ −A²/UqSl2
normalization layer already present), and the novelty claim sharpens to the bridge itself:
an F₂³ sign cocycle / eight-square quadruple identity matched against TL-diagram
evaluations exists NOWHERE (negative below). The dossier's host citation list
(`TemperleyLieb.lean:87,146,157`, `Hecke.lean:49`, `UqSl2/QuantumTrace.lean:41`) should be
extended at pilot time (report-only; R1's file).

**Negatives (each direct-source this session):**
- **No eight-square/Graves/sign-cocycle content anywhere**: `rg -inw "eight-square|Graves"`
  over openai-math `OAI/` → 0; over tauceti → 0; `rg "sigmaQ|sigma_q|sign.?cocycle"` over
  tauceti/mathlib → only `sigmaQuotient*` (Setoid noise). mathlib: no σ_q, no cocycle-style
  deformation content.
- **mathlib (encore, ff2494ea): NO TL/Jones/knot theory at all** — `rg -il
  "temperley|jones.?poly|kauffman|braid" Mathlib/` returns only false positives (braided
  monoidal categories, Coxeter); no KnotTheory file exists.
- **axiommath (all 6 repos): 0 TL/Jones/Kauffman content** (precise grep `TemperleyLieb|
  JonesPolynomial|Kauffman` → 0 files; the broad "quantum" hits are AreaLaw2D
  quantum-info noise).
- **openai-math: TL exists, no bridge content** — `HarmonicArtin.TemperleyLieb`
  (`OAI/Topology/ArtinGroups/Diagrams/{Circle,Relation}.lean`) + the dilute-TL layer
  (`OAI/Combinatorics/HoneycombChords/`, e.g. `PhysicalWeights.lean`) — the dossier's
  "third corpus TL host" note re-verified; no sign family, no deformation of any sign rule.
- **tauceti's bilinear sign-cocycle row (new, in-corpus):**
  `TauCeti/GroupTheory/GroupExtension/Of/FactorSet.lean:571–576` `ofBimultiplicative` —
  "Bilinear sign cocycles on lattices, such as the ordered sign cocycle
  `Matrix.signFactorSet` of an integer matrix, are of this form". This is exactly the
  dossier's known-miss (e) (fermionic ordering signs, the BILINEAR case
  (−1)^{Σ_{i<j} a_i b_j}) — now with an exact in-corpus citation: the quadratic/bilinear
  cocycle theory exists in tauceti; eth's CUBIC correction and the q-family do not.

## 2. Nearest-miss table (≥ 2 rows delivered: 7)

| # | source | what it has | delta vs σ_q/(M)/(H) |
|---|---|---|---|
| 1 | **Benkart–Pérez-Izquierdo, arXiv:math/9801141** (1998; round-3 §2) | quantum analogue of the SPLIT octonions via U_q(D₄) with a q-version of the composition property | the object-level q-composition collision — headline wording locked accordingly; no four-term Graves alternation, no (1−q) defect form, no sign family on F₂³ |
| 2 | **eth `Eight.signs`** (`SecCrossing_Identity.lean:261`, statement at `EightSquareStatement.lean:53`) | the q = 1 fiber itself: Graves alternation, proved mod-2 only | no deformation, no defect polynomial, no host; (B) makes it our q = 1 fiber — the seed, not a competitor |
| 3 | **tauceti Jones/TL/Hecke stack** (§1 above: `jonesTrace`, `MarkovEquiv.jonesTrace_eq`, `BraidWord/Jones.lean`, `Homfly/Jones.lean`, `Hecke.lean:49`, `Khovanov/`, `Jimbo/`) | a COMPLETE formal Jones polynomial (Markov trace + invariance + specialization + diagram comparison) and the TL/Hecke host | the (H) HOST, in-corpus: no eight-square/sign-cocycle content anywhere in it; (H)'s claim is the connection, and the bridge lemmas (w_p family, σ_q = closure traces at q = −A²) exist nowhere |
| 4 | **tauceti `FactorSet.ofBimultiplicative`** (`FactorSet.lean:571–576`, `Matrix.signFactorSet`) | formal BILINEAR sign cocycles on lattices (group-extension factor sets) | the bilinear case only — eth's cubic correction τ, the q-weighting (−q)^τ, and the parallelogram defect have no counterpart; nearest in-corpus formal kin of the sign-cocycle concept |
| 5 | **Prathamesh, AFP entry "Knot_Theory"** (isa-afp.org/entries/Knot_Theory.html, 2016; abstract read this session) | Isabelle: tangle-based links/framed links + construction and invariance of the bracket polynomial (Kauffman bracket); "perhaps the first attempt to formalize any aspect of knot theory in an interactive proof assistant" | the external TL-adjacent formalization: no TL algebra as such, no Jones polynomial proper, no skein-host bridge, no sign content — and outside our corpora |
| 6 | **openai-math `HarmonicArtin.TemperleyLieb` + HoneycombChords dilute-TL** (`ArtinGroups/Diagrams/{Circle,Relation}.lean`; `PhysicalWeights.lean`) | two further TL developments (diagram circles/relations; dilute-TL loop model) | Artin-group and loop-model shaped; no Graves/eight-square content, no sign-rule deformation |
| 7 | **Kauffman bracket skein calculus** (classical; Kauffman 1988 "New invariants in the theory of knots" and the bracket state-model papers) | the ambient algebra of (H) — bracket, loop value δ = −(A²+A⁻²), skein relations | classical calculus, no F₂³ sign family, no composition-algebra connection (round-3 §2's verdict carried) |

Context rows (checked, not table-grade): classical q-deformed octonion searches remain
empty per round-3 (zbMATH `q-deformed octonion`/`q-octonion` → 0; `quantum octonion` → the
B-PI paper only); no Lean/mathlib TL or Jones content exists outside tauceti (mathlib
negative above); no Coq/Agda TL formalization surfaced in this session's sweeps (negative
claim limited to the queries run: "Jones polynomial formalization {Lean, Coq, AFP,
Isabelle}" web sweeps 2026-11-19).

## 3. Verdicts (component-wise; vocabulary per the round-5-battery precedent)

| component | verdict | one-line reason |
|---|---|---|
| (M) corrected defect identity (two-regime form, `round6-41-errata-check.md` §3) | **NEW-narrow (stands)** | an explicit ℤ[q±] sign-family parallelogram defect with factor (1−q): no hit in any corpus (§1 negatives) or external sweep; lemma-grade as mathematics, but the corpus gap is total |
| (B) q = 1 fiber = eth's σ | **COVERED-by-construction** | definition-level (phi_parts); its value is the anchor, not novelty |
| (N) nondegeneracy | **NEW-narrow (stands)** | the iff-q=1 statement for the family is unstated anywhere; decide-grade |
| (H) TL/Jones host bridge | **NEW as a BRIDGE; host NOT claimable** | §1: tauceti already HAS the complete Jones polynomial — (H)'s wording must be "the eight-square sign rule matched to TL/Jones trace evaluations (q = −A²)", never "first TL/Jones formalization"; no source states any composition-algebra ↔ TL trace connection |
| object level (a q-deformed composition algebra) | **CONTESTED (carried)** | Benkart–Pérez-Izquierdo 1998 owns q-composition (round-3; unchanged) |

Risk register delta vs round-3: novelty risk unchanged (COLD tier); EFFORT risk down on the
(H) milestone (host machinery present at-source); one NEW wording risk added (the §1
under-listing — an article claiming host-layer formality would be wrong).

— lane R9 (worktree agent-09), 2026-11-19. No commits (hold for K/H per protocol).

---

## ADDENDUM 2026-11-19 (post-relay) — R4's 41-core pre-analysis folded; battery graded
against the CORRECTED identity

Mid-task relay (coordinator, this date): R4's pre-analysis independently found the P0
`P1`/`P2`/`MainIdentity`-as-Para-universals FALSE (counter-quad p=000, q₁=100, p′=100,
q₂=000; identity reads **0 = 2** at q = −1), with the corrected content = a **unified
defect identity A+B = (1−q)·aeval(GqGen) valid at EVERY parallelogram quad**, and the
odd-gap stratum = {p′ = ¬p bitwise}; kernel decide-certification pending in core-1
(treat UNVERIFIED until then). R9 verification this session (exact enumeration, same
method as `round6-41-errata-check.md` §3):

1. **Convergence confirmed — the two falsity findings are the same phenomenon.** R4's
   counter-quad is one of the 336 gap-0 quadruples of my census; independently recomputed
   here: Q1=0, Q2=1, τ₁=τ₂=0, F(−1) = 0, uniform G(−1) = 0, precharter-kDef G(−1) = 1 ⇒
   RHS = 2 — the "0 = 2" reading reproduces exactly. R4's unified identity agrees with my
   §3 uniform min-side formula (0 failures over 448 × 12 evaluation points, degree ≤ 6 —
   interpolation-grade as a polynomial-identity certificate; still NOT a kernel verdict).
2. **The stratification claim independently VERIFIED in enumeration**: odd gap ⟺
   d := q₁⊕q₂ = 111 ⟺ p′ = ¬p bitwise — all 64 d=111 quads odd-gap, 0 violations in
   either direction (equivalently: the 64-quadruple (P1)(P2) regime of my census IS the
   bitwise-complement stratum).
3. **Verdict table update (component (M))**: the novelty row now grades the CORRECTED
   statement — *the unified defect identity at every parallelogram quad + the
   d=111/bitwise-complement odd-gap stratification* — not the refuted Para-universals;
   kernel-decide status pending (grading unaffected: the corrected statement is, if
   anything, a cleaner novelty object — a stratum theorem, not a two-case patch).
4. **New nearest-miss row class added and checked EMPTY**: "defect/skein identities at
   parallelogram quads" — no row of the §2 table (Benkart–Pérez-Izquierdo, eth, the
   tauceti Jones/TL/Hecke stack, `FactorSet.ofBimultiplicative`, AFP Prathamesh, OAI TL,
   Kauffman skein calculus) nor anything in this session's external sweeps states ANY
   identity of the shape "alternating four-term sum over a parallelogram constraint =
   (1−q)·explicit polynomial". The class-level negative is now on record.
5. **Headline discipline re-verified**: "first sign-rule/parallelogram-defect deformation"
   still holds against Benkart–Pérez-Izquierdo 1998 (q-composition object, no
   parallelogram-defect identity) and the dossier's five known misses — unchanged by the
   corrected framing; if anything the stratification sharpens it ("the classical rule of
   signs is exactly the d=111-complement stratum's q=1 fiber" is now a precise sentence).
6. **Cross-file flag (instruction 3 of the relay)**: my erratum-2 verdict (REFINED — a
   correct reformulation mis-billed as a display mis-print; see
   `round6-41-errata-check.md` §2) **differs from A6's stamp**; mathematically this does
   NOT touch GqGen consumption — on the odd-gap/d=111 stratum Q1 ≡ Q2, so A6's corrected
   display, my uniform formula, and GqGen coincide there, and the erratum-1 summand fix
   (CONFIRMED, agreeing with A6) is the one load-bearing correction. Flagged for the
   record-accuracy channel only.

— addendum R9, 2026-11-19 (same hold: no commits).
