# R7 bib cards + gate-sweep verdicts (iteration-4 review, 2026-11-16)

*Lane R7 (external evidence). Consumers: §C bib cards → R1/R2 article edits; §A gate
sweep text → relay to R6 for append to `novelty/iter4-fresh-bridges.md` (R6 owns that
file; R7 has NOT edited it); §B → the 01-stability (Iter-5-leaning) rung. All
arXiv-id facts below were verified against the arXiv abstract page or API listing on
2026-11-16 unless marked otherwise. Theorem-number anchors marked "(abs)" are
abstract-level only — pull the PDF before citing a numbered theorem.*

---

## §A FB-1 gate sweeps — verdicts (relay copy for R6's §gate-sweeps)

### Gate (a): CDPS 2017 / tropical-Sinkhorn — zero-temperature dual + substitution-rule characterization

**Verdict (a): both rungs clear.** R1-ii (zero-temperature *dual* limit) =
NEAREST-MISS, no dual/potential statement found anywhere; R2 (tropical substitution-rule
soundness characterization) = NOVEL as a question type, canonical nearest-miss =
Allamigeon–Benchimol–Gaubert–Joswig's tropical simplex. One mandatory new citation for
dossier 76 (Gwozdz), one structural caution (Gwozdz again), one conditional (CDPS body
paywalled).

Evidence (all consulted 2026-11-16):

1. **CDPS 2017** — exact cite, from tauceti's own header
   (`TauCeti/MeasureTheory/OptimalTransport/Entropic/ZeroTemperature.lean:82–84` [V]):
   G. Carlier, V. Duval, G. Peyré, B. Schmitzer, *Convergence of entropic schemes for
   optimal transport and gradient flows*, **SIAM J. Math. Anal. 49 (2017), 1385–1418**.
   The tauceti citation line scopes CDPS to "the block approximation of a coupling and
   the convergence of entropic transport as ε → 0" — **primal quantities**. Not on
   arXiv (title sweep = 0 hits); SIAM body paywalled from this environment ⇒
   **body-level dual-content check NOT DONE** (conditional evidence class; if the pilot
   proceeds to R1-ii, someone with SIAM access should eyeball CDPS §on potentials).
2. **Zero-temperature dual sweep**: arXiv `all:"zero-temperature" AND all:"optimal
   transport"` (7 hits) — **none** proves dual-value or rescaled-potential convergence
   to the Kantorovich dual. Nearest: **Mengue, arXiv:2501.19369** (2025,
   "Optimal transportation and pressure at zero temperature") — recovers Kantorovich
   duality from a β→∞ *pressure* (primal) variational limit, not from Schrödinger dual
   potentials. Also adjacent: **Caputo–Gerolin–Monina–Pelikh–Portinale,
   arXiv:2602.23144** (quantum-thermodynamics SDP: dual maximizers + zero-temperature
   limits — different setting, cite-optional).
3. **MUST-CITE / structural caution for R1**: **Gwozdz, arXiv:2607.16881** (2026,
   "Entropic optimal transport need not select a zero-temperature limit") — constructs
   a counterexample where entropic OT *minimizers* fail to converge as ε→0, plus a
   compactness theorem and convergence criteria. Consequence for dossier 76: zero-
   temperature selection is NOT automatic in general; R1-ii is honest exactly because
   it lives in the finite-support / discretisable-cost regime (tauceti's
   block-approximation hypothesis). The dossier should state this contrast explicitly.
4. **Tropical Sinkhorn**: arXiv `all:"tropical" AND all:"Sinkhorn"` = **0 hits** — the
   phrase-class is empty on arXiv (checked 2026-11-16).
5. **Tropical LP / simplex line** (the real nearest-miss set for R2):
   - **Allamigeon, Benchimol, Gaubert, Joswig, "Tropicalizing the simplex algorithm",
     arXiv:1308.0454** (v2 2014; SIAM J. Discrete Math. 29:2 (2015), DOI
     10.1137/130936464) — tropical analog of the simplex algorithm; "a combinatorial
     algorithm to perform one tropical pivoting step, including the computation of
     reduced costs, in O(n(m+n))" (abs). **No characterization of pivoting/substitution
     rules (criterion ⟺ soundness) is stated.**
   - **Butkovič, "On Tropical Linear and Integer Programs", arXiv:1709.08983** (2017) —
     strong/weak duality of tropical LP, no gap (the duality substrate, no rules).
   - **Loho, "Abstract tropical linear programming", arXiv:1612.01890** (2016/17) —
     signed tropical matroids; connections to classical simplex and mean-payoff games.
   - **Adenwalla–Braunfeld–Hons–Sylvester–Zamaraev, arXiv:2607.23754** (2026) —
     decidability reduced to tropical LP feasibility via mean-payoff game duality
     (shows the line is active; nothing on rules).
   - **Sergeev–Liu, arXiv:1902.10055** (2019) — tropical bilevel, uses tropical LP
     solvers; **Joswig–Kulas, arXiv:0801.4835** — "tropical simplex" as a geometric
     object only.
   - No paper in the line states a **soundness criterion** for tropical
     substitution/pivot rules of the "dominating/eligible-ordering ⟺ sound" shape.

**Action for R6's file**: FB-1 keeps grade **B→B+** (R2 question type unclaimed
anywhere; R1-ii unclaimed at dual level). Add to dossier 76's must-cites: Gwozdz
2607.16881 (selection caution), Mengue 2501.19369 (primal-pressure nearest-miss),
ABGJ 1308.0454 (tropical-simplex nearest-miss), Butkovič 1709.08983 (duality
substrate). CDPS remains cite-for-primal only until a paywall pass.

### Gate (b): Truffet-literature kill-check for the OAI tropical-LP counterexample

**Verdict (b): NO KILL — the counterexample's neighborhood is clean.** The Truffet
literature is located, real, and current; nobody has published a counterexample, a
soundness theorem, or any follow-up against the substitution method; and the OAI tree's
"V4" naming pins it to the 2026-08-29 v4 of the two Truffet papers. One high-value
side-finding: the classical sibling paper's claim is strongly-polynomial **general LP**.

Evidence (all consulted 2026-11-16):

1. **The tropical paper**: **Laurent Truffet, "Substitution for minimizing/maximizing a
   tropical linear (fractional) programming", arXiv:2603.26423** — v1 2026-03-27, v2
   2026-04-02, v3 2026-05-11, **v4 2026-08-29**. Special substitution method on the
   tropical cone from homogenizing the initial tropical polyhedron; "inherits the
   strong polynomiality of the classical substitution for linear systems"; explicitly
   contrasted with exponential tropical Fourier–Motzkin; motivation = software static
   analysis + parity/mean-payoff/energy games (abs). **No soundness theorem for the
   substitution steps and no erratum/counterexample note visible at abstract level.**
2. **The classical sibling**: **Laurent Truffet, "Linear Programming Problem Solved By
   a Special Substitution Method", arXiv:2604.06726** — v1 2026-04-08, v4 **2026-08-29**
   (same v4 date as the tropical paper — matches `TruffetV4Counterexample`'s "V4").
   Abstract proves only "the research of the criteria is strongly polynomial" and
   claims the method inherits correctness+strong polynomiality for **general LP** —
   i.e. an (unrefereed) open-problem-grade claim. **Flag for the world scan**: if the
   OAI tropical counterexample pattern extends to the classical criteria, this is a
   refutation of a claimed strongly-polynomial LP method — high-value, high-care.
3. **Correction pattern in the author's max-plus line** (supports the soundness-gap
   reading): **Lahlou–Truffet, arXiv:2106.08854** (Max-atom problem in P) carries a
   public note that **errors were pointed out**, superseded by **Truffet,
   arXiv:2408.14256** (2024, French; saturation principle in (max,+)). Also:
   Truffet arXiv:0904.2244 (Fréchet arrays are max-plus linear, residuation);
   Lahlou–Truffet 1712.05798, 1802.05974 (maximum empower, max-plus).
4. **No follow-ups/citations found**: Semantic Scholar citations of arXiv:2603.26423 =
   empty set (API, 2026-11-16; tool caveat: S2 indexing of 2026 preprints is partial);
   arXiv sweeps surfaced no paper citing or refuting either Truffet paper; no external
   match for the counterexample's vocabulary (`dominating`, `eligible`, `lower/upper`
   orderings over `WithBot ℝ` forms) — that vocabulary is OAI-internal.

**Action for R6's file**: the counterexample (and any soundness criterion around it)
remains formally novel — FB-1 R2 stands. Add to dossier 76: cite Truffet 2603.26423
v4 as the target-of-refutation (with the V4-version pin), Truffet 2604.06726 as the
classical sibling claim, and Lahlou–Truffet 2106.08854 → 2408.14256 as the
author-lineage correction pattern. Optional: the "does the classical claim fall too"
question is a cheap, well-posed follow-up candidate.

---

## §B 01-stability mandatory sweeps (R2's flags) — both CLEAR

### B.1 Quantitative von Neumann trace inequality — **NO quantitative-stability statement exists (arXiv level); rung clears**

- `all:"von Neumann trace inequality"` (5 hits) and `all:"trace inequality" AND
  all:"equality case"` (5 hits): **zero** papers give deficit bounds for
  |Tr(AB)| ≤ Σ_i λ_i↓(A) λ_i↓(B) (or the singular-value form). Users/refiners only.
- **Nearest statements** (cite these in the rung's related-work):
  1. **Guterman–Wolf, "Poset-refined majorization relations", arXiv:2607.28061**
     (2026) — strengthens von Neumann's trace inequality, Ky Fan, and Horn
     log-majorization by relaxing aligned-order eigenvalue/singular-value orderings to
     partial orders. A *refinement* line, not stability; no explicit constants (abs).
  2. Equality-case characterizations exist only for OTHER trace inequalities:
     Fang–He–Huang arXiv:2608.30172 (Jensen trace equality, semifinite vN algebras);
     Hiai arXiv:2402.16067 (log-majorization equality cases, Golden–Thompson); Li–Zhou
     arXiv:2608.20937 (Audenaert inequality equality iff A=B). Qualitative only.
  3. **Structural nearest-miss for the *stability* statement shape** (equality ⇒
     simultaneous aligned diagonalization; near-equality ⇒ near-aligned pair): the
     almost-commuting-matrices line. **Hastings, "Making Almost Commuting Matrices
     Commute", arXiv:0808.2474** (v4 2011; Comm. Math. Phys. 291:321 (2009)) — explicit
     **dimension-independent** δ–ε bounds for ‖[A,B]‖ ≤ δ ⇒ ε-close commuting pair
     (v4 fixes a proof error caught by Filonov–Kachkovskiy — a hygiene note worth
     citing when we build on it); qualitative predecessor = H. Lin's theorem.
- **Bottom line**: a theorem "deficit in the vN trace inequality controls distance to
  an aligned (near-)commuting pair, with explicit constants" is not in the arXiv
  literature; nearest tools are Hastings/Lin (qualitative-to-quantitative template).

### B.2 Quantitative Schur–Horn (piecewise-strict g_c) — **NO metric-stability statement exists (arXiv level); rung clears**

- `all:"Schur-Horn" AND all:"stability"` = **0 hits**. Full recent Schur–Horn listing
  (20 hits, 2026-11-16) contains exactly one perturbation-behaviour paper:
  1. **Chen–Li, "On the Continuity of Schur-Horn Mapping", arXiv:2407.00701**
     (2024, **v2 2026**) — continuity/"strong Schur–Horn continuity" of eigenvalue
     perturbation at fixed diagonals; **continuity, not quantitative Lipschitz/Hölder
     bounds**. THE nearest statement; cite it.
  2. **Uhlmann–Wang, arXiv:2609.35558** (2026) — a *reverse* Schur–Horn majorization
     inequality (SPD, dim ≤ 6) — nearest "direction-opposite" statement; cite-optional.
  3. Equality-case analogues: Mishra arXiv:2309.04562 (equality in symplectic
     Weyl/Lidskii/Schur–Horn-type inequalities, LAA 2026); Bhatia–Jain arXiv:2004.03906
     (symplectic Schur–Horn, weak supermajorization). Probabilistic:
     Meckes–Meckes arXiv:1711.02710.
  4. Active 2026 applications (context, not competition): Zelaya–Miri et al.
     arXiv:2608.19353, 2607.24104 (photonic Schur–Horn tomography); Kleywegt–Milz–
     Singh–Xie arXiv:2605.27837 (spectral design algorithm); Zhang arXiv:2601.10602
     (hyperbolic-polynomial Schur–Horn); Bloch–Ratiu arXiv:2504.12924 (Monge–
     Kantorovich ↔ Schur–Horn link — also relevant to FB-1's OT junction!).
- **Bottom line**: a quantitative (piecewise-strict g_c) Schur–Horn stability theorem
  is unclaimed; nearest = Chen–Li continuity. No obstruction to chartering the rung.

---

## §C Bibliographic cards (cite-ready; R1/R2 consume directly)

### C.1 Bansal–Maji — the missing nearest-miss cite for article 75 §6

- **Authors**: Diksha Rani Bansal, Bibekananda Maji.
- **Title**: *Number Field Analogue of Jacobi Theta Relation And Zeros of Dedekind
  zeta function on Re(s)=1/2*.
- **arXiv**: 2507.18121 (math.NT), v1 2025-07-24, 25 pages (abs).
- **Statement to cite (abs)**: via a number-field Jacobi-theta relation, **there exist
  infinitely many nontrivial zeros of the Dedekind zeta function on Re(s) = 1/2 for
  any number field F** (Hardy-type). Unconditional at abstract level; **no proportion
  claimed** — that contrast is exactly why 75 cites it.
- **Use**: article 75 §6 "Relation to prior work", one sentence: strongest on-line
  statement for general ζ_L in the literature; weaker in kind (infinitude, not
  proportion). Also usable in 42's §6 as context. No theorem number visible on the
  abs page — cite the main application (abs) until the PDF is pulled.

### C.2 Kuwahara — article 72's donor; scope correction + trade-off non-statement

- **Author**: Tomotaka Kuwahara. **Title**: *The Rényi area law conjecture is false
  below α=1 in high dimensions*. **arXiv**: 2610.15199 (quant-ph), v1 2026-10-10;
  7 pp + 25 pp appendix, 6 figures (abs).
- **Scope (abs)**: constructions in **every spatial dimension ≥ 2** (not only 2D);
  fixed local dimension, bounded interaction strength, uniform spectral gap, unique
  ground states, adiabatically connected to product states via uniformly gapped local
  paths; volume-law Rényi-α for all 0 < α < 1; **von Neumann (α = 1) area law still
  holds in the examples** (α = 1 is the sharp threshold in the class).
- **Trade-off (abs)**: worst-case rank–error trade-off for approximate ground-state
  projectors — optimal Schmidt rank at projection error ε across a planar cut of
  cross-section A is exp[Θ̃((A log ε⁻¹)^{2/3})] when log ε⁻¹ ≳ A. This is an
  *approximate-projector upper-bound* statement; **the boundary-linear log-rank no-go
  is NOT stated** — article 72's S₀ ≥ S_α bridge remains ours.
- **Use**: article 72 (i) relabel "2D" → "every dimension ≥ 2" wherever the hKL family
  is described (free strengthening); (ii) add the trade-off as the positive
  counterpart in §6; (iii) the α=1-survival fact is the external argument for AL-3D's
  von-Neumann-only `SlabAreaLaw3D` shape.

### C.3 Lamzouri — ζ-side proportion constants (the V2 donor's source)

- **Author**: Youness Lamzouri. **Title**: *A new proof that more than 2/3 of the
  zeros of the Riemann zeta function are simple and on the critical line*.
  **arXiv**: 2609.02882 (math.NT), Sep 2026 (abs).
- **Constants (abs)**: simple and on the critical line **> 0.6725** (67.25%);
  distinct **≥ 0.83625** (83.62%); **new endpoints**: zeros simple *or* on the line
  (or both) **≥ 0.8876**; average of the simple and on-line proportions **≥ 0.8362**.
- **Provenance (abs)**: simplifies/improves "a recent proof by Claude (Anthropic's
  AI), verified by Levent Alpöge and Ralph Furman", replacing a finite-dimensional
  matrix framework with a single Hilbert-space inequality; uses the unconditional
  Baluyot–Goldston–Suriajaya–Turnage-Butterbaugh pair correlation.
- **Formal status**: AxiomMath ZetaZerosV2 formalizes the 0.6725/0.83625 endpoints
  (`simple_proportion_d4`, `distinct_proportion_d5`) — the donor 42-M4 consumes. The
  **0.8876 simple-or-on-line endpoint is NOT exported by V2** — flag as a future donor
  endpoint shape (iteration-4+).
- **Use**: articles 42/42-M4/75 donor lineage; qa donor-hygiene narrative.

### C.4 Knausgård — stronger constants, hygiene caveat

- **Author**: Kristian Muri Knausgård.
- **Card 1**: *More than 83.9% of the zeros of the Riemann zeta function are distinct
  and more than 67.35% are simple and on the critical line*, **arXiv:2610.08965**
  (math.NT, cross cs.LO), v1 2026-10-06. Constants (abs): simple+on-line ≥
  **0.67353…**; distinct ≥ **1645064/1960733 = 0.83900…** (implies > 67.80% simple);
  simple-or-on-line ≥ **88.93%**; simple/on-line average ≥ **83.67%** (improving
  Lamzouri's estimates). **Hygiene (author-disclosed, abs)**: Lean 4 "analytic inputs
  included" but **three axioms beyond Mathlib, one per inequality, each recording that
  a search program returned true** (native_decide-class); ancillary Python/C++
  certificates + ~100 JSON replay shards. Never consume at headline level.
- **Card 2**: *More than 83.69% of the zeros of the Riemann zeta function are
  distinct*, **arXiv:2609.33043**, v1 2026-09-27, v2 2026-10-07. Distinct ≥
  **0.8369928814…**; Lean components proved, final constant additionally depends on a
  computer-assisted local inequality from unrefereed work, re-run by the author (abs).
- **Use**: articles 42/42-M4 §6 (the superseded ζ-side route — constants match the
  in-repo record 0.67353/0.83900; note in-repro text said "0.67354", arXiv abs says
  "0.67353…", use the arXiv figure); donor-hygiene exhibits.

### C.5 Liu ×2 — QR-D constants + the "formalized by Lean" line

- **Card 1**: Baiying Liu, *Improved zero-free half-planes for the quasi-Riemann
  hypothesis*, **arXiv:2610.12234** (math.NT, cross-list math.RT), v1 2026-10-08,
  **v2 2026-10-12**. **B_new = (18ξ_new + 7)/(18ξ_new + 9) = 0.874957019420098946…**,
  ξ_new the unique root in (0.38858, 0.38859) of **1188ξ³ − 2160ξ² + 171ξ + 190 = 0**
  (trigonometric closed form available); optimality proven within the stated exponent
  comparison system; optimal limiting values b_new, ℓ_new, κ_new given (abs). Class:
  finite-order Hecke L over ℚ(√−3), transfer to every Dirichlet L including ζ.
  **Formalization (abs, verbatim claim)**: "This result has been formalized by Lean
  [Liu26]" — the `liu-zerofree` repo (sibling; DO-NOT-CONSUME as build dep,
  statement-level only, per AGENTS.md).
- **Card 2**: Baiying Liu, *Zero-free half-planes for Hecke L-functions over number
  fields and Quasi-Riemann Hypothesis*, **arXiv:2610.26835**, v2 2026-10-19.
  **B♭ = 0.874886647039964…** (root near 0.8749 of a quartic), **uniform for
  finite-order Hecke L-functions over every number field** (abs). No formalization
  mentioned.
- **Use**: 50-M2/50 §6 race context; dossier 70 standing notes; the informal-vs-formal
  gap narrative (formal Dirichlet frontier still 0.873345856106 per
  QuasiRiemannTracker badge, 2026-11-16). Related informal: Xu–Sang arXiv:2610.15291
  (7/8 → 0.8748867, Hecke ℚ(√−3) + Dirichlet); Ji arXiv:2611.16665 (Re s > 599/600
  for ζ_ℚ(i), weaker constant, number-field ζ_K class).

### C.6 Morin–Duchesne–Rasmussen–Ruelle — the d = 8 kin row for the H4 seed-2 statement set (H4-precharter E1 row 1 + E2 row 3; minted 2026-11-21)

- **Authors**: Alexi Morin-Duchesne, Jørgen Rasmussen, Philippe Ruelle. (The battery
  and precharter cite "Morin-Duchesne 2015" — first-author shorthand for this paper's
  journal year.)
- **Title**: *Dimer representations of the Temperley–Lieb algebra*.
- **arXiv**: 1409.3416 (math-ph), v1 2014-09-11, v2 2014-11-23, 23 pp; **journal:
  Nucl. Phys. B, DOI 10.1016/j.nuclphysb.2014.11.016** (the 2015 of record) (abs,
  verified 2026-11-21).
- **Content (abs)**: a new spin-chain representation of **TL_n(β = 0)** related to the
  dimer model; the dimer representations have **dimension 2^{n−1}** (vs the usual XXZ
  2^n) — at n = 4 exactly the **d = 8** boundary host class, at **loop value 0**, not
  δ = ±2.
- **Use**: the H4-precharter's E1/E2 nearest-miss rows — dimension kin ONLY: no
  realizability or prescribed-table question, no Gram/sign content, not at the closed
  fibers (the round-7 battery `round7-h3-battery.md:336` verdict NOT-COVERED stands,
  now with the exact cite). Gates any future H4 article draft's §4 row.

### C.7 Chernyak–Gainutdinov–Jacobsen–Saleur — the two-boundary-TL genre row for H4's E2 (minted 2026-11-21)

- **Authors**: Dmitry Chernyak, Azat M. Gainutdinov, Jesper Lykke Jacobsen, Hubert
  Saleur. ("Chernyak 2023" = this paper's SIGMA publication year.)
- **Title**: *Algebraic Bethe Ansatz for the Open XXZ Spin Chain with Non-Diagonal
  Boundary Terms via U_q sl_2 Symmetry*.
- **arXiv**: 2212.09696 (hep-th), v1 2022-12-19, v2 2023-07-17; **journal: SIGMA 19
  (2023) 046, 47 pp, DOI 10.3842/SIGMA.2023.046** (abs, verified 2026-11-21).
- **Content (abs)**: Bethe equations for the general open XXZ chain with non-diagonal
  boundary terms under the Nepomechie constraint; the **two-boundary Temperley–Lieb
  Hamiltonian realised** in a U_q sl_2-invariant spin chain, equivalence via
  Schur–Weyl duality with the two-boundary TL algebra; infinite-dimensional Verma
  modules on the edges (companion: Chernyak–Gainutdinov–Saleur,
  *U_q sl_2-invariant non-compact boundary conditions for the XXZ spin chain*,
  **arXiv:2207.12772**, JHEP 2022 — the boundary-conditions origin, cite-optional).
  Note (abs-level): the abstract names the 2BTL Hamiltonian and Schur–Weyl duality;
  the battery's "tr(K·)-type functionals as standard machinery" gloss
  (`round7-h3-battery.md:337`) is genre-level — pull the PDF before citing any
  trace-of-K statement as the paper's own.
- **Use**: H4-precharter E2 row 2 — spectra/eigenvalue machinery ONLY: no member of
  the genre poses a prescribed-sign/Gram-table realizability question in any
  functional class (the battery's NOT-COVERED class-row verdict stands, now with the
  exact cite). Gates any future H4 article draft's §4 row.

---

*Tool conditions (for the caveat ledger): zbMATH 403-blocked; DuckDuckGo
CAPTCHA-blocked; Semantic Scholar partial (429 then OK, empty citation sets on 2026
preprints); arXiv API rate-flaky (retried). "0 hits" claims carry the query strings
used, in-line above. CDPS 2017 body = paywalled-unverified (conditional). C.6–C.7
verified 2026-11-21 against the arXiv abs pages (1409.3416, 2212.09696, 2207.12772);
genre-gloss caveats marked in-card.*
