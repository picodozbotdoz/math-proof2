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
| 30 | [The ETH-Appendix Operators Q_s Are Second Differences of Number Operators](30-boson-operators-second-difference-closed-form.md) | refutation + new closed form | **proved, unconditional** (general moment identities: paper proof, instances kernel-checked) |
| 52 | [A Statistics-Universal Creation–Annihilation Calculus](52-statistics-universal-occupation-calculus.md) | new formal theorem (algebra) | **proved, unconditional** |
| 32 | [The Exact Savings Frontier of the Corollary-31 Certificate Class](32-rc-savings-frontier.md) | new theorem (complexity/analysis) | **proved**; crossing point as a parameter |
| 42 | [Critical-Line Zero Proportions for Quadratic Dedekind Zeta Functions](42-quadratic-dedekind-zeta-zero-proportions.md) | first formal ζ_K zero-density theorems | **proved, certificate-conditional** (Top-3 #1) |
| 20 | [The Common-Zero Seam](20-common-zero-seam-dedekind-zero-density.md) | structural theorem + obstruction analysis | conditional core **proved**; hCZ analysis on paper |
| 11 | [A Call-Charged Reduction Calculus for Fine-Grained Complexity](11-call-charged-reduction-calculus.md) | new formal framework | M1 **proved**; machine realizations open |
| 50 | [Zero-Free Regions Cannot Improve Window-Certificate Constants; Formal Strip Confinement](50-zero-free-regions-cannot-move-certificate-constants.md) | negative result + formal corollary | Part I source-verified argument; Part II **proved, binder-conditional** |
| 21 | [The ξ′-Tuned Quartic Window Does Not Improve the ζ Constant](21-quartic-window-transplant-certified-loss.md) | negative result | **certified numerically** (not kernel-verified) |
| 22 | [The Prime Number Theorem in ψ-Form from Mathlib's Wiener–Ikehara](22-pnt-psi-form-from-mathlib-wiener-ikehara.md) | formalization (classical theorem) | **proved, unconditional** — not new mathematics |

Ordering above is by how new the mathematics is (01, 30, 52, 32 first), not by triage
rank. Candidates without a Lean or certified result (02, 03, 10, 12, 31, 40, 41, 51, 60) remain
proposals in `research/candidates/` and have no article; dossier 10 (Top-3 #2) is cleared to
pilot (G1 audit CASE A) and its first milestone (M1 = L3, `exists_tm_space`) is proved
axioms-clean (`pilots/10-blueprint.md`), but the headline refutation still needs L1/L2, so it has
no article yet.
