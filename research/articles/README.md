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

## Cycle 2 (2026-11-13, opened) — expected articles

[expected] entries for likely Cycle-2 discovery articles; one line each, kind + status.
Article files are created when the underlying pilot lands a kernel-verified (or certified)
result; each then gets its own file per the standing instruction.

| # | article | kind | status |
|---|---|---|---|
| 71 | The s-Plane Zeta of a Curve: Formal Dictionary, Exact Window, Hasse–Weil Transport | formalization-first (classical math, first formal s-plane FF zeta) + anti-CT comparison corollary | **[expected — pending A2's P2]** (W1/W2/HW landing theorems; P0–P1 substrate already green, 7/7 lemmas kernel-clean) |
| 72 | The Rényi Monotonicity No-Go Gate for Area-Law Rank Statements | certified-negative (Kuwahara-obstruction formalized as a fence) | **[expected — pending A4]** (C-neg in flight; main-run precedent: articles 30/50's negative-result kind) |
| 73 | A Formal Tate Dictionary for Function-Field Hecke L-Series, I: Statement Layer | formalization-first (Tier-C binder layer of the first formal Tate-type statements) | **[expected — pending 73-C]** (skeleton executing, A2; "anywhere" claim scoped + WenrongZou clock per A5 P2-13) |
| 42-M4 | (upgrade of article 42) ζ_K Proportions with an Unconditional ζ-Column | donor-swap upgrade of a proved article | **[expected — pending M4b]** (decide addendum-to-42 vs new article when M4b lands; V2 discharges the ζ-side binders, hCert dropped) |
| 50-M2 | Unconditional Strip Confinement for ζ and Dirichlet L | binder-discharge corollaries (posture upgrade of pilot 50's shell) | **[expected — pending route decision]** (R1 openai-7/8 in-corpus / R2 DZDF-31/32 (G1) / R3 Liu-1 external (G7); constants parametric in θ) |

