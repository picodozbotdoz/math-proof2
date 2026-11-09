# Candidate dossier 30 — hall-parseval-boson-identification

Lane R7 ("tensor-bridge"), 2026-11-09. Realizes empty-zone candidate (c) of
`research/bridges/tensor-algebra.md` §4. Tags: [VERIFIED] = read in source this lane;
[HYPOTHESIS] = proposed new content. Boundary note: R1's dossier 41 (q-deformed eight-square
identity) owns the σ_q/Graves-alternation direction; this dossier owns the Hall/Parseval
operator layer. No overlap.

---

## Name

hall-parseval-boson-identification

## One-line pitch

eth's Appendix-B "Boson" pairing `pairing h a b = coeff 0 (a[−h]·b)` on `V = ℚ[t₁,t₂,…]` —
defined via binomial-twisted creation/annihilation mode operators and driving the ρ = 1/√2
pieces of the ETH-refutation — is exactly `h!` times the Hall inner product of tauceti's
Frobenius-characteristic theory, transported along the power-sum identification `t_k ↔ p_k`
with one ω-twist; and the Q_s resolution-of-identity (`LemmaQ`) is a system of self-adjoint,
mutually annihilating idempotents (a Parseval/spectral-decomposition theorem) — neither
statement exists in any corpus, and each needs both corpora to even state.

## Precise mathematical statement

All objects below are [VERIFIED] in source unless flagged. Fix `h ≥ 1`.

**The eth side** (`anthropics_formal-math/eth/proof/statements/AppHalfPiecesStatement.lean`):
`V := MvPolynomial ℕ+ ℚ` (`:73`); monomial `tpow μ` (`:76`); weight spaces `VE E` via
`weightedHomogeneousSubmodule` (`:82`); operators `nabla`: `∇_{−k} f = t_k·f`, `∇_k f = k·∂f/∂t_k`
(`:89–90`); mode operators `op a r = a[r]` of display (47) (`:105`) — on a monomial `t^μ` the sum
over `ks ∈ Choices μ r` of `∏_i binom(−k_i−1, μ_i−1)` times the `∇`-products, with `binom` the
generalized `Ring.choose` (`:39`); the pairing `pairing h a b := coeff 0 (op a (−h) b)`
(`:131`); top-weight projection `part h' a` (`:140`); angle operators `angle h i`
(`:146`); `Q_s(a,b)` of display (48) (`:149–154`); dual families `y_n = Σ_{j=1}^n C(n,j)·t_j`
(`:166`), `aFam μ = ∏_i (−1)^{μ_i−1}·y_{μ_i}` (`:169`), `bFam μ = (h!/z_μ)·t^μ` (`:172`) with
`z_μ = ∏_k k^{m_k(μ)}·m_k(μ)!` (`:54`). Proved in eth: `AppHalfPieces.lemmaQ` (a: `Q_s = Q'_s`;
b: support; c: `Σ_{|s|≤E+h} Q_s = pairing·Id` on `V_E`) and `AppHalfPieces.lemmaDual`
(`a^μ[−h]·b^ν = h!·[μ=ν]`) — aliases `PaperIndex.operators` / `PaperIndex.dual`
(`eth/proof/PaperIndex.lean:2389,2394`).

**The tauceti/mathlib side**: `MvPolynomial.psum σ ℚ k = Σ_{i∈σ} X i ^ k` and
`psumPart σ ℚ μ = ∏_i psum σ ℚ (μ_i)` (mathlib `Mathlib/RingTheory/MvPolynomial/Symmetric/
Defs.lean:351,355`); `TauCeti.hallInner` (`TauCeti/RingTheory/MvPolynomial/Symmetric/Schur/
HallInner.lean:77`, Schur-orthonormal by definition, "the classical one when `#σ ≥ n`" per
file header); `TauCeti.hallInner_psumPart` (`TauCeti/RepresentationTheory/Symmetric/
FrobeniusCharacteristic.lean:272–274`): for `#σ ≥ n`, `⟨p_ρ, p_ρ'⟩ = z_ρ·δ_{ρρ'}`;
`TauCeti.zPart` (`ClassSize.lean:77`) = eth's `zz` (`:54`) up to the partition-type transport.

**Maps (all defined by the theorem).**
- `Φ_σ : V → MvPolynomial σ ℚ`: the unique ℚ-algebra hom with `Φ_σ (X k) = psum σ ℚ k`
  [well-defined: `V` is free on the `X k`; `Φ_σ (tpow μ) = psumPart σ ℚ μ`].
- `top_h : V → V_h`, `top_h := part h` (eth `:140`).
- `ω_σ : Symm_*(σ) → Symm_*(σ)`: the symmetric-function involution with
  `ω_σ (psumPart σ ℚ μ) = (−1)^{h−ℓ(μ)}·psumPart σ ℚ μ` for μ ⊢ h
  [**to be constructed**; equivalently `ω(s_λ) = s_{λ'}` on tauceti's Schur basis — neither
  mathlib nor tauceti has ω: python scan `omegaInvolution|symmetricInvolution` → 0 hits in
  both, [VERIFIED]].

**Theorem A (pairing identification; separately statable).** For every finite alphabet `σ`
with `#σ ≥ h`, every `a ∈ V` and every `b ∈ V_h`:

```
pairing h a b = h! · hallInner σ ℚ h ⟨ω_σ (Φ_σ (top_h a)), _⟩ ⟨Φ_σ b, _⟩ .
```

(Both inner arguments carry the subtype mem proofs `psumPart_mem_symmetricHomogeneousSubmodule` /
eth `WtLe`-membership; suppressed in display.) Note the asymmetry: ω-twist on the `a`-side only
— the hallmark of a bilinear (not symmetric) form; `pairing` itself is not manifestly symmetric
(its symmetry would be a corollary, cf. Theorem B).

**Theorem A′ (top-component identity; separately statable, the computational heart).** For
every μ ⊢ h: `ω_σ (Φ_σ (top_h (aFam μ))) = psumPart σ ℚ μ`, i.e. the top-weight component of
`a^μ` is `(−1)^{h−ℓ(μ)}·t^μ` (because the weight-h component of `y_n` is `C(n,n)·t_n = t_n`)
and the ω-twist cancels the sign exactly. [VERIFIED by hand for h = 2, both partitions μ =
(2), (1,1), including the full display-(47) computation of `pairing 2 (a^μ) (b^ν)` through the
generalized binomials `binom(−3,1) = −3`; the sign cancellation `−2·2 − (−6) = +2 = 2!` is the
mechanism. Reproducible as a Lean `decide`/`norm_num` check.]

**Theorem B (Parseval/idempotence; separately statable). [HYPOTHESIS]** Equip `V_E` (E ≥ 0)
with the form `{f, g}_E := (1/(E+h)!)·pairing (E+h) (·) (·)`-transported from Theorem A, and let
`†` be the adjoint on `End V_E` for `{·,·}_E`. Then:
- **B1 (self-adjointness):** for every `s` with `|s| ≤ E+h`: `Q_s(a,b)† = Q_s(a,b)`
  [plausibly from `LemmaQ.a` (`Q_s = Q'_s`) plus Theorem A; the "factors exchanged in all
  products" of `:152–154` is an adjoint-type statement].
- **B2 (mutual annihilation / idempotence):** `Q_s ∘ Q_t = 0` for `s ≠ t` and
  `Q_s ∘ Q_s = pairing h a b • Q_s`; equivalently `(pairing h a b)⁻¹·Q_s` are mutually
  orthogonal idempotents, and the Parseval identity
  `Σ_{|s|≤E+h} {Q_s f, Q_s g}_E = (pairing h a b) · {f, g}_E` holds.
  [Delineation: `Σ_{s,t} Q_s Q_t = (pairing)²·Id` is a trivial consequence of `LemmaQ.c`
  applied twice — the content of B2 is the *diagonal* part. Falsifiable cheaply: at `h = 1`,
  `E ∈ {0,1}` compute `Q_s` explicitly and test idempotence — first milestone.]

## Novelty check

Corpus-side (python scans — rg output in this workspace mangles some unicode names, so counts
below are from `python3` file walks with `re.search`; patterns listed):

- mathlib (`encore-mathlib/repo/mathlib4`, `ff2494ea`): `\bhallInner\b` → **0 files**;
  `\bHeisenberg\b` → **0**; `\bboson\b` → **0**; `schurPoly\b` → **0**;
  `\bomegaInvolution\b|\bsymmetricInvolution\b` → **0**. (But `psum`/`psumPart`/`hsymm`/`hsymmPart`
  DO exist, `Defs.lean:312–355` — the generators are there, the pairing/ω layer is not.)
- tauceti: `omegaInvolution|symmetricInvolution|\bomega_\b` → 1 false positive
  (`Geometry/Symplectic/Manifold/Energy.lean`, symplectic form). `hallInner` exists (donor).
  `Heisenberg` in `RingTheory/` → only `RingTheory/DividedPowers/Heisenberg.lean` (divided-power
  Lie theory, no MvPolynomial mode operators). No `pairing`-vs-`hallInner` bridge statement.
- openai-math (`lean/OAI`): `\bhallInner\b` → **0**; `psumPart` → **0**;
  Heisenberg×(MvPolynomial|symmetric function|power sum) co-occurrence → **8 files, all
  `OAI/MathematicalPhysics/Heisenberg/*`** (physics: PinDensity, StablePolynomials, …) — no
  symmetric-function/Fock bridge. [erratum 2026-11-09, H/QA: v1 said "0 files" from "256
  files, all Hodge"; actual 498 Heisenberg files — mostly the Hodge groups/lattices, e.g.
  `OAI/AlgebraicGeometry/HodgeConjecture/CMExtraction/Finite/HeisenbergLattice.lean`, plus
  the 8-file MathematicalPhysics family — claim's intent holds, counts corrected.]
  `LemmaDual|lemmaDual` → 1 false positive (`GaussLemma.lean:46`, `gaussLemmaDualNormed…`);
  "boson" hits are `OAI/MathematicalPhysics/BFSS/*` (physics), never symmetric functions.
- anthropics: `AppHalfPieces.lemmaQ/lemmaDual` are the nearest objects (donors); python check
  of `eth/proof/rates/ClauseBound/Boson/*.lean` for `commutator|commute` → 0 hits — no
  commutation, adjoint, or idempotence statement exists anywhere in eth.
- Cross-check `research/qa/decl-index.tsv` caveat honored (direct scans used).

Literature: `[R8 confirmation pending — round-2]`. Exact queries to run:
  "Heisenberg algebra Hall pairing symmetric functions MvPolynomial";
  "boson Fock space ring of symmetric functions duality creation annihilation";
  "Kac Raina Bombay affine Lie algebras vertex operators symmetric functions basic representation";
  "Jing bosonic vertex operators Hall-Littlewood symmetric functions";
  "Shapovalov form Heisenberg bosonic Fock z-mu duality";
  "Macdonald symmetric functions Hall polynomials Chapter I section 5 exercise Heisenberg".
Known nearest misses (classical): the identification of Λ with the bosonic Fock space, the
Heisenberg action `p_n ↦ multiplication, n·∂/∂p_n ↦ annihilation`, and
`⟨p_μ, p_ν⟩ = z_μ δ` are textbook (Macdonald [macdonald1995] I §5 Ex., cited by tauceti's
`PowerSum/Basic.lean` references; Kac–Raina). What is NOT classical: (i) eth's mode operators
`a[r]` with the generalized-binomial twists `binom(−k−1, μ−1)` are specific to the 2026
Anthropic paper (`eth/paper.pdf` Appendix B/H) — their identification with the Hall pairing
(Theorem A) appears nowhere (the paper's appendix is self-contained, cites no
symmetric-function literature, per `proof/README.md:174` "Boson" entry); (ii) the idempotence/
Parseval structure of `Q_s` (Theorem B) is stated in no corpus and no literature trace is
known — R8 to confirm.

## Bridge analysis

- Corpora bridged: anthropics/eth (the operators, `LemmaQ`, `LemmaDual`, the complexity
  consumer `ThmHalfPiecesPure :239–242`) + tauceti (`hallInner`, `hallInner_psumPart`,
  `frobeniusCharacteristic` cycle-type machinery, Specht/character tables) + mathlib
  (`MvPolynomial.psumPart :355` — the shared transport target, 2026 addition).
- Why essential: eth has the operators and their duality but no Hall inner product, no power-sum
  orthogonality, no ω (it never leaves ℚ[t₁,t₂,…]); tauceti/mathlib have the pairing theory but
  no `a[r]`/`Q_s` (python scans above). Theorem A needs `hallInner_psumPart` to even be checked;
  Theorem B needs `LemmaQ` plus the identified form. Neither side can formulate the other's half.
- Empty-zone fit: `research/bridges/tensor-algebra.md` §4(c) (Fock-space operators beyond
  lemmaQ/lemmaDual); strengthens §2b of the same map.

## Proof-strategy sketch

1. **Transport layer.** Define `Φ_σ` (algebra hom, `MvPolynomial.hom`); prove
   `Φ_σ (tpow μ) = MvPolynomial.psumPart σ ℚ μ` by `Multiset.map_prod` — routine.
2. **Triangularity.** Prove `top_h (aFam μ) = (−1)^{h−ℓ(μ)}·tpow μ`: the weight-h component of
   `y_n = Σ_j C(n,j) t_j` is `t_n`, and weight components are multiplicative
   (`weightedHomogeneousSubmodule` graded-algebra API; eth's own `PieceFacts.wtLe`
   (`AppHalfPiecesStatement.lean:216`) is the sub-h statement). New but easy (S).
3. **ω construction.** Build `ω_σ` on `TauCeti.symmetricHomogeneousSubmodule`-degrees as the
   Schur-basis map `s_λ ↦ s_{λ'}` (tauceti `schurPolyBasis`) or via
   `psumPart ↦ (−1)^{h−ℓ} psumPart`; prove the sign rule using Newton-identity material
   (`tauceti NewtonIdentities.lean:88` `sum_range_hsymm_mul_neg_one_pow_mul_esymm`; mathlib has
   its own `Mathlib/RingTheory/MvPolynomial/Symmetric/NewtonIdentities.lean`). **Hardest new
   glue** (M-lite): involution property `ω∘ω = id` and compatibility with `hallInner`
   (`hallInner(ωf, ωg) = hallInner(f,g)` — classical, from Schur orthonormality + conjugate
   partitions).
4. **Reduce to dual families.** Both sides of Theorem A are ℤ-bilinear in `a` and kill
   weight-< h components of `a` (LHS: `AppHalfPieces.O1.zero` (`:126`) — `op a (−h)` maps
   `V_h → V_0` and sub-h weights to negative weight = 0; RHS: `top_h` by construction). The
   top-components `{(−1)^{h−ℓ(μ)} t^μ}` are a ℚ-basis of `V_h` (triangular w.r.t. monomials),
   so it suffices to check `a = aFam μ`, `b = bFam ν`.
5. **Base check.** For `a = a^μ`, `b = b^ν`: LHS = `h!·[μ=ν]` by `AppHalfPieces.lemmaDual`
   (`PaperIndex.lean:2394`, donor). RHS = `h!·hallInner(psumPart μ, (h!/z_ν)·psumPart ν)`
   (steps 2–3) = `h!·(h!/z_ν)·z_μ·[μ=ν]` by `TauCeti.hallInner_psumPart` (donor) = `h!·[μ=ν]`.
   Theorem A ∘ A′ done. This is where the naive sign transport FAILS and the ω-twist saves it
   ([VERIFIED by hand at h = 2]: without ω the RHS at μ = ν = (2) is `−2!` ≠ `+2!`).
6. **Theorem B.** First run the falsification milestone (h = 1, E ∈ {0,1}, compute `Q_s` via
   displays (54)/(55) `PieceFacts.row/col` (`:221–227`)); if idempotence survives, prove B1 from
   `LemmaQ.a` + Theorem A's form and B2 from B1 + a support/annihilation computation using
   `LemmaQ.b` (the `|s| > E+h` vanishing). [Genuinely open; flagged.]
7. **Consumer (optional).** Re-derive eth's `PieceFacts.int_a/int_b` (integrality, `:229–230`)
   and the `Rrow/Rcol` budget formulas (`:207–210`) through the Hall side, confirming the
   ρ = 1/√2 pieces survive the transport.

## Feasibility

(Per R9 §3 template, `research/feasibility/mathlib-verification.md`; empirical context from
`research/feasibility/port-probe.md`.)

- F0. Target: Theorem A (+A′) as a standalone Lean theorem over mathlib `MvPolynomial` +
  tauceti `hallInner`; Theorem B behind it.
- F1. Entry points (verified in the pinned checkout `ff2494ea` / tauceti `d92acc5c0`):
  `MvPolynomial.psum/psumPart/hsymm/hsymmPart` (`Mathlib/RingTheory/MvPolynomial/Symmetric/
  Defs.lean:351,355,312,316`), `Mathlib.Algebra.MvPolynomial.PDeriv` (eth's `nabla` substrate),
  `Mathlib.RingTheory.MvPolynomial.Weightedhomogeneous` (eth imports it already,
  `AppHalfPiecesStatement.lean:9`); tauceti `TauCeti.hallInner` (`HallInner.lean:77`),
  `TauCeti.hallInner_psumPart` (`FrobeniusCharacteristic.lean:272`), `TauCeti.zPart`
  (`ClassSize.lean:77`), `schurPolyBasis`, `psumPart_mem_symmetricHomogeneousSubmodule`.
- F2. Donor lemmas: eth statement layer `AppHalfPiecesStatement.lean` (definitions only,
  imports only mathlib — port of definitions is S by the port-probe B-pattern; proofs of
  `lemmaQ`/`lemmaDual` live in `proof/rates/ClauseBound/Boson/` + `PaperIndex.lean:2389,2394`
  — porting PROOFS is tactic-churn M per port-probe §4 caveat; better: re-state as hypotheses/
  axioms-free imports of the eth statement file and re-prove only what Theorem A needs beyond
  `lemmaDual`); tauceti donors are importable if the pilot lake project depends on tauceti
  (v4.36.0-rc2, same toolchain as the mathlib checkout — the natural host; OAI's lakefile
  already demonstrates a tauceti dependency edge, `openai-math/lean/lakefile.lean`).
- F3. Missing glue: (a) `Φ_σ` hom + `tpow ↦ psumPart` — S; (b) ω construction + sign rule +
  involution + isometry — the one genuinely new module, ~M-lite (builds on Schur basis);
  (c) eth's `binom`/`Ring.choose` sign bookkeeping (steps 2, 5) — S, eth's `BinomRules`
  (`:43–45`) and Boson `Scalars.lean` already do the arithmetic; (d) Theorem B — open
  mathematics, unestimated (falsification milestone first).
- F4. Effort: **M** for Theorem A+A′ (~1.5–3k LoC: ω module + transport + base check);
  Theorem B pushes to **L** if the idempotence conjecture survives and is attempted.
- F5. Risks: infinite-vs-finite alphabet (mitigated: fix `#σ ≥ h`; tauceti's header states the
  form is classical there [VERIFIED `HallInner.lean` docstring]); ω does not exist ready-made
  anywhere (build from scratch — churn risk if tauceti lands one concurrently; check
  `mathlib-shims.json` at pilot time); eth proof-side port churn (v4.33.1 → v4.36.0-rc2);
  Theorem B may be false (that is a finding, not a failure — the falsification milestone
  either yields the theorem or a clean counterexample publication inside the corpus bridge).
- F6. Verification plan: kernel-only, no `sorry`/`native_decide`/external CAS; fresh lake
  project on `v4.36.0-rc2` + mathlib `ff2494ea` + tauceti dep, Modal build/check per
  math-proof1 (`lean_build.py`/`lean_check.py`) once scaffolding exists — exactly the
  port-probe §1 environment (image already built and cached).

## Significance

Gives the first formal theorem connecting a complexity-theoretic construction (the ρ = 1/√2
pieces behind `e* = 0` and ETH's fall) with the representation theory of symmetric groups
(Specht/Frobenius characteristic): eth's Appendix B stops being an isolated trick and becomes
a chapter of the Hall-pairing story, with tauceti's entire Frobenius-characteristic stack as
downstream API. Theorem B, if true, exhibits `Q_s` as spectral projectors — a new structural
theorem about the operators that currently have exactly two lemmas to their name — and its
falsification would equally delineate the method. Unlocks: commutation-relation lemmas,
`Rrow/Rcol` as trace formulas, and the boson–fermion comparison with tauceti's CAR/Fock
(`Algebra/Lie/GeneralLinear/Fock.lean`, per survey §1.3) and OAI's Laughlin CCR layer.

## Score (filled at triage — leave empty)

- Novelty (1–5):
- Significance (1–5):
- Effort (S/M/L → 1–5):
- Rank:

Lane proposal: R7 pilot #1 (pairs with R9 follow-up: tauceti `hallInner` dependency probe;
Theorem B falsification milestone is a self-contained first Lean file).

## F4 grade by lane R9

2026-11-09, round 5. Evidence: `ProbeF_MathlibBatch.lean` (runs 9–10: all 16 checks OK)
+ rg verification of the tauceti side this session.

- **Grade: M (Theorem A+A′) — confirmed.** Mathlib side now probe-verified:
  `MvPolynomial.psum/psumPart/hsymm/hsymmPart` (Symmetric/Defs.lean) and `pderiv` all
  elaborate OK with signatures captured (run 10), matching R7's rg lines (:351/:355/:312/:316).
- **Tauceti side (rg, one path correction)**: `hallInner` lives at
  `TauCeti/RingTheory/MvPolynomial/Symmetric/Schur/HallInner.lean` (dossier cited
  "HallInner.lean:77" without path); `hallInner_psumPart` verified at
  `TauCeti/RepresentationTheory/Symmetric/FrobeniusCharacteristic.lean:273` (dossier :272 —
  off by one), with `hallInner_psumPart_schurPolyBasis` :257. Zero port friction
  (tauceti = v4.36.0-rc2, same toolchain, verified in port-probe §8.3). A live #check of
  the tauceti pair would need the tauceti-check image (not run — rg + same-toolchain
  suffices for grading; flag for the pilot's first commit).
- **eth side**: statement layer `AppHalfPiecesStatement.lean` = S-port per B-pattern
  (ProbeB2 family); proofs stay tactic-churn M (per port-probe §4 caveat) — dossier F2's
  hypothesis-import route is the right one and is now validated by ProbeE's binder pattern.
- Verdict: keep M; ω-module remains the driver; Theorem B stays L-if-attempted.
