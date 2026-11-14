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

## Cycle 2 (2026-11-13, opened; drafts 2026-11-14) — articles in progress

Per the orchestrator's Cycle-2 queue, article DRAFTS are written now (not gated on pilot
verdicts): each carries the decided substance (survey/bridge/novelty findings + landed
GREEN evidence) with **explicit verdict slots** ([VERDICT:…], [G7b]) confined to the
pilot-outcome/evidence sections, so fill-in is surgical when the orchestrator relays
landings. Drafts are marked Status: DRAFT until their slots fill.

| # | article (file) | kind | status + verdict slots |
|---|---|---|---|
| 71 | [The s-Plane Zeta of a Curve](71-splane-zeta-curve-dictionary.md) | formalization-first (first formal s-plane FF zeta; exact-1/2 window; Hasse–Weil transport; anti-CT comparison) | **PROVED, FINAL-GREEN — A2 FORMAL REPORT LANDED**: p2-run6 OK, **279 LoC**/11 thms all triad, descent 6→4→2→1→0; W1 statement delta recorded (draft `s ≠ 1` UNSOUND — honest pole-family exclusion `hs1` + Core-2 `re_eq_one_of_card_mul_wOf`; `multiset_sum_map_const` mathlib gap) |
| 72 | [The Rényi Monotonicity No-Go Gate](72-renyi-monotonicity-nogo-gate.md) | certified-negative (the Kuwahara obstruction as a permanent formal fence) + M1 family-265 interface companion | **C-neg PROVED — GREEN + axcheck-clean** (A4 official report 2026-11-14: run8-final rc=0 0/0; 369 LoC/11 thms; axcheck 11/11 triad, 0 sorryAx; Appendix-A deviations documented in 72-prework :495 — N1 at 0<α≤β<1, N3 concrete-family FALSE forms, Kuwahara as external hKL binder); **M1 partial-GREEN, FINAL for the tranche — [VERDICT:72-M1] FILLED, A8 formal report landed (2026-11-14)**: m1-run8-GREEN T1+T2 OK (vendor P72M1T1 702 LoC + P72M1T2 360 LoC/25 thms; descent 24→10→1→0 over runs 6–8, 5 latent bugs found by the post-interruption static audit); m1-axcheck-final 52+28 axiom-lines, 0 sorryAx, triad-only; **landed: L1 ptrace-Gram + entropy match, L2 at constant 1 (stronger than the ≤ 4 safety form), vendor layer — all kernel-clean; L3 Hamiltonian/ground/gap transfer + the interface theorem carried to Iteration 4 by design** (spec in m1-run8-GREEN.log header) |
| 73 | [A Formal Tate Dictionary for FF Hecke L-Series, I](73-formal-tate-dictionary-function-field.md) | formalization-first (first formal Tate-type statements, function-field scope; three-column window table at the tracker frontier) | **PROVED at Tier C, FINAL-GREEN — [VERDICT:73-C] FILLED, A2 formal report LANDED (2026-11-14)**: Q0 first-try GREEN (143 LoC probe), Q1–Q3 GREEN (run6-c-green: 236 LoC, 7/7 triad, descent 2→4→4→2→OK; Q2 via DifferentiableAt.div, hPur binder everywhere); **Q4 UNTOUCHED per the separate gate — carries to Iteration 4** |
| 42-M4 | [ζ_K Proportions with an Unconditional ζ-Column](42M4-zetaK-proportions-unconditional-zeta-column.md) | donor-swap upgrade of article 42 (V2 endpoints replace the Knausgård certificate binders on the ζ side) | **PROVED, FINAL — both routes GREEN** (M4a GREEN + axcheck-clean: m4-run2, m4-axcheck-run1; **[VERDICT:M4b] + [VERDICT:M4b-upgrade] FILLED-FINAL per A1 §9 2026-11-14**: fallback m4b-run2 GREEN 1,560/66; upgrade COMPLETE on the primary route — m4b2-run2 direct-V2-import GREEN, FINAL artifact 1,571 LoC/68 thms, M4c(i) axiom hygiene fully discharged (fallback axcheck 68/68 triad; primary axcheck 70+2 donor prints triad-only), fallback preserved byte-exact, net +11 LoC delta; A3 formal report LANDED — pilots/42/M4-note.md); standalone (main-run 42 frozen) |
| 50-M2 | [Unconditional Strip Confinement for ζ and Dirichlet L](50M2-unconditional-strip-confinement.md) | binder-discharge corollaries (posture upgrade of pilot 50's proved shell; parametric θ) | **DRAFT — routes settled on paper**: R2 statement-level (G1b FAIL), R3 constant story resolved (liu1-hygiene sweep) + tracker-replayed exact B_new (round-4 §9); R1 gated: **[G7b]**; landing: **[VERDICT:50-M2-R1]** |
| 10 | [One Machine, All k: Uniform ETH Refutation with Polynomial Space](10-uniform-poly-space-eth-refutation.md) | new theorem (complexity; the uniform × poly-space × min-route conjunction — target; the landed discovery = the three-layer certificate stack incl. polyTVal_id, the first value-time/word-space certificate) | **FINAL — three layers GREEN (M1/L1/L2; [VERDICT:10-L2] FILLED, A6 formal LANDED); assembly tranche (wd↔cw walk + counter-padM′) carried to Iteration 4** (orchestrator decision 2026-11-14): L2/M3 GREEN + axcheck-clean (l2-run5-final-green BOTH OK 0/0/0; 2,625/151 all ⊆ triad; truncated prints covered by M1's byte-identical-region audit); §5 records the remaining tranche verbatim |
| 11 | [A Call-Charged Reduction Calculus](11-call-charged-reduction-calculus.md) §Cycle-2 addendum | M2 TM2 realization (Theorem B(ii)) appended to the proved main-run article | **COMPLETE — [VERDICT:11-M2] FILLED-FINAL GREEN, A8 FORMAL REPORT RECEIVED (2026-11-14)**: m2-run8-GREEN all six files OK incl. RedTm2 (421 LoC, 0 sorry-tokens; P11T3 1,100/88 GREEN first-run); **corrected error series 4→2→3→6→3→2→2→0** (run5 = 3 displayed sites vs counter 4; m2-run1–7 headers run-time persisted, NOT reconstructed; churn = aborting declarations exposing the next class, no regressions); m2-axcheck-final **76 axiom-lines (64+12), 0 sorryAx, triad-only** (dedup triad ×22, [propext,Quot.sound] ×17, [propext] ×15; Tm2Sol.mono/tm2_choice/tm2_charging/tm2_realized_composed full triad; map_headD_sf axiom-free); the four outage fixes final per 11-blueprint §8 (incl. hk re-proved clear+inner induction+Nat.mul_le_mul_right, hsomeCons rebuilt); Theorem B(ii) PROVED; article Status line carries "+ M2 COMPLETE" |
| 75 | [Abelian Assembly: Zero Proportions for ζ_L](75-abelian-assembly-zetaL-proportions.md) | n+1-factor proportion assembly over the whole abelian tower (first ζ_L statements; binder-schema open core; ℚ-route) | **DRAFT — entry milestone LANDED, A4 FORMAL REPORT LANDED (2026-11-14): [VERDICT:75-*] FILLED** — (P-a)+(C1)@2/3 GREEN (run6-final 0/0/0, descent 26→7→1→2→2→0; Pa.lean ≈363 new LoC on the M4a carry; in-file audit 17/17 triad incl. 3 heritage); N0 folded; **N2 ℚ-route + P-b (5/6 strip arm, +0.2–0.3k design on file) CARRIED-TO-ITERATION-4**; strengthening: hntop-partial-products derived away via the ℕ∞ analyticOrderAt route |
| 22 | [The PNT in ψ-Form](22-pnt-psi-form-from-mathlib-wiener-ikehara.md) §Cycle-2 closure note | knowledge-level closure (no new article warranted) | **CLOSED-BY-UPSTREAM note appended**: upstream PrimeNumberTheoremAnd @ 938912bb proves StrongPNT triad-clean (dossier 22 T2b retired; cite upstream) |

Knowledge-level records folded into the drafts (not separate articles): the Liu-1
constant-story resolution and the G1b/G2 donor-probe verdicts (article 50-M2 §4; dossier
70 standing notes); the QR-D race state incl. the tri-kernel-verified
QuasiRiemannTracker audit and the formal Dirichlet frontier 0.8733458561 (Bebel) —
dossier 70 standing notes 3–4 + article 50-M2 §§1/4/6. Dossier 74's pilot-outcome
template/article stay with lane A4 (owner); coordinator relay if unowned at its report.
Main-run continuation evidence recorded in place: pilot 52 VERIFIED-GREEN close-out and
pilot 20 runs-recorded (article 52/dossier 20 unchanged); pilot 10-L1 inside article 10.

