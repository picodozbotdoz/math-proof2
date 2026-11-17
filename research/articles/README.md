# Research articles — iteration 4 index

Honest counts — **FINAL, orchestrator-ratified 2026-11-16**: **5 discovery-grade** ·
**7 technical records & formalizations** · **4 notes/certificates (1 pending a branch
decision)** + 3 relocated notes — down from 17 article files for both cycles. Not every
verified artifact is an article: donor swaps, binder discharges, statement layers and
closure notes live in dossiers/ledger rows (§C) with full verification records. Article
gate: `TEMPLATE-iter4.md` (mandatory). Discovery bar: R2's S1–S4 and the R1 editorial
rubric (`qa/iter4-review/r2-discovery-strength.md` §4, `r1-articles-editorial.md`).
Status strings below use the template's closed vocabulary (PROVED-UNCONDITIONAL /
PROVED-CONDITIONAL / CERTIFIED-NUMERIC / PAPER-ONLY; "at donor pin" flags a donor
toolchain substrate).

## A. Discovery-grade

| # | article | kind | status |
|---|---|---|---|
| 01 | [An Exact Five-Defect Identity for the Rank–Trace Inequality](01-inertial-defect-master-identity.md) | new theorem (linear algebra) | Thms 1–3 PROVED-UNCONDITIONAL |
| 30 | [The ETH-Appendix Operators Q_s Are Second Differences of Number Operators](30-boson-operators-second-difference-closed-form.md) | new closed form + refutation of a project-formulated conjecture (B2) | refutation/closed form/spectral/commutativity PROVED-UNCONDITIONAL; moment identities PAPER-ONLY with kernel-checked instances |
| 32 | [The Exact Savings Frontier of the Corollary-31 Certificate Class](32-rc-savings-frontier.md) | new theorem (frontier function Γ(ε), phase transition); constants superseded at birth — caveat carried in-article | **proved; crossing exists for all ε < ε*** (run-12 discharge 2026-11-17, `pilots/32/M2.lean`: `crossing_exists`/`frontier_unconditional`/`frontier_formula_unconditional` triad; ε-dependence of c* and Corollary-31 data-structure statement remain PAPER-ONLY); `frontier_nonempty_iff` PROVED-UNCONDITIONAL |
| 42 | [Critical-Line Zero Proportions for Quadratic Dedekind Zeta Functions](42-quadratic-dedekind-zeta-zero-proportions.md) | new statement class, corollary-level assembly; v2 = merged 42 + 42-M4 (2026-11-16) | Thms 1–3 PROVED-CONDITIONAL (χ-column = zeta23 Thm E as binder — the open core); ζ-column PROVED-UNCONDITIONAL (ZetaZerosV2 import, triad-audited) |
| 75 | [Abelian Assembly: Zero Proportions for ζ_L Across an Abelian Tower](75-abelian-assembly-zetaL-proportions.md) | new statement class (n+1-factor schema) under named open binders — conditional billing in title/abstract | Thms A–B PROVED-CONDITIONAL (component proportions = the open core); **strip-distinct 5/6 arm (P-b, 4 landings) PROVED-CONDITIONAL, landed Iter-4 2026-11-16** (pb-run11-final; hCZStripFam binder conjecture-grade); ℚ-instantiation (N2) carried |

## B. Technical records & formalizations

| # | article | kind | status |
|---|---|---|---|
| 11 | [A Call-Charged Reduction Calculus for Fine-Grained Complexity](11-call-charged-reduction-calculus.md) | formal calculus for folklore composition, acceptance-tested on donor Theorem 19 (M2 integrated into the body, 2026-11-16) | Thms 1 PROVED-UNCONDITIONAL; Thms 2–3 PROVED-CONDITIONAL (donor claim binders); Thm B(ii) `tm2_realized_composed` PROVED-CONDITIONAL (EthExistsTm, EthPoly, EthIsPoly); word-RAM half + M3 open |
| 20 | [An Interface Theorem for Zero-Proportion Engines](20-engine-seam-interface.md) | conditional interface + the two multiplicity-merging lemmas — technical record; the seam analysis moves to `pilots/20-seam-analysis.md` (dossier-grade note) | Thms 1–3 + merging lemmas PROVED-CONDITIONAL (Card20/TracesFamily/EngineStep; hz/hw, hfamz/hfamw); `merged_mult_of_common` PROVED-UNCONDITIONAL; seam Prop (old Thm 5) PAPER-ONLY in the note, not the article |
| 22 | [The PNT in ψ-Form](22-pnt-psi-form-from-mathlib-wiener-ikehara.md) | formalization of a classical theorem — the corpus's honesty exemplar | M1–M4 PROVED-UNCONDITIONAL; T2b closed by upstream (note destined for dossier 22/survey) |
| 50 | [What the 7/8 Half-Plane Buys](50-zero-free-regions-cannot-move-certificate-constants.md) | technical record (v2 = merged 50 + 50-M2, 2026-11-16): Part II formal corollary + its discharge + Part I source-verified structural observation (knowledge-level — never "theorem" billing) | ζ strip confinement 1/8 ≤ Re ρ ≤ 7/8 PROVED-UNCONDITIONAL **at donor pin** (openai 7/8 donor, G7b-audited); Dirichlet PROVED-CONDITIONAL (hFEχ); Part I PAPER-ONLY (source-reading) |
| 52 | [A Statistics-Universal Creation–Annihilation Calculus](52-statistics-universal-occupation-calculus.md) | axiomatization + ε-universal dual-family lemma (formal-first) | Thms 1–5 PROVED-UNCONDITIONAL (Thms 1, 3 without Classical.choice); physlib `ExchangeSign` nearest-neighbor note destined for `novelty/` |
| 71 | [The s-Plane Zeta of a Curve over 𝔽_q](71-splane-zeta-curve-dictionary.md) | **kind: FORMALIZATION-FIRST** (v2, 2026-11-17 — template-complete PASS×5; Cycle-2 corpus-legacy compliance per TEMPLATE-iter4 §0, the forced-correction class: the false s ≠ 1 pole clause) | W1/W2/HW PROVED-CONDITIONAL (WeilData binder — Weil conjectures as hypothesis structure, transcribed from AxiomMath `Weil`'s statement, NOT discharged); Core 1 `re_eq_half_of_norm_mul` + Core 2 `re_eq_one_of_card_mul_wOf` PROVED-UNCONDITIONAL |
| 72 | [A Kernel-Verified Fence for Kuwahara's Refutation of the Rényi Area Laws](72-renyi-monotonicity-nogo-gate.md) | kernel-verified fence around **Kuwahara's** refutation (external theorem, d ≥ 2, carried as hypothesis hKL; the stated boundary-linear log-rank no-go is ours) + interface layer | N1/N2a/N2b PROVED-UNCONDITIONAL; N3a/N3b PROVED-CONDITIONAL (hKL + boundary + the negated law); M1 links 1–3 PROVED-UNCONDITIONAL; link 4 + interface theorem carried |

## C. Notes, certificates & addenda (low-billing tier; verification records live in dossiers/ledger)

*Section note: "not articles" applies to every row except 10, which KEEPS article status
as a relabeled technical record (orchestrator resolution, 2026-11-16) and is listed here
for low billing — its row leads with the open headline.*

| item | home | note |
|---|---|---|
| 10 | [Toward One Machine for All k: Space-Certified Layers](10-layers-toward-uniform-poly-space-eth-refutation.md) — KEEPS article status, renamed 2026-11-16 | M1/L1/L2 PROVED-UNCONDITIONAL as layers; **headline OPEN**; assembly tranche D1–D6 carried to Iteration 4 |
| 21 | [quartic-window certificate study](../pilots/21-quartic-window-certificate.md) — DEMOTED 2026-11-16 (formerly article 21); case-study stub in dossier 02 | Proposition **computationally certified (external script, not kernel-verified, excluded from proved-artifact counts)** — R3's wording, applied at every mention incl. the abstract marker; family evidence PAPER-ONLY |
| 50-M2 | folded into article 50 v2 as its Part II discharge section (2026-11-16); ops narration → ledger pointers | ζ strip confinement PROVED-UNCONDITIONAL at donor pin; Dirichlet PROVED-CONDITIONAL (hFEχ) |
| 73 | demoted to dossier/pilot record 2026-11-16 — [`candidates/73` outcome record](../candidates/73-function-field-hecke-tate.md) | C.lean layer PROVED-CONDITIONAL (hRat/hPur binders, never discharged); Q4 carried; re-article condition = runbook-file branch 2 |
| 22-T2b closure note | dossier 22 / `survey/axiommath-pntplus.md` (out of the article file; deferred with its owning dossier) | closed-by-upstream (PrimeNumberTheoremAnd @ 938912bb); cite upstream, not us |
| 52 physlib addendum | `novelty/physlib-surface.md` standing notes (deferred with its owning dossier) | dated nearest neighbor; theorems unaffected |
| 42-M4 file | retired on merge into 42 v2 (2026-11-16) — integrated merge, not an addendum | edit history preserved in 42 v2 §0 (c540682 vs 4e19304) |

Retired/superseded pointers: article 42 v1 (replaced in place by v2, 2026-11-16);
42-M4, 50-M2, 73 article files (retired; frozen cycle records carry dated drift-notes);
dossier-only items 02, 03, 12, 31, 40, 41, 51, 60, 74 remain proposals without articles.

Restructuring provenance: iteration-4 review lanes R1 (editorial audit + swap-in
runbook), R2 (discovery-strength bar + 20/72 rewrites), R3 (verification tables — all
status rows above trace to per-declaration axiom prints); files under
`qa/iter4-review/`.
