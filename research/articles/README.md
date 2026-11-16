# Research articles — one per discovery

Written 2026-11-09 at project close, per the user's standing instruction conveyed in the
close-out session ("a complete research article for each discovery, each in its own file,
not mixed"; no in-repo instruction file exists — citation corrected 2026-11-10).
Each article is self-contained: statement, proof, formal-verification record (Lean
declarations, files, axioms, binders), relation to prior work, limitations. Every Lean claim
is backed by `research/pilots/<NN>/logs/axcheck-final.log` (final sweep: 29/29 files OK,
0 sorryAx, axioms ⊆ {propext, Classical.choice, Quot.sound}).

| # | article | kind | status |
|---|---|---|---|
| 01 | [An Exact Five-Defect Identity for the Rank–Trace Inequality](01-inertial-defect-master-identity.md) | new theorem (linear algebra) | **proved, unconditional** (Top-3 #3) |
| 30 | [The ETH-Appendix Operators Q_s Are Second Differences of Number Operators](30-boson-operators-second-difference-closed-form.md) | new closed form + refutation of a project-formulated conjecture | **proved, unconditional** (general moment identities: paper proof, instances kernel-checked) |
| 52 | [A Statistics-Universal Creation–Annihilation Calculus](52-statistics-universal-occupation-calculus.md) | axiomatization + ε-universal dual-family lemma (formal-first) | **proved, unconditional** |
| 32 | [The Exact Savings Frontier of the Corollary-31 Certificate Class](32-rc-savings-frontier.md) | new theorem (complexity/analysis) | **proved**; crossing point as a parameter |
| 42 | [Critical-Line Zero Proportions for Quadratic Dedekind Zeta Functions](42-quadratic-dedekind-zeta-zero-proportions.md) | first formal ζ_K on-line zero-proportion lower bounds (formal-first; "zero-density" = N(σ,T) bounds — wrong term, retired) | **proved, certificate-conditional** (Top-3 #1) |
| 20 | [The Common-Zero Seam](20-common-zero-seam-dedekind-zero-density.md) | conditional interface (engine seam) + knowledge-level seam analysis | conditional core **proved**; hCZ analysis on paper |
| 11 | [A Call-Charged Reduction Calculus for Fine-Grained Complexity](11-call-charged-reduction-calculus.md) | formal calculus for folklore composition (acceptance-tested on donor Thm 19) | M1 **proved**; Theorem B(ii) TM2 realization **proved** (Cycle 2, on three eth interface hypotheses); word-RAM half + M3 open |
| 50 | [Zero-Free Regions Cannot Improve Window-Certificate Constants; Formal Strip Confinement](50-zero-free-regions-cannot-move-certificate-constants.md) | source-verified structural observation (knowledge-level; about the donor's proof architecture) + formal corollary of a donor-printed statement | Part I source-verified argument; Part II **proved, binder-conditional** |
| 21 | *(moved)* certified numerical comparison → `research/pilots/21-certified-comparison.md` (certificate, not an article per the Iter-4 strength bar) | numerical certificate | **certified numerically** (not kernel-verified); content folded into dossier 02's case study |
| 22 | [The Prime Number Theorem in ψ-Form from Mathlib's Wiener–Ikehara](22-pnt-psi-form-from-mathlib-wiener-ikehara.md) | formalization (classical theorem) | **proved, unconditional** — not new mathematics |

Ordering above is by how new the mathematics is (01, 30, 52, 32 first), not by triage
rank. Honest counts under the Iter-4 strength bar
(`qa/iter4-review/r2-discovery-strength.md`): **5 discovery-grade articles (01,
30, 32, 42, 75 — 75 conditional), 9 technical records, 1 numerical certificate moved
out of articles (21), 2 records merged (42-M4, 50-M2).** Candidates without a Lean or certified result (02, 03, 10, 12, 31, 40, 41, 51, 60) remain
proposals in `research/candidates/` and have no article; dossier 10 (Top-3 #2) is cleared to
pilot (G1 audit CASE A) and its first milestone (M1 = L3, `exists_tm_space`) is proved
axioms-clean (`pilots/10-blueprint.md`), but the headline refutation still needs L1/L2, so it has
no article yet.

## Cycle 2 (2026-11-13 → 2026-11-14) — articles

One article per Cycle-2 deliverable, each standalone; kind column carries the strength-bar class. Every Lean claim is backed by the
Cycle-2 final sweep (`feasibility/VERIFICATION-LEDGER.md` §9.F: 44/44 stages OK, 0 sorryAx,
axioms ⊆ {propext, Classical.choice, Quot.sound}; per-pilot `pilots/*/logs/axcheck-c2-final.log`).

| # | article | kind | status |
|---|---|---|---|
| 75 | [Abelian Assembly: Zero Proportions for ζ_L Across an Abelian Tower](75-abelian-assembly-zetaL-proportions.md) | conditional statement-class first (first ζ_L proportion statements; component-proportion binders = the open core; assembly mathematics is corollary-level) | **proved, conditional** on component-proportion hypotheses (the open core); 5/6 arm + ℚ-instantiation carried to Iteration 4 |
| 42-M4 | [ζ_K Zero Proportions with an Unconditional ζ-Column](42M4-zetaK-proportions-unconditional-zeta-column.md) | donor-swap upgrade of article 42 — on-line proportion lower bounds (formal-first); no new mathematics (§1 Honesty) | **proved**; ζ-side unconditional in Lean (ZetaZerosV2 imported), χ-side conditional |
| 71 | [The s-Plane Zeta of a Curve over 𝔽_q](71-splane-zeta-curve-dictionary.md) | formalization-first (Weil 1948) + a forced statement correction | **proved, conditional** on `WeilData` (the Weil conjectures as a hypothesis structure) |
| 73 | [Hecke L-Series over 𝔽_q[T] in Lean, I](73-formal-tate-dictionary-function-field.md) | formalization-first statement layer (technical record; hRat/hPur never discharged; Q4 pending) | **proved at Tier C**, under rationality/purity hypotheses; Q4 (rationality discharge) carried |
| 72 | [The Rényi Monotonicity No-Go Gate (+ family-265 interface layer)](72-renyi-monotonicity-nogo-gate.md) | formal fence around Kuwahara's refutation (the no-go is his, arXiv:2610.15199; N1–N3 are textbook) + interface layer | **proved** (gate unconditional given the `hKL` family); interface theorem carried |
| 50-M2 | [Unconditional Strip Confinement for ζ and Dirichlet L](50M2-unconditional-strip-confinement.md) | binder discharge of article 50's shell — formalizes the openai preprint's own Cor. 1.2 (technical record; no new mathematics) | **proved, unconditional** for ζ (1/8 ≤ Re ρ ≤ 7/8; openai 7/8 donor, G7b-audited); Dirichlet with one FE hypothesis |
| 10 | [Toward One Machine for All k: Space-Certified Layers](10-layers-toward-uniform-poly-space-eth-refutation.md) | certified layers toward an OPEN headline (technical record) | **HEADLINE OPEN** — three layers proved (M1/L1/L2, 151 thms ⊆ triad); assembly tranche carried to Iteration 4 |
| 11 | [A Call-Charged Reduction Calculus](11-call-charged-reduction-calculus.md) §Cycle-2 addendum | Theorem B(ii): TM2 realization | **proved** (on three eth interface hypotheses) |
| 22 | [The PNT in ψ-Form](22-pnt-psi-form-from-mathlib-wiener-ikehara.md) §Cycle-2 closure note | knowledge-level closure | upstream PrimeNumberTheoremAnd @ 938912bb proves StrongPNT (T2b retired) |

Ordering is by strength-bar class. Formalization-first items (71, 73, 22) are technical
records of classical mathematics (Weil 1948; Tate/Weil/Rosen; Hadamard–dVV), not
discoveries. Knowledge-level records (the Liu-1 constant story, the QR-D race state
incl. the QuasiRiemannTracker audit and the formal Dirichlet frontier 0.8733458561)
live in dossier 70's standing notes and the verification ledger, not in articles. Dossier 74 (surprisal-moment ceilings) has no pilot this cycle and no
article; it is carried to Iteration 4.
