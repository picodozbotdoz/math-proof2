# Related work and the external race

Lane R8 final artifact, 2026-11-09. Ready-to-merge related-work section for REPORT.md.
Every claim verified in novelty rounds 1–5 (`round-1.md`…`round-3.md` incl. §T,
`knausgaard-as-donor.md`, `VERDICTS.md` §Round-4/5); bracketed cites give round/§.

## The AF cluster and its formal race

The Alpöge–Furman theorem (arXiv:2608.13637; v1 2026-08-13, v2 2026-08-19) proved
unconditionally that ≥ 2/3 of zeta zeros are simple and on the critical line (≥ 5/6 distinct),
rising to 2−1/c₁* = 0.67250 / 0.83625 with the Montgomery–Taylor window, and was itself
formalized in Lean (the zeta23 corpus) [r1 §4]. Within eight weeks the informal constants were
beaten three times and the formal ones once. Lamzouri (arXiv:2609.02882, 2026-09-08) gave an
independent, matrix-free reproof at the same constants plus two new estimates (simple-or-on-line
≥ 88.76%, average ≥ 83.62%) [r1 §4, r2 §1]. Biao Wang (arXiv:2609.24167, v1 2026-09-21) refined
Lamzouri to C₀ + δ₀, δ₀ = 6.67×10⁻⁸ [r3 §5, §10]. Cobeli–Zaharescu (arXiv:2610.23467,
2026-10-16) proved ≥ 8/9 of zeros simple-or-on-line [r3 §5]. Knausgård then moved the formal
frontier twice: arXiv:2609.33043 (v1 2026-09-27) proved distinct ≥ 0.83699 via a new
"mixed-multiplicity Gram inequality" with a free clipping parameter; and arXiv:2610.08965
(2026-10-06) with the public repo `kristianmk/839` — an extension of zeta23 itself via a
window-hypothesis relaxation patch — proved formally distinct ≥ 0.83900, simple+on-line ≥
0.6735382 (the first improvement over the MT constant), simple-or-on-line ≥ 0.88932, and a
monotone ladder of ceilings for his pair-energy certificate classes (s = 6, 8, 10, ∞), plus an
independent reconstruction of AF's unpublished period-256 near-CUE law and an all-windows
ceiling 0.84093/0.68185 [r3 §T]. In the fine-grained complexity cluster, Majdoddin
(arXiv:2610.17420, 2026-10-12) extended Alman–Vassilevska Williams (arXiv:2610.06783) to thin
products up to D ≤ N^0.172 with a dichotomy, accompanied by its own Lean formalization
(`Majdoddin/formal-math`, a fork of the anthropics tree) [VERDICTS §5.2(a)]. **Conclusion:**
the zeta-proportion constant race is lost before this project started (our survey snapshot was
two formal generations stale), and the ecosystem now contains **two independent Lean build-outs
on the anthropics tree besides ours** (Knausgård, Majdoddin) — any candidate whose bottom line
is a ζ-constant or a frozen exponent is arriving late [r3 §T(e), VERDICTS §5.3].

## Adjacent formalization efforts

- **teorth/IEANTN** (Tao): 1244 files; zero-counting vocabulary (`zetaN`, `HasRvMBound`,
  `zetaZeroesSum`), ZeroCount node still `status: stub`, Rosser–Schoenfeld/Backlund solutions
  and PntSmooth machinery in progress — our RvM/EF donation plays have a months-scale window;
  feasibility for Hecke instantiation improves if it lands [r1 item 2, r2 §9(i)].
- **mathlib zeta race**: 2026 additions HardyZ, ZetaZeros (discreteness only), Wiener–Ikehara
  (merged); PNT-family PRs #41394 (Mertens), #44062 (weights), #43238 (weak PNT) all still
  open — Tier-1 "first PNT in mathlib" is alive-but-doomed; Tier-2 (effective 7/8 error term)
  is the content [r1 item 2, r2 §9(ii), donor §2(d)].
- **PNTAnd** (AlexKontorovich): MediumPNT/StrongPNT deep in its 339-file tree; hosts IEANTN
  port-out [donor §2(d)]. **Cycle-2 close-out (2026-11-13): upstream @ `938912bb` PROVES
  StrongPNT (ψ = x + O(x·exp(−c√log x)), `StrongPNT.lean:2900`, triad-clean) — dossier 22's
  Tier-2 T2b is CLOSED-BY-UPSTREAM (formalization-only to recover); only T2a
  (quasi-RH-conditional x^{7/8+ε}) remains open content [VERDICTS Cycle-2 standing note 1].
- **PhysLean / Tooby-Smith** (arXiv:2505.07939): Wick, static and normal-ordered, in Lean 4 —
  the bosonic instance of dossier 52's layer is taken; the universal/fermionic side is not
  [VERDICTS §5.1].
- **ETH formalizations**: besides anthropics-eth, OpenAI's `SubexponentialSAT` (kernel-verified
  by unaltuzun/exponential-time-hypothesis-verify, whose audit also shows the formalized bound
  is the weaker ρ(n) rate) and suquark/NotETHSimplified (3-SAT, ε-rate, poly space, multitape)
  — dossier 10's conjunction remains unclaimed [r2 §4].
- **Yamashita** (2026-06): Lean 4 HSD interior-point method for LP — nearest formal neighbor
  for dossier 02's LP-duality lemma; mathlib itself still lists LP duality as a TODO
  [VERDICTS §5.2(b)].

## Classical prior art our candidates must cite

Mapped to dossier IDs (all verified in-round): **de Laat–Rolen–Tripp–Wagner, arXiv:1908.04876
(2019)** — ζ_K quadratic distinct-zero proportions > 45% via pair correlation + SDP window
optimization; the must-cite nearest miss for 20/42 (and informal precedent for 02's
optimization-over-windows) [VERDICTS §5.2(c)]. **Cycle-2 precision (r4 P2-3): the 45% is
GRH-conditional, FIXED quadratic K, T→∞ asymptotic (Thm 1.1/Cor 1.3(i)) — not uniform over
fields; corrects VERDICTS §5.2(c)'s "unconditional" wording.** **Pan 1985** (doi 10.1016/0898-1221(85)90095-1)
— bit-complexity of matrix multiplication; kills 51 as mathematics [r2 §7]. **Šleževičienė
2003** (Zbl 1132.11340) — Selberg-class Speiser correspondence; contests 40-T2 [r3 §1].
**Benkart–Pérez-Izquierdo 1998** (arXiv:math/9801141) — quantum split octonions with a
q-composition property; object-level prior for 41 [r3 §2]. **Wei Zhang, arXiv:2310.07360** —
conditional simple-zero counts for ζ_K (L⁶-Lindelöf); nearest classical kin for 20/40/42
[r2 §5]. **Hughes–Miller 2007**, "Low-lying zeros of L-functions with orthogonal symmetry"
(corrects 02's garbled citation) [r2 §2]. **Laderman 1976** (Zbl 0322.65021) — rank ≤ 23 for
3×3 (not Smirnov); anchors 60 [r3 §4]. **CCLM17** = Carneiro–Chandee–Littmann–Milinovich
(Zbl 1362.11078; RH-conditional) — window optimality; anchors 21/02 [r3 §5].

## Our differentiation (final novelty posture; verbatim from VERDICTS §5.3)

Settled-safe: **10/Z3** (conjunction un-pre-empted, three-way audited), **11/Z1** and **12/Z4**
(no formal or informal counterpart; frozen-constant ecosystems), **41** (narrow (M)+(N) + TL
host, Benkart-graze bounded), **30/31** (classical anchors verified, bridge statements
untraced), **60** (ecosystem by design), **01's identity + 03's Theorem M** (structurally
distinct from everything found, including Knausgård Thm 2). Still-risky: **02** (correctly
re-scoped, but the AF-cluster is one paper away from formalizing LP/SDP window optimization —
de Laat–Rolen 2019 and law_lp.py show the idea is in the air; move fast or narrow to the
Lean-duality lemma + pair-mass dictionary), **20/40/42** (statements safe today — nobody has
touched Hecke/ζ_K proportions — but the cluster's actors (Wang, Knausgård, Lamzouri) pivot
fast, and every month of delay raises the chance a ζ_K corollary appears; 42 is the cheapest
first move and is now donor-accelerated), **52** (PhysLean is actively consuming the bosonic
side), **32** (two Lean formalizations already exist in its ecosystem; only the frontier-
function statement is ours). Overall: the zero-side constant race is lost (two formal
generations behind, per round-3 §T); the program's realizable novelty is structural (defect
identity, LP-in-Lean, incomparable-bandwidth axis), cross-L-function (Hecke/ζ_K), and
cross-model (machine-model conjunctions) — exactly the movable-ground list of round 3, now
with donor accelerants for 42 and a hard deadline culture for everything AF-adjacent.

## Cycle-2 additions (lane A5, 2026-11-13; full query records in `round-4.md` §1/§2/§3/§5/§6/PART-2)

- **The quasi-RH cluster (six papers, six weeks, two external Lean artifacts)**: OpenAI [Ope26a]
  *The Quasi-Riemann Hypothesis: A Zero-Free Half-Plane Re(s)>7/8* (preprint 2026-09-30, ζ included
  via principal Dirichlet; Lean = the sorry-challenge only) → [Ope26b] 11/12 + Landau–Siegel
  corollary (10-05) → **Liu-1 arXiv:2610.12234** B_new = 0.8749570 for Hecke-over-ℚ(√−3) + every
  Dirichlet L incl. ζ, **formalized** (liubaiying101 repo, entry theorems at the exact rational
  34999/40000, v4.34.1, triad-claimed, replay harness) → **Xu–Sang arXiv:2610.15291** 0.8748867
  conditional on [Ope26a]'s analytic inputs → **Cureton–Thorner** hexagonmath.org/2610.00200
  (v1 10-12/v2 10-14) 31/32 for EVERY number field + finite-order Hecke L, **our DZDF donor** →
  **Liu-2 arXiv:2610.26835** (v2 10-29) B♭ = 0.8748866 UNIFORM over all number fields incl. ζ_K,
  Lean in progress. Nearest ζ_K-zero neighbor: Trudgian–Zuniga Alterman arXiv:2610.16010
  (h(K) < 0.58, low-lying zeros). **Note: hexagonmath.org's archive is ORCID-gated** — arXiv-only
  absence claims are unsound for this venue (r4 method item 14, P2-12); direct sweep needs an ORCID.
- **Suzuki arXiv:2610.41115** (2026-10-30): spectral theory of function-field zetas — Hilbert
  spaces from the Weil quadratic form, eigenvalues → zero ordinates. The FF zone's method-neighbor
  clock for dossiers 71/73 (no proportions, no dictionary, informal).
- **Kuwahara arXiv:2610.15199** (2026-10-10): Rényi-α<1 area laws FALSE in d ≥ 2 for unique-gapped
  ground states — by S₀ ≥ S_α, literal rank concentration from a spectral gap is FALSE; the
  surviving concentration shape (von Neumann effective rank) IS the area law (our own AreaLaw2D
  donor). Anchors 72's no-go gate and 74's discipline.
- **AHS arXiv:2004.15009 cluster scan** (r4 P2-9): 23 citers (first page; Kuwahara = citer #1);
  NO citer proves class-side lower bounds on achievable entanglement windows — 74's T1-floor
  positioning survives; AHS remains the state-side dual (Õ(√b)).
- **DLRT arXiv:1908.04876 — scope corrected (r4 P2-3)**: Thm 1.1 fixed abelian K under GRH
  (o_K(1), T→∞), Cor 1.3(i) fixed quadratic K GRH-conditional asymptotic; nothing uniform over
  K, no Hecke/non-abelian. Corrects VERDICTS §5.2(c)'s "unconditional"; the gate that keeps
  dossier 75's primary at N 4.
- **Upstream PNT+ close-out**: AlexKontorovich/PrimeNumberTheoremAnd @ `938912bb` (2026-11-12)
  PROVES StrongPNT (ψ = x + O(x·exp(−c√log x)), `StrongPNT.lean:2900`, triad-clean) — 22-T2b
  closed-by-upstream, formalization-only to recover; fork-vs-upstream Mathlib-subtree drift
  39/75 files (real port, not rebase) [VERDICTS Cycle-2 standing note 1].
- **PNT+/tauceti Perron three-way** (duplication audit): analytic-NT Perron now exists
  independently as tauceti `TauCeti/NumberTheory/ArithmeticDirichletSeries/Perron/{Basic,Formula,
  Ideal}.lean` (truncated kernel + arithmetic formula + ideal variant) and PNT+
  `PrimeNumberTheoremAnd/PerronFormula.lean` (7 theorems); DZDF re-exposes tauceti's layer via
  its hard dependency. Dossier 22's Tier-2 route and any RvM-adjacent pilot have two donor
  choices + a third via DZDF — pick by toolchain match (PNT+ is on our pin's family).
- **RvM def-not-theorem trap**: ZetaZeros V1's `RiemannVonMangoldt` is a DEF, not a proved
  theorem — novelty greps (incl. `decl-index-v2.tsv` hits under `axiommath-zetazeros`, 276
  challenge/scaffold-heavy rows) must not read it as a result; explicit-constants RvM is contested
  (fork binder-only; upstream Kadiri in progress) [VERDICTS Cycle-2 standing note 2].
- **Tate-thesis formal neighbors** (r4 P2-13, for 73): arXiv 0 relevant (8+2 entries all
  math-physics/Langlands); GitHub exactly two Lean repos, both audited — DawidLipin/
  Project_Tate_Thesis (dissertation, unfinished, number-field adeles) and **WenrongZou/TateThesis**
  (PhD project, supervisors Nuccio & Brasca, ANR FALSE, Lean 4 + CI; number-field-only, goals
  framed not proved) — no function-field Tate dictionary anywhere; WenrongZou is the "anywhere"
  phrasing's clock.
