# PROPOSAL (R1, iteration-4 review) — `research/articles/README.md` v2 skeleton

**Proposal file — do not edit `research/articles/README.md` until the restructuring
decision.** Sections and rows below are the restructured index per the R1 editorial
audit (`r1-articles-editorial.md` §3 README defects, §6 kind verdicts) and R2's
discovery-strength audit (`r2-discovery-strength.md` §2–§4). R1/R2 disagreements are
marked ⚠ in-row and registered in §D at the bottom — not silently resolved.

Contradictions being fixed (evidence):
- README.md:26–29 "so it has no article yet" (dossier 10) vs README.md:45 (Cycle-2 row
  10) — the audit's README BLOCKER;
- README.md:19 (row 11 "machine realizations open") vs README.md:46 (row 11 "TM2
  realization **proved**") and the article's own addendum (11:132–134);
- README.md:17 row 42 kind "first formal ζ_K zero-density theorems" — terminology
  mislabel (R2 §3 item 6): these are on-line zero-*proportion* lower bounds;
- main-table rows 42/50 carry 2026-11-09 statuses with no supersession pointers.

---

## README v2 (proposed content)

# Research articles — iteration 4 index

Honest counts — **FINAL, orchestrator-ratified 2026-11-16**: **5 discovery-grade** ·
**7 technical records & formalizations** · **4 notes/certificates (1 pending a branch
decision)** + 3 relocated notes — down from 17 article files for both cycles. (The
alternate count line proposed alongside the R1/R2 splits is STRUCK; see §D.) Not every
verified artifact is an article: donor swaps, binder discharges, statement layers and
closure notes live in dossiers/ledger rows (§C) with full verification records. Article
gate: `TEMPLATE-iter4.md` (mandatory). Discovery bar: R2's S1–S4
(`r2-discovery-strength.md` §4).

## A. Discovery-grade

| # | article | kind | status (closed vocabulary) |
|---|---|---|---|
| 01 | [An Exact Five-Defect Identity for the Rank–Trace Inequality](01-inertial-defect-master-identity.md) | new theorem (linear algebra) | Thms 1–3 PROVED-UNCONDITIONAL |
| 30 | [The ETH-Appendix Operators Q_s Are Second Differences of Number Operators](30-boson-operators-second-difference-closed-form.md) | new closed form + refutation of *this project's own* conjecture B2 (R2 §2 caveat) | refutation/closed form/spectral/commutativity PROVED-UNCONDITIONAL; moment identities PAPER-ONLY with kernel-checked instances |
| 32 | [The Exact Savings Frontier of the Corollary-31 Certificate Class](32-rc-savings-frontier.md) | new theorem (frontier function Γ(ε), phase transition); constants superseded at birth — caveat carried in-article | frontier/uniqueness/transition PROVED-CONDITIONAL (crossing existence carried as parameter, PAPER-ONLY) |
| 42 | [Critical-Line Zero Proportions for Quadratic Dedekind Zeta Functions](42-quadratic-dedekind-zeta-zero-proportions.md) *(v2 = merged 42 + 42-M4; draft `r1-rewrite-42v2.md`)* | new statement class, corollary-level assembly; ζ-column discharged in Lean | Thms 1–3 PROVED-CONDITIONAL (χ-column = zeta23 Thm E as binder); ζ-column PROVED-UNCONDITIONAL (ZetaZerosV2 import, triad-audited) |
| 75 | [Abelian Assembly: Zero Proportions for ζ_L Across an Abelian Tower](75-abelian-assembly-zetaL-proportions.md) | new statement class (n+1-factor schema) under named open binders — conditional billing in title/abstract required (R2 S4(b)) | Thms A–B PROVED-CONDITIONAL (component proportions = the open core); strip-distinct arm + ℚ-instantiation carried |

*(R2 also passes 32's and 01's billing as-is; 42 is billed "formal-first grade" per R2
§4 — the row above says so via "corollary-level assembly".)*

## B. Technical records & formalizations

| # | article | kind (re-kindened per R1/R2) | status |
|---|---|---|---|
| 11 | [A Call-Charged Reduction Calculus](11-call-charged-reduction-calculus.md) *(M2 integrated into body; fix sheet `r1-fixes-11-73.md` §a)* | formal calculus for folklore composition, acceptance-tested on donor Theorem 19 (R2 §4 item 5; was "new formal framework") | Thms 1–3 PROVED-UNCONDITIONAL; Theorem B(ii) `tm2_realized_composed` PROVED-CONDITIONAL (EthExistsTm, EthPoly, EthIsPoly); word-RAM half open |
| 20 | [The Common-Zero Seam](20-common-zero-seam-dedekind-zero-density.md) | conditional interface + knowledge-level obstruction analysis (R2 §4 item 9; was "structural theorem") | Thms 1–4 PROVED-CONDITIONAL (engine card/step binders); Thm 5 PAPER-ONLY (not formalized — stated up front, fixes R1 MAJOR) |
| 22 | [The PNT in ψ-Form](22-pnt-psi-form-from-mathlib-wiener-ikehara.md) | formalization of a classical theorem — the corpus's honesty exemplar (R2 §2) | M1–M4 PROVED-UNCONDITIONAL; T2b closed by upstream (note relocated to dossier 22, §C) |
| 50 | [What the 7/8 Half-Plane Buys](50-zero-free-regions-cannot-move-certificate-constants.md) *(v2 = merged 50 + 50-M2; draft `r1-rewrite-50v2.md`)* | technical record: Part II formal corollary + its discharge + Part I source-verified structural observation (knowledge-level — never "theorem" billing; R2 §4 item 11) | ζ strip confinement 1/8 ≤ Re ρ ≤ 7/8 PROVED-UNCONDITIONAL at donor pin (openai 7/8 donor, G7b-audited); Dirichlet PROVED-CONDITIONAL (hFEχ); Part I PAPER-ONLY (source-reading) |
| 52 | [A Statistics-Universal Creation–Annihilation Calculus](52-statistics-universal-occupation-calculus.md) | axiomatization + ε-universal dual-family lemma (R2 §4 item 10; was "new formal theorem") | Thms 1–5 PROVED-UNCONDITIONAL (Thms 1,3 without Classical.choice); physlib `ExchangeSign` nearest-neighbor note relocated to `novelty/`, §C |
| 71 | [The s-Plane Zeta of a Curve over 𝔽_q](71-splane-zeta-curve-dictionary.md) | formalization-first that **forced a statement correction** (the false s ≠ 1 pole clause) — earns article status (R1 §6; R2 §2 keeps) | W1/W2/HW PROVED-CONDITIONAL (WeilData = Weil conjectures as hypothesis structure) |
| 72 | [The Rényi Monotonicity No-Go Gate](72-renyi-monotonicity-nogo-gate.md) | kernel-verified fence around **Kuwahara's** refutation (external theorem, carried as hypothesis hKL) + interface layer (R2 §4 item 8; retitle drops "Family-265" — R1 MAJOR) | N1–N3 PROVED-UNCONDITIONAL as stated; the no-go itself is conditional on hKL (Kuwahara arXiv:2610.15199); M1 links 1–3 PROVED-UNCONDITIONAL, link 4 + interface theorem carried |

## C. Notes, certificates & addenda (low-billing tier; verification records live in dossiers/ledger)

*Section note: "not articles" applies to every row except 10, which KEEPS article status
as a relabeled technical record (orchestrator resolution, 2026-11-16) and is listed here
for low billing — its row leads with the open headline.*

| item | new home | note |
|---|---|---|
| 10 | KEEPS article status — relabeled technical record, renamed file with headline-OPEN lead (RESOLVED 2026-11-16: R1's demotion withdrawn; R2's keep adopted; rename + R6+A1 headline edits; cross-refs per the swap-in runbook) | M1/L1/L2 PROVED-UNCONDITIONAL as layers; **headline OPEN**; carried D1–D6 |
| 21 | DEMOTED per R2's package (RESOLVED 2026-11-16): certificate file `git mv` → `research/pilots/21-quartic-window-certificate.md` (root-level, matching `pilots/21-milestoneC.md`; H may prefer a `pilots/21/` dir — keep this row in sync); dossier-02 case study (`candidates/02-ez5-bandwidth-k-ceiling-laws.md` stub for the dossier owner); README pointer row here | Proposition **computationally certified (external script, not kernel-verified, excluded from proved-artifact counts)** — R3's wording, applied at every mention incl. the abstract marker; family evidence PAPER-ONLY |
| 50-M2 | folded into article 50 v2 as its Part II discharge section; ops narration → ledger pointers (draft `r1-rewrite-50v2.md`; executed via the swap-in runbook) | ζ strip confinement PROVED-UNCONDITIONAL at donor pin; Dirichlet PROVED-CONDITIONAL (hFEχ) |
| 73 | branch decision pending (`r1-fixes-11-73.md` §b): branch-1 demote to dossier 73/pilot record (both lanes prefer); branch-2 rewrite post-Q4 | C.lean layer PROVED-CONDITIONAL (hRat/hPur binders, never discharged); Q4 carried |
| 22-T2b closure note | dossier 22 / `survey/axiommath-pntplus.md` (out of the article file; deferred past this runbook — see runbook §"deferred") | closed-by-upstream (PrimeNumberTheoremAnd @ 938912bb); cite upstream, not us |
| 52 physlib addendum | `novelty/physlib-surface.md` standing notes (out of the article file; deferred past this runbook — see runbook §"deferred") | dated nearest neighbor; theorems unaffected |
| 42-M4 file | retired on merge into 42 v2 (RESOLVED 2026-11-16: R1's integrated-merge adopted — not an addendum, the addendum pattern is what made article 11 self-contradictory; `r1-rewrite-42v2.md`) | edit history preserved in 42 v2 §0 (c540682 vs 4e19304) |

Retired/superseded pointers: article 42 v1 (in place, marked superseded at top by the v2
swap); 42-M4 (file retired); dossier-only items 02, 03, 12, 31, 40, 41, 51, 60, 74
remain proposals without articles, as before.

---

## D. Disagreement register — RESOLVED by orchestrator, 2026-11-16

| row | R1 position | R2 position | orchestrator resolution (recorded verbatim in substance) |
|---|---|---|---|
| 42-M4 | merge into 42 v2 (one article, one status story; `r1-rewrite-42v2.md`) | keep as separate honest article, relabel cycle headline (R2 §4 item 4) | **RESOLVED — merges as R1's INTEGRATED v2** (not an addendum — the addendum pattern is what made article 11 self-contradictory). Row above and §C updated. |
| 10 | demote article to dossier tranche record (headline OPEN ≠ article) | keep article (ranking #3; only slug/banner fix, R2 §4 item 7) | **RESOLVED — article 10 KEEPS article status** as relabeled technical record (rename + headline-OPEN lead per R6+A1 edits) — not demoted. Row stays in §C for low billing with the open headline leading; §B unchanged at 7. |
| 21 | keep as short NEGATIVE article (certified numeric, self-contained, honest) | fold into dossier 02 case study (R2 §4 item 2) | **RESOLVED — article 21 DEMOTES per R2's package** (pilots certificate + dossier-02 case study; R3's "computationally certified (external script…)" wording). Row in §C updated. |
| 20 placement | scored 10/12, no kind verdict issued (R1 §6 table omits 20) | technical-record rekind (R2 §4 item 9) | no conflict — R2's rekind adopted (no orchestrator ruling needed). |
| 52 placement | scored 11/12, kept among best articles | kind softened to axiomatization (R2 §4 item 10); kept as article | no conflict — article stays, kind label softened. |

Counting rule for the header line — **FINAL as ratified**: §A = 5 (01, 30, 32, 42v2, 75);
§B = 7 (11, 20, 22, 50v2, 52, 71, 72); §C = 4 items (10 — kept article, low billing; 21;
50-M2 folded; 73 pending branch) + 3 relocated notes. ~~If the orchestrator resolves the
three ⚠ rows the other way (42-M4 kept, 10 and 21 kept as articles), the counts become
5 / 10 / 1 — update the header line accordingly at swap time.~~ STRUCK per the
orchestrator ruling; the primary counts line above is final.
