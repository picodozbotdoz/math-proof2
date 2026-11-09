# Phase 1 survey — anthropics_formal-math

Corpus root: `/home/doz/zcode-workdir/anthropics_formal-math` (git `16a5ce4`, read-only). Three
self-contained Lake projects, all AI-written by Claude (Anthropic), all following the Palomar
submission template: a small **trusted** statement file (`Challenge.lean` etc., `sorry` by design,
imports only Mathlib) + an **untrusted** proof library + `comparator*.json` (the Lean FRO's
Comparator / lean4export / independent `nanoda` kernel / `landrun` sandbox). CI
(`.github/workflows/lean-projects.yml`) runs `lake build` **failing on any `sorry` outside the
trusted Challenge files**, plus the Comparator acceptance bar, on every PR/push.

## 0. Corpus snapshot

| | 3sum-apsp | eth | zeta23 |
|---|---|---|---|
| Result, one sentence | Deterministic word-RAM programs solve 3SUM in O(n^1.9992), (min,+)-product and APSP in O(n^2.99942), Exact Triangle in O(n^2.9983), and Zero-Weight k-Clique in O(n^{k−0.0017⌊k/3⌋}) steps on integers of poly size | One deterministic Turing machine #counts every k-CNF in 2^{C·min{km/√(log m), k²·n·log log n/√(log n)}} steps, which refutes ETH (s₃ = 0) | At least 2/3 of the nontrivial zeros of ζ (and of every primitive Dirichlet L-function) are simple and on the critical line; 5/6 are distinct; with the Montgomery–Taylor optimal window the constants improve to 2−1/c₁* ≈ 0.6725 and (3−1/c₁*)/2 ≈ 0.8363 [staleness note 2026-11-09, H per R8 VERDICTS flag 3: these constants are two formal generations behind — Knausgård (arXiv:2609.33043, repo kristianmk/839) has 0.67354/0.83900 formally with ceiling ladders; see novelty/round-3.md §T] |
| Source paper | Alman–Vassilevska Williams, *Truly Subquadratic 3SUM and Truly Subcubic APSP via Triangles in Sparse Lopsided Graphs*, arXiv:2610.06783v1 | Claude (Anthropic), *A 2^{o(n)} Time Algorithm for 3-SAT*, `eth/paper.pdf` (Hexagon, to appear) | Alpöge–Furman, *More than two thirds of the zeta zeros are simple and on the critical line*, arXiv:2608.13637 |
| Toolchain | Lean v4.33.1 / Mathlib v4.33.1 | Lean v4.33.1 / Mathlib v4.33.1 | Lean v4.33.0-rc2 / Mathlib `51e6992e` (tag v4.33.0-rc2) |
| Scale | 137 statements (`EndStatement.lean` 139 lines, imports nothing; `PaperStatements.lean` 4194 lines); library `ThreeSumApsp/` 426 files, ~97k lines | 2 claims (`MainResults.lean` 183 lines); library `proof/` 1047 files, ~152k lines | 17 + 6 comparator statements (`Challenge.lean`, `Challenge/XiPrime.lean`); library `Zeta23/` 316 files, ~102k lines |
| Organization | statements → `Challenge/` → `Solution/`; proof library split `Sec1..Sec5` (paper math), `Lang`+`Machine`+`Programs` (imperative language → word-RAM compiler), `TimeClaims` (abstract running-time deductions), `RunningTimes` (programs per theorem), `Spec`/`ModelChecks`/`ConditionalTimes`; `docs/INDEX.md` maps every paper item | `MainResults.lean` → `Challenge.lean` → `Solution.lean`; `proof/statements/` (narrow-import restatements), `machines/` (step machines → Mathlib `Turing.FinTM2`), `networks/`–`threesat/`–`sparsification/`–`rates/`–`variables/` (paper §§3–8 + Apps A–D), `consequences/` (§7), `maintheorem/`; `proof/PaperIndex.lean` is a per-paper-item alias index | `ChallengeDeps.lean` (15 Mathlib-only definitions) + `Challenge.lean` → `Solution.lean`; library by proof stage: `LinAlg/` (§3), `WeilEF/`, `RvM/`, `GammaFacts/`, `Analytic/`, `MV/`, `FromPNTPlus/`, `PrimeSideA/B`, `ZeroSide/`, `Assembly/`, `ThmD/`, `ThmE/`, `ThmDE/`, `XiPrime/`, `PairCeiling/`; second topic `Challenge/XiPrime.lean`; `AUDIT.md`, `formalization.yaml` |

## 1. Mathematical territory

### 1.1 3sum-apsp

**Machine model** (defined from scratch in `EndStatement.lean`, core Lean only, no Mathlib): a word
RAM with cells indexed by ℤ holding `BitVec W`; nine instruction kinds (`Instr.one/add/sub/mul/
load/store/bltz/accept/reject`), one step each — no division, shifts, bitwise ops, or constant
other than 1 (`EndStatement.exec`). `Problem.SolvedInTime Q r` : for every exponent κ (paper's ν)
there are a program P, word-size constant b and T with `BigO T r` such that every instance of size
n with entries |a| ≤ n^κ is solved within T(n) steps at every word size W ≥ b·(⌊log₂ n⌋+1)
(`EndStatement.lean:67`).

**The five headline claims** (`EndStatement.lean`, proved as `endStatement_*` in
`ThreeSumApsp/Statements/EndStatement.lean`):

- `Theorem_19` (line 85): Exact Triangle (tripartite, weights wAB+wBC+wAC) solvable in O(n^{3−ε_T}),
  ε_T = 0.0017 (line 82).
- `Theorem_22_3SUM` (line 95): 3SUM (∃ distinct i,j,k with x i + x j + x k = 0, `Fin n → Int`)
  in O(n^1.9992).
- `Theorem_22_MinPlus` (line 106) / `Theorem_22_APSP` (line 125): (min,+)-product of two n×n
  integer matrices, and APSP on directed graphs with no negative cycles (path system
  `Path w i j d`, output = reachability flag + shortest distance) in O(n^2.99942).
- `Corollary_39_ZeroWeight` (line 136): for every k ≥ 3, Zero-Weight k-Clique on complete
  k-partite graphs in O(n^{k−0.0017·⌊k/3⌋}).

**The actual conditional statement (Corollary 40 / Theorem 4)** — this is a *refutation of
conjectures*, not a lower bound: `Items.Theorem_4` (`PaperStatements.lean:4187`) =
`Corollary_40_times ∧ Corollary_40_fail (1/18) ∧ Corollary_40_fail 0.1204`. The three conjectures of
van den Brand–Naslund–Vassilevska Williams [vdBNS19] are read as statements about programs:
`HintedMv.Conjecture52/57/512` (`PaperStatements.lean:2796–2811`), each of the form
"∀ε>0, ¬ Achieves(ω−ε)(1+τ−ε)" where `Achieves` is an abstract "some algorithm runs Phase 2 in
O(n^{a₂}) and Phase 3 in O(n^{a₃})" predicate. `Corollary_40_fail τ₀` (line 4120) says: for **every**
real ω ≥ 2 (standing for the undefined rectangular exponent ω(1,1,τ)) and every 0<τ<τ₀, programs
achieve Phase 2 in O(n^{2−0.063τ}) and Phase 3 in O(n^{1+0.437τ}), refuting Conjectures 5.2/5.7;
and analogously (ω₂≥2, ω₃≥1+τ₂) for the uMv Conjecture 5.12. The ω's are arbitrary reals subject
only to the input/output-size lower bounds — that the true exponents satisfy them is **not** proved.

**Objects introduced**: the rank-1 tensor `Full`/`Mult` evaluation scheme for the 3×3 matrix
multiplication tensor via `Term`s (Ukkonen-style trilinear forms over `LeftVar/RightVar/OutVar`,
`MvPolynomial (LeftVar ⊕ RightVar ⊕ OutVar) ℤ`, `PaperStatements.lean:111–161`); the level-m
outer/inner string tiling (`LeftStr/RightStr/OutStr`, `N0 = 3^(L−m)`, `D = 4^m`, `K = C(L,m)`,
`M = K·N0²`); the pruned recursion `Pruned` with leaf orders and counts (`alpha`, `beta`);
the thin-product data-structure problems (`thinProduct`, `IsDataStructure`); the band structure
`Leaves`, `Rc` (a monotone savings function on c ∈ (10,∞) with limit ε* = 0.1204, `Sec4_Rc_*`
statements); the hinted-Mv phase problems. Everything of paper §§2–5 (Lemmas 6–11, eqs (1)–(11),
Theorems 5, 17, 21, 24, 25, 30, 34, Corollaries 15, 16, 26, 31, 32, Lemma 27–29, 36–37, Corollary
38, Tables 1–2, Figures 3/4/6/10) is stated as a named proposition `Items.*` and proved
(`docs/INDEX.md`: "There are 137 statements, in 2 files").

### 1.2 eth

**Statements** (`eth/MainResults.lean`, definitions only, imports only Mathlib):

- `MainTheorem` (line 177): ∃ one machine M (`Turing.FinTM2`-based `TM2ComputableAux Bool Bool`, all
  stack alphabets finite) and one constant C : ℕ, chosen **before** k and φ, such that for every
  k ≥ 1, n ≥ 4, every k-CNF φ on x₀…x_{n−1} with no clause repeated (`IsKCNF`), m ≥ 2 clauses and
  every variable occurring (`AllOccur`), M outputs `numSat φ` in n+1 bits within
  `timeMin C k m n = ⌊2^{C·min(expM, expN)}⌋` steps, where `expM = k·m/√(log₂ m)` and
  `expN = k²·n·log log n/√(log n)` (lines 147–154).
- `ETH` (line 117): `0 < s 3`, where `s k = ⨅ δ : InTime k δ, δ` and `InTime k δ` says one
  deterministic machine decides k-SAT within ⌊c·2^{δn}⌋ steps for every n — Impagliazzo–Paturi's
  ETH in the s₃-form. `ETHIsFalse` (line 122) := `¬ ETH`, i.e. s₃ = 0.
  Both are proved: `Solution.lean:40–44` (`Wrap.countingBoundImpliesFailureOfETH`, `CountedRoute.mainTheoremHolds`).

**ETH-flavored statements proved beyond the two headline ones** (all via `proof/PaperIndex.lean` aliases):
Corollary 5 = s_k = 0 for every k ≥ 3 ⇒ ETH **and SETH false**
(`PaperIndex.ethAndSethFail := FromPrinted.SplitSat.eth_and_seth_false`); the same for randomized
algorithms (`PaperIndex.ethAndSethFailForRandomizedAlgorithms`) and **NSETH false**
(`PaperIndex.nsethFails := FromPrinted.Consequences.nsethFalse`, verifier form); Corollary 6 =
#k-SAT counted in 2^{O(k²n log log n/√log n)}; Corollary 7 = counting in graphs (cliques, vertex
covers); §7: **E^NP has no circuits of linear size** (`PaperIndex.circuits :=
FromPrinted.Consequences.circuits`, oracle-TM form, proved directly following Williams's argument —
Williams's cited theorem itself is not in Lean).

**The mathematical engine** (paper §§3–5, App A–B, formalized in `proof/networks/`, `proof/rates/`):
tensor-network contraction on grid layouts. Definition 3: a (K,λ)-clique; Definition 4:
"achievable (K,e)" = a program evaluates every (K,λ)-clique in 2^{eK²λ}·poly operations. Lemma 1
(`PaperIndex.grouping := Printed.groupingLemma`): grouping a g = 3K⁸-node network into K classes
upgrades (K,e) to within e·(U+gP/K) — the variance computation (`Variance.stVar`: Var Y ≤ 4PU) is
formalized step by step. The **eight-square identity** (display (28), `PaperIndex.eightSquareIdentity
:= Eight.signs`): σ(p,q)σ(p′,q′) + σ(p,q′)σ(p′,q) = 0 whenever p⊕q = p′⊕q′, q ≠ q′ — the sign magic
behind Lemma 2, which splits 2^t[x=v][y=u] into pieces A₀…A_t factoring through ≤ 11t bits
(`Eight.lemPieces`). Theorem B / Appendix B: "pieces with parameters (1/√2, c)" built from the
operators a[r], Q_s(a,b) on V = ℚ[t₁,t₂,…] (the Heisenberg/Fock-space algebra — namespace
`ClauseBound.Boson`, "Boson" per `proof/README.md:174`); Lemma 9 = `AppHalfPieces.lemmaQ`, Lemma 10
(the duality a^μ[−h]·b^ν = h!·[μ=ν]) = `AppHalfPieces.lemmaDual`. Proposition 3
(`PaperIndex.level := Given.levelProposition`): (K,e) achievable ∧ g = 3K⁸ ⇒ (g², e′) achievable
with e′ = (ρ + 2/K)·e + 2/K, ρ = 1/√2 — i.e. e(9K¹⁶) ≤ (1/√2 + 2/K)·e(K) + 2/K, whence
`PaperIndex.levelHence := Given.eStarZero` (e* = 0). Theorem A (recursion on levels with schedule
K_ℓ, e_ℓ of display (40)), Theorem C (3-SAT counted in 2^{O(n/(log n)^{α/10})}), Theorem D
(a)+(b) (from clique algorithms to a k-CNF bound 2^{O(k²·e·n·log(k/e))} via Appendix D:
sparsification with Calabro thresholds, parity checks chosen by conditional expectations —
`ParityChecksStatement.lean`), Corollary 11 = min of the two exponents = the Main Theorem.

### 1.3 zeta23

**Counting functions** (defined from Mathlib alone in `ChallengeDeps.lean`): a nontrivial zero is
`riemannZeta ρ = 0 ∧ 0 < Re ρ < 1`; multiplicity via `analyticOrderAt` (`zeroMult`); windows
T₁ < Im ρ ≤ T₂; `Ncount` (with multiplicity, `∑ᶠ`), `Ndist`, `N0star` (distinct on line),
`N0simple` (simple on line); the Dirichlet variants over `DirichletCharacter.LFunction χ`; and
`cMT = √2·tan(1/√2)/(1 + tan(1/√2)/√2)` = 0.75329… (1/cMT = 1/2 + 2^{-1/2}cot(2^{-1/2}) is the
Montgomery–Taylor constant). "liminf ≥ c" is the ε-form `∀ε>0, ∃T₀, ∀T≥T₀, (c−ε)·N ≤ X`.

**The 17 comparator theorems** (`Challenge.lean:131–229`, delegating to `Zeta23.thmA₀`,
`Zeta23.thmB₀_mult`, `Zeta23.thmC₀_mult` in `Zeta23/Final.lean`, `Zeta23/FinalMult.lean`, and
`Zeta23.ThmD.thmD₀` etc. in `Zeta23/ThmD/`):

- **A** (2/3 on the line, dyadic + cumulative): liminf N₀*(T,2T)/N(T,2T) ≥ 2/3 — `two_thirds_on_critical_line`.
- **B** (simple + on line): liminf N₀ˢ/N ≥ 2/3 — `two_thirds_simple_on_critical_line(_cumulative)`.
- **C** (distinct): liminf N_d/N ≥ 5/6 — `five_sixths_distinct(_cumulative)`.
- **D** (optimal Montgomery–Taylor window): liminf N₀*/N ≥ 2 − 1/c₁* = 0.67250…; the same constant
  for N₀ˢ; and N_d ≥ (3 − 1/c₁*)/2 = 0.83625… — `montgomery_taylor_*` (dyadic + cumulative).
- **E** (Dirichlet): the analogues of A, B, C, D for every primitive χ mod q > 1 —
  `dirichlet_*` (each with explicit binders `1 < q`, `χ.IsPrimitive`).

Left denominator counts **with** multiplicity, right side counts **distinct** points — the strong
direction (`Challenge.lean` reading notes). This is a zero-**density** theorem, not a zero-free
region: no strip Re s > σ is proved empty; what is proved is the proportion bounds above, for ζ,
for every primitive Dirichlet L-function, and (second topic) for ξ′.

**Beyond the paper's statements** (still unconditional, `#print axioms`-audited):
- **ξ′ topic** (`Challenge/XiPrime.lean`, 6 statements, `Zeta23/XiPrime/`): all zeros of
  ξ′(s) = d/ds[½s(s−1)π^{−s/2}Γ(s/2)ζ(s)] lie in the open critical strip
  (`xiPrime_zeros_in_open_critical_strip`); Re ξ′/ξ > 0 for Re s ≥ 1
  (`xiPrime_over_xi_re_pos`); ≥ 85.838% of zeros of ξ′ in (T,2T] are simple and on the line and
  ≥ 92.919% distinct (flat window; 86.864%/93.432% with the quartic window) —
  `xiPrime_simple_zeros_on_critical_line(_cumulative,_quartic,_quartic_cumulative)`. Farmer–Gonek(–Lee)
  method (arXiv:0803.025/J.LMS 2014) upgraded by the rank–trace device.
- **Lemma R tightness** (`Zeta23.ZeroSide.TightMult.lemmaR_tight`, `TightMult.lean:93`; variant
  `lemmaR_tight'` :104): for on-line atoms with integer
  multiplicities m_j ≤ c on orthonormal vectors plus b pair-blocks of eigenvalue c,
  2c·tr(P+Q) − ‖P+Q‖²_F = Σ_j k_c(m_j) + c²·b — the rank–trace certificate cannot be improved from
  these quantities alone (cited in the paper's appendix).
- **Bandwidth-one ceiling** (`Zeta23/PairCeiling/`, no comparator topic; carries the one displayed
  hypothesis `EnclOK`): every bandwidth-one certificate (c₀,r) certifies at most
  0.6818287 + 2.55·10⁻⁶·(|r′(1)| + ∫|r″|) simple zeros (`ceiling_law256`, `ceiling_nearCUE_signed`) —
  an optimality barrier for the whole method; the 256 near-CUE row inequalities are `decide`-checked
  in-kernel (`LawN256_check`), the input enclosures come from external interval arithmetic (sha256-
  stamped certificate, not in-repo).

**Key intermediate machinery** (all proved, nothing assumed): Weil's explicit formula for ζ and for
primitive L(s,χ) (`Zeta23/WeilEF/`, literature form [IK04, Thm 5.12]); Riemann–von Mangoldt with
Backlund's bound (`Zeta23/RvM/Statement.lean:20 riemannVonMangoldt`); Stirling-type Γ′/Γ estimates
(`Zeta23/GammaFacts/`); Chebyshev–Mertens (`Zeta23.Cheb.chebyshevMertens`, ported
`FromPNTPlus/`); Montgomery–Vaughan generalized Hilbert inequality (`Zeta23/MV/Final.lean:30
mv_hilbert`, diagonal constant 13); the **rank–trace inequality**
(`Zeta23/LinAlg/RankTrace.lean:163 rank_trace_ineq`): for P ⪰ 0 of rank ≤ r, Q Hermitian with
positive inertia ≤ b, c > 0: c·tr P − (c²/4)r + 2c·tr Q − c²b ≤ ‖P+Q‖²_F — via von Neumann's trace
inequality and Sylvester inertia (`Zeta23/LinAlg/VonNeumann.lean`, `Sylvester.lean`, namespace
`RHLinalg`); the paper's Theorem-D variational problem (`Zeta23/ThmD/Functional.lean`).

## 2. Depth & terminal points

### (a) `sorry` inventory

`rg -n "sorry"` over all three projects. **Zero `sorry` in any proof file.** All occurrences are the
deliberate trusted-side placeholders:

| Project | File:lines | Count | What each withholds |
|---|---|---|---|
| 3sum-apsp | `Challenge/EndStatement.lean:59,64,69,74,80`; `Challenge/PaperStatements.lean:23–124 (one per line)` | 5 + 132 = 137 | Each is `theorem <name> : <Statement> := by sorry` — by design; the identically-named theorem in `Solution/` (importing `ThreeSumApsp/`) is what Comparator checks against it |
| eth | `eth/Challenge.lean:13,17` | 2 | `MainResults.ethIsFalse`, `MainResults.mainTheorem` — placeholders for `Solution.lean:40–44` |
| zeta23 | `Challenge.lean:133–229`; `Challenge/XiPrime.lean:69–106` | 17 + 6 = 23 | theorems A–E (× dyadic/cumulative/Dirichlet) and the six ξ′ statements |

CI **does forbid** `sorry` outside these: `.github/workflows/lean-projects.yml` header comment "runs
`lake build` and fails on any `sorry` outside the trusted comparator statement files
(`Challenge.lean`, `Challenge/<Topic>.lean`)"; `3sum-apsp/scripts/check.sh` builds with `--wfail`
outside `Challenge/`. `zeta23/AUDIT.md` records a source-level count of `sorry` tokens = the
challenge files only, and `#print axioms` on all 23 statements = `[propext, Classical.choice,
Quot.sound]` (no `sorryAx`, no project axioms; `axiom` declarations: 0). eth README repeats the
same for its two theorems. Library files mentioning "sorry" in comments only:
`zeta23/Zeta23/FromPNTPlus/Mertens.lean:31–32` ("the sorry'd E₁Λ.bounded … is not ported; no sorry
enters"), `StrongPNTPrefix.lean:4` ("sorry-free prefix, truncated before JBlaschke/ZeroInequality").

### (b) Stated-not-proved / conjectural / future work

3sum-apsp (`docs/REMARKS.md`, "What is not proved", quoted/paraphrased with locators):
- "**Real inputs, and Section 5.1.** Theorem 35 and the half of Theorem 2 on real inputs are about
  Las Vegas algorithms on a real RAM. … The machine has integer words and no random bits, so these
  running times are not proved for any machine."
- "**Theorem 33 … is not proved here; it occurs only as a hypothesis.** Lemma 36 restates
  randomized reductions of [CVX22]; as a sentence about running times it occurs only as a
  hypothesis."
- "**Exponents of matrix multiplication** (ω, α, μ and the rectangular exponents) are not defined.
  … That the true exponents satisfy these lower bounds is not proved."
- "**The hypotheses that the paper calls refuted** (3SUM, APSP, Exact Triangle, k-Clique and
  others) are not defined; only running times are stated." — i.e. **no lower-bound hypothesis and
  no hardness conjecture is assumed anywhere**; the "conditional" content of Corollary 40 is
  parameter-universal (all reals ω ≥ 2), not conditional on an unproved number-theoretic fact.
- The three *conditional lemmas* (`ThreeSumApsp/ConditionalTimes/{Theorem34,Theorem35,Corollary38}.lean`)
  prove only implication chains between abstract running-time claims; "None of the three proves a
  running time."
- Theorems 17/21 stated without their running-time sentences (subroutine-calling cannot be
  composed under the extensional `SolvedInTime` definition); reductions of [VW13]/[VW18] written
  as programs but "not compared with the constructions in those papers."

eth (`proof/PaperIndex.lean` docstrings, quoted):
- Theorem 2 entry: "the paper's Theorem 2 counts the satisfying assignments, and this statement
  says only that … a machine decides satisfiability within c·2^{δn} steps, which is weaker … Lean
  does not derive the printed theorem from it. No Lean statement states the printed, counting
  sentence on its own" (it is the k=3 case of Corollary 6's first half).
- Section 7 circuit bound entry: "the paper derives it from «ETH is false» by a cited theorem of
  Williams, which is not in Lean: Lean proves the conclusion directly, following Williams's argument."
- NSETH entry: "that this [verifier form] matches nondeterministic time is not proved in Lean."
- The passage from Turing-machine steps to word-RAM time "is not made in Lean"
  (`MainResults.lean` head comment); simulation/rewriting facts are "standard facts; they are not
  part of the Lean statements or proofs."
- README "condensed idea" is itself weaker: "What it rederives is only that 3-SAT can be decided in
  time O(2^{δn}) for every δ > 0, not the sharper bounds at the top of this page."

zeta23:
- PairCeiling carries the one hypothesis `EnclOK` (the 256 integer form-factor enclosures obtained
  outside Lean; certificate sha256 `cc3de991…`, "available from the authors") — the only external
  computational input anywhere in the corpus, and it is not part of the 17+6 submitted statements.
- XiPrime docstrings: labels `[XF′ Lemma 6.1]` etc. "refer to the authors' technical supplement …
  which is not included in this repository; these labels record provenance only" (`zeta23/README.md:92`).
- No stated-but-unproved conjecture inside the library; the barrier result (ceiling ≈ 0.6818 for
  bandwidth-one certificates) is the formal record of the method's limit — a *proved* optimality
  statement playing the role of future-work guidance.

### (c) Proved-but-not-generalized (fixed constants that could be parameters)

- zeta23 window parameter: the library proves λ-parameterized families `thmA_lam`, `thmB_lam`,
  `thmC_lam` (`Zeta23/Final.lean:79,99,119`, any 0<λ<1) but Theorem D's optimum is evaluated only
  at λ = 1 (c₁* with ϑ = 1/√2) — other window shapes (quartic exists only for ξ′) are unexplored.
- zeta23 rank–trace parameter c: applied at c = 2 (simple) and c = 3 (distinct)
  (`Zeta23/ZeroSide/Mult.lean`, `mult_three`); the inequality itself
  (`rank_trace_ineq`) is fully general in c — intermediate c values and their optimal constants are
  not computed (the paper's own route to 5/6 via Prop 4.5(iii) c=2 is replaced by c=3).
- zeta23 PairCeiling: the specific law is the 256-periodic one (`LawN256.lean`); the stability
  inequality `ceiling_stability` is general for any (c₀,r)-certificate, but only one law instance
  is certified.
- 3sum-apsp: every numeric exponent is frozen as the paper's printed numeral (ε_T = 0.0017,
  1.9992, 2.99942, 0.063, 0.437, 1/18, 0.1204, ε* = 0.1204, 18, D^18); the underlying lemmas
  (e.g. `Sec4_Rc_strictAntiOn`, Table 2 rows as separate statements `table_2_c19`, …) carry the
  trade-off curve but no parametrized "savings as a function of c" theorem is extracted.
- 3sum-apsp Strassen: only Strassen's exponent log₂ 7 is used in Theorem 17's form
  ("ω is not defined, and Strassen's exponent log₂ 7 is used in its place"; `logb_two_seven_lt`).
- eth: the recursion constants are frozen: g = 3K⁸, e′ = (ρ+2/K)e + 2/K with ρ = 1/√2 pieces
  (11/12 in `PiecesFromEightSquares`); the min-form bound C·min{km/√log m, k²n·log log n/√log n}
  with one universal C — no attempt at better constants, other norms, or space bounds.

### (d) Isolated results with no neighbors

- `Zeta23.ZeroSide.TightMult.lemmaR_tight` — an exact equality characterizing the certificate;
  nothing else in the corpus consumes it (it certifies tightness, cited in the paper's appendix).
- zeta23 `Zeta23/LinAlg/` (namespace `RHLinalg`): a self-contained pure-linear-algebra development
  (von Neumann trace inequality, both directions of Sylvester inertia, Weyl bound) written for §3,
  with no other consumer in the corpus — a natural donor to mathlib.
- zeta23 `Zeta23/PairCeiling/` — the stability inequality + near-CUE + N=256 law chain ends at
  `ceiling_law256`; nothing downstream; its natural neighbors (other bandwidths, other laws) do not exist.
- eth `Eight.signs` (the eight-square identity) and `AppHalfPieces.lemmaQ/lemmaDual` (operator
  identities on ℚ[t₁,t₂,…]): pure algebra with no other formalization in the corpus to connect to;
  the "Boson"/Fock-space connection (paper Appendix H) is mentioned in `proof/README.md:174` only.
- 3sum-apsp `Sec1.MonoConvolution` (Section 1's only statement) — a standalone convolution
  monotonicity fact; also `table_1_section_2_column` (a single table cell as a theorem).
- eth `ParityChecksStatement.lean` — a method-of-conditional-expectations choice of checks
  ("differs from its Step 2"), pure combinatorics with no neighbors.

## 3. External dependencies

### mathlib imports (verified by grep)

- **zeta23**: statement layer imports `Mathlib` wholesale (`Challenge.lean`, `ChallengeDeps.lean`);
  the library uses narrow imports, most frequent: `Mathlib.Analysis.SpecialFunctions.Integrals.Basic`
  (×14), `Mathlib.Analysis.Complex.CauchyIntegral` (×12), `Mathlib.NumberTheory.LSeries.RiemannZeta`,
  `Mathlib.NumberTheory.LSeries.Dirichlet`, `Mathlib.NumberTheory.LSeries.Nonvanishing`,
  `Mathlib.Analysis.Analytic.Order` (`analyticOrderAt`), `Mathlib.Analysis.SpecialFunctions.Gamma.Digamma`
  / `Gamma.Deligne`, `Mathlib.Analysis.SpecialFunctions.SmoothTransition` (the taper profile
  `Real.smoothTransition`), `Mathlib.NumberTheory.Chebyshev`, `Mathlib.NumberTheory.AbelSummation`,
  `Mathlib.Analysis.PSeries`, `Mathlib.MeasureTheory.Integral.IntervalIntegral.*`. ξ is built on
  Mathlib's `completedRiemannZeta₀` (`ChallengeDeps/XiPrime.lean:16`).
- **eth**: dominated by tactics (`Mathlib.Tactic` ×208, `Ring` ×110, `Linarith` ×97,
  `Positivity` ×77); the model of computation is
  `Mathlib.Computability.TuringMachine.Computable` (×14: `Turing.FinTM2`, `TM2ComputableAux`,
  `TM2OutputsInTime`); plus `Mathlib.Analysis.SpecialFunctions.Pow.Real`, `Log.Base`,
  `Mathlib.Algebra.BigOperators.Ring.Finset`, `Mathlib.Algebra.Order.BigOperators.Group.Finset`.
- **3sum-apsp**: `EndStatement.lean` imports **nothing** (core `BitVec`, `Int`, `Rat`, `List`
  only). `PaperStatements.lean` and the library: `Mathlib.Algebra.MvPolynomial.Basic/CommRing`,
  `Mathlib.LinearAlgebra.Matrix.Defs/Notation`, `Mathlib.Combinatorics.SimpleGraph.Basic`,
  `Mathlib.NumberTheory.PrimeCounting`, `Mathlib.Probability.Independence.Basic`,
  `Mathlib.Analysis.SpecialFunctions.Log.Base`, `Mathlib.Analysis.Complex.ExponentialBounds`,
  `Mathlib.Data.Nat.Log/Size`, `Mathlib.Data.List.GetD`, tactics (`Ring` ×10, `Positivity`/`Linarith`
  ×7 each). Uses the Lean 4 `module`/`public import` system.

### Classical results assumed or cited from the literature

- **zeta23 assumes nothing**: "the top-level theorems have no hypotheses" (`README.md:17`). Every
  classical input is *re-proved*: Weil's explicit formula for ζ and primitive L(s,χ) (cited to
  [IK04, Thm 5.12] in `Zeta23/Final.lean` header), Riemann–von Mangoldt + Backlund–Jensen,
  Montgomery–Vaughan Hilbert inequality ([MV74, Thm 2] diagonal form, constant 13, upgraded to the
  bilinear [lem:MV] form in `Zeta23/MV/`), Chebyshev–Mertens (ported from
  PrimeNumberTheoremAnd, which itself credits Goldmakher's proof), Stirling/Γ′/Γ. ξ′ results cite
  Farmer–Gonek–Lee (arXiv:0803.0425 = J.LMS (2) 90 (2014)) for the method. One external
  computational artifact: the `EnclOK` interval-arithmetic enclosures (PairCeiling, non-submitted).
- **eth assumes nothing in Lean**: all of §§3–8 + Apps A–D proved. Cited but re-proved:
  Williams's ACC→lower-bounds step is "not in Lean: Lean proves the conclusion directly". Cited
  and *not* formalized: the word-RAM simulation of `FinTM2` (standard, outside the statements);
  "nondeterministic time = verifier form" for NSETH. The sparsification lemma (App C) is proved
  with "the changed sparsification algorithm of Appendix C with Calabro's thresholds"
  (`proof/sparsification/`).
- **3sum-apsp**: the five claims "assume no cited result" (README:63). Cited-and-proved-here:
  the [CH20] reduction (Theorem 21a / Convolution-3SUM) with a program following that paper;
  Bertrand-type prime counts (`exists_le_card_primesInRange`, proved from a counting form).
  Cited-as-hypothesis: Theorem 33; the [CVX22] randomized reductions (Lemma 36, hypothesis only);
  [VW13, Thm 4.2/4.3] and [VW18] reductions written as programs but not compared to sources;
  [vdBNS19] Conjectures 5.2/5.7/5.12 — defined in Lean (`Conjecture52/57/512`) as the objects
  being refuted. **The unconditional content** of the whole project is: the five upper-bound claims
  plus 132 further proved statements — no lower bound, conditional or otherwise, is claimed. The
  conditional lemmas make explicit that deductions like Theorem 35 hold for *any* semantics of
  "solved in time T" satisfying their premises.

## 4. Bridging hooks

Names/paths below are exact; the analysis/number-theory ↔ complexity triangle is the target.

**To mathlib (donors — proved here, absent or weaker there):**
- `Zeta23/LinAlg/VonNeumann.lean` — von Neumann's trace inequality for Hermitian matrices
  (`RHLinalg` namespace); mathlib lacks it as a standalone API. Donable.
- `Zeta23/LinAlg/RankTrace.lean:163 rank_trace_ineq` — rank–trace/Frobenius inequality
  (c·trP − c²r/4 + 2c·trQ − c²b ≤ ‖P+Q‖²_F); a new elementary matrix inequality, mathlib-ready.
- `Zeta23/LinAlg/Sylvester.lean`, `Inertia.lean`, `PosIndex.lean` — both directions of Sylvester's
  law of inertia (mathlib has inertia only partially); `Weyl.lean` — Weyl eigenvalue bound.
- `Zeta23/RvM/` — Riemann–von Mangoldt N(T) via argument principle with Backlund's bound
  (`RvM/Statement.lean:20`): mathlib's zeta development (`Mathlib.NumberTheory.LSeries.RiemannZeta`)
  has no zero-counting; this is the first formal RvM and directly extends mathlib's `riemannZeta`.
- `Zeta23/WeilEF/` — Weil's explicit formula over Mathlib's ζ and `DirichletCharacter.LFunction`;
  the zero-sum limit machinery (`ZeroSumLimit.lean`, `Landau.lean`) is the entry API for any
  future explicit-formula work (PNT-class theorems, zero-free regions) in mathlib.
- `eth`'s `machines/ToTuring/` (46 files): "polynomial-time certificate" framework (`PolyT`,
  `steps_to_time`, `exists_tm_padded`) turning abstract step-costs into `Turing.TM2OutputsInTime`
  — a reusable complexity layer over `Mathlib.Computability.TuringMachine` that mathlib itself
  lacks (mathlib has machines, almost no time-complexity API).
- `3sum-apsp/EndStatement.lean` — a 139-line self-contained word-RAM (`Instr`, `exec`,
  `Problem.SolvedInTime`) importing nothing; could be lifted into mathlib (or reused by any
  algorithms formalization) as the reference word-RAM model. Its `BigO`-on-`Rat` trick
  (denominator-exponent form, line 50) is reusable.

**To mathlib (consumers — what they lean on):** zeta23 leans on `riemannZeta`,
`DirichletCharacter.LFunction`, `analyticOrderAt`, `completedRiemannZeta₀`, `Real.smoothTransition`;
**missing on the mathlib side** (gaps these projects had to fill themselves): zero-counting
functions, explicit formulas, Γ′/Γ Stirling bounds, Hilbert-type inequalities, the PNT-plus
Chebyshev–Mertens constants (hence the `FromPNTPlus/` port from PrimeNumberTheoremAnd — itself a
third-party bridge node). eth leans only on `Turing.Computable` + tactics — the entire algorithmic
content is in-house.

**To tauceti / openai-math (candidates by content):**
- `Zeta23/ZeroSide/TightMult.lemmaR_tight` and `Zeta23/PairCeiling/ceiling_stability` — exact
  certificates/barriers for spectral zero-density arguments; natural meet-point for any
  tauceti/openai-math work on zeta zeros, random-matrix (CUE) form factors, or trace inequalities.
- `Zeta23/XiPrime/` — zeros of ξ′: contains an in-repo *proved* explicit formula for ξ′/ξ
  (`XiPrime/ExplicitFormula/`) and Re ξ′/ξ > 0 on Re s ≥ 1; a ready-made neighbor for any
  De Bruijn–Newman / Λ ≤ 0 formalization elsewhere.
- `eth`'s `Eight.signs` + `AppHalfPieces.lemmaQ/lemmaDual` (operators a[r], Q_s on ℚ[t₁,t₂,…],
  "Boson"/Heisenberg algebra per `proof/README.md:174`) — representation-theoretic identities
  driving a complexity result; the same objects appear in symmetric-function theory and could meet
  number-theoretic generatingfunctionology from the other corpora.
- `eth`'s grouping/variance computation (`networks/Variance/`, `stVar`: Var Y ≤ 4PU over K^g
  random groupings) — a clean second-moment method, structurally identical to the variance terms
  in zeta23's `PrimeSide/` Gram-matrix trace estimates: a shared probabilistic lemma layer is a
  plausible bridge.
- `3sum-apsp`'s trilinear-form machinery (`PaperStatements.lean:111–306`: `Term`, `phi/psi/chi`,
  `Full`, `Mult`, `Pruned`) — the first formalized "tensor-rank → algorithm" pipeline; any
  openai-math/tauceti content on matrix multiplication exponents, border rank, or Strassen-type
  identities (cf. eth's eight-square identity, `Eth Eight.signs`, and 3sum-apsp's Strassen
  identity `Eq_1` :603 — 2×2 seven-product, docstring :601-603 — with the border-rank identity
  (1) being `Lemma_6` :618, ten terms over defs `G` :178 / `E` :183) would connect here.
  [erratum 2026-11-09, H/QA: v1 attributed the border-rank identity (1) to `Eq_1`; `Eq_1` is
  Strassen's 2×2 identity and the ten-term border-rank decomposition is `Lemma_6`.] Notably
  **both** eth and 3sum-apsp independently
  formalize tensor-decomposition-to-algorithm arguments — the two never share API (different
  machine models: word RAM vs Turing; `Problem.SolvedInTime` vs `TM2OutputsInTime`), which is
  itself an empty zone (§ Phase 2).
- Complexity ↔ analysis hooks: `3sum-apsp` `Sec4_Rc_*` (`Rc` strictly antitone with limit ε* =
  0.1204, `Sec4_Rc_strictAntiOn`, `Sec4_Rc_zero_tendsto`, `Sec4_epsStar_numeric`) — a real-analysis
  monotone-limit object living inside an algorithms proof; zeta23's ThmD functional
  (`ThmD/Functional.lean`) is a variational problem over windows — both are optimization-over-
  functions objects that could borrow each other's calculus.

**Within-corpus empty zones:** no theorem connects the three subprojects (by design); the shared
substrate is only Mathlib + the Palomar/Comparator harness. The two complexity projects model
"solved in time" twice with incompatible definitions; a joint "reduction" theory (3sum-apsp's
`Claim.*` interface in `TimeClaims/` is parameterized by an abstract solver, exactly the shape
eth's `Solver`/`interface statement` layer takes) is a concrete, feasible unification target.

## 5. Sources consulted

- `/home/doz/zcode-workdir/anthropics_formal-math/README.md` (CI rules, project table)
- `.github/workflows/lean-projects.yml` (sorry policy, Comparator pins)
- 3sum-apsp: `README.md`; `EndStatement.lean` (all 139 lines); `PaperStatements.lean`
  (statement index scan + §Section 5 pp. 2780–2815, 4020–4195); `Challenge/PaperStatements.lean`
  (sorry inventory); `docs/REMARKS.md` (What is not proved; Sections 2–3); `docs/INDEX.md` (head;
  137 statements); `docs/MACHINE.md`, `docs/VERIFYING.md`, `docs/PROGRAMS.md`, `docs/FILES.md`
  (existence, titles); `ThreeSumApsp/` folder listing; import grep.
- eth: `README.md`; `MainResults.lean` (all); `Challenge.lean` (all); `Solution.lean` (all);
  `proof/README.md` (all 183 lines); `proof/PaperIndex.lean` (§-headers + entries for Thm 1, 2,
  Cor. 5, §7, Lemma 1, eight-square, Prop. 3, Thm A, B, C, D, Cor. 11, Lemmas 9–10);
  `proof/statements/` listing; import grep.
- zeta23: `README.md` (all); `AUDIT.md` (head, sorry/axiom counts); `formalization.yaml`
  (sources/alignment); `ChallengeDeps.lean` (all); `Challenge.lean:110–229`;
  `Challenge/XiPrime.lean` (defs + 6 theorems); `Zeta23/Final.lean` (head + theorem names);
  `Zeta23/LinAlg/RankTrace.lean:150–175`; `Zeta23/MV/Final.lean`; `Zeta23/RvM/Statement.lean`;
  `Zeta23/FromPNTPlus/Mertens.lean` (provenance header); folder listings; import grep.
