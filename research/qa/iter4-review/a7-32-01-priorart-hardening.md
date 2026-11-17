# A7 pre-shipping prior-art hardening — articles 32 (crossing/frontier) and 01 (master identity)

*Lane A7, 2026-11-17. Web sweep, no Modal. Trigger: both articles template-complete in the
current wave; article-32's crossing claim newly discharged (week1-agenda row 1, run 12).
All sources accessed 2026-11-17 (URLs inline). Verdict classes: NOVEL / KNOWN-core /
RETRACT.*

## Article-32 (rc-savings-frontier; the discharged crossing claim, Thm A(iii))

**Verdict: NOVEL — with one mandatory pitch-rescope and four mandatory citations.**
Evidence: the follow-up literature around Alman–Vassilevska Williams arXiv:2610.06783v1
("Truly Subquadratic 3SUM and Truly Subcubic APSP via Triangles in Sparse Lopsided
Graphs", the 3sum-apsp sibling's paper; cited-by ≈ 20) contains **threshold and barrier
statements, but no exact achievable-frontier theorem for the Corollary-31 certificate
class**: (a) Majdoddin arXiv:2610.17420 (v1 2026-10-12) improves the thin-product range
to ε < ln4/(5 ln5) ≈ 0.172 and proves **technique barriers** (Appendix A: border-rank/
shape exclusions for base identities; abstract-verified no data-structure-class
optimality); (b) Tomar, "Which Fine-Grained Lower Bounds Survive the Refutation of 3SUM
and APSP?" v4 2026-10-27 (`mefyi.com/papers/survive-3sum-apsp/survive-3sum-apsp.pdf`)
systematizes the thresholds: closed-form analysis-range formula ε\*_R = 2 ln q0/(R ln R)
("saves … exactly for ε < ε\*") and quotes ε\*₁₀ = ln4/(5 ln 10) = 0.1204 — but its §6 is
explicit that such limits "limit the closed-form analysis, not the method" (the method
with W known in advance reaches ε < ε_ex = 0.17843), and its subject is which conditional
lower bounds survive, not certificate-class savings frontiers; (c) Karingula–Lovett
arXiv:2610.15663 / ECCC TR26-247 (2026-10-11) is a simplified proof with weaker
exponents, no optimality claim (abstract-verified); (d) Saha–Ye arXiv:2610.20297
(2026-10-14) is a faster (min,+) algorithm Õ(N^2.9964), no frontier claim
(abstract-verified). The exact-frontier statement — Achievable(ε) = (0, Γ(ε)), unique
crossing c\*(ε), phase transition at ε\*₁₀, non-attainment; the PairCeiling-style ceiling
for the class — appears in none of them; the crossing/uniqueness shape appears nowhere.
**Action:** the article must cite all four + AVW's own ε\*₁₀ naming (Thm 24/25 region,
"all three fail … for every τ < 0.1204", arXiv:2610.06783v1 HTML) and must RE-SCOPE the
pitch phrase "first optimality barrier proved inside an algorithms corpus" → "first exact
achievable-frontier theorem for a data-structure certificate class" (Majdoddin's proved
technique barriers and Tomar's threshold systematization make the unqualified phrase
unsafe; the Theorem-A statement itself is untouched). Tomar cite currently at mefyvi URL
v4 — arXiv-id upgrade check at draft time.

## Article-01 (ez1-inertial-defect-master-identity; five-defect exact decomposition)

**Verdict: NOVEL (re-confirmed; no 2026 competitor since the main-run check).**
Evidence: (a) the Anthropic companion "How the two-thirds argument was found: two agent
runs" (`www-cdn.anthropic.com/d7f3ecf1d01392d887f8bc974ca187e2a121b1ed.pdf`, 95 pp,
full-text searched 2026-11-17) documents the rank–trace lemma as a one-sided inequality
("five-line proof by von Neumann's trace inequality"), its equality case *declared sharp
after a hundred thousand random and several hundred adversarial trials* (numerical, not
an identity), the campaign's failed factorization attempts ("no factorisation, no usable
difference, no closing relation" — the 'no slack' synthesis), and the polarized-object
attempt as a failed moonshot — i.e., the informal side confirms the decomposition was
sought and not found; (b) Lamzouri arXiv:2609.02882 simplifies by *replacing* the
finite-dimensional matrix framework with a single Hilbert-space inequality — away from
trace identities, no defect decomposition; (c) 2026 Dirichlet-moment papers (Macmillan
arXiv:2608.25721 mixed second moment; arXiv:2610.41394 weighted one-level density) are
moment formulas, not matrix-identity refinements; (d) generic matrix-analysis literature
(inertia laws, partial-trace inequalities) contains nothing in the five-defect /
inertial-refinement shape (multi-query sweep, 2026-11-17). **Action:** the article
should CITE the companion PDF (the numerical-sharpness datum makes our proved
defect-vanishing equality characterization strictly stronger; the failed polarized-object
attempt frames our polarized bilinear form as new).

## Stamps

- article-32: **zero retracts — 2026-11-17** (NOVEL; pitch-rescope + 5 citations owed at
  draft: Majdoddin 2610.17420 incl. App. A, Tomar v4, Karingula–Lovett 2610.15663,
  Saha–Ye 2610.20297, AVW's ε\*₁₀ discussion).
- article-01: **zero retracts — 2026-11-17** (NOVEL re-confirmed; companion-PDF citation
  owed at draft).

— lane A7, 2026-11-17. Scratch PDFs (/tmp) discarded after this record per convention.

---

## §30 (dated 2026-11-17, lane A7) — article-30 prior-art re-confirmation (A9 upgrading now)

*Theorem-B class re-swept for 2026 arrivals since the main-run check (2026-11-09):
second-quantization operator identities, combinatorial boson calculus, formal-venue
competitors. All sources accessed 2026-11-17.*

**Verdict: NOVEL (re-confirmed; no 2026 competitor, no formal-venue competitor).**
Evidence: (a) the combinatorial boson-calculus line — Blasiak–Duchamp–Penson et al.,
"Combinatorics and Boson Normal Ordering: A Gentle Introduction" (arXiv:0704.3116, 111+
cites) and Maier, "Boson operator ordering identities from generalized Stirling numbers"
(arXiv:2308.10332; J. Algebraic Combinatorics 2024) — rewrites operator *strings* in
(a†, a) via Stirling/combinatorial structures: a different object and shape from article
30's mode-product family Q_s = second difference of the occupation profile
ψ_m(j) = |j|·m_{|j|} on the polynomial Fock model, its monomial-eigenvalue form
δ_{s0} + Δ²ψ_m(s), and its moment identities (Σ_s s²·Q_s = 4·(Euler operator)); no 2026
arrival in this space (nearest: an Aug-2025 s-ordering press note on older work; a Jan-
2026 encyclopedia topic page — neither is a statement). (b) Formal venues: Lean/Isabelle/
Coq sweeps for formalized second-quantization / Fock-space / creation-annihilation
operator identities surface only pedagogical literature — no competitor formalization;
article 30's Lean pilots (`pilots/30-falsify-TheoremB-h1.lean`, `pilots/30/ClosedForm.lean`)
remain first-of-kind for this statement class. (c) The anthropics ETH-refutation external
wave (Oct 27–Nov 6, 2026: NYT, TechCrunch, computationalcomplexity blog, AWS/DataCamp
write-ups, all checked at headline level) is press coverage of the algorithmic result —
no external mathematical follow-up on the appendix half-piece operators, and no
Parseval-type conjecture about them anywhere outside this project. (d) Symmetric-function
side: Macdonald's operator literature (SFHP Ch. I–IV) and the 2026 arrivals (e.g., the
Hopf-algebra framework arXiv:2610.21289v2, 2026-11-03) contain no
second-difference-of-occupation-profile identity. **Action:** none beyond the article's
existing nearest-miss rows; the re-confirmation is recorded here for A9's upgrade.
